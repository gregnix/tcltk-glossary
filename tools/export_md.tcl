#!/usr/bin/env tclsh
# export_md.tcl -- Export glossary to extended Markdown.
#
# Output format documented in docs/glossary-formats.md.
#
# Usage:
#   tclsh export_md.tcl <input.db> <output.md>
#   tclsh export_md.tcl --category "Tcl Concepts" <input.db> <output.md>
#   tclsh export_md.tcl --bilingual-only <input.db> <output.md>

package require tdbc::sqlite3

set categoryFilter ""
set bilingualOnly  0

# Parse args
set positional {}
foreach arg $argv {
    switch -glob -- $arg {
        --category=*  { set categoryFilter [string range $arg 11 end] }
        --category    { error "Use --category=NAME (no space)" }
        --bilingual-only { set bilingualOnly 1 }
        --help - -h {
            puts "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] <input.db> <output.md>"
            exit 0
        }
        default { lappend positional $arg }
    }
}

if {[llength $positional] < 2} {
    puts stderr "Usage: $argv0 \[--category=NAME\] \[--bilingual-only\] <input.db> <output.md>"
    exit 1
}
set inDb   [lindex $positional 0]
set outMd  [lindex $positional 1]

if {![file exists $inDb]} {
    puts stderr "Error: db not found: $inDb"
    exit 1
}

tdbc::sqlite3::connection create db $inDb

# Build query
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

# ---------------------------------------------------------------
# Write Markdown
# ---------------------------------------------------------------
set fp [open $outMd w]
fconfigure $fp -encoding utf-8 -translation lf

# Header
puts $fp "# Glossary export"
puts $fp ""
puts $fp "Source database: `$inDb`  "
puts $fp "Exported: [clock format [clock seconds] -format {%Y-%m-%dT%H:%M:%SZ} -gmt 1]  "
puts $fp "Terms: [llength $rows]"
if {$categoryFilter ne ""} {
    puts $fp "  "
    puts $fp "Filter: category = `$categoryFilter`"
}
puts $fp ""

set currentCategory ""
foreach r $rows {
    set cat [dict get $r category]
    if {$cat ne $currentCategory} {
        puts $fp ""
        puts $fp "## $cat"
        puts $fp ""
        set currentCategory $cat
    }

    set term      [dict get $r term]
    set en_def    [dict get $r en_definition]
    set de_def    [dict get $r de_definition]
    set en_ex     [dict get $r en_example]
    set de_ex     [dict get $r de_example]
    set related   [dict get $r related_terms]
    set see_also  [dict get $r see_also]

    puts $fp "**$term**"
    if {$en_def ne ""} { puts $fp "- EN: $en_def" }
    if {$de_def ne ""} { puts $fp "- DE: $de_def" }
    if {$en_ex ne ""} {
        puts $fp "- EN-EX:"
        puts $fp "```tcl"
        puts $fp $en_ex
        puts $fp "```"
    }
    if {$de_ex ne ""} {
        puts $fp "- DE-EX:"
        puts $fp "```tcl"
        puts $fp $de_ex
        puts $fp "```"
    }
    if {$related ne ""}  { puts $fp "- RELATED: $related" }
    if {$see_also ne ""} { puts $fp "- SEE: $see_also" }
    puts $fp ""
}

close $fp
db close

puts "Exported [llength $rows] terms to $outMd"
exit 0
