#!/usr/bin/env tclsh
# Tcl/Tk Glossary Manager - TUI (Terminal User Interface)
# Version: 1.0
# KEINE Tk-Widgets - Reines Terminal!

package require tdbc::sqlite3

# Globale Variablen
set ::db_path ""
set ::current_page 0
set ::page_size 20
set ::search_results {}
set ::current_category "all"

# ANSI Color Codes
set ::COLOR_RESET "\033\[0m"
set ::COLOR_BOLD "\033\[1m"
set ::COLOR_BLUE "\033\[34m"
set ::COLOR_GREEN "\033\[32m"
set ::COLOR_YELLOW "\033\[33m"
set ::COLOR_CYAN "\033\[36m"
set ::COLOR_GRAY "\033\[90m"

# DB-Verbindung (TDBC)
proc connect_db {db_file} {
    if {[catch {tdbc::sqlite3::connection create ::glossdb $db_file} err]} {
        puts "ERROR: Could not open database: $err"
        return 0
    }
    set ::db_path $db_file
    return 1
}

# Header ausgeben
proc print_header {} {
    puts "\n$::COLOR_BOLD$::COLOR_BLUE[string repeat = 70]$::COLOR_RESET"
    puts "$::COLOR_BOLD  Tcl/Tk Glossary Manager (TUI)$::COLOR_RESET"
    puts "$::COLOR_BOLD$::COLOR_BLUE[string repeat = 70]$::COLOR_RESET\n"
}

# Menu ausgeben
proc print_menu {} {
    puts "\n$::COLOR_YELLOW\[MENU\]$::COLOR_RESET"
    puts "  ${::COLOR_GREEN}s$::COLOR_RESET) Suche"
    puts "  ${::COLOR_GREEN}c$::COLOR_RESET) Kategorien"
    puts "  ${::COLOR_GREEN}a$::COLOR_RESET) Alle Begriffe"
    puts "  ${::COLOR_GREEN}i$::COLOR_RESET) Statistik"
    puts "  ${::COLOR_GREEN}h$::COLOR_RESET) Hilfe"
    puts "  ${::COLOR_GREEN}q$::COLOR_RESET) Beenden"
    puts ""
}

# Sicherer dict-Zugriff: TDBC mit `-as dicts` laesst NULL-Spalten weg,
# daher liefert `dict get` einen Fehler wenn die Spalte NULL ist.
# Diese Hilfsproc gibt einen Default-Wert zurueck wenn der Key fehlt.
proc dict_get_safe {d key {default ""}} {
    if {[dict exists $d $key]} {
        return [dict get $d $key]
    }
    return $default
}

