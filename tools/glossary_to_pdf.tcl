#!/usr/bin/env tclsh
# glossary_to_pdf.tcl -- Glossar-PDF mit TOC + Index, pure Tcl-Stack
#
# Pipeline:
#   glossary_full.md
#       -> mdstack::parser::parse  (Tokens)
#       -> mdstack::model::ast     (AST)
#       -> docir::md::fromAst      (DocIR)
#       -> docir::pdf::render      (PDF)
#
# Aufruf:
#   tclsh glossary_to_pdf.tcl glossary_full.md ?output.pdf?
#
# Voraussetzungen (im TCLLIBPATH oder als installierte tm-Module):
#   - mdstack          (parser)
#   - docir            (core)
#   - docir::mdSource  (Markdown-AST -> DocIR)
#   - docir::pdf       (DocIR -> PDF) -- mindestens 0.2 fuer TOC + Index
#   - pdf4tcl          (>=0.9)
#   - pdf4tcllib       (>=0.1)

# Stdout/Stderr UTF-8 (sonst Umlaut-Probleme bei System-Encoding != utf-8)
fconfigure stdout -encoding utf-8
fconfigure stderr -encoding utf-8

# ============================================================
# CLI
# ============================================================
if {$argc < 1 || $argc > 2} {
    puts stderr "Usage: tclsh glossary_to_pdf.tcl input.md \[output.pdf\]"
    exit 1
}
set inputMd  [lindex $argv 0]
set outputPdf [expr {$argc >= 2 ? [lindex $argv 1] : "[file rootname $inputMd].pdf"}]

if {![file exists $inputMd]} {
    puts stderr "Eingabedatei nicht gefunden: $inputMd"
    exit 1
}

# ============================================================
# Pakete laden
# ============================================================
package require mdstack::parser
package require mdstack::model
package require docir
package require docir::mdSource    ;# liefert docir::md::fromAst
package require docir::pdf  0.2    ;# diese Version mit TOC+Index

puts "Pakete geladen."

# ============================================================
# Markdown lesen
# ============================================================
puts "Lese: $inputMd"
set fh [open $inputMd r]
fconfigure $fh -encoding utf-8
set md [read $fh]
close $fh
puts "  [string length $md] Zeichen"

# ============================================================
# Pipeline: MD -> AST -> DocIR
# ============================================================
puts "Parse Markdown..."
set tokens [::mdstack::parser::parse $md]
puts "  [llength $tokens] Tokens"

puts "Baue AST..."
set doc [::mdstack::model::new $tokens]
set ast [::mdstack::model::ast $doc]

puts "AST -> DocIR..."
set ir [::docir::md::fromAst $ast]
puts "  [llength $ir] DocIR-Bloecke"

# ============================================================
# DocIR -> PDF mit TOC + Index
# ============================================================
puts "Rendere PDF..."
set startTime [clock seconds]

::docir::pdf::render $ir $outputPdf [dict create \
    title           "Tcl/Tk Glossary 30" \
    author          "Glossary Manager" \
    paper           a4 \
    margin          42 \
    fontSize        10 \
    footer          "Seite %p" \
    \
    generateToc     1 \
    tocTitle        "Inhaltsverzeichnis" \
    tocDepth        2 \
    \
    generateIndex   1 \
    indexTitle      "Stichwortverzeichnis" \
    indexLevel      3 \
    \
    bookmarks       1]

set duration [expr {[clock seconds] - $startTime}]
puts "Fertig: $outputPdf  (${duration}s)"

# Explizites exit: einige der geladenen Pakete (mdstack, docir,
# pdf4tcl, pdf4tcllib) hinterlassen u.U. offene channels oder
# event-handler die das Skript hängen lassen wuerden.
exit 0
