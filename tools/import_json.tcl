#!/usr/bin/env tclsh
# import_json.tcl -- Import glossary from JSON into SQLite (via rl_json).
#
# Expected top-level schema: "tcltk-glossary/1.5" (or compatible).
# See docs/glossary-formats.md for the full format.
#
# Usage:
#   tclsh import_json.tcl <input.json> <output.db>

package require tdbc::sqlite3
package require rl_json

if {[llength $argv] < 2} {
    puts stderr "Usage: $argv0 <input.json> <output.db>"
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
# Read + parse JSON
# ---------------------------------------------------------------
set fp [open $inFile r]
fconfigure $fp -encoding utf-8
set raw [read $fp]
close $fp

if {[catch {
    set schemaTag [::rl_json::json get $raw schema]
} err]} {
    puts stderr "Error: invalid JSON or missing 'schema' field: $err"
    exit 1
}

# Accept known schema versions
set accepted {tcltk-glossary/1.5}
if {$schemaTag ni $accepted} {
    puts stderr "WARN: unknown schema '$schemaTag' (expected one of: $accepted)"
    puts stderr "      Continuing best-effort. Re-run with the right tool if errors occur."
}

if {![::rl_json::json exists $raw terms]} {
    puts stderr "Error: JSON has no 'terms' array."
    exit 1
}

set nTerms [::rl_json::json length $raw terms]
puts "Schema:    $schemaTag"
puts "Terms in input: $nTerms"
puts ""

# ---------------------------------------------------------------
# Prepared statements
# ---------------------------------------------------------------
set chkStmt [db prepare {
    SELECT COUNT(*) FROM terms WHERE term = :term AND category = :category
}]
set insStmt [db prepare {
    INSERT INTO terms
        (term, category, en_definition, de_definition,
         en_example, de_example, related_terms, see_also)
    VALUES
        (:term, :category, :en_def, :de_def,
         :en_ex, :de_ex, :related, :see)
}]
set catChk [db prepare {SELECT COUNT(*) FROM categories WHERE name = :name}]
set catIns [db prepare {INSERT INTO categories (name, sort_order) VALUES (:name, 999)}]

# ---------------------------------------------------------------
# Helper: array of strings → "comma, separated, list" for DB storage
# ---------------------------------------------------------------
proc jsonArrayToCsv {jsonValue} {
    if {$jsonValue eq ""} { return "" }
    set n [::rl_json::json length $jsonValue]
    if {$n == 0} { return "" }
    set parts {}
    for {set i 0} {$i < $n} {incr i} {
        lappend parts [::rl_json::json get $jsonValue $i]
    }
    return [join $parts ", "]
}

# ---------------------------------------------------------------
# Walk terms
# ---------------------------------------------------------------
set termsCount 0
set seenCategories {}

for {set i 0} {$i < $nTerms} {incr i} {
    set termObj [::rl_json::json extract $raw terms $i]

    set term      [::rl_json::json get $termObj term]
    set category  [::rl_json::json get $termObj category]
    set en_def    [::rl_json::json get $termObj en_definition]
    set de_def    [::rl_json::json get $termObj de_definition]
    set en_ex     [::rl_json::json get $termObj en_example]
    set de_ex     [::rl_json::json get $termObj de_example]

    set relatedJson ""
    if {[::rl_json::json exists $termObj related_terms]} {
        set relatedJson [::rl_json::json extract $termObj related_terms]
    }
    set seeJson ""
    if {[::rl_json::json exists $termObj see_also]} {
        set seeJson [::rl_json::json extract $termObj see_also]
    }
    set related [jsonArrayToCsv $relatedJson]
    set see     [jsonArrayToCsv $seeJson]

    set term     [string trim $term]
    set category [string trim $category]
    if {$term eq "" || $category eq ""} continue

    # Ensure category exists
    if {$category ni $seenCategories} {
        set rows [$catChk allrows -as lists -- [list name $category]]
        if {[lindex [lindex $rows 0] 0] == 0} {
            set name $category
            $catIns execute
            puts "\nCategory: $category"
        }
        lappend seenCategories $category
    }

    # Skip duplicate
    set rows [$chkStmt allrows -as lists -- [list term $term category $category]]
    if {[lindex [lindex $rows 0] 0] > 0} {
        puts "  SKIP duplicate: $term"
        continue
    }

    $insStmt execute
    puts "  + $term"
    incr termsCount
}

$chkStmt close
$insStmt close
$catChk close
$catIns close

puts ""
puts "=========================================="
puts "Import complete."
puts "  Terms inserted: $termsCount of $nTerms in input"
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
