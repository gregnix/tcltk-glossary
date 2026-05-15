#!/usr/bin/env tclsh
# import_csv.tcl -- Import glossary from RFC 4180 CSV into SQLite.
#
# Expected columns (header row required, exact order):
#   term, category, en_definition, de_definition,
#   en_example, de_example, related_terms, see_also
#
# Multi-line cells must be quoted with double-quotes per RFC 4180.
#
# Usage:
#   tclsh import_csv.tcl <input.csv> <output.db>

package require tdbc::sqlite3
package require csv          ;# tcllib
package require fileutil     ;# tcllib (for foreachLine)

if {[llength $argv] < 2} {
    puts stderr "Usage: $argv0 <input.csv> <output.db>"
    exit 1
}
set inFile [lindex $argv 0]
set outDb  [lindex $argv 1]

if {![file exists $inFile]} {
    puts stderr "Error: input file not found: $inFile"
    exit 1
}

# Schema setup
set schemaFile [file join [file dirname [info script]] schema.sql]
if {[file exists $schemaFile] && ![file exists $outDb]} {
    if {[catch {exec sqlite3 $outDb < $schemaFile} err]} {
        puts stderr "Error creating schema: $err"
        exit 1
    }
}

tdbc::sqlite3::connection create db $outDb

# ---------------------------------------------------------------
# Read CSV with RFC 4180 quoted multi-line support
# ---------------------------------------------------------------
set fp [open $inFile r]
fconfigure $fp -encoding utf-8 -translation auto
set rawCsv [read $fp]
close $fp

# csv::split with quoted multiline:
# tcllib's ::csv::split splits a single line; for multiline we need to
# build records from the input stream. Use ::csv::iscomplete to merge.
set records {}
set buf ""
foreach line [split $rawCsv "\n"] {
    if {$buf eq ""} {
        set buf $line
    } else {
        append buf "\n" $line
    }
    if {[::csv::iscomplete $buf]} {
        lappend records [::csv::split $buf]
        set buf ""
    }
}
if {[string trim $buf] ne ""} {
    # Trailing incomplete line -- best effort
    lappend records [::csv::split $buf]
}

if {[llength $records] < 2} {
    puts stderr "Error: CSV needs header row plus at least one data row"
    exit 1
}

# Header
set header [lindex $records 0]
set expected {term category en_definition de_definition en_example de_example related_terms see_also}
if {$header ne $expected} {
    puts stderr "Error: CSV header mismatch."
    puts stderr "  Expected: $expected"
    puts stderr "  Got:      $header"
    exit 1
}

# Data rows
set termsCount 0
set seenCategories {}

set stmt [db prepare {
    INSERT INTO terms
        (term, category, en_definition, de_definition,
         en_example, de_example, related_terms, see_also)
    VALUES
        (:term, :category, :en_def, :de_def,
         :en_ex, :de_ex, :related, :see)
}]

set chkStmt [db prepare {
    SELECT COUNT(*) FROM terms WHERE term = :term AND category = :category
}]

set catStmt [db prepare {
    INSERT INTO categories (name, sort_order) VALUES (:name, 999)
}]
set catChk  [db prepare {
    SELECT COUNT(*) FROM categories WHERE name = :name
}]

foreach row [lrange $records 1 end] {
    if {[llength $row] != 8} {
        puts stderr "WARN: skipping row with ${llength $row} columns (expected 8): [string range [join $row ,] 0 60]..."
        continue
    }
    lassign $row term category en_def de_def en_ex de_ex related see
    set term     [string trim $term]
    set category [string trim $category]
    if {$term eq "" || $category eq ""} continue

    # Ensure category exists
    if {$category ni $seenCategories} {
        set chkRows [$catChk allrows -as lists -- [list name $category]]
        if {[lindex [lindex $chkRows 0] 0] == 0} {
            set name $category
            $catStmt execute
            puts "\nCategory: $category"
        }
        lappend seenCategories $category
    }

    # Skip if (term, category) already exists
    set chkRows [$chkStmt allrows -as lists -- [list term $term category $category]]
    if {[lindex [lindex $chkRows 0] 0] > 0} {
        puts "  SKIP duplicate: $term"
        continue
    }

    $stmt execute
    puts "  + $term"
    incr termsCount
}

$stmt close
$chkStmt close
$catStmt close
$catChk close

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