# Begriff anzeigen (TDBC)
proc display_term {term_id} {
    set result [::glossdb allrows -as dicts {SELECT * FROM terms WHERE id = :term_id}]
    if {[llength $result] == 0} return
    
    set row [lindex $result 0]
    puts "\n$::COLOR_BOLD$::COLOR_BLUE[string repeat = 70]$::COLOR_RESET"
    puts "$::COLOR_BOLD[dict_get_safe $row term]$::COLOR_RESET"
    puts "${::COLOR_GRAY}([dict_get_safe $row category])${::COLOR_RESET}"
    puts "$::COLOR_BLUE[string repeat = 70]$::COLOR_RESET\n"
    
    set en_def [dict_get_safe $row en_definition]
    if {$en_def ne ""} {
        puts "${::COLOR_CYAN}English:$::COLOR_RESET"
        puts "[wrap_text $en_def 68]\n"
    }
    
    set de_def [dict_get_safe $row de_definition]
    if {$de_def ne ""} {
        puts "${::COLOR_CYAN}Deutsch:$::COLOR_RESET"
        puts "[wrap_text $de_def 68]\n"
    }
    
    set en_ex [dict_get_safe $row en_example]
    if {$en_ex ne ""} {
        puts "${::COLOR_CYAN}Example (EN):$::COLOR_RESET"
        puts "$::COLOR_GRAY[indent_text $en_ex 2]$::COLOR_RESET\n"
    }
    
    set de_ex [dict_get_safe $row de_example]
    if {$de_ex ne ""} {
        puts "${::COLOR_CYAN}Beispiel (DE):$::COLOR_RESET"
        puts "$::COLOR_GRAY[indent_text $de_ex 2]$::COLOR_RESET\n"
    }
    
    set related [dict_get_safe $row related_terms]
    if {$related ne ""} {
        puts "${::COLOR_GRAY}Verwandte Begriffe: $related$::COLOR_RESET"
    }
    
    set seealso [dict_get_safe $row see_also]
    if {$seealso ne ""} {
        puts "${::COLOR_GRAY}Siehe auch: $seealso$::COLOR_RESET"
    }
    
    set notes [dict_get_safe $row notes]
    if {$notes ne ""} {
        puts "\n${::COLOR_YELLOW}Notizen:$::COLOR_RESET"
        puts "$::COLOR_GRAY[wrap_text $notes 68]$::COLOR_RESET"
    }
    
    puts "\n$::COLOR_BLUE[string repeat - 70]$::COLOR_RESET"
}

# Text umbrechen
proc wrap_text {text width} {
    set lines {}
    set words [split $text]
    set line ""
    
    foreach word $words {
        if {[string length "$line $word"] > $width} {
            lappend lines [string trim $line]
            set line $word
        } else {
            append line " $word"
        }
    }
    
    if {$line ne ""} {
        lappend lines [string trim $line]
    }
    
    return [join $lines "\n"]
}

# Text einruecken
proc indent_text {text indent} {
    set prefix [string repeat " " $indent]
    set lines {}
    foreach line [split $text "\n"] {
        lappend lines "$prefix$line"
    }
    return [join $lines "\n"]
}

# Suche
proc search_terms {} {
    puts -nonewline "${::COLOR_YELLOW}Suchbegriff: $::COLOR_RESET"
    flush stdout
    if {[gets stdin query] < 0} { return }
    
    if {$query eq ""} return
    
    set ::search_results {}
    set query_like "%$query%"
    
    # TDBC: allrows -as dicts
    set results [::glossdb allrows -as dicts {
        SELECT id, term, category FROM terms
        WHERE term LIKE :query_like
           OR en_definition LIKE :query_like
           OR de_definition LIKE :query_like
        ORDER BY term COLLATE NOCASE
        LIMIT 50
    }]
    
    foreach row $results {
        lappend ::search_results [list [dict get $row id] [dict get $row term] [dict get $row category]]
    }
    
    set count [llength $::search_results]
    
    if {$count == 0} {
        puts "${::COLOR_YELLOW}Keine Ergebnisse gefunden.$::COLOR_RESET"
        return
    }
    
    puts "\n${::COLOR_GREEN}Ergebnisse ($count):$::COLOR_RESET\n"
    
    set num 1
    foreach item $::search_results {
        lassign $item id term category
        puts [format "  %2d) %-30s ${::COLOR_GRAY}\[%s\]$::COLOR_RESET" $num $term $category]
        incr num
    }
    
    puts "\n${::COLOR_YELLOW}Auswahl (1-$count, 0=Zurueck):$::COLOR_RESET "
    puts -nonewline "> "
    flush stdout
    if {[gets stdin choice] < 0} { return }
    
    if {$choice eq "0" || $choice eq ""} return
    
    if {[string is integer -strict $choice] && $choice > 0 && $choice <= $count} {
        set item [lindex $::search_results [expr {$choice - 1}]]
        lassign $item id term category
        display_term $id
        
        puts "\n${::COLOR_YELLOW}\[Enter\] = Zurueck$::COLOR_RESET"
        if {[gets stdin] < 0} { return }
    }
}

