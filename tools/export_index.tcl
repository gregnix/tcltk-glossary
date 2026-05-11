#!/usr/bin/env tclsh
# export_index.tcl - Erstelle Index mit allen Kategorien + 3 Beispiele pro Kategorie
# Usage: tclsh export_index.tcl glossary.db > glossary_index.md

package require tdbc::sqlite3

if {[llength $argv] < 1} {
    puts "Usage: tclsh export_index.tcl <glossary.db> \[output.md\]"
    puts "Example: tclsh export_index.tcl glossary.db > glossary_index.md"
    exit 1
}

set db_file [lindex $argv 0]

if {![file exists $db_file]} {
    puts stderr "Error: Database file not found: $db_file"
    exit 1
}

tdbc::sqlite3::connection create db $db_file

# Header
puts "# Tcl/Tk Glossary - Index"
puts ""
puts "**Automatisch generiert:** [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]"
puts ""

# Statistik (TDBC)
set stats [db allrows -as dicts {SELECT * FROM stats}]
if {[llength $stats] > 0} {
    set row [lindex $stats 0]
    puts "## Statistik"
    puts ""
    puts "- **Begriffe gesamt:** [dict get $row total_terms]"
    puts "- **Kategorien:** [dict get $row total_categories]"
    puts "- **Bilinguale Begriffe (EN+DE):** [dict get $row bilingual_terms]"
    puts "- **Mit Beispielen:** [dict get $row terms_with_examples]"
    puts ""
}

puts "---"
puts ""

# Kategorien mit Beispielen (TDBC)
puts "## Kategorien-Index"
puts ""

set cat_num 0
set categories [db allrows -as dicts {
    SELECT category, COUNT(*) as count 
    FROM terms 
    GROUP BY category 
    ORDER BY category
}]

foreach cat $categories {
    incr cat_num
    
    set category [dict get $cat category]
    set count [dict get $cat count]
    
    puts "### $cat_num. $category"
    puts ""
    puts "**Anzahl Begriffe:** $count"
    puts ""
    
    # Erste 3 Beispiele (TDBC)
    set example_num 0
    set terms [db allrows -as dicts {
        SELECT term, en_definition, de_definition
        FROM terms
        WHERE category = :category
        ORDER BY term
        LIMIT 3
    }]
    
    foreach term $terms {
        incr example_num
        
        set term_name [dict get $term term]
        set en_def [dict get $term en_definition]
        set de_def [dict get $term de_definition]
        
        puts "**$example_num) $term_name**"
        
        if {$en_def ne ""} {
            set en_short [string range $en_def 0 80]
            if {[string length $en_def] > 80} {
                append en_short "..."
            }
            puts "- EN: $en_short"
        }
        
        if {$de_def ne ""} {
            set de_short [string range $de_def 0 80]
            if {[string length $de_def] > 80} {
                append de_short "..."
            }
            puts "- DE: $de_short"
        }
        puts ""
    }
    
    if {$count > 3} {
        puts "*... und [expr {$count - 3}] weitere Begriffe*"
        puts ""
    }
    
    puts "---"
    puts ""
}

# Footer mit Export-Hinweisen
puts "## Weitere Aktionen"
puts ""
puts "### Einzelne Kategorie exportieren:"
puts ""
puts "```bash"
puts "# Beispiel: TclOO-Begriffe exportieren"
puts "tclsh export_category.tcl glossary.db \"Object-Oriented Tcl\" > tcloo_export.md"
puts "```"
puts ""
puts "### Alle Kategorien auflisten:"
puts ""
puts "```bash"
puts "sqlite3 glossary.db \"SELECT DISTINCT category FROM terms ORDER BY category;\""
puts "```"
puts ""
puts "### Begriffe mit fehlenden Definitionen:"
puts ""
puts "```bash"
puts "sqlite3 glossary.db \"SELECT term, category FROM terms WHERE en_definition IS NULL OR de_definition IS NULL;\""
puts "```"

db close

puts ""
puts "---"
puts "*Generiert aus: $db_file*"


