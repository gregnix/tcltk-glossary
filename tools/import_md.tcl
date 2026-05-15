#!/usr/bin/env tclsh
# import_md.tcl -- Import extended-Markdown glossary into SQLite.
#
# Reads the extended format documented in docs/glossary-formats.md.
# Backward compatible with the original 4-field format (terms without
# EN-EX / DE-EX / RELATED / SEE lines import correctly with empty values).
#
# Usage:
#   tclsh import_md.tcl <input.md> <output.db>

package require tdbc::sqlite3

if {[llength $argv] < 2} {
    puts stderr "Usage: $argv0 <input.md> <output.db>"
    exit 1
}
set inFile [lindex $argv 0]
set outDb  [lindex $argv 1]

if {![file exists $inFile]} {
    puts stderr "Error: input file not found: $inFile"
    exit 1
}

# ---------------------------------------------------------------
# Schema setup (load schema.sql if available; otherwise rely on DB)
# ---------------------------------------------------------------
set schemaFile [file join [file dirname [info script]] schema.sql]
if {[file exists $schemaFile] && ![file exists $outDb]} {
    if {[catch {exec sqlite3 $outDb < $schemaFile} err]} {
        puts stderr "Error creating schema: $err"
        exit 1
    }
}

tdbc::sqlite3::connection create db $outDb

# ---------------------------------------------------------------
# Read input
# ---------------------------------------------------------------
set fp [open $inFile r]
fconfigure $fp -encoding utf-8
set content [read $fp]
close $fp

# ---------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------
proc saveTerm {db category term enDef deDef enEx deEx related seeAlso} {
    set term [string trim $term]
    if {$term eq ""} { return 0 }

    # Skip if (term, category) already exists
    set rows [$db allrows -as lists {
        SELECT COUNT(*) FROM terms WHERE term = :term AND category = :category
    }]
    if {[lindex [lindex $rows 0] 0] > 0} {
        puts "  SKIP duplicate: $term"
        return 0
    }

    set stmt [$db prepare {
        INSERT INTO terms
            (term, category, en_definition, de_definition,
             en_example, de_example, related_terms, see_also)
        VALUES
            (:term, :category, :enDef, :deDef,
             :enEx,  :deEx,    :related, :seeAlso)
    }]
    $stmt execute
    $stmt close
    puts "  + $term"
    return 1
}

proc ensureCategory {db category} {
    if {$category eq ""} return
    set rows [$db allrows -as lists {SELECT COUNT(*) FROM categories WHERE name = :category}]
    if {[lindex [lindex $rows 0] 0] == 0} {
        set stmt [$db prepare {
            INSERT INTO categories (name, sort_order) VALUES (:category, 999)
        }]
        $stmt execute
        $stmt close
        puts "\nCategory: $category"
    }
}

# ---------------------------------------------------------------
# Parser: line-by-line, with a small state machine for code fences
# ---------------------------------------------------------------
set currentCategory ""
set currentTerm     ""
set enDef ""; set deDef ""
set enEx  ""; set deEx  ""
set related ""; set seeAlso ""

# fence state:
#   ""        => not in a fence
#   "en_ex"   => currently collecting EN example body
#   "de_ex"   => currently collecting DE example body
set fenceTarget ""
set fenceBuf {}
set inFooter 0

set termsCount 0

proc flushTerm {} {
    upvar 1 currentCategory cat  currentTerm   term
    upvar 1 enDef enDef          deDef         deDef
    upvar 1 enEx  enEx           deEx          deEx
    upvar 1 related rel          seeAlso       see
    upvar 1 termsCount tc
    if {$term ne ""} {
        if {[saveTerm db $cat $term $enDef $deDef $enEx $deEx $rel $see]} {
            incr tc
        }
    }
    set term ""; set enDef ""; set deDef ""
    set enEx ""; set deEx ""
    set rel  ""; set see ""
}

foreach line [split $content "\n"] {

    # Active code fence? collect until closing fence.
    if {$fenceTarget ne ""} {
        if {[regexp {^[ \t]*(```|~~~)\s*$} $line]} {
            # Closing fence -- commit body
            set body [join $fenceBuf "\n"]
            if {$fenceTarget eq "en_ex"} {
                set enEx $body
            } else {
                set deEx $body
            }
            set fenceTarget ""
            set fenceBuf {}
        } else {
            lappend fenceBuf $line
        }
        continue
    }

    # Category header
    if {[regexp {^##\s+(.+)$} $line -> catName]} {
        flushTerm
        set heading [string trim $catName]
        if {$heading in {License Acknowledgments}} {
            set currentCategory ""
            set inFooter 1
            continue
        }
        set inFooter 0
        set currentCategory $heading
        ensureCategory db $currentCategory
        continue
    }

    if {$inFooter} continue

    # Term header
    if {[regexp {^\*\*(.+?)\*\*\s*$} $line -> term]} {
        flushTerm
        set currentTerm [string trim $term]
        continue
    }

    # Definition lines
    if {[regexp {^-\s+EN:\s*(.+)$} $line -> txt]} {
        set enDef [string trim $txt]
        continue
    }
    if {[regexp {^-\s+DE:\s*(.+)$} $line -> txt]} {
        set deDef [string trim $txt]
        continue
    }

    # Example markers -- open fence on next ```/~~~ line
    if {[regexp {^-\s+EN-EX:\s*(.*)$} $line -> rest]} {
        set rest [string trim $rest]
        if {$rest ne ""} {
            # Single-line example given inline
            set enEx $rest
        } else {
            set fenceTarget "en_ex"
            set fenceBuf {}
        }
        continue
    }
    if {[regexp {^-\s+DE-EX:\s*(.*)$} $line -> rest]} {
        set rest [string trim $rest]
        if {$rest ne ""} {
            set deEx $rest
        } else {
            set fenceTarget "de_ex"
            set fenceBuf {}
        }
        continue
    }

    # Cross-references
    if {[regexp {^-\s+RELATED:\s*(.+)$} $line -> txt]} {
        set related [string trim $txt]
        continue
    }
    if {[regexp {^-\s+SEE:\s*(.+)$} $line -> txt]} {
        set seeAlso [string trim $txt]
        continue
    }

    # If a fence opens immediately after EN-EX: / DE-EX: (no content)
    # ... was handled by setting fenceTarget. Now opening line:
    if {$fenceTarget ne ""} {
        # Should not reach here; fenceTarget is set, lookup is above
    } elseif {[regexp {^[ \t]*(```|~~~)\s*\w*\s*$} $line]} {
        # An opening fence appears without a prior EN-EX:/DE-EX: cue
        # (e.g. inside body text) -- ignore to avoid accidental capture.
    }
}

# Flush last term
flushTerm

# ---------------------------------------------------------------
# Stats
# ---------------------------------------------------------------
puts ""
puts "=========================================="
puts "Import complete."
puts "  Terms inserted: $termsCount"
puts "=========================================="

if {[catch {
    set stats [db allrows -as dicts -nullvalue 0 {SELECT * FROM stats}]
    if {[llength $stats] > 0} {
        set s [lindex $stats 0]
        puts "DB totals: [dict get $s total_terms] terms, [dict get $s total_categories] categories"
    }
}]} {}

db close
exit 0
