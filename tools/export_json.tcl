#!/usr/bin/env tclsh
# export_json.tcl -- Export glossary to JSON (via rl_json).
#
# Schema: tcltk-glossary/1.5
#
# Usage:
#   tclsh export_json.tcl <input.db> <output.json>
#   tclsh export_json.tcl --category=NAME <input.db> <output.json>
#   tclsh export_json.tcl --pretty <input.db> <output.json>     (default: compact)
#   tclsh export_json.tcl --bilingual-only <input.db> <output.json>

package require tdbc::sqlite3
package require rl_json

set categoryFilter ""
set bilingualOnly  0
set pretty 1                ;# default to pretty-printed for readability
set positional {}
foreach arg $argv {
    switch -glob -- $arg {
        --category=*  { set categoryFilter [string range $arg 11 end] }
        --bilingual-only { set bilingualOnly 1 }
        --pretty   { set pretty 1 }
        --compact  { set pretty 0 }
        --help - -h {
            puts "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] \[--pretty|--compact\] <input.db> <output.json>"
            exit 0
        }
        default { lappend positional $arg }
    }
}

if {[llength $positional] < 2} {
    puts stderr "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] <input.db> <output.json>"
    exit 1
}
set inDb   [lindex $positional 0]
set outJs  [lindex $positional 1]

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

# DB stats (informational)
set stats [db allrows -as dicts {SELECT * FROM stats}]
set totalTerms 0
set totalCats  0
if {[llength $stats] > 0} {
    set s [lindex $stats 0]
    set totalTerms [dict get $s total_terms]
    set totalCats  [dict get $s total_categories]
}

db close

# Helper: comma-list → JSON array of strings
proc csvToJsonArray {csv} {
    set csv [string trim $csv]
    if {$csv eq ""} { return {[]} }
    set items {}
    foreach item [split $csv ","] {
        set item [string trim $item]
        if {$item ne ""} { lappend items $item }
    }
    set j {[]}
    foreach item $items {
        ::rl_json::json set j end+1 [::rl_json::json string $item]
    }
    return $j
}

# Build root document
set doc [::rl_json::json template {
    {
        "schema":   "tcltk-glossary/1.5",
        "exported": "~S:nowIso",
        "stats":    {
            "terms":      "~N:totalTerms",
            "categories": "~N:totalCats"
        },
        "terms":    []
    }
} [list \
    nowIso     [clock format [clock seconds] -format {%Y-%m-%dT%H:%M:%SZ} -gmt 1] \
    totalTerms $totalTerms \
    totalCats  $totalCats]]

# Append each term
foreach r $rows {
    set t [::rl_json::json template {
        {
            "term":           "~S:term",
            "category":       "~S:cat",
            "en_definition":  "~S:enDef",
            "de_definition":  "~S:deDef",
            "en_example":     "~S:enEx",
            "de_example":     "~S:deEx",
            "related_terms":  "~J:relJ",
            "see_also":       "~J:seeJ"
        }
    } [list \
        term  [dict get $r term] \
        cat   [dict get $r category] \
        enDef [dict get $r en_definition] \
        deDef [dict get $r de_definition] \
        enEx  [dict get $r en_example] \
        deEx  [dict get $r de_example] \
        relJ  [csvToJsonArray [dict get $r related_terms]] \
        seeJ  [csvToJsonArray [dict get $r see_also]]]]
    ::rl_json::json set doc terms end+1 $t
}

# Output
set fp [open $outJs w]
fconfigure $fp -encoding utf-8 -translation lf
if {$pretty} {
    puts $fp [::rl_json::json pretty $doc]
} else {
    puts $fp $doc
}
close $fp

puts "Exported [llength $rows] terms to $outJs"
exit 0