# Alle Kategorien (TDBC)
proc show_categories {} {
    set categories {}
    
    # TDBC: allrows -as dicts
    set results [::glossdb allrows -as dicts {
        SELECT category, COUNT(*) as cnt FROM terms
        GROUP BY category
        ORDER BY category
    }]
    
    foreach row $results {
        lappend categories [list [dict get $row category] [dict get $row cnt]]
    }
    
    puts "\n${::COLOR_GREEN}Kategorien:$::COLOR_RESET\n"
    
    set num 1
    foreach cat $categories {
        lassign $cat name count
        puts [format "  %2d) %-40s ${::COLOR_GRAY}(%d)$::COLOR_RESET" $num $name $count]
        incr num
    }
    
    set max_num [llength $categories]
    puts "\n${::COLOR_YELLOW}Auswahl (1-$max_num, 0=Zurueck):$::COLOR_RESET "
    puts -nonewline "> "
    flush stdout
    if {[gets stdin choice] < 0} { return }
    
    if {$choice eq "0" || $choice eq ""} return
    
    if {[string is integer -strict $choice] && $choice > 0 && $choice <= $max_num} {
        set cat_name [lindex [lindex $categories [expr {$choice - 1}]] 0]
        browse_category $cat_name
    }
}

# Kategorie durchsuchen (TDBC)
proc browse_category {category} {
    set terms {}
    
    # TDBC: allrows -as dicts
    set results [::glossdb allrows -as dicts {
        SELECT id, term FROM terms
        WHERE category = :category
        ORDER BY term COLLATE NOCASE
    }]
    
    foreach row $results {
        lappend terms [list [dict get $row id] [dict get $row term]]
    }
    
    puts "\n${::COLOR_GREEN}Kategorie: $category$::COLOR_RESET\n"
    
    set num 1
    foreach item $terms {
        lassign $item id term
        puts [format "  %2d) %s" $num $term]
        incr num
    }
    
    set max_num [llength $terms]
    puts "\n${::COLOR_YELLOW}Auswahl (1-$max_num, 0=Zurueck):$::COLOR_RESET "
    puts -nonewline "> "
    flush stdout
    if {[gets stdin choice] < 0} { return }
    
    if {$choice eq "0" || $choice eq ""} return
    
    if {[string is integer -strict $choice] && $choice > 0 && $choice <= $max_num} {
        set item [lindex $terms [expr {$choice - 1}]]
        lassign $item id term
        display_term $id
        
        puts "\n${::COLOR_YELLOW}\[Enter\] = Zurueck$::COLOR_RESET"
        if {[gets stdin] < 0} { return }
    }
}

# Alle Begriffe (TDBC)
proc browse_all_terms {} {
    set terms {}
    
    # TDBC: allrows -as dicts
    set results [::glossdb allrows -as dicts {
        SELECT id, term, category FROM terms
        ORDER BY term COLLATE NOCASE
        LIMIT 100
    }]
    
    foreach row $results {
        lappend terms [list [dict get $row id] [dict get $row term] [dict get $row category]]
    }
    
    puts "\n${::COLOR_GREEN}Alle Begriffe (erste 100):$::COLOR_RESET\n"
    
    set num 1
    foreach item $terms {
        lassign $item id term category
        puts [format "  %2d) %-30s ${::COLOR_GRAY}\[%s\]$::COLOR_RESET" $num $term $category]
        incr num
    }
    
    set max_num [llength $terms]
    puts "\n${::COLOR_YELLOW}Auswahl (1-$max_num, 0=Zurueck):$::COLOR_RESET "
    puts -nonewline "> "
    flush stdout
    if {[gets stdin choice] < 0} { return }
    
    if {$choice eq "0" || $choice eq ""} return
    
    if {[string is integer -strict $choice] && $choice > 0 && $choice <= $max_num} {
        set item [lindex $terms [expr {$choice - 1}]]
        lassign $item id term category
        display_term $id
        
        puts "\n${::COLOR_YELLOW}\[Enter\] = Zurueck$::COLOR_RESET"
        if {[gets stdin] < 0} { return }
    }
}

