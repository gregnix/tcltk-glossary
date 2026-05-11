#!/usr/bin/env tclsh
# export_category.tcl - Export einzelne Kategorie aus Glossary-DB
# Usage: tclsh export_category.tcl glossary.db "Category Name" > output.md

package require tdbc::sqlite3

if {[llength $argv] < 2} {
    puts stderr "Usage: tclsh export_category.tcl <glossary.db> <category_pattern>"
    puts stderr ""
    puts stderr "Examples:"
    puts stderr "  tclsh export_category.tcl glossary.db \"Object-Oriented Tcl\" > tcloo.md"
    puts stderr "  tclsh export_category.tcl glossary.db \"%TclOO%\" > tcloo.md"
    puts stderr "  tclsh export_category.tcl glossary.db \"%Widget%\" > widgets.md"
    puts stderr ""
    puts stderr "Verfuegbare Kategorien:"
    tdbc::sqlite3::connection create tmpdb [lindex $argv 0]
    set cats [tmpdb allrows -as dicts {SELECT DISTINCT category FROM terms ORDER BY category}]
    foreach row $cats {
        puts stderr "  - [dict get $row category]"
    }
    tmpdb close
    exit 1
}

set db_file [lindex $argv 0]
set category_pattern [lindex $argv 1]

if {![file exists $db_file]} {
    puts stderr "Error: Database file not found: $db_file"
    exit 1
}

tdbc::sqlite3::connection create db $db_file

# Ermittle exakte Kategorien (TDBC)
set categories {}
set rows [db allrows -as dicts {
    SELECT DISTINCT category FROM terms 
    WHERE category LIKE :category_pattern
    ORDER BY category
}]
foreach row $rows {
    lappend categories [dict get $row category]
}

if {[llength $categories] == 0} {
    puts stderr "Error: No categories found matching '$category_pattern'"
    puts stderr ""
    puts stderr "Verfuegbare Kategorien:"
    set all_cats [db allrows -as dicts {SELECT DISTINCT category FROM terms ORDER BY category}]
    foreach row $all_cats {
        puts stderr "  - [dict get $row category]"
    }
    db close
    exit 1
}

# Header
puts "# Tcl/Tk Glossary - Export"
puts ""
puts "**Kategorien:** [join $categories {, }]"
puts "**Exportiert:** [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
puts "**Quelle:** $db_file"
puts ""

# Fuer jede Kategorie (TDBC)
foreach category $categories {
    # Anzahl Begriffe
    set result [db allrows -as lists {SELECT COUNT(*) FROM terms WHERE category = :category}]
    set count [lindex [lindex $result 0] 0]
    
    puts "## $category"
    puts ""
    puts "**Anzahl Begriffe:** $count"
    puts ""
    
    # Alle Begriffe dieser Kategorie (TDBC)
    set terms [db allrows -as dicts {
        SELECT * FROM terms 
        WHERE category = :category
        ORDER BY term COLLATE NOCASE
    }]
    
    foreach row $terms {
        set term [dict get $row term]
        set en_def [dict get $row en_definition]
        set de_def [dict get $row de_definition]
        set en_ex [dict get $row en_example]
        set de_ex [dict get $row de_example]
        set related [dict get $row related_terms]
        set see_also [dict get $row see_also]
        set notes [dict get $row notes]
        set tcl_ver [dict get $row tcl_version]
        
        puts "**$term**"
        
        if {$en_def ne ""} {
            puts "- EN: $en_def"
        }
        
        if {$de_def ne ""} {
            puts "- DE: $de_def"
        }
        
        if {$en_ex ne "" || $de_ex ne ""} {
            puts ""
            if {$en_ex ne ""} {
                puts "**Example (EN):**"
                puts "```tcl"
                puts $en_ex
                puts "```"
                puts ""
            }
            
            if {$de_ex ne ""} {
                puts "**Beispiel (DE):**"
                puts "```tcl"
                puts $de_ex
                puts "```"
                puts ""
            }
        }
        
        if {$related ne ""} {
            puts "**Verwandte Begriffe:** $related"
            puts ""
        }
        
        if {$see_also ne ""} {
            puts "**Siehe auch:** $see_also"
            puts ""
        }
        
        if {$notes ne ""} {
            puts "**Notizen:** $notes"
            puts ""
        }
        
        if {$tcl_ver ne ""} {
            puts "*Tcl-Version: $tcl_ver*"
            puts ""
        }
        
        puts ""
    }
}

db close

puts "---"
puts ""
puts "**Export-Info:**"
puts "- Exportierte Kategorien: [llength $categories]"
puts "- Format: Markdown (kompatibel mit Original)"
puts "- Verwendung: Kann direkt in tcl_tk_glossary30.md eingefuegt werden"


