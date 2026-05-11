#!/bin/bash
# Test-Script fuer TUI - simuliert Benutzer-Eingaben.
#
# Wechselt automatisch ins Verzeichnis des Skripts (also nach
# glossary_manager/), damit auch glossary.db relativ gefunden wird.

cd "$(dirname "$0")" || exit 1

# Vorbedingung: glossary.db muss existieren
if [[ ! -f glossary.db ]]; then
    echo "FEHLER: glossary.db nicht gefunden im Verzeichnis $(pwd)"
    echo ""
    echo "Bitte erst importieren:"
    echo "    tclsh tools/import_md.tcl ../Referenz-PDF/tcl_tk_glossary30.md glossary.db"
    exit 1
fi

# Test 1: Statistik anzeigen
echo "=== TEST 1: Statistik ==="
echo -e "i\nq" | tclsh glossary_tui.tcl glossary.db

echo ""
echo "=== TEST 2: Suche nach 'namespace' ==="
echo -e "s\nnamespace\n1\n\nq" | tclsh glossary_tui.tcl glossary.db

echo ""
echo "=== TEST 3: Kategorien ==="
echo -e "c\n0\nq" | tclsh glossary_tui.tcl glossary.db
