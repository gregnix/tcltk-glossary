#!/usr/bin/env tclsh
# Import Markdown Glossary -> SQLite (via TDBC)
# Usage: tclsh import_md.tcl glossary30.md output.db

package require tdbc::sqlite3

if {[llength $argv] < 2} {
    puts "Usage: $argv0 <input.md> <output.db>"
    puts "Example: $argv0 ../tcl_tk_glossary30.md glossary.db"
    exit 1
}

set input_file [lindex $argv 0]
set output_db [lindex $argv 1]

if {![file exists $input_file]} {
    puts "Error: Input file not found: $input_file"
    exit 1
}

# DB oeffnen/erstellen (TDBC)
tdbc::sqlite3::connection create db $output_db

# Schema laden
set schema_file [file join [file dirname [info script]] schema.sql]
if {![file exists $schema_file]} {
    puts "Error: Schema file not found: $schema_file"
    exit 1
}

puts "Creating database schema..."

# Schema via sqlite3 CLI laden (einfacher fuer DDL mit TRIGGERs)
if {[catch {exec sqlite3 $output_db < $schema_file} err]} {
    puts stderr "Error creating schema: $err"
    exit 1
}

# DB reconnect mit TDBC (nach Schema-Erstellung)
db close
tdbc::sqlite3::connection create db $output_db

# MD-Datei einlesen
puts "Reading markdown file: $input_file"
set fp [open $input_file r]
fconfigure $fp -encoding utf-8
set content [read $fp]
close $fp

# Parse Markdown
set current_category ""
set current_term ""
set en_def ""
set de_def ""
set in_footer 0

proc save_term {db category term en_def de_def} {
    if {$term eq ""} return
    
    set term [string trim $term]
    set en_def [string trim $en_def]
    set de_def [string trim $de_def]
    
    if {$term eq ""} return
    
    # Bereits vorhanden? (TDBC) — pro Kategorie eindeutig (Schema 1.5)
    set result [$db allrows -as lists {
        SELECT COUNT(*) FROM terms WHERE term = :term AND category = :category
    }]
    set exists [lindex [lindex $result 0] 0]
    if {$exists > 0} {
        puts "  SKIP (duplicate in '$category'): $term"
        return
    }
    
    # INSERT (TDBC mit Prepared Statement)
    set stmt [$db prepare {
        INSERT INTO terms (term, category, en_definition, de_definition)
        VALUES (:term, :category, :en_def, :de_def)
    }]
    $stmt execute
    $stmt close
    
    puts "  + $term"
}

set line_num 0
set terms_count 0
set categories_count 0

foreach line [split $content "\n"] {
    incr line_num
    
    # Kategorie-Header (## ...)
    if {[regexp {^##\s+(.+)$} $line -> cat_name]} {
        # Vorherigen Term speichern
        if {$current_term ne ""} {
            save_term db $current_category $current_term $en_def $de_def
            incr terms_count
        }
        
        set heading [string trim $cat_name]
        
        # Reservierte Footer-Headers ueberspringen (License-Block am Ende
        # exportierter Markdown-Dateien). Diese sind keine Kategorien.
        if {$heading in {License Acknowledgments}} {
            set current_category ""
            set current_term ""
            set en_def ""
            set de_def ""
            set in_footer 1
            continue
        }
        
        set in_footer 0
        set current_category $heading
        set current_term ""
        set en_def ""
        set de_def ""
        
        # Kategorie speichern (TDBC)
        set result [db allrows -as lists {SELECT COUNT(*) FROM categories WHERE name = :current_category}]
        set exists [lindex [lindex $result 0] 0]
        if {$exists == 0} {
            set stmt [db prepare {INSERT INTO categories (name, sort_order) VALUES (:current_category, :categories_count)}]
            $stmt execute
            $stmt close
            incr categories_count
            puts "\nCategory: $current_category"
        }
        continue
    }
    
    # Im Footer-Bereich: alles weitere ignorieren bis zum naechsten ##
    if {[info exists in_footer] && $in_footer} {
        continue
    }
    
    # Term-Header (**term**)
    if {[regexp {^\*\*(.+?)\*\*\s*$} $line -> term]} {
        # Vorherigen Term speichern
        if {$current_term ne ""} {
            save_term db $current_category $current_term $en_def $de_def
            incr terms_count
        }
        
        set current_term [string trim $term]
        set en_def ""
        set de_def ""
        continue
    }
    
    # EN-Zeile (- EN: ...)
    if {[regexp {^-\s+EN:\s*(.+)$} $line -> def]} {
        set en_def [string trim $def]
        continue
    }
    
    # DE-Zeile (- DE: ...)
    if {[regexp {^-\s+DE:\s*(.+)$} $line -> def]} {
        set de_def [string trim $def]
        continue
    }
}

# Letzten Term speichern
if {$current_term ne ""} {
    save_term db $current_category $current_term $en_def $de_def
    incr terms_count
}

# Statistik
puts "\n=========================================="
puts "Import complete!"
puts "=========================================="
puts "Terms imported:      $terms_count"
puts "Categories found:    $categories_count"

# TDBC: allrows -as dicts
set stats [db allrows -as dicts {SELECT * FROM stats}]
if {[llength $stats] > 0} {
    set row [lindex $stats 0]
    puts "Total terms in DB:   [dict get $row total_terms]"
    puts "Total categories:    [dict get $row total_categories]"
    puts "Bilingual terms:     [dict get $row bilingual_terms]"
    puts "Terms with examples: [dict get $row terms_with_examples]"
}

db close

puts "\nDatabase: $output_db"
puts "Ready for use with glossary_gui.tcl or glossary_tui.tcl"

