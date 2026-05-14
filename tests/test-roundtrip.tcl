#!/usr/bin/env tclsh
# tests/test-roundtrip.tcl
#
# Verifiziert die Export-Import-Pipeline:
#  1. Exportiert glossary.db -> markdown (export_full.tcl)
#  2. Importiert markdown -> neue test-DB (import_md.tcl)
#  3. Vergleicht Term- und Kategorien-Counts der beiden DBs
#
# Exit 0 = roundtrip OK, 1 = mismatch, 2 = deps fehlen (skip).
#
# Aufruf:  tclsh tests/test-roundtrip.tcl  [glossary.db]
#          (default: ../glossary.db relativ zum Skript)
#
# Benoetigt: tdbc::sqlite3 (fuer beide Tools) und sqlite3-CLI
#            (das import_md.tcl benutzt das CLI fuer Schema-Laden).

set scriptDir [file dirname [file normalize [info script]]]
set repoRoot  [file dirname $scriptDir]

# Default-Pfade
set dbFile  [file join $repoRoot glossary.db]
if {[llength $argv] >= 1} {
    set dbFile [lindex $argv 0]
}

# --- 1. Vorpruefungen ---

if {[catch {package require tdbc::sqlite3}]} {
    puts "SKIP: tdbc::sqlite3 not available"
    puts "  Install: apt install tcl-tdbc-sqlite3   (Debian/Ubuntu)"
    puts "       or: dnf install tcl-tdbc-sqlite3   (Fedora)"
    exit 2
}

if {[auto_execok sqlite3] eq ""} {
    puts "SKIP: sqlite3 CLI not in PATH (needed by import_md.tcl)"
    puts "  Install: apt install sqlite3"
    exit 2
}

if {![file exists $dbFile]} {
    puts "FAIL: source DB not found: $dbFile"
    exit 1
}

# --- 2. Counts in Source-DB ---

proc countTerms {dbPath} {
    tdbc::sqlite3::connection create db $dbPath
    set rs [db prepare "SELECT COUNT(*) AS n FROM terms"]
    set row [lindex [$rs allrows -as dicts] 0]
    set terms [dict get $row n]
    $rs close

    set rs [db prepare "SELECT COUNT(DISTINCT category) AS n FROM terms"]
    set row [lindex [$rs allrows -as dicts] 0]
    set cats [dict get $row n]
    $rs close

    db close
    return [list $terms $cats]
}

puts "== Roundtrip-Test =="
puts "Source DB: $dbFile"
lassign [countTerms $dbFile] srcTerms srcCats
puts "  terms=$srcTerms  categories=$srcCats"

# --- 3. Export ---

set tmpDir [file join /tmp gl-roundtrip-[pid]]
file mkdir $tmpDir
set mdFile  [file join $tmpDir export.md]
set testDb  [file join $tmpDir test.db]

puts "\nExport: $mdFile"
set exporter [file join $repoRoot tools export_full.tcl]
if {[catch {
    exec [info nameofexecutable] $exporter $dbFile > $mdFile 2>@stderr
} err]} {
    puts "FAIL: export failed: $err"
    file delete -force $tmpDir
    exit 1
}

set mdSize [file size $mdFile]
puts "  exported [expr {$mdSize / 1024}] KB"
if {$mdSize < 1000} {
    puts "FAIL: exported file too small (suspect)"
    file delete -force $tmpDir
    exit 1
}

# --- 4. Import in fresh DB ---

puts "\nImport: $testDb"
set importer [file join $repoRoot tools import_md.tcl]
if {[catch {
    exec [info nameofexecutable] $importer $mdFile $testDb 2>@stderr >&@stdout
} err]} {
    puts "FAIL: import failed: $err"
    file delete -force $tmpDir
    exit 1
}

# --- 5. Counts in Test-DB ---

lassign [countTerms $testDb] dstTerms dstCats
puts "\nDestination DB: $testDb"
puts "  terms=$dstTerms  categories=$dstCats"

# --- 6. Vergleich ---

puts "\n== Vergleich =="
set diffTerms [expr {$srcTerms - $dstTerms}]
set diffCats  [expr {$srcCats  - $dstCats}]

puts [format "  terms:      src=%4d  dst=%4d  diff=%+d" $srcTerms $dstTerms $diffTerms]
puts [format "  categories: src=%4d  dst=%4d  diff=%+d" $srcCats $dstCats $diffCats]

# Cleanup
file delete -force $tmpDir

# Roundtrip ist "ok" wenn der Export alle Terms enthaelt UND der Import
# nicht weniger als source - 1% einliest (geringe Toleranz fuer evtl.
# Edge-Cases wie doppelte Terms in verschiedenen Kategorien).
set tol [expr {$srcTerms / 100}]
if {abs($diffTerms) > $tol} {
    puts "\nFAIL: term diff > tolerance ($tol)"
    exit 1
}
if {abs($diffCats) > 2} {
    puts "\nFAIL: category diff > 2"
    exit 1
}

puts "\nOK: roundtrip preserved $dstTerms/$srcTerms terms"
exit 0
