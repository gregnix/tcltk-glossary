#!/usr/bin/env tclsh
# export_full.tcl - Export der KOMPLETTEN Glossary-DB als Markdown
#                   mit Inhaltsverzeichnis (via Pandoc --toc) und
#                   alphabetischem Stichwortverzeichnis (Index).
#
# Usage: tclsh export_full.tcl glossary.db > glossary_full.md
#
# Anschliessend nach PDF wandeln:
#
#   pandoc glossary_full.md -o glossary_full.pdf \
#       --pdf-engine=xelatex \
#       -V lang=de \
#       -V geometry:margin=2cm \
#       -V mainfont="DejaVu Sans" \
#       -V monofont="DejaVu Sans Mono" \
#       -V fontsize=10pt \
#       --toc --toc-depth=2 \
#       -V colorlinks=true \
#       -V linkcolor=blue
#
# Voraussetzungen (Ubuntu/Debian):
#   sudo apt install pandoc texlive-xetex texlive-fonts-recommended

package require tdbc::sqlite3

# Stdout muss UTF-8 sein -- Umlaute aus der DB sonst kaputt
fconfigure stdout -encoding utf-8
fconfigure stderr -encoding utf-8

# Source-Datei kann UTF-8 sein, das Tcl-System-Encoding ist aber je
# nach Plattform anders (z.B. iso8859-1). Multi-Byte-Zeichen im Source
# wuerden sonst falsch interpretiert. Daher als Konstanten via \u-Escape:
set EMDASH "\u2014"

# ============================================================
# CLI
# ============================================================
if {[llength $argv] < 1} {
    puts stderr "Usage: tclsh export_full.tcl <glossary.db> \[--no-index\] \[--no-frontmatter\]"
    puts stderr "Output: vollstaendiger Markdown auf stdout, mit Inhaltsverzeichnis-fertiger"
    puts stderr "        Heading-Struktur und alphabetischem Index am Ende."
    exit 1
}

set db_file [lindex $argv 0]
set opt(includeIndex) 1
set opt(includeFrontmatter) 1
set opt(forDocir) 0
foreach a [lrange $argv 1 end] {
    switch -- $a {
        --no-index       { set opt(includeIndex) 0 }
        --no-frontmatter { set opt(includeFrontmatter) 0 }
        --for-docir {
            # docir::pdf erzeugt den Index selbst und braucht keine
            # Pandoc-Anker (`{#anker}`-Syntax in Headings) — fuehrt
            # bei docir::pdf-Render dazu dass die Anker-Syntax sichtbar
            # im Heading erscheint. Mit dieser Option weglassen.
            set opt(includeIndex) 0
            set opt(forDocir)     1
        }
        default {
            puts stderr "Unbekannte Option: $a"
            exit 2
        }
    }
}

if {![file exists $db_file]} {
    puts stderr "Error: Database file not found: $db_file"
    exit 1
}

# ============================================================
# Hilfsproc: NULL-Spalten-fest (TDBC laesst NULL-Keys weg)
# ============================================================
proc dict_get_safe {d key {default ""}} {
    if {[dict exists $d $key]} {
        return [dict get $d $key]
    }
    return $default
}

# ============================================================
# Pandoc-Anker erzeugen
# ============================================================
# Pandoc-Konvention: Lowercase, Leerzeichen -> "-", Sonderzeichen weg.
# Wir machen es deterministisch und eindeutig (ID-Suffix bei Kollision).
proc make_anchor {term {id ""}} {
    set a [string tolower $term]
    set a [regsub -all {[äÄ]} $a "ae"]
    set a [regsub -all {[öÖ]} $a "oe"]
    set a [regsub -all {[üÜ]} $a "ue"]
    set a [regsub -all {[ß]} $a "ss"]
    set a [regsub -all {[^a-z0-9]+} $a "-"]
    set a [string trim $a "-"]
    if {$a eq ""} { set a "term" }
    if {$id ne ""} {
        append a "-$id"
    }
    return $a
}

# ============================================================
# DB oeffnen
# ============================================================
tdbc::sqlite3::connection create db $db_file

# Statistik
set stats [db allrows -as dicts {SELECT * FROM stats}]
set total_terms 0
set total_categories 0
if {[llength $stats] > 0} {
    set s [lindex $stats 0]
    set total_terms      [dict_get_safe $s total_terms 0]
    set total_categories [dict_get_safe $s total_categories 0]
}

# ============================================================
# Ausgabe
# ============================================================

# YAML-Frontmatter fuer Pandoc
if {$opt(includeFrontmatter)} {
    puts "---"
    puts "title: \"Tcl/Tk Glossary 30\""
    puts "subtitle: \"Vollstaendiges Begriffslexikon\""
    puts "author: \"Glossary Manager Export\""
    puts "date: \"[clock format [clock seconds] -format {%Y-%m-%d}]\""
    puts "lang: de"
    puts "documentclass: article"
    puts "toc-title: \"Inhaltsverzeichnis\""
    puts "---"
    puts ""
}

