#!/usr/bin/env tclsh
# export_csv.tcl -- Export glossary to RFC 4180 CSV.
#
# Usage:
#   tclsh export_csv.tcl <input.db> <output.csv>
#   tclsh export_csv.tcl --category=NAME <input.db> <output.csv>
#   tclsh export_csv.tcl --bilingual-only <input.db> <output.csv>

package require tdbc::sqlite3
package require csv

set categoryFilter ""
set bilingualOnly  0
set positional {}
foreach arg $argv {
    switch -glob -- $arg {
        --category=*  { set categoryFilter [string range $arg 11 end] }
        --bilingual-only { set bilingualOnly 1 }
        --help - -h {
            puts "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] <input.db> <output.csv>"
            exit 0
        }
        default { lappend positional $arg }
    }
}

if {[llength $positional] < 2} {
    puts stderr "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] <input.db> <output.csv>"
    exit 1
}
set inDb  [lindex $positional 0]
set outCsv [lindex $positional 1]

if {![file exists $inDb]} {
    puts stderr "Error: db not found: $inDb"
    exit 1
}

tdbc::sqlite3::connection create db $inDb

set where "1=1"
set params {}
if {$categoryFilter ne ""} {
    set where "category = :cat"
    lappend params cat $categoryFilter
}
if {$bilingualOnly} {
    append where " AND en_definition != '' AND de_definition != ''"
}

set sql "SELECT term, category,
                COALESCE(en_definition, '') AS en_definition,
                COALESCE(de_definition, '') AS de_definition,
                COALESCE(en_example,    '') AS en_example,
                COALESCE(de_example,    '') AS de_example,
                COALESCE(related_terms, '') AS related_terms,
                COALESCE(see_also,      '') AS see_also
         FROM terms
         WHERE $where
         ORDER BY category, term"

set rows [db allrows -as dicts -- $sql $params]

set fp [open $outCsv w]
fconfigure $fp -encoding utf-8 -translation lf

# Header
puts $fp [::csv::join {term category en_definition de_definition en_example de_example related_terms see_also}]

# Data
foreach r $rows {
    puts $fp [::csv::join [list \
        [dict get $r term] \
        [dict get $r category] \
        [dict get $r en_definition] \
        [dict get $r de_definition] \
        [dict get $r en_example] \
        [dict get $r de_example] \
        [dict get $r related_terms] \
        [dict get $r see_also]]]
}

close $fp
db close

puts "Exported [llength $rows] terms to $outCsv"
exit 0