# Statistik (TDBC)
proc show_statistics {} {
    set stats [::glossdb allrows -as dicts {SELECT * FROM stats}]
    if {[llength $stats] > 0} {
        set row [lindex $stats 0]
        puts "\n${::COLOR_BOLD}Datenbank-Statistik:$::COLOR_RESET"
        puts "$::COLOR_BLUE[string repeat = 40]$::COLOR_RESET"
        puts "  Begriffe gesamt:     [dict get $row total_terms]"
        puts "  Kategorien:          [dict get $row total_categories]"
        puts "  Bilinguale Begriffe: [dict get $row bilingual_terms]"
        puts "  Mit Beispielen:      [dict get $row terms_with_examples]"
        puts "$::COLOR_BLUE[string repeat = 40]$::COLOR_RESET\n"
    }
    
    puts "${::COLOR_YELLOW}\[Enter\] = Zurueck$::COLOR_RESET"
    if {[gets stdin] < 0} { return }
}

# Hilfe
proc show_help {} {
    puts "\n${::COLOR_BOLD}Hilfe:$::COLOR_RESET"
    puts "$::COLOR_BLUE[string repeat = 40]$::COLOR_RESET"
    puts "  ${::COLOR_GREEN}s$::COLOR_RESET) Suchbegriff eingeben"
    puts "  ${::COLOR_GREEN}c$::COLOR_RESET) Kategorien durchsuchen"
    puts "  ${::COLOR_GREEN}a$::COLOR_RESET) Alle Begriffe anzeigen"
    puts "  ${::COLOR_GREEN}i$::COLOR_RESET) Statistik anzeigen"
    puts "  ${::COLOR_GREEN}q$::COLOR_RESET) Programm beenden"
    puts "$::COLOR_BLUE[string repeat = 40]$::COLOR_RESET\n"
    
    puts "${::COLOR_YELLOW}\[Enter\] = Zurueck$::COLOR_RESET"
    if {[gets stdin] < 0} { return }
}

# Main Loop
proc main_loop {} {
    while {1} {
        print_menu
        puts -nonewline "${::COLOR_YELLOW}Auswahl: $::COLOR_RESET"
        flush stdout
        if {[gets stdin choice] < 0} { break }
        
        switch -exact -- [string tolower $choice] {
            "s" { search_terms }
            "c" { show_categories }
            "a" { browse_all_terms }
            "i" { show_statistics }
            "h" { show_help }
            "q" { break }
            default {
                puts "${::COLOR_YELLOW}Unbekannte Auswahl. Bitte 's', 'c', 'a', 'i', 'h' oder 'q'.$::COLOR_RESET"
            }
        }
    }
    
    puts "\n${::COLOR_GREEN}Auf Wiedersehen!$::COLOR_RESET\n"
}

# MAIN
if {[llength $argv] < 1} {
    puts "Usage: $argv0 <glossary.db>"
    puts "Example: $argv0 glossary.db"
    exit 1
}

set db_file [lindex $argv 0]

if {![file exists $db_file]} {
    puts "ERROR: Database file not found: $db_file"
    exit 1
}

if {![connect_db $db_file]} {
    exit 1
}

print_header
puts "${::COLOR_GREEN}Datenbank: $db_file$::COLOR_RESET"

# TDBC: Stats anzeigen
set stats [::glossdb allrows -as dicts {SELECT * FROM stats}]
if {[llength $stats] > 0} {
    set row [lindex $stats 0]
    puts "${::COLOR_GRAY}Begriffe: [dict get $row total_terms] | Kategorien: [dict get $row total_categories]$::COLOR_RESET"
}

main_loop

::glossdb close