# Vorspann
puts "# Tcl/Tk Glossary 30"
puts ""
puts "**Erzeugt:** [clock format [clock seconds] -format {%Y-%m-%d %H:%M:%S}]  "
puts "**Quelle:** `$db_file`  "
puts "**Begriffe:** $total_terms in $total_categories Kategorien"
puts ""
puts "Diese Datei ist als Druckvorlage gedacht. Inhaltsverzeichnis und"
puts "Stichwortverzeichnis werden bei der PDF-Erzeugung von Pandoc"
puts "ergaenzt (`--toc`-Option)."
puts ""
puts "\\newpage"
puts ""

# ============================================================
# Hauptteil: Kategorien (alphabetisch) -> Begriffe (alphabetisch)
# ============================================================

# Liste alle Begriffe sammeln (fuer Index am Ende)
set indexEntries {}

set cat_rows [db allrows -as dicts {
    SELECT DISTINCT category FROM terms ORDER BY category COLLATE NOCASE
}]

foreach cat_row $cat_rows {
    set cat [dict get $cat_row category]
    set cat_anchor [make_anchor "kat-$cat"]
    
    puts "## $cat"
    puts ""
    
    # Alle Begriffe in dieser Kategorie alphabetisch
    set term_rows [db allrows -as dicts {
        SELECT * FROM terms 
        WHERE category = :cat 
        ORDER BY term COLLATE NOCASE
    }]
    
    foreach row $term_rows {
        set id      [dict get $row id]
        set term    [dict get $row term]
        set anchor  [make_anchor $term $id]
        set en_def  [dict_get_safe $row en_definition]
        set de_def  [dict_get_safe $row de_definition]
        set en_ex   [dict_get_safe $row en_example]
        set de_ex   [dict_get_safe $row de_example]
        set related [dict_get_safe $row related_terms]
        set seealso [dict_get_safe $row see_also]
        set notes   [dict_get_safe $row notes]
        
        # Heading mit Anker fuer Index-Verlinkung (Pandoc-Style).
        # Bei --for-docir weglassen, weil docir::pdf die Anker-Syntax
        # nicht versteht und sie im PDF sichtbar machen wuerde.
        if {$opt(forDocir)} {
            puts "### $term"
        } else {
            puts "### $term {#$anchor}"
        }
        puts ""
        
        # Index-Eintrag merken
        lappend indexEntries [list $term $anchor $cat]
        
        if {$en_def ne ""} {
            puts "**EN:** $en_def"
            puts ""
        }
        if {$de_def ne ""} {
            puts "**DE:** $de_def"
            puts ""
        }
        if {$en_ex ne ""} {
            puts "*Example (EN):*"
            puts ""
            puts "```"
            puts $en_ex
            puts "```"
            puts ""
        }
        if {$de_ex ne ""} {
            puts "*Beispiel (DE):*"
            puts ""
            puts "```"
            puts $de_ex
            puts "```"
            puts ""
        }
        if {$related ne ""} {
            puts "**Verwandte Begriffe:** $related"
            puts ""
        }
        if {$seealso ne ""} {
            puts "**Siehe auch:** $seealso"
            puts ""
        }
        if {$notes ne ""} {
            puts "> $notes"
            puts ""
        }
    }
    puts ""
}

# ============================================================
# Index am Ende: alphabetisches Stichwortverzeichnis
# ============================================================
if {$opt(includeIndex) && [llength $indexEntries] > 0} {
    puts "\\newpage"
    puts ""
    puts "# Stichwortverzeichnis"
    puts ""
    puts "Alphabetische Liste aller Begriffe mit klickbarem Verweis auf den"
    puts "jeweiligen Eintrag."
    puts ""
    
    # Alphabetisch sortieren (case-insensitive)
    set sortedIndex [lsort -dictionary -index 0 $indexEntries]
    
    # Gruppieren nach Anfangsbuchstabe
    set lastInitial ""
    foreach entry $sortedIndex {
        set term   [lindex $entry 0]
        set anchor [lindex $entry 1]
        set cat    [lindex $entry 2]
        
        # Anfangsbuchstabe (mit Umlaut-Normalisierung)
        set initial [string toupper [string index $term 0]]
        switch -- $initial {
            "Ä" { set initial "A" }
            "Ö" { set initial "O" }
            "Ü" { set initial "U" }
        }
        
        if {$initial ne $lastInitial} {
            puts ""
            puts "## $initial"
            puts ""
            set lastInitial $initial
        }
        
        # Eintrag mit Link zum Anker
        # Format: - [Term](#anker) -- *Kategorie*
        puts "- \[$term\](#$anchor) $EMDASH *$cat*"
    }
    puts ""
}

db close
