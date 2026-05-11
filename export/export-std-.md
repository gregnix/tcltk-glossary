# Tcl/Tk Glossar

Export: 2026-05-11 19:35:30

License: CC BY 4.0 — see end of document for details.

---


## Archive-Formate / Archive Formats

### GZIP

**EN:** GNU compression format; typically used with tar (creates .tar.gz or .tgz); single file compression; Tcl: `zlib` command (8.6+) supports gzip; common for Tcl package distribution; command: `gzip file` creates file.gz.

**DE:** GNU-Kompressions-Format; typischerweise mit tar verwendet (erstellt .tar.gz oder .tgz); Einzeldatei-Kompression; Tcl: `zlib`-Befehl (8.6+) unterstützt gzip; üblich für Tcl-Paket-Distribution; Befehl: `gzip file` erstellt file.gz.

---

### TAR (Tape Archive)

**EN:** Unix archive format; stores multiple files with metadata; no compression (use with gzip/bzip2); Tcl package: tar (tcllib); common for source distributions; preserves Unix permissions; format: `tar cvf archive.tar files/`.

**DE:** Unix-Archiv-Format; speichert mehrere Dateien mit Metadaten; keine Kompression (mit gzip/bzip2 verwenden); Tcl-Paket: tar (tcllib); üblich für Quell-Distributionen; bewahrt Unix-Berechtigungen; Format: `tar cvf archive.tar files/`.

---

### TGZ / .tar.gz

**EN:** Compressed tar archive; combines tar archiving with gzip compression; standard for Unix/Linux source distributions; Tcl can handle with `zlib` and `tar` packages; extract: `tar xzf archive.tgz`.

**DE:** Komprimiertes Tar-Archiv; kombiniert Tar-Archivierung mit Gzip-Kompression; Standard für Unix/Linux-Quell-Distributionen; Tcl kann mit `zlib`- und `tar`-Paketen handhaben; Extrahieren: `tar xzf archive.tgz`.

---

### ZIP

**EN:** Popular compression archive format; widely supported; used by starkits internally; Tcl packages: vfs::zip, zipfile::decode (tcllib); can mount as VFS or extract files; cross-platform.

**DE:** Beliebtes Kompressions-Archiv-Format; weit unterstützt; intern von Starkits verwendet; Tcl-Pakete: vfs::zip, zipfile::decode (tcllib); kann als VFS mounten oder Dateien extrahieren; plattformübergreifend.

---

### bzip2 / .tar.bz2

**EN:** Compression format with better compression than gzip but slower; often used with tar (.tar.bz2 or .tbz2); Tcl: available via extensions; extract: `tar xjf archive.tar.bz2`.

**DE:** Kompressions-Format mit besserer Kompression als gzip aber langsamer; oft mit tar verwendet (.tar.bz2 oder .tbz2); Tcl: verfügbar über Extensions; Extrahieren: `tar xjf archive.tar.bz2`.

---

### xz / .tar.xz

**EN:** Modern compression format with excellent compression ratio; increasingly common for source distributions; slower than gzip but better compression; extract: `tar xJf archive.tar.xz`.

**DE:** Modernes Kompressions-Format mit exzellentem Kompressions-Verhältnis; zunehmend üblich für Quell-Distributionen; langsamer als gzip aber bessere Kompression; Extrahieren: `tar xJf archive.tar.xz`.

---


## Arithmetische Operatoren / Arithmetic Operators

### % (Modulo)

**EN:** Modulo operator; returns remainder of division (e.g., `10 % 3` = 1).

**DE:** Modulo-Operator; gibt Rest der Division zurück (z.B. `10 % 3` = 1).

---

### * (Multiplication)

**EN:** Multiplication operator; multiplies two numbers (e.g., `$x * $y`).

**DE:** Multiplikations-Operator; multipliziert zwei Zahlen (z.B. `$x * $y`).

---

### ** (Exponentiation)

**EN:** Power operator; raises left operand to power of right (e.g., `2 ** 8` = 256).

**DE:** Potenz-Operator; erhebt linken Operanden zur Potenz des rechten (z.B. `2 ** 8` = 256).

---

### + (Addition)

**EN:** Addition operator; adds two numbers (e.g., `$x + $y`).

**DE:** Additions-Operator; addiert zwei Zahlen (z.B. `$x + $y`).

---

### + (Unary Plus)

**EN:** Unary plus operator; explicitly indicates positive value.

**DE:** Unäres Plus; zeigt explizit positiven Wert an.

---

### ++ (Increment)

**EN:** Increment operator; increases variable value by 1 (e.g., `incr x` or in expr).

**DE:** Inkrement-Operator; erhöht Variablenwert um 1 (z.B. `incr x` oder in expr).

---

### - (Subtraction)

**EN:** Subtraction operator; subtracts right operand from left (e.g., `$x - $y`).

**DE:** Subtraktions-Operator; subtrahiert rechten Operanden von linkem (z.B. `$x - $y`).

---

### - (Unary Minus)

**EN:** Negation operator; changes sign of number (e.g., `-$x`).

**DE:** Negations-Operator; ändert Vorzeichen der Zahl (z.B. `-$x`).

---

### -- (Decrement)

**EN:** Decrement operator; decreases variable value by 1.

**DE:** Dekrement-Operator; verringert Variablenwert um 1.

---

### / (Division)

**EN:** Division operator; divides left operand by right (e.g., `$x / $y`).

**DE:** Divisions-Operator; dividiert linken Operanden durch rechten (z.B. `$x / $y`).

---


## Array-Subcommands / Array Subcommands

### array donesearch

**EN:** End an incremental array iteration and release resources. Syntax: array donesearch arrayName searchToken. Must be called after array startsearch (counterpart). If you forget, the search token is kept alive until the variable is unset.

**DE:** Beendet eine inkrementelle Array-Iteration und gibt Ressourcen frei. Syntax: array donesearch arrayName searchToken. Muss nach array startsearch aufgerufen werden (Gegenstueck). Bei Vergessen bleibt das Such-Token bis zum unset der Variable.

---

### array exists

**EN:** Test whether a variable is an array. Syntax: array exists arrayName. Returns 1 if it is an array, 0 otherwise (including: variable is undefined, or is a scalar). Used to guard against treating scalars as arrays (which would error).

**DE:** Prueft ob eine Variable ein Array ist. Syntax: array exists arrayName. Liefert 1 wenn Array, 0 sonst (inkl.: Variable undefiniert oder Skalar). Verwendet um zu verhindern dass Skalare als Arrays behandelt werden (was einen Fehler waere).

---

### array get

**EN:** Return all key-value pairs of an array as a flat list. Syntax: array get arrayName ?pattern?. With pattern: glob filter on keys. Inverse of array set: `array set b [array get a]` copies an array. Order is implementation-defined.

**DE:** Liefert alle Key-Value-Paare eines Arrays als flache Liste. Syntax: array get arrayName ?pattern?. Mit Pattern: Glob-Filter auf Keys. Umkehrung von array set: `array set b [array get a]` kopiert ein Array. Reihenfolge implementierungsabhaengig.

---

### array names

**EN:** Return list of all keys in an array. Syntax: array names arrayName ?-exact|-glob|-regexp? ?pattern?. Without options: all keys. Used to iterate: `foreach k [array names arr] { ... }`.

**DE:** Liefert eine Liste aller Keys in einem Array. Syntax: array names arrayName ?-exact|-glob|-regexp? ?pattern?. Ohne Optionen: alle Keys. Zum Iterieren verwendet: `foreach k [array names arr] { ... }`.

---

### array nextelement

**EN:** Get the next key from an in-progress array iteration. Syntax: array nextelement arrayName searchToken. Returns the next key, or empty when iteration is done. Use only with a token from array startsearch.

**DE:** Liefert den naechsten Key einer laufenden Array-Iteration. Syntax: array nextelement arrayName searchToken. Liefert den naechsten Key, oder leer wenn die Iteration beendet ist. Nur mit einem Token aus array startsearch verwenden.

---

### array set

**EN:** Bulk-set array elements from a key-value list. Syntax: array set arrayName {key1 val1 key2 val2 ...}. List length must be even. Existing keys are overwritten; existing keys not in the list are kept. Used to load configuration tables.

**DE:** Setzt Array-Elemente in Bulk aus einer Key-Value-Liste. Syntax: array set arrayName {key1 val1 key2 val2 ...}. Listenlaenge muss gerade sein. Existierende Keys werden ueberschrieben; nicht in der Liste enthaltene Keys bleiben. Zum Laden von Konfigurationstabellen.

---

### array size

**EN:** Return the number of elements (key-value pairs) in an array. Syntax: array size arrayName. Returns 0 if the array is empty or undefined.

**DE:** Liefert die Anzahl der Elemente (Key-Value-Paare) eines Arrays. Syntax: array size arrayName. Liefert 0 wenn das Array leer oder undefiniert ist.

---

### array startsearch

**EN:** Begin an incremental iteration over an array. Syntax: array startsearch arrayName. Returns an opaque search token. Used with array nextelement and array donesearch when iterating arrays that may change during iteration (rare; foreach over [array names ...] is the usual approach).

**DE:** Beginnt eine inkrementelle Iteration ueber ein Array. Syntax: array startsearch arrayName. Liefert ein opakes Such-Token. Verwendet mit array nextelement und array donesearch bei Iterationen ueber waehrend der Iteration veraenderlichen Arrays (selten; foreach ueber [array names ...] ist der uebliche Weg).

---

### array unset

**EN:** Remove array elements (or the entire array). Syntax: array unset arrayName ?pattern?. Without pattern: removes the entire array (the variable becomes undefined). With pattern (glob): removes matching keys. Counterpart to bulk array set.

**DE:** Entfernt Array-Elemente (oder das ganze Array). Syntax: array unset arrayName ?pattern?. Ohne Pattern: entfernt das ganze Array (Variable wird undefiniert). Mit Pattern (Glob): entfernt treffende Keys. Gegenstueck zum Bulk array set.

---


## Ausrichtung / Alignment

### Align

**EN:** Horizontal alignment option specifying how content is positioned (left, right, center).

**DE:** Horizontale Ausrichtungsoption, die angibt, wie Inhalt positioniert wird (left, right, center).

---

### Baseline

**EN:** Align content along the text baseline, used for text alignment.

**DE:** Inhalt an der Textgrundlinie ausrichten, wird für Textausrichtung verwendet.

---

### Bottom

**EN:** Align content to the bottom edge; elements are positioned at the bottom of their container.

**DE:** Inhalt unten ausrichten; Elemente werden am unteren Rand ihres Containers positioniert.

---

### Justify

**EN:** Align text to both left and right margins by adjusting spacing between words.

**DE:** Text sowohl links als auch rechts ausrichten durch Anpassung der Abstände zwischen Wörtern.

---

### Left

**EN:** Align content to the left edge; text or elements start from the left side.

**DE:** Inhalt linksbündig ausrichten; Text oder Elemente beginnen von der linken Seite.

---

### Right

**EN:** Align content to the right edge; text or elements start from the right side.

**DE:** Inhalt rechtsbündig ausrichten; Text oder Elemente beginnen von der rechten Seite.

---

### Top

**EN:** Align content to the top edge; elements are positioned at the top of their container.

**DE:** Inhalt oben ausrichten; Elemente werden am oberen Rand ihres Containers positioniert.

---

### Valign (Vertical Align)

**EN:** Vertical alignment option specifying how content is positioned (top, bottom, center, baseline).

**DE:** Vertikale Ausrichtungsoption, die angibt, wie Inhalt positioniert wird (top, bottom, center, baseline).

---


## Auswahl und Selection / Selection and Current Items

### @x,y (Index Format)

**EN:** Index format specifying position by coordinates (e.g., `@100,50` in text or listbox widgets).

**DE:** Index-Format, das Position durch Koordinaten angibt (z.B. `@100,50` in Text- oder Listbox-Widgets).

---

### Active

**EN:** State of widget element being interacted with (e.g., active listbox item, active menu entry).

**DE:** Zustand eines Widget-Elements, mit dem interagiert wird (z.B. aktives Listbox-Element, aktiver Menüeintrag).

---

### Active Element

**EN:** Currently highlighted or focused element within a widget (keyboard navigation target).

**DE:** Aktuell hervorgehobenes oder fokussiertes Element innerhalb eines Widgets (Ziel der Tastaturnavigation).

---

### Browse (Selection Mode)

**EN:** Selection mode like single, but selection follows mouse movement; one item always selected.

**DE:** Auswahlmodus wie single, aber Auswahl folgt Mausbewegung; ein Element immer ausgewählt.

---

### CLIPBOARD Selection

**EN:** Standard clipboard for copy/paste operations (Ctrl+C/Ctrl+V).

**DE:** Standard-Zwischenablage für Kopieren/Einfügen-Operationen (Strg+C/Strg+V).

---

### Current

**EN:** Item under mouse pointer or having special focus in widgets like canvas or listbox (e.g., `current` tag in canvas).

**DE:** Element unter Mauszeiger oder mit speziellem Fokus in Widgets wie Canvas oder Listbox (z.B. `current`-Tag in Canvas).

---

### Export (Selection)

**EN:** Make selection available to other applications through X11 selection mechanism.

**DE:** Auswahl für andere Anwendungen über X11-Auswahl-Mechanismus verfügbar machen.

---

### Extended (Selection Mode)

**EN:** Selection mode allowing range selection with Shift+click and toggle with Ctrl+click.

**DE:** Auswahlmodus, der Bereichsauswahl mit Umschalt+Klick und Umschalten mit Strg+Klick erlaubt.

---

### Index (Selection Context)

**EN:** Position indicator in text, listbox, or entry widget (e.g., `@x,y`, line.char, `anchor`, `end`, `insert`).

**DE:** Positionsindikator in Text-, Listbox- oder Entry-Widget (z.B. `@x,y`, line.char, `anchor`, `end`, `insert`).

---

### Multiple (Selection Mode)

**EN:** Selection mode allowing multiple non-contiguous items via click (Ctrl+click to toggle).

**DE:** Auswahlmodus, der mehrere nicht-zusammenhängende Elemente per Klick erlaubt (Strg+Klick zum Umschalten).

---

### PRIMARY Selection

**EN:** X11 selection type for middle-click paste; contains currently highlighted text.

**DE:** X11-Auswahl-Typ für Mittelklick-Einfügen; enthält aktuell hervorgehobenen Text.

---

### Selection

**EN:** Currently selected text, items, or data; managed by Tk selection system for copy/paste operations.

**DE:** Aktuell ausgewählter Text, Elemente oder Daten; verwaltet durch Tk-Selection-System für Kopieren/Einfügen-Operationen.

---

### Selection Mode

**EN:** Determines how items can be selected in listbox or similar widgets.

**DE:** Bestimmt, wie Elemente in Listbox oder ähnlichen Widgets ausgewählt werden können.

---

### Single (Selection Mode)

**EN:** Selection mode allowing only one item to be selected at a time (e.g., `listbox -selectmode single`).

**DE:** Auswahlmodus, der nur ein Element gleichzeitig erlaubt (z.B. `listbox -selectmode single`).

---

### activate

**EN:** Make specified item active (keyboard focus target) without selecting it.

**DE:** Angegebenes Element aktiv machen (Tastaturfokus-Ziel) ohne es auszuwählen.

---

### anchor (Selection)

**EN:** Starting point of text selection; marks where selection began.

**DE:** Startpunkt der Textauswahl; markiert, wo Auswahl begann.

---

### current (Canvas Tag)

**EN:** Special canvas tag automatically assigned to item under mouse pointer.

**DE:** Spezieller Canvas-Tag, der automatisch dem Element unter Mauszeiger zugewiesen wird.

---

### curselection

**EN:** Listbox command returning indices of all currently selected items (e.g., `.listbox curselection`).

**DE:** Listbox-Befehl, der Indizes aller aktuell ausgewählten Elemente zurückgibt (z.B. `.listbox curselection`).

---

### nearest

**EN:** Find item nearest to specified coordinates (used in listbox and canvas).

**DE:** Element finden, das angegebenen Koordinaten am nächsten ist (verwendet in Listbox und Canvas).

---

### see

**EN:** Scroll widget to make specified item or position visible.

**DE:** Widget scrollen, um angegebenes Element oder Position sichtbar zu machen.

---

### sel (Selection Tag)

**EN:** Special text widget tag marking selected text range.

**DE:** Spezieller Text-Widget-Tag, der ausgewählten Textbereich markiert.

---

### selection anchor

**EN:** Set anchor point for selection operations in listbox or text widget.

**DE:** Ankerpunkt für Auswahloperationen in Listbox oder Text-Widget setzen.

---

### selection clear

**EN:** Clear current selection and release ownership.

**DE:** Aktuelle Auswahl löschen und Besitz freigeben.

---

### selection get

**EN:** Retrieve current selection data from clipboard or selection buffer.

**DE:** Aktuelle Auswahldaten aus Zwischenablage oder Auswahl-Puffer abrufen.

---

### selection handle

**EN:** Register handler to provide selection data in specific format.

**DE:** Handler registrieren, um Auswahldaten in bestimmtem Format bereitzustellen.

---

### selection own

**EN:** Claim ownership of selection; widget becomes selection provider.

**DE:** Besitz der Auswahl beanspruchen; Widget wird Auswahl-Anbieter.

---

### selection set

**EN:** Set current selection data (PRIMARY selection in X11).

**DE:** Aktuelle Auswahldaten setzen (PRIMARY-Auswahl in X11).

---


## Autotools / GNU Build System

### --enable-FEATURE / --disable-FEATURE

**EN:** Configure options to enable/disable optional features (e.g., `--enable-threads`).

**DE:** Configure-Optionen zum Aktivieren/Deaktivieren optionaler Features (z.B. `--enable-threads`).

---

### --prefix

**EN:** Configure option specifying installation directory (e.g., `./configure --prefix=/usr/local`).

**DE:** Configure-Option zum Angeben des Installations-Verzeichnisses (z.B. `./configure --prefix=/usr/local`).

---

### --with-PACKAGE / --without-PACKAGE

**EN:** Configure options to include/exclude optional packages or dependencies.

**DE:** Configure-Optionen zum Einschließen/Ausschließen optionaler Pakete oder Abhängigkeiten.

---

### ./configure

**EN:** Command to run configure script, checking dependencies and creating build configuration.

**DE:** Befehl zum Ausführen von configure-Skript, Prüfen von Abhängigkeiten und Erstellen von Build-Konfiguration.

---

### AC_INIT / AC_CONFIG_FILES

**EN:** Core autoconf macros initializing package and specifying files to generate.

**DE:** Kern-autoconf-Makros zum Initialisieren von Paket und Spezifizieren zu generierender Dateien.

---

### AM_INIT_AUTOMAKE

**EN:** Automake macro initializing automake support in configure.ac.

**DE:** Automake-Makro zum Initialisieren von automake-Unterstützung in configure.ac.

---

### Makefile.am

**EN:** High-level input file for automake using simplified syntax.

**DE:** High-Level-Eingabe-Datei für automake mit vereinfachter Syntax.

---

### Makefile.in

**EN:** Template Makefile generated by automake; processed by configure to create final Makefile.

**DE:** Template-Makefile generiert von automake; von configure verarbeitet um finales Makefile zu erstellen.

---

### aclocal

**EN:** Tool collecting autoconf macros from system and third-party packages.

**DE:** Tool zum Sammeln von autoconf-Makros von System und Drittanbieter-Paketen.

---

### autoconf

**EN:** Tool generating configure script from configure.ac for platform-specific configuration.

**DE:** Tool zum Generieren von configure-Skript aus configure.ac für plattformspezifische Konfiguration.

---

### automake

**EN:** Tool generating Makefile.in from Makefile.am for consistent build system structure.

**DE:** Tool zum Generieren von Makefile.in aus Makefile.am für konsistente Build-System-Struktur.

---

### autoreconf

**EN:** Tool running all autotools in correct order to update build system.

**DE:** Tool zum Ausführen aller autotools in korrekter Reihenfolge um Build-System zu aktualisieren.

---

### autoreconf -i / autoreconf --install

**EN:** Install missing auxiliary files and run autotools (common first-time setup).

**DE:** Fehlende Hilfsdateien installieren und autotools ausführen (übliches Erst-Setup).

---

### autotools

**EN:** Suite of GNU build tools (autoconf, automake, libtool) for creating portable build systems.

**DE:** Suite von GNU-Build-Tools (autoconf, automake, libtool) zum Erstellen portabler Build-Systeme.

---

### bootstrap / autogen.sh

**EN:** Script running autotools to generate configure script from repository checkout.

**DE:** Skript zum Ausführen von autotools um configure-Skript aus Repository-Checkout zu generieren.

---

### config.h

**EN:** Header file generated by configure containing platform-specific #define statements.

**DE:** Header-Datei generiert von configure mit plattformspezifischen #define-Anweisungen.

---

### config.log

**EN:** Log file from configure containing detailed test results and error messages.

**DE:** Log-Datei von configure mit detaillierten Test-Ergebnissen und Fehlermeldungen.

---

### config.status

**EN:** Script generated by configure that can recreate current configuration.

**DE:** Skript generiert von configure, das aktuelle Konfiguration neu erstellen kann.

---

### configure

**EN:** Script detecting system features and generating Makefiles for specific platform.

**DE:** Skript zum Erkennen von System-Features und Generieren von Makefiles für spezifische Plattform.

---

### configure.ac / configure.in

**EN:** Input file for autoconf containing macros defining configuration tests and options.

**DE:** Eingabe-Datei für autoconf mit Makros, die Konfigurations-Tests und Optionen definieren.

---

### libtool

**EN:** Generic library support script simplifying shared library creation across platforms.

**DE:** Generisches Bibliotheks-Unterstützungs-Skript, das Shared-Library-Erstellung plattformübergreifend vereinfacht.

---

### ltmain.sh

**EN:** Libtool script for building and linking libraries portably.

**DE:** Libtool-Skript für portables Bauen und Linken von Bibliotheken.

---

### m4

**EN:** Macro processor used by autoconf to expand macros in configure.ac.

**DE:** Makro-Prozessor verwendet von autoconf zum Expandieren von Makros in configure.ac.

---


## BWidget-Bibliothek / BWidget Library

### BWidget

**EN:** Pure-Tcl widget library providing enhanced widgets (Tree, ListBox, ComboBox, ProgressBar, etc.); portable alternative to platform-specific widgets; requires only Tcl/Tk 8.1+ (e.g., `package require BWidget`).

**DE:** Reine-Tcl-Widget-Bibliothek mit erweiterten Widgets (Tree, ListBox, ComboBox, ProgressBar, etc.); portable Alternative zu plattformspezifischen Widgets; benötigt nur Tcl/Tk 8.1+ (z.B. `package require BWidget`).

---

### BWidget ComboBox

**EN:** Combination of entry and dropdown list from BWidget; predates ttk::combobox.

**DE:** Kombination aus Entry und Dropdown-Liste von BWidget; existiert vor ttk::combobox.

---

### BWidget ListBox

**EN:** Enhanced listbox widget with multi-column support, sorting, and selection features.

**DE:** Erweitertes Listbox-Widget mit Mehrspalten-Unterstützung, Sortierung und Auswahl-Features.

---

### BWidget ProgressBar

**EN:** Progress indicator widget from BWidget library; predates ttk::progressbar.

**DE:** Fortschrittsanzeige-Widget aus BWidget-Bibliothek; existiert vor ttk::progressbar.

---

### BWidget Tree

**EN:** Hierarchical tree widget from BWidget library for displaying tree structures with expand/collapse functionality.

**DE:** Hierarchisches Baum-Widget aus BWidget-Bibliothek zur Anzeige von Baumstrukturen mit Expand/Collapse-Funktionalität.

---


## Backup und Recovery / Backup and Recovery

### Archive

**EN:** Compressed file collection for storage; backup format; examples: .tar.gz, .zip, .7z; Tcl create: vfs::zip, tar package; long-term storage; may include metadata, directory structure.

**DE:** Komprimierte Datei-Sammlung für Speicherung; Backup-Format; Beispiele: .tar.gz, .zip, .7z; Tcl erstellen: vfs::zip, tar-Paket; Langzeit-Speicherung; kann Metadaten, Verzeichnis-Struktur enthalten.

---

### Backup

**EN:** Copy of data for recovery; protects against data loss; strategies: full backup (all files), incremental (changes since last), differential (changes since full); Tcl can automate: `file copy`, tar/zip creation; schedule with cron/Task Scheduler.

**DE:** Kopie von Daten für Wiederherstellung; schützt vor Datenverlust; Strategien: Voll-Backup (alle Dateien), inkrementell (Änderungen seit letztem), differentiell (Änderungen seit Voll); Tcl kann automatisieren: `file copy`, tar/zip-Erstellung; planen mit cron/Task Scheduler.

---

### Restore

**EN:** Recover data from backup; reverses backup process; extracts files from backup archive; tests backup validity; Tcl scripts: extract tar/zip, copy files to original locations; critical to test before disaster.

**DE:** Daten von Backup wiederherstellen; kehrt Backup-Prozess um; extrahiert Dateien aus Backup-Archiv; testet Backup-Gültigkeit; Tcl-Skripte: tar/zip extrahieren, Dateien zu Original-Orten kopieren; kritisch zu testen vor Katastrophe.

---

### Snapshot

**EN:** Point-in-time copy of system state; filesystem or VM snapshot; allows rollback to specific moment; VCS commit is code snapshot; some filesystems support native snapshots (ZFS, Btrfs).

**DE:** Punkt-in-Zeit-Kopie von System-Zustand; Dateisystem- oder VM-Snapshot; erlaubt Rollback zu spezifischem Moment; VCS-Commit ist Code-Snapshot; einige Dateisysteme unterstützen native Snapshots (ZFS, Btrfs).

---


## Befehle und Syntax / Commands and Syntax

### Command

**EN:** A Tcl instruction consisting of a command name followed by arguments, separated by spaces.

**DE:** Eine Tcl-Anweisung, bestehend aus einem Befehlsnamen gefolgt von Argumenten, getrennt durch Leerzeichen.

---

### List

**EN:** An ordered collection of elements separated by spaces, fundamental to Tcl's data structures.

**DE:** Eine geordnete Sammlung von Elementen, die durch Leerzeichen getrennt sind; grundlegend für Tcls Datenstrukturen.

---

### Procedure (proc)

**EN:** Define new command (not a function object like in C/Python); creates command with name, parameters, and body that becomes part of interpreter's command set (e.g., `proc myproc {arg1 arg2} {...}`).

**DE:** Neuen Befehl definieren (kein Funktionsobjekt wie in C/Python); erstellt Befehl mit Name, Parametern und Body, der Teil des Interpreter-Befehlssatzes wird (z.B. `proc myproc {arg1 arg2} {...}`).

---

### Substitution

**EN:** The process of replacing variables, commands in brackets, or backslash sequences with their values.

**DE:** Der Prozess, bei dem Variablen, Befehle in Klammern oder Backslash-Sequenzen durch ihre Werte ersetzt werden.

---

### Variable

**EN:** A named storage location for data, accessed with the `$` prefix or `set` command.

**DE:** Ein benannter Speicherplatz für Daten, auf den mit dem `$`-Präfix oder dem `set`-Befehl zugegriffen wird.

---


## Benutzeroberflächen / User Interfaces

### CLI (Command Line Interface)

**EN:** Interface accepting text commands; user types commands in terminal; Tcl interactive shell (tclsh) is CLI; no graphical elements.

**DE:** Oberfläche, die Text-Befehle akzeptiert; Benutzer tippt Befehle im Terminal; Tcl interaktive Shell (tclsh) ist CLI; keine grafischen Elemente.

---

### Console

**EN:** System text interface; in Windows: command prompt or PowerShell; in Unix/Linux: terminal; Tcl's `console` command creates debug console in Tk applications.

**DE:** System-Text-Oberfläche; in Windows: Eingabeaufforderung oder PowerShell; in Unix/Linux: Terminal; Tcls `console`-Befehl erstellt Debug-Konsole in Tk-Anwendungen.

---

### GUI (Graphical User Interface)

**EN:** Visual interface with windows, buttons, menus, and graphical elements; Tk provides comprehensive GUI toolkit for Tcl; event-driven interaction using mouse and keyboard.

**DE:** Visuelle Oberfläche mit Fenstern, Buttons, Menüs und grafischen Elementen; Tk bietet umfassendes GUI-Toolkit für Tcl; ereignisgesteuerte Interaktion mit Maus und Tastatur.

---

### TUI (Text-based User Interface)

**EN:** Interface using text characters only, no graphics; runs in terminal/console; Tcl can create TUIs using terminal control sequences, readline, or packages like tclreadline; also called "Console UI" or "Character UI".

**DE:** Oberfläche nur mit Text-Zeichen, keine Grafik; läuft im Terminal/Konsole; Tcl kann TUIs mit Terminal-Steuersequenzen, readline oder Paketen wie tclreadline erstellen; auch "Console UI" oder "Character UI" genannt.

---

### Terminal

**EN:** Text-based interface for command input/output; physical terminal or terminal emulator; displays text using character grid (rows × columns).

**DE:** Textbasierte Oberfläche für Befehls-Ein-/Ausgabe; physisches Terminal oder Terminal-Emulator; zeigt Text mit Zeichen-Raster (Zeilen × Spalten).

---


## Bibliotheks- und Paket-System / Library and Package System

### Library

**EN:** Collection of reusable code (procedures, packages, modules); Tcl libraries: tcllib (pure Tcl), Critcl (C-based), tklib (Tk extensions); installed in standard locations; loaded with `package require` or `source`.

**DE:** Sammlung wiederverwendbaren Codes (Prozeduren, Pakete, Module); Tcl-Bibliotheken: tcllib (reines Tcl), Critcl (C-basiert), tklib (Tk-Extensions); installiert in Standard-Verzeichnissen; geladen mit `package require` oder `source`.

---

### Module

**EN:** Synonym for Tcl Module (.tm file); self-contained package in single file; preferred over traditional multi-file packages; loaded via `package require` like regular packages; stored in module paths.

**DE:** Synonym für Tcl Module (.tm-Datei); eigenständiges Paket in einzelner Datei; bevorzugt gegenüber traditionellen Mehrdatei-Paketen; geladen über `package require` wie reguläre Pakete; gespeichert in Modul-Pfaden.

---

### Package

**EN:** Distributable unit of Tcl code; defined by pkgIndex.tcl or package provide; versioned (e.g., 1.2.3); loaded with `package require PackageName ?version?`; can contain Tcl scripts, compiled extensions, or both.

**DE:** Verteilbare Einheit von Tcl-Code; definiert durch pkgIndex.tcl oder package provide; versioniert (z.B. 1.2.3); geladen mit `package require PackageName ?version?`; kann Tcl-Skripte, kompilierte Extensions oder beides enthalten.

---

### Shared Library

**EN:** Compiled binary extension (.so on Unix, .dll on Windows, .dylib on macOS); contains C/C++ code callable from Tcl; loaded with `load` or `package require`; provides performance-critical functionality.

**DE:** Kompilierte Binär-Extension (.so auf Unix, .dll auf Windows, .dylib auf macOS); enthält C/C++-Code aufrufbar von Tcl; geladen mit `load` oder `package require`; bietet performancekritische Funktionalität.

---

### TCLLIBPATH

**EN:** Environment variable specifying additional package search directories; space-separated list with Tcl list syntax; overrides/extends default `auto_path`; set before starting Tcl interpreter.

**DE:** Umgebungsvariable, die zusätzliche Paket-Suchverzeichnisse spezifiziert; leerzeichengetrennte Liste mit Tcl-Listen-Syntax; überschreibt/erweitert Standard-`auto_path`; gesetzt vor Start des Tcl-Interpreters.

---

### TM (Tcl Module)

**EN:** Modern single-file package format (.tm extension); no pkgIndex.tcl needed; filename encodes name and version (e.g., mypackage-1.0.tm); auto-discovered in module paths; simpler than traditional packages; Tcl 8.5+.

**DE:** Modernes Einzeldatei-Paket-Format (.tm-Endung); keine pkgIndex.tcl nötig; Dateiname kodiert Name und Version (z.B. mypackage-1.0.tm); automatisch in Modul-Pfaden entdeckt; einfacher als traditionelle Pakete; Tcl 8.5+.

---

### lib Directory

**EN:** Standard directory for libraries; typically `$prefix/lib` or `$prefix/lib/tcl8.6`; contains packages, modules, and shared libraries; searched via `auto_path` variable; platform-specific (lib vs lib64).

**DE:** Standard-Verzeichnis für Bibliotheken; typischerweise `$prefix/lib` oder `$prefix/lib/tcl8.6`; enthält Pakete, Module und Shared Libraries; durchsucht über `auto_path`-Variable; plattformspezifisch (lib vs lib64).

---

### package ifneeded

**EN:** Register package loading script; defined in pkgIndex.tcl; executed when package first required; lazy loading mechanism; example: `package ifneeded mypackage 1.0 [list source [file join $dir mypackage.tcl]]`.

**DE:** Paket-Lade-Skript registrieren; definiert in pkgIndex.tcl; ausgeführt wenn Paket erstmals benötigt; Lazy-Loading-Mechanismus; Beispiel: `package ifneeded mypackage 1.0 [list source [file join $dir mypackage.tcl]]`.

---

### package provide

**EN:** Command declaring package availability; specifies package name and version; called by package initialization code; example: `package provide mypackage 1.0`.

**DE:** Befehl zur Deklaration von Paket-Verfügbarkeit; spezifiziert Paket-Namen und Version; aufgerufen von Paket-Initialisierungs-Code; Beispiel: `package provide mypackage 1.0`.

---

### package require

**EN:** Command loading package and its dependencies; searches `auto_path` directories; matches version requirements; loads pkgIndex.tcl or .tm file; example: `package require http 2.9`.

**DE:** Befehl zum Laden von Paket und seinen Abhängigkeiten; durchsucht `auto_path`-Verzeichnisse; passt Versions-Anforderungen; lädt pkgIndex.tcl oder .tm-Datei; Beispiel: `package require http 2.9`.

---

### pkg_mkIndex

**EN:** Command generating pkgIndex.tcl from Tcl files in directory; scans for `package provide` statements; creates index entries; usage: `pkg_mkIndex /path/to/dir *.tcl`.

**DE:** Befehl zum Generieren von pkgIndex.tcl aus Tcl-Dateien im Verzeichnis; scannt nach `package provide`-Anweisungen; erstellt Index-Einträge; Verwendung: `pkg_mkIndex /path/to/dir *.tcl`.

---

### tcl::tm

**EN:** Tcl's module system — namespace for the module-path management commands. `tcl::tm::path add /dir/with/tm-files` registers a directory; `tcl::tm::roots` lists all roots. A Tcl module is a `.tm` file named with version like `mypkg-1.0.tm`; placed under a path-registered directory, it becomes available via `package require mypkg`. Simpler than the `pkgIndex.tcl` system: no index file needed, version is in the filename. Standard for new Tcl code; coexists with old-style packages.

**DE:** Tcls Modul-System — Namespace fuer die Modulpfad-Verwaltungs-Befehle. `tcl::tm::path add /dir/with/tm-files` registriert ein Verzeichnis; `tcl::tm::roots` listet alle Wurzeln. Ein Tcl-Modul ist eine `.tm`-Datei mit Version im Namen wie `meinpkg-1.0.tm`; unter einem registrierten Verzeichnis abgelegt, wird es ueber `package require meinpkg` verfuegbar. Einfacher als das `pkgIndex.tcl`-System: keine Index-Datei noetig, Version im Dateinamen. Standard fuer neuen Tcl-Code; koexistiert mit alten-Stil-Packages.

---

### tcl::tm::path

**EN:** Command managing Tcl Module paths; `tcl::tm::path add` adds directory; `tcl::tm::path list` shows current paths; modules in these directories auto-discovered; separate from `auto_path`.

**DE:** Befehl zur Verwaltung von Tcl-Modul-Pfaden; `tcl::tm::path add` fügt Verzeichnis hinzu; `tcl::tm::path list` zeigt aktuelle Pfade; Module in diesen Verzeichnissen automatisch entdeckt; getrennt von `auto_path`.

---


## Bind-Spezifische Details / Bind-Specific Details

### %A

**EN:** ASCII character corresponding to key press (empty for non-printable keys).

**DE:** ASCII-Zeichen entsprechend dem Tastendruck (leer für nicht druckbare Tasten).

---

### %K

**EN:** Keysym (symbolic name) of pressed key in binding scripts.

**DE:** Keysym (symbolischer Name) der gedrückten Taste in Binding-Skripten.

---

### %W

**EN:** Substitution for widget pathname in binding scripts.

**DE:** Substitution für Widget-Pfadnamen in Binding-Skripten.

---

### %X, %Y

**EN:** Mouse coordinates relative to screen in binding scripts.

**DE:** Maus-Koordinaten relativ zum Bildschirm in Binding-Skripten.

---

### %b

**EN:** Mouse button number (1=left, 2=middle, 3=right).

**DE:** Mausbutton-Nummer (1=links, 2=mitte, 3=rechts).

---

### %k

**EN:** Numeric keycode of pressed key in binding scripts.

**DE:** Numerischer Tastencode der gedrückten Taste in Binding-Skripten.

---

### %s

**EN:** State of modifier keys (Control, Shift, Alt) as numeric bitmask.

**DE:** Zustand der Modifikatortasten (Control, Shift, Alt) als numerische Bitmaske.

---

### %t

**EN:** Timestamp of event in milliseconds.

**DE:** Zeitstempel des Ereignisses in Millisekunden.

---

### %x, %y

**EN:** Mouse coordinates relative to widget in binding scripts.

**DE:** Maus-Koordinaten relativ zum Widget in Binding-Skripten.

---

### Bind

**EN:** Command to associate event patterns with scripts for widgets or tags.

**DE:** Befehl zum Verknüpfen von Ereignismustern mit Skripten für Widgets oder Tags.

---

### Binding Class

**EN:** Group of widgets sharing common bindings (e.g., all Text widgets share Text class bindings).

**DE:** Gruppe von Widgets, die gemeinsame Bindings teilen (z.B. alle Text-Widgets teilen Text-Klassen-Bindings).

---

### Bindtags

**EN:** List of tag names determining binding order for event processing.

**DE:** Liste von Tag-Namen, die Binding-Reihenfolge für Ereignisverarbeitung bestimmen.

---

### Break

**EN:** Command to stop event propagation in binding chain.

**DE:** Befehl zum Stoppen der Ereignisweiterleitung in der Binding-Kette.

---

### Continue

**EN:** Skip remaining bindings at current level but continue to next level.

**DE:** Restliche Bindings auf aktueller Ebene überspringen, aber zur nächsten Ebene fortfahren.

---

### Event Generate

**EN:** Programmatically create and send events to widgets.

**DE:** Programmatisch Ereignisse erstellen und an Widgets senden.

---

### Event Pattern

**EN:** String describing event type and modifiers (e.g., `<Button-1>`, `<Control-Key-s>`).

**DE:** Zeichenfolge, die Ereignistyp und Modifikatoren beschreibt (z.B. `<Button-1>`, `<Control-Key-s>`).

---

### Event Sequence

**EN:** Multiple events that must occur in order (e.g., `<Double-Button-1>`, `<Control-x><Control-c>`).

**DE:** Mehrere Ereignisse, die in Reihenfolge auftreten müssen (z.B. `<Double-Button-1>`, `<Control-x><Control-c>`).

---

### Event Substitution

**EN:** Special characters in binding scripts replaced with event details (e.g., `%x`, `%y` for coordinates, `%W` for widget).

**DE:** Spezielle Zeichen in Binding-Skripten werden durch Ereignisdetails ersetzt (z.B. `%x`, `%y` für Koordinaten, `%W` für Widget).

---

### Virtual Event

**EN:** Named event that can be triggered by multiple physical events (e.g., `<<Copy>>`, `<<Paste>>`).

**DE:** Benanntes Ereignis, das von mehreren physischen Ereignissen ausgelöst werden kann (z.B. `<<Copy>>`, `<<Paste>>`).

---


## Boolesche Werte / Boolean Values

### False

**EN:** Boolean value representing logical falsehood; can be expressed as `false`, `no`, `off`, or `0`.

**DE:** Boolescher Wert, der logische Falschheit repräsentiert; kann als `false`, `no`, `off` oder `0` ausgedrückt werden.

---

### No

**EN:** Alternative representation of boolean false value.

**DE:** Alternative Darstellung des booleschen Werts falsch.

---

### Off

**EN:** Alternative representation of boolean false, often used for switches or toggles.

**DE:** Alternative Darstellung von booleschen falsch, oft verwendet für Schalter oder Umschalter.

---

### On

**EN:** Alternative representation of boolean true, often used for switches or toggles.

**DE:** Alternative Darstellung von booleschen wahr, oft verwendet für Schalter oder Umschalter.

---

### True

**EN:** Boolean value representing logical truth; can be expressed as `true`, `yes`, `on`, or `1`.

**DE:** Boolescher Wert, der logische Wahrheit repräsentiert; kann als `true`, `yes`, `on` oder `1` ausgedrückt werden.

---

### Yes

**EN:** Alternative representation of boolean true value.

**DE:** Alternative Darstellung des booleschen Werts wahr.

---


## Build-System und Toolchain / Build System and Toolchain

### $(VAR) / ${VAR}

**EN:** Variable substitution syntax in Makefile to reference variable value.

**DE:** Variablen-Substitutions-Syntax in Makefile zum Referenzieren von Variablen-Wert.

---

### -command

**EN:** Prefix in Makefile rule ignoring command errors and continuing build.

**DE:** Präfix in Makefile-Regel, das Befehls-Fehler ignoriert und Build fortsetzt.

---

### @command

**EN:** Prefix in Makefile rule suppressing echo of command before execution.

**DE:** Präfix in Makefile-Regel, das Echo des Befehls vor Ausführung unterdrückt.

---

### Dependency

**EN:** File or target that must exist/be built before another target can be built.

**DE:** Datei oder Ziel, das existieren/gebaut werden muss, bevor anderes Ziel gebaut werden kann.

---

### Makefile

**EN:** Configuration file for make containing build rules, targets, and dependencies.

**DE:** Konfigurations-Datei für make mit Build-Regeln, Zielen und Abhängigkeiten.

---

### PHONY Target

**EN:** Makefile target that doesn't represent actual file (e.g., `.PHONY: clean all`).

**DE:** Makefile-Ziel, das keine tatsächliche Datei repräsentiert (z.B. `.PHONY: clean all`).

---

### Rule

**EN:** Makefile entry defining how to build target from dependencies with shell commands.

**DE:** Makefile-Eintrag, der definiert, wie Ziel aus Abhängigkeiten mit Shell-Befehlen gebaut wird.

---

### Target

**EN:** Named goal in Makefile (e.g., `all`, `install`, `clean`) that can be built.

**DE:** Benanntes Ziel in Makefile (z.B. `all`, `install`, `clean`), das gebaut werden kann.

---

### Variable (Makefile)

**EN:** Named value in Makefile (e.g., `CC=gcc`, `CFLAGS=-O2 -Wall`).

**DE:** Benannter Wert in Makefile (z.B. `CC=gcc`, `CFLAGS=-O2 -Wall`).

---

### gmake

**EN:** GNU Make; enhanced version of make with additional features and syntax.

**DE:** GNU Make; erweiterte Version von make mit zusätzlichen Features und Syntax.

---

### make

**EN:** Build automation tool that executes commands in Makefile based on file dependencies.

**DE:** Build-Automatisierungs-Tool, das Befehle in Makefile basierend auf Datei-Abhängigkeiten ausführt.

---

### make all

**EN:** Default target building entire project; typically builds all executables and libraries.

**DE:** Standard-Ziel, das gesamtes Projekt baut; baut typischerweise alle ausführbaren Dateien und Bibliotheken.

---

### make clean

**EN:** Target that removes built files and intermediate objects, returning to clean state.

**DE:** Ziel, das gebaute Dateien und Zwischen-Objekte entfernt, zurück zu sauberem Zustand.

---

### make distclean

**EN:** Target that removes all generated files including configure output, returning to distribution state.

**DE:** Ziel, das alle generierten Dateien inklusive configure-Ausgabe entfernt, zurück zu Distributions-Zustand.

---

### make install

**EN:** Target that installs built files to system directories (usually requires root/admin).

**DE:** Ziel, das gebaute Dateien in System-Verzeichnisse installiert (erfordert meist Root/Admin).

---


## C-Erweiterungen und Toolchains / C Extensions and Toolchains

### C (Programmiersprache)

**EN:** The systems programming language Tcl and Tk are written in. Every Tcl extension that contains compiled code interacts with the Tcl interpreter through the Tcl C-API, which is itself a C-language interface. Knowing C is not required to use Tcl, but is essential for: writing Tcl extensions in C (via TEA or critcl), reading the Tcl source code, understanding error messages from the C layer, or debugging memory issues. Tcl's design — value-as-string with cached internal reps — was shaped by what's easy to express in C. The C standard versions: C89, C99, C11, C17, C23; Tcl 9 requires at least C99.

**DE:** Die System-Programmiersprache, in der Tcl und Tk geschrieben sind. Jede Tcl-Erweiterung mit kompiliertem Code interagiert ueber die Tcl-C-API mit dem Tcl-Interpreter, die selbst eine C-Sprachen-Schnittstelle ist. C-Kenntnisse sind keine Voraussetzung um Tcl zu nutzen, aber essentiell fuer: Schreiben von Tcl-Erweiterungen in C (via TEA oder critcl), Lesen des Tcl-Quellcodes, Verstehen von Fehlermeldungen aus der C-Schicht, oder Debugging von Speicherproblemen. Tcls Design — Wert-als-String mit gecachten Internal-Reps — wurde davon gepraegt, was in C einfach auszudruecken ist. C-Standardversionen: C89, C99, C11, C17, C23; Tcl 9 erfordert mindestens C99.

---

### C++

**EN:** Object-oriented evolution of C, with classes, templates, RAII, and a large standard library (STL). In the Tcl/Tk world, C++ appears in: (a) some compiled extensions (`tkmcairo`, parts of `twapi`, several BAWT-built extensions); (b) the build systems that produce them (MSVC links `.cpp` files routinely, GCC needs `-x c++`); (c) when wrapping a C++ library to expose to Tcl, where the wrapper code needs `extern "C"` boundaries so the Tcl stubs see C-linkage symbols. The Tcl C-API itself is pure C, but C++ extensions interact with it through the same headers, just with `EXTERN` macros that handle the C/C++ linkage difference.

**DE:** Objekt-orientierte Evolution von C, mit Klassen, Templates, RAII und einer grossen Standard-Bibliothek (STL). In der Tcl/Tk-Welt taucht C++ auf bei: (a) einigen kompilierten Erweiterungen (`tkmcairo`, Teilen von `twapi`, mehreren BAWT-gebauten Erweiterungen); (b) den Build-Systemen, die sie produzieren (MSVC linkt `.cpp`-Dateien routinemaessig, GCC braucht `-x c++`); (c) beim Wrappen einer C++-Bibliothek zur Bereitstellung fuer Tcl, wo der Wrapper-Code `extern "C"`-Grenzen braucht, damit die Tcl-Stubs C-Linkage-Symbole sehen. Die Tcl-C-API selbst ist pures C, aber C++-Erweiterungen interagieren ueber dieselben Header, mit `EXTERN`-Makros die den C/C++-Linkage-Unterschied behandeln.

---

### CFFI

**EN:** Tcl Foreign Function Interface, by Ashok Nadkarni — Tcl extension for calling C functions in pre-built shared libraries (`.so`/`.dll`/`.dylib`) without compiling anything Tcl-side. Declare function signatures with `cffi::Wrapper`, then call them. No need for a TEA build pipeline; ideal when an OS library exists and you just need Tcl access to it. Supports complex types (structs, pointers, callbacks). Successor in spirit to the older `ffidl`.

**DE:** Tcl Foreign Function Interface, von Ashok Nadkarni — Tcl-Erweiterung zum Aufrufen von C-Funktionen in vorgebauten Shared Libraries (`.so`/`.dll`/`.dylib`) ohne Tcl-seitiges Kompilieren. Funktions-Signaturen mit `cffi::Wrapper` deklarieren, dann aufrufen. Keine TEA-Build-Pipeline noetig; ideal wenn eine OS-Bibliothek existiert und nur Tcl-Zugriff darauf gebraucht wird. Unterstuetzt komplexe Typen (Structs, Pointer, Callbacks). Spiritueller Nachfolger des aelteren `ffidl`.

---

### CGO

**EN:** Go's mechanism for calling C functions and using C types from Go code, and vice versa. Activated by `import "C"` in Go source plus C preamble in comments. Equivalent in role to Tcl's CFFI: bridges to existing C libraries. Notable in Tcl context because Go-based Tcl extensions (e.g. tclgo) use CGO to call into the Tcl C-API. CGO has its own memory-safety rules — Go GC must not move pointers that are visible to C, hence the pinning idioms.

**DE:** Gos Mechanismus zum Aufrufen von C-Funktionen und Nutzen von C-Typen aus Go-Code, und umgekehrt. Aktiviert durch `import "C"` im Go-Source plus C-Praeambel in Kommentaren. Rollengleich zu Tcls CFFI: Bruecke zu existierenden C-Bibliotheken. Im Tcl-Kontext bemerkenswert weil Go-basierte Tcl-Erweiterungen (z.B. tclgo) ueber CGO in die Tcl-C-API rufen. CGO hat eigene Memory-Safety-Regeln — Gos GC darf keine Pointer bewegen, die C sieht, daher die Pinning-Idiome.

---

### Deployment Target

**EN:** macOS-specific build option that declares the *minimum* macOS version a binary supports. Set via `-mmacosx-version-min=10.13` or `MACOSX_DEPLOYMENT_TARGET=10.13` environment variable. Build system uses this to choose which API symbols to allow. A binary built with deployment target 12.0 will not run on macOS 11; a binary built with target 10.13 runs on every macOS since 10.13. Critical for distributing universal Tcl/Tk apps.

**DE:** macOS-spezifische Build-Option, die die *Minimum*-macOS-Version deklariert, die eine Binary unterstuetzt. Gesetzt via `-mmacosx-version-min=10.13` oder `MACOSX_DEPLOYMENT_TARGET=10.13`-Umgebungsvariable. Build-System nutzt das um zu entscheiden, welche API-Symbole erlaubt sind. Eine Binary mit Deployment Target 12.0 laeuft nicht auf macOS 11; eine Binary mit Target 10.13 laeuft auf jedem macOS seit 10.13. Kritisch beim Verteilen universeller Tcl/Tk-Apps.

---

### MSVC

**EN:** Microsoft Visual C++ — Microsoft's C/C++ compiler suite. The default native compiler on Windows for any code that doesn't deliberately target Unix conventions. Used for the official Tcl/Tk Windows builds and for most binary Tcl extensions on Windows. Distributed with Visual Studio (Community Edition is free). Produces PE binaries; uses link.exe rather than ld; uses CL.EXE with `/`-prefixed flags rather than `-` flags.

**DE:** Microsoft Visual C++ — Microsofts C/C++-Compiler-Suite. Der Standard-Native-Compiler unter Windows fuer Code, der nicht bewusst Unix-Konventionen anvisiert. Genutzt fuer die offiziellen Tcl/Tk-Windows-Builds und die meisten Binaer-Tcl-Erweiterungen unter Windows. Mit Visual Studio ausgeliefert (Community Edition ist kostenlos). Produziert PE-Binaries; nutzt link.exe statt ld; nutzt CL.EXE mit `/`-praefigierten Flags statt `-`-Flags.

---

### MinGW-w64

**EN:** Minimalist GNU for Windows (64-bit edition) — port of GCC and the GNU toolchain to Windows, producing native Windows binaries. Successor to the original MinGW (32-bit only). Lets developers use Unix-style build systems (configure, make, autotools) to produce Windows binaries. Common on Windows in MSYS2 or as a cross-compiler from Linux. Distinguishable from MSVC by the C runtime (msvcrt vs. UCRT options) and by ABI quirks for C++ name mangling.

**DE:** Minimalist GNU for Windows (64-bit Ausgabe) — Portierung von GCC und der GNU-Toolchain auf Windows, die native Windows-Binaries produziert. Nachfolger des urspruenglichen MinGW (nur 32-bit). Erlaubt Entwicklern, Unix-Style-Build-Systeme (configure, make, autotools) fuer Windows-Binaries zu nutzen. Auf Windows ueblicherweise in MSYS2 oder als Cross-Compiler aus Linux. Unterscheidbar von MSVC durch die C-Runtime (msvcrt vs. UCRT-Optionen) und ABI-Eigenheiten bei C++-Name-Mangling.

---

### Multiarch

**EN:** Debian/Ubuntu mechanism for installing libraries from multiple architectures side-by-side. Paths like `/usr/lib/x86_64-linux-gnu/` and `/usr/lib/aarch64-linux-gnu/` hold per-arch libraries. Lets you install 32-bit and 64-bit versions in parallel, or develop for ARM on x86_64 without a separate sysroot. Common in cross-compile setups where the build needs ARM headers and libraries available alongside the native ones.

**DE:** Debian-/Ubuntu-Mechanismus zur Installation von Bibliotheken aus mehreren Architekturen nebeneinander. Pfade wie `/usr/lib/x86_64-linux-gnu/` und `/usr/lib/aarch64-linux-gnu/` halten architektur-spezifische Bibliotheken. Erlaubt das Installieren von 32-bit- und 64-bit-Versionen parallel, oder Entwickeln fuer ARM auf x86_64 ohne separates Sysroot. Ueblich in Cross-Compile-Setups, wo der Build ARM-Header und -Bibliotheken neben den nativen braucht.

---

### NDK

**EN:** Android Native Development Kit — Google's toolchain for compiling C/C++ code to Android. Provides cross-compilers (clang/clang++ for ARM, x86, x86_64), Android-specific headers (Bionic libc instead of glibc), and system libraries. Used by AndroWish to compile Tcl/Tk and extensions for Android targets. Requires an Android API level decision (minSdk) — defines which OS versions the produced binaries support.

**DE:** Android Native Development Kit — Googles Toolchain zum Kompilieren von C/C++-Code fuer Android. Liefert Cross-Compiler (clang/clang++ fuer ARM, x86, x86_64), Android-spezifische Header (Bionic libc statt glibc) und System-Bibliotheken. Wird von AndroWish genutzt um Tcl/Tk und Erweiterungen fuer Android-Ziele zu kompilieren. Erfordert eine Android-API-Level-Entscheidung (minSdk) — definiert welche OS-Versionen die produzierten Binaries unterstuetzen.

---

### Pinned Memory

**EN:** Memory address that the language runtime/garbage-collector promises not to move. In Go-Tcl integration via CGO, Go pointers passed to C must be pinned — otherwise Go's GC may relocate them mid-call, leaving C with a dangling pointer. Modern Go (1.20+) provides `runtime.Pinner` for this. In Tcl extension code, the equivalent concern: a `Tcl_Obj` whose intrep holds a pointer to data allocated elsewhere needs lifetime management to keep that data alive as long as the Tcl_Obj exists.

**DE:** Speicher-Adresse, die die Sprach-Runtime / der Garbage-Collector verspricht nicht zu verschieben. In Go-Tcl-Integration ueber CGO muessen an C uebergebene Go-Pointer gepinnt sein — sonst kann Gos GC sie mitten im Aufruf umlagern und C einen Dangling-Pointer hinterlassen. Modernes Go (1.20+) bietet `runtime.Pinner` dafuer. Im Tcl-Erweiterungs-Code: das Pendant — ein `Tcl_Obj`, dessen Intrep einen Pointer auf anderswo allokierte Daten haelt, braucht Lifetime-Management um diese Daten so lange am Leben zu halten wie der Tcl_Obj existiert.

---

### Polyglot Programming

**EN:** Building one application from multiple programming languages, each chosen for what it does best. In Tcl context: Tcl as the orchestration and UI layer (fast iteration, Tk for GUI), with C/C++/Go for performance-critical components (parsing, encoding, computation). Tcl's strength here is its bridge-friendly C-API and modular extension model. Common architectures: pure Tcl + critcl-inlined C; Tcl + CGO-compiled Go extension; Tcl + Rust via CFFI.

**DE:** Eine Anwendung aus mehreren Programmiersprachen bauen, jede gewaehlt fuer das was sie am besten kann. Im Tcl-Kontext: Tcl als Orchestrierungs- und UI-Schicht (schnelle Iteration, Tk fuer GUI), mit C/C++/Go fuer performance-kritische Komponenten (Parsing, Encoding, Berechnung). Tcls Staerke hier ist die bruecken-freundliche C-API und das modulare Erweiterungs-Modell. Uebliche Architekturen: pure Tcl + critcl-inlined C; Tcl + CGO-kompilierte Go-Erweiterung; Tcl + Rust ueber CFFI.

---

### Python

**EN:** Dynamically-typed scripting language with extensive standard library. Relevant in the Tcl/Tk ecosystem in two ways: (1) **tkinter** — Python's standard Tk binding, the way most non-Tcl users encounter Tk; (2) as an alternative to Tcl for scripting tasks — Python's syntax is more familiar to most programmers, but Tcl's homoiconic ("everything is a list/string") model is uniquely suited to GUI scripting and command-extension scenarios. The two communities have historically been parallel rather than competing — Python for general scripting, Tcl for embedded scripting and Tk-based GUIs.

**DE:** Dynamisch typisierte Skriptsprache mit umfangreicher Standard-Bibliothek. Im Tcl/Tk-Oekosystem auf zwei Wegen relevant: (1) **tkinter** — Pythons Standard-Tk-Bindung, der Weg auf dem die meisten Nicht-Tcl-Nutzer Tk erleben; (2) als Alternative zu Tcl fuer Skript-Aufgaben — Pythons Syntax ist vielen Programmierern vertrauter, aber Tcls homoikonisches ("alles ist Liste/String") Modell ist einzigartig fuer GUI-Skripting und Befehls-Erweiterungs-Szenarien geeignet. Die beiden Communities lagen historisch parallel statt konkurrierend — Python fuer generelles Skripting, Tcl fuer eingebettetes Skripting und Tk-basierte GUIs.

---

### QEMU

**EN:** Open-source machine emulator and virtualizer. For cross-compilation workflows: lets you run binaries built for one architecture (e.g. ARM) on another (e.g. x86_64 Linux), via user-mode emulation (`qemu-arm`). Indispensable for testing cross-compiled Tcl extensions before deploying to actual hardware. Also full-system mode (boot a different-architecture OS in a VM) for deeper testing. Standard tool for embedded/cross development.

**DE:** Open-Source-Maschinen-Emulator und -Virtualisierer. Fuer Cross-Kompilierungs-Workflows: laesst Binaries, die fuer eine Architektur (z.B. ARM) gebaut wurden, auf einer anderen (z.B. x86_64 Linux) laufen, via User-Mode-Emulation (`qemu-arm`). Unverzichtbar zum Testen cross-kompilierter Tcl-Erweiterungen bevor sie auf echte Hardware kommen. Auch Full-System-Modus (booten eines anderen-Architektur-OS in einer VM) fuer tieferes Testen. Standard-Werkzeug fuer Embedded-/Cross-Entwicklung.

---

### Toolchain

**EN:** The full set of tools used to build software for a specific target — compiler, assembler, linker, libraries, headers, archiver. For native builds: the host's installed gcc/clang/msvc. For cross-compilation: a separate toolchain matching the target architecture and OS. Often packaged with a triplet identifier like `x86_64-linux-gnu` (host) or `aarch64-linux-gnu` (Raspberry Pi target). Setting `CC`, `LD`, `AR` to toolchain-specific binaries directs the build.

**DE:** Der volle Satz an Werkzeugen zum Bauen von Software fuer ein bestimmtes Target — Compiler, Assembler, Linker, Bibliotheken, Header, Archiver. Fuer native Builds: das auf dem Host installierte gcc/clang/msvc. Fuer Cross-Kompilierung: eine separate Toolchain passend zur Ziel-Architektur und zum Ziel-OS. Oft verpackt mit einer Triplet-Kennung wie `x86_64-linux-gnu` (Host) oder `aarch64-linux-gnu` (Raspberry-Pi-Ziel). Das Setzen von `CC`, `LD`, `AR` auf Toolchain-spezifische Binaries lenkt den Build.

---

### Triplet

**EN:** Build-system identifier for a compile target in the form `architecture-vendor-os-libc` (or shorter). Standard forms: `x86_64-linux-gnu`, `aarch64-linux-gnu`, `x86_64-w64-mingw32`, `arm-none-eabi`. Used by configure scripts (`--host=...`, `--build=...`, `--target=...`) and Rust's `--target` flag. Encodes the answer to "what binary should this produce?" succinctly.

**DE:** Build-System-Kennung fuer ein Compile-Ziel in der Form `Architektur-Vendor-OS-Libc` (oder kuerzer). Standard-Formen: `x86_64-linux-gnu`, `aarch64-linux-gnu`, `x86_64-w64-mingw32`, `arm-none-eabi`. Verwendet von configure-Scripts (`--host=...`, `--build=...`, `--target=...`) und Rusts `--target`-Flag. Kodiert die Antwort auf "was fuer eine Binary soll das werden?" knapp.

---

### clang-cl

**EN:** Clang configured as an MSVC-compatible drop-in compiler. Accepts MSVC's `/`-style flags, links against the MSVC C runtime, produces PE binaries that link with libraries built by MSVC. Used by projects that want LLVM's diagnostics and code-quality on Windows but cannot leave the MSVC ecosystem. ABI-compatible with MSVC for C; for C++, mostly compatible with caveats.

**DE:** Clang, konfiguriert als MSVC-kompatibler Drop-in-Compiler. Akzeptiert MSVCs `/`-Style-Flags, linkt gegen die MSVC-C-Runtime, produziert PE-Binaries, die mit MSVC-gebauten Bibliotheken zusammenpassen. Genutzt von Projekten, die LLVMs Diagnostics und Code-Qualitaet unter Windows wollen, aber das MSVC-Oekosystem nicht verlassen koennen. ABI-kompatibel mit MSVC fuer C; fuer C++ weitgehend kompatibel mit Vorbehalten.

---

### critcl

**EN:** Tcl extension by Andreas Kupries that lets you embed C code directly inside a Tcl script. critcl compiles the C inline at first run (caching the result) and registers it as a Tcl command. Eliminates the build-system boilerplate of TEA for small extensions — no `configure.ac`, no `Makefile.in`, no `pkgIndex.tcl` work. Typical use: tight inner loops, OS-level calls, performance-critical helpers. Example: `critcl::cproc fast_add {int a int b} int { return a + b; }`.

**DE:** Tcl-Erweiterung von Andreas Kupries, die C-Code direkt im Tcl-Script einbetten laesst. critcl kompiliert das C beim ersten Lauf inline (mit Caching) und registriert es als Tcl-Befehl. Eliminiert den Build-System-Boilerplate von TEA fuer kleine Erweiterungen — kein `configure.ac`, kein `Makefile.in`, keine `pkgIndex.tcl`-Arbeit. Typischer Einsatz: enge innere Schleifen, OS-Level-Aufrufe, performance-kritische Hilfsfunktionen. Beispiel: `critcl::cproc fast_add {int a int b} int { return a + b; }`.

---

### ffidl

**EN:** Older Foreign Function Interface for Tcl. Pre-CFFI, lighter weight, less complete in type support. Still used in legacy Tcl code. For new projects, CFFI is recommended over ffidl (better typed, better Tcl-9 support, actively maintained).

**DE:** Aelteres Foreign Function Interface fuer Tcl. Vor CFFI, schlanker, weniger vollstaendig in der Typunterstuetzung. In Tcl-Legacy-Code weiter im Einsatz. Fuer neue Projekte ist CFFI gegenueber ffidl zu empfehlen (besser typisiert, besser Tcl-9-Support, aktiv gepflegt).

---

### glibc

**EN:** GNU C Library — the standard C library on most Linux distributions (Debian, Ubuntu, Fedora, RHEL, ...). Provides POSIX APIs, threading, locale, dynamic linker. Each glibc version has a binary-incompatibility threshold: a binary built against glibc 2.34 will not run on a system with glibc 2.31 (forward-compatibility only). Critical when distributing Tcl-extension binaries — must target the *lowest* glibc you want to support.

**DE:** GNU C Library — die Standard-C-Bibliothek auf den meisten Linux-Distributionen (Debian, Ubuntu, Fedora, RHEL, ...). Bietet POSIX-APIs, Threading, Locale, dynamischen Linker. Jede glibc-Version hat eine Binary-Inkompatibilitaets-Schwelle: eine gegen glibc 2.34 gebaute Binary laeuft nicht auf einem System mit glibc 2.31 (nur vorwaerts-kompatibel). Kritisch beim Verteilen von Tcl-Erweiterungs-Binaries — gegen die *niedrigste* glibc zielen, die unterstuetzt werden soll.

---

### musl

**EN:** Alternative C library to glibc, designed for size and static linking. Used by Alpine Linux (the de-facto small-container Linux), embedded distributions, and Docker images that need tiny binaries. Differences from glibc: stricter standards conformance, smaller binaries, no `getrlimit`-stack-juggling. Tcl extensions built against glibc may not run on musl systems and vice versa — different DNS resolution, different threading internals, different locale handling.

**DE:** Alternative C-Bibliothek zu glibc, ausgelegt auf Groesse und statisches Linken. Verwendet von Alpine Linux (das De-Facto-Klein-Container-Linux), eingebetteten Distributionen und Docker-Images, die winzige Binaries brauchen. Unterschiede zu glibc: strengere Standard-Konformitaet, kleinere Binaries, kein `getrlimit`-Stack-Jonglieren. Tcl-Erweiterungen, die gegen glibc gebaut wurden, laufen evtl. nicht auf musl-Systemen und umgekehrt — andere DNS-Aufloesung, andere Threading-Internas, anderes Locale-Handling.

---


## Canvas Item Details / Canvas Item Details

### Arc (Canvas)

**EN:** Canvas item drawing portion of oval outline; specified by bounding rectangle and angles (start, extent); styles: `pieslice`, `chord`, `arc`.

**DE:** Canvas-Element zum Zeichnen eines Teils einer Oval-Umrisslinie; angegeben durch begrenzende Rechteck und Winkel (start, extent); Stile: `pieslice`, `chord`, `arc`.

---

### Bitmap (Canvas)

**EN:** Canvas item displaying monochrome bitmap pattern; predefined: `error`, `gray75`, `gray50`, `gray25`, `gray12`, `hourglass`, `info`, `questhead`, `question`, `warning`.

**DE:** Canvas-Element zur Anzeige monochromen Bitmap-Musters; vordefiniert: `error`, `gray75`, `gray50`, `gray25`, `gray12`, `hourglass`, `info`, `questhead`, `question`, `warning`.

---

### Image (Canvas)

**EN:** Canvas item displaying photo or bitmap image; references image created with `image create`.

**DE:** Canvas-Element zur Anzeige von Foto oder Bitmap-Bild; referenziert Bild erstellt mit `image create`.

---

### Line (Canvas)

**EN:** Canvas item drawing straight or curved lines through specified coordinates; options: `-width`, `-fill`, `-dash`, `-arrow`, `-smooth`.

**DE:** Canvas-Element zum Zeichnen gerader oder gekrümmter Linien durch angegebene Koordinaten; Optionen: `-width`, `-fill`, `-dash`, `-arrow`, `-smooth`.

---

### Oval (Canvas)

**EN:** Canvas item drawing ellipse or circle; defined by bounding rectangle; options: `-fill`, `-outline`, `-width`, `-dash`.

**DE:** Canvas-Element zum Zeichnen von Ellipse oder Kreis; definiert durch begrenzende Rechteck; Optionen: `-fill`, `-outline`, `-width`, `-dash`.

---

### Polygon (Canvas)

**EN:** Canvas item drawing closed shape with three or more vertices; first/last points automatically connected; options: `-fill`, `-outline`, `-smooth`.

**DE:** Canvas-Element zum Zeichnen geschlossener Form mit drei oder mehr Eckpunkten; erster/letzter Punkt automatisch verbunden; Optionen: `-fill`, `-outline`, `-smooth`.

---

### Rectangle (Canvas)

**EN:** Canvas item drawing rectangular shape; defined by two opposite corners; options: `-fill`, `-outline`, `-width`, `-dash`.

**DE:** Canvas-Element zum Zeichnen rechteckiger Form; definiert durch zwei gegenüberliegende Ecken; Optionen: `-fill`, `-outline`, `-width`, `-dash`.

---

### Text (Canvas)

**EN:** Canvas item displaying text string; options: `-text`, `-font`, `-fill`, `-anchor`, `-justify`, `-width`.

**DE:** Canvas-Element zur Anzeige von Text-String; Optionen: `-text`, `-font`, `-fill`, `-anchor`, `-justify`, `-width`.

---

### Window (Canvas)

**EN:** Canvas item embedding Tk widget at specified position; allows interactive widgets within canvas.

**DE:** Canvas-Element zum Einbetten von Tk-Widget an angegebener Position; erlaubt interaktive Widgets innerhalb Canvas.

---


## Canvas-Item-Typen / Canvas Item Types

### Activefill / Activeoutline

**EN:** Fill/outline color when canvas item is active (typically during mouse-over).

**DE:** Füll-/Umrissfarbe, wenn Canvas-Element aktiv ist (typischerweise während Mouse-Over).

---

### Anchor (text/image anchor)

**EN:** Positioning reference point for text and image items on canvas.

**DE:** Positionierungsreferenzpunkt für Text- und Bild-Elemente auf Canvas.

---

### Arc

**EN:** Canvas item drawing portion of oval outline, specified by start and extent angles.

**DE:** Canvas-Element zum Zeichnen eines Teils einer Oval-Umrisslinie, angegeben durch Start- und Erweiterungswinkel.

---

### Bitmap

**EN:** Canvas item displaying monochrome bitmap pattern.

**DE:** Canvas-Element, das monochromes Bitmap-Muster anzeigt.

---

### Disabledfill / Disabledoutline

**EN:** Fill/outline color when canvas item is in disabled state.

**DE:** Füll-/Umrissfarbe, wenn Canvas-Element im deaktivierten Zustand ist.

---

### Extent

**EN:** Angular range for arc items, measured in degrees from start angle.

**DE:** Winkelbereich für Arc-Elemente, gemessen in Grad vom Startwinkel.

---

### Image

**EN:** Canvas item displaying image (photo or bitmap) at specified position.

**DE:** Canvas-Element, das Bild (Foto oder Bitmap) an angegebener Position anzeigt.

---

### Justify (text justify)

**EN:** Text alignment within its bounding box: `left`, `right`, `center`.

**DE:** Textausrichtung innerhalb ihrer Begrenzungsbox: `left`, `right`, `center`.

---

### Line

**EN:** Canvas item drawing straight or curved lines through specified coordinates.

**DE:** Canvas-Element zum Zeichnen gerader oder gekrümmter Linien durch angegebene Koordinaten.

---

### Offset

**EN:** Scroll offset for stipple pattern or dash pattern alignment.

**DE:** Scroll-Versatz für Stipple-Muster oder Strich-Muster-Ausrichtung.

---

### Oval

**EN:** Canvas item drawing ellipse or circle inscribed in bounding rectangle.

**DE:** Canvas-Element zum Zeichnen einer Ellipse oder eines Kreises, eingeschrieben in begrenzende Rechteck.

---

### Polygon

**EN:** Canvas item drawing closed shape with three or more vertices.

**DE:** Canvas-Element zum Zeichnen geschlossener Form mit drei oder mehr Eckpunkten.

---

### Rectangle

**EN:** Canvas item drawing rectangular shape defined by opposite corners.

**DE:** Canvas-Element zum Zeichnen rechteckiger Form, definiert durch gegenüberliegende Ecken.

---

### Start

**EN:** Starting angle for arc items, measured in degrees (0 = 3 o'clock position).

**DE:** Startwinkel für Arc-Elemente, gemessen in Grad (0 = 3-Uhr-Position).

---

### State (canvas item state)

**EN:** Canvas item state: `normal`, `disabled`, or `hidden`.

**DE:** Canvas-Element-Zustand: `normal`, `disabled` oder `hidden`.

---

### Stipple (canvas stipple)

**EN:** Bitmap pattern for creating textured fills in canvas items.

**DE:** Bitmap-Muster zum Erstellen texturierter Füllungen in Canvas-Elementen.

---

### Style (arc style)

**EN:** Arc drawing style: `pieslice` (filled wedge), `chord` (filled segment), `arc` (outline only).

**DE:** Arc-Zeichnungsstil: `pieslice` (gefüllter Keil), `chord` (gefülltes Segment), `arc` (nur Umriss).

---


## Canvas-Spezifische Begriffe / Canvas-Specific Terms

### Arrow

**EN:** Arrowhead decoration for line items; options include `first`, `last`, `both`, `none`.

**DE:** Pfeilspitzen-Dekoration für Linienelemente; Optionen umfassen `first`, `last`, `both`, `none`.

---

### Bbox (Bounding Box)

**EN:** The rectangular area that encloses a canvas item or group of items.

**DE:** Der rechteckige Bereich, der ein Canvas-Element oder eine Gruppe von Elementen umschließt.

---

### Canvas Item

**EN:** A graphical object on a canvas (line, rectangle, oval, text, image, etc.).

**DE:** Ein grafisches Objekt auf einem Canvas (Linie, Rechteck, Oval, Text, Bild, etc.).

---

### Coords

**EN:** Get or set the coordinates of a canvas item.

**DE:** Die Koordinaten eines Canvas-Elements abrufen oder setzen.

---

### Create

**EN:** Command to add new items to a canvas (e.g., `.canvas create line`).

**DE:** Befehl zum Hinzufügen neuer Elemente zu einem Canvas (z.B. `.canvas create line`).

---

### Lower

**EN:** Move canvas items down in the stacking order (behind other items).

**DE:** Canvas-Elemente in der Stapelreihenfolge nach unten bewegen (hinter andere Elemente).

---

### Move

**EN:** Shift a canvas item by relative x and y offsets.

**DE:** Ein Canvas-Element um relative x- und y-Verschiebungen bewegen.

---

### Raise

**EN:** Move canvas items up in the stacking order (in front of other items).

**DE:** Canvas-Elemente in der Stapelreihenfolge nach oben bewegen (vor andere Elemente).

---

### Rotate

**EN:** Rotate canvas items around a center point (requires additional calculations).

**DE:** Canvas-Elemente um einen Mittelpunkt drehen (erfordert zusätzliche Berechnungen).

---

### Smooth

**EN:** Create smoothed curves for line and polygon items on canvas.

**DE:** Geglättete Kurven für Linien- und Polygon-Elemente auf Canvas erstellen.

---

### Spline

**EN:** A smooth curve through specified points, used with canvas line items.

**DE:** Eine glatte Kurve durch angegebene Punkte, verwendet mit Canvas-Linienelementen.

---


## Clipboard und Selection / Clipboard and Selection

### CLIPBOARD

**EN:** Standard system clipboard for copy/paste (Ctrl+C/V); different from PRIMARY selection.

**DE:** Standard-System-Zwischenablage für Kopieren/Einfügen (Strg+C/V); unterschiedlich von PRIMARY-Auswahl.

---

### clipboard append

**EN:** Append text to system clipboard (e.g., `clipboard append "text"`).

**DE:** Text an System-Zwischenablage anhängen (z.B. `clipboard append "text"`).

---

### clipboard clear

**EN:** Clear system clipboard contents.

**DE:** System-Zwischenablage-Inhalt löschen.

---

### clipboard get

**EN:** Retrieve current clipboard contents as string.

**DE:** Aktuellen Zwischenablage-Inhalt als String abrufen.

---


## Compiler und Linker / Compiler and Linker

### -D (Define)

**EN:** Define preprocessor macro (e.g., `-DUSE_TCL_STUBS` defines USE_TCL_STUBS).

**DE:** Präprozessor-Makro definieren (z.B. `-DUSE_TCL_STUBS` definiert USE_TCL_STUBS).

---

### -I (Include Path)

**EN:** Compiler flag specifying directory to search for header files.

**DE:** Compiler-Flag zum Spezifizieren von Verzeichnis für Header-Datei-Suche.

---

### -L (Library Path)

**EN:** Linker flag specifying directory to search for libraries.

**DE:** Linker-Flag zum Spezifizieren von Verzeichnis für Bibliotheks-Suche.

---

### -O0 -O1 -O2 -O3

**EN:** Optimization levels: O0 (none), O1 (basic), O2 (standard), O3 (aggressive).

**DE:** Optimierungs-Stufen: O0 (keine), O1 (basis), O2 (standard), O3 (aggressiv).

---

### -Wall / -Wextra

**EN:** Enable all/extra compiler warnings for better code quality.

**DE:** Alle/Extra Compiler-Warnungen aktivieren für bessere Code-Qualität.

---

### -fPIC

**EN:** Compiler flag generating position-independent code required for shared libraries.

**DE:** Compiler-Flag zum Generieren positions-unabhängigen Codes erforderlich für Shared Libraries.

---

### -g

**EN:** Compiler flag including debug symbols for debugging with gdb/lldb.

**DE:** Compiler-Flag zum Einschließen von Debug-Symbolen für Debugging mit gdb/lldb.

---

### -l (Link Library)

**EN:** Linker flag linking against specific library (e.g., `-ltcl` links libtcl.so).

**DE:** Linker-Flag zum Linken gegen spezifische Bibliothek (z.B. `-ltcl` linkt libtcl.so).

---

### -shared

**EN:** Linker flag creating shared library (.so/.dll/.dylib) instead of executable.

**DE:** Linker-Flag zum Erstellen von Shared Library (.so/.dll/.dylib) statt ausführbarer Datei.

---

### CFLAGS

**EN:** Compiler flags for C code (e.g., `-O2 -Wall -I/usr/include/tcl8.6`).

**DE:** Compiler-Flags für C-Code (z.B. `-O2 -Wall -I/usr/include/tcl8.6`).

---

### CPPFLAGS

**EN:** C preprocessor flags (e.g., `-DUSE_TCL_STUBS -D_GNU_SOURCE`).

**DE:** C-Präprozessor-Flags (z.B. `-DUSE_TCL_STUBS -D_GNU_SOURCE`).

---

### LDFLAGS

**EN:** Linker flags specifying library search paths (e.g., `-L/usr/lib64`).

**DE:** Linker-Flags zum Spezifizieren von Bibliotheks-Suchpfaden (z.B. `-L/usr/lib64`).

---

### LIBS

**EN:** Libraries to link against (e.g., `-ltcl8.6 -lpthread`).

**DE:** Bibliotheken zum Linken (z.B. `-ltcl8.6 -lpthread`).

---

### Object File (.o)

**EN:** Compiled but not linked intermediate file from source code.

**DE:** Kompilierte aber nicht gelinkte Zwischen-Datei aus Quellcode.

---

### Shared Library (.so/.dll/.dylib)

**EN:** Dynamically loaded library shared between multiple programs.

**DE:** Dynamisch geladene Bibliothek, geteilt zwischen mehreren Programmen.

---

### Static Library (.a)

**EN:** Archive of compiled object files linked directly into executable.

**DE:** Archiv kompilierter Objekt-Dateien direkt in ausführbare Datei gelinkt.

---

### ar

**EN:** Tool creating static library archives from object files.

**DE:** Tool zum Erstellen statischer Bibliotheks-Archive aus Objekt-Dateien.

---

### clang / clang++

**EN:** LLVM C/C++ compilers, alternative to gcc with better diagnostics.

**DE:** LLVM C/C++-Compiler, Alternative zu gcc mit besserer Diagnostik.

---

### gcc / g++

**EN:** GNU C/C++ compilers commonly used for building Tcl extensions.

**DE:** GNU C/C++-Compiler häufig verwendet für Bau von Tcl-Extensions.

---

### ldd

**EN:** Tool showing shared library dependencies of executable (Linux/Unix).

**DE:** Tool zum Anzeigen von Shared-Library-Abhängigkeiten ausführbarer Datei (Linux/Unix).

---

### nm

**EN:** Tool listing symbols in object files or libraries.

**DE:** Tool zum Auflisten von Symbolen in Objekt-Dateien oder Bibliotheken.

---

### ranlib

**EN:** Tool generating index for static library archive for faster linking.

**DE:** Tool zum Generieren von Index für statisches Bibliotheks-Archiv für schnelleres Linken.

---

### strip

**EN:** Tool removing debug symbols from binary to reduce size.

**DE:** Tool zum Entfernen von Debug-Symbolen aus Binary um Größe zu reduzieren.

---


## Core Tcl Commands

### MenTestBegriff

**EN:** This is my test entry for testing the edit dialog

**DE:** Dies ist mein Test-Betrag zum Testen des Edit-Dialog

---

### dict

**EN:** Ordered key/value dictionary in Tcl 8.5+. Subcommands: dict create, get, set, unset, exists, keys, values, size, for, map, with, update, merge, replace, append, lappend, incr, filter, info. Stable iteration order. Internally a hash table; pure Tcl values, no special syntax.

**DE:** Geordnetes Key/Value-Dictionary in Tcl 8.5+. Subkommandos: dict create, get, set, unset, exists, keys, values, size, for, map, with, update, merge, replace, append, lappend, incr, filter, info. Stabile Iterations-Reihenfolge. Intern Hash-Tabelle; reine Tcl-Werte, keine spezielle Syntax.

---

### info

**EN:** Tcl introspection ensemble. Subcommands: info commands, procs, args, body, default, exists, vars, globals, locals, level, frame, script, library, patchlevel, tclversion, complete, hostname, nameofexecutable, sharedlibextension, functions, exists, object, class, namespace. Used for runtime reflection: list defined procs, get arg lists, check completeness of a script string.

**DE:** Tcl-Introspektions-Ensemble. Subkommandos: info commands, procs, args, body, default, exists, vars, globals, locals, level, frame, script, library, patchlevel, tclversion, complete, hostname, nameofexecutable, sharedlibextension, functions, exists, object, class, namespace. Verwendet fuer Laufzeit-Reflexion: definierte Prozeduren auflisten, Arg-Listen lesen, Vollstaendigkeit eines Skripts pruefen.

---

### proc

**EN:** Define a Tcl procedure. Syntax: proc name {arg1 ?arg2 default? ...args} body. Special args: args (collects rest), {arg default} (optional with default value). Return value is the body's return value (or last expression value). Local variables are scoped to the proc.

**DE:** Definiert eine Tcl-Prozedur. Syntax: proc name {arg1 ?arg2 default? ...args} body. Spezielle Argumente: args (sammelt Rest), {arg default} (optional mit Default-Wert). Rueckgabe ist der return-Wert (oder Wert des letzten Ausdrucks). Lokale Variablen sind auf die Prozedur beschraenkt.

---

### string

**EN:** Tcl ensemble command for string operations. Subcommands: string length, index, range, compare, equal, first, last, match, map, repeat, replace, reverse, tolower, toupper, totitle, trim, trimleft, trimright, cat, is, wordstart, wordend. Tcl's strings are Unicode-aware (UTF-8 internally in 8.x, UTF-32 in some places in 9.x).

**DE:** Tcl-Ensemble-Kommando fuer Stringoperationen. Subkommandos: string length, index, range, compare, equal, first, last, match, map, repeat, replace, reverse, tolower, toupper, totitle, trim, trimleft, trimright, cat, is, wordstart, wordend. Tcl-Strings sind Unicode-faehig (UTF-8 intern in 8.x, UTF-32 stellenweise in 9.x).

---


## Cursor-Typen / Cursor Types

### Cursor

**EN:** Mouse pointer appearance; can be customized with predefined cursor types.

**DE:** Aussehen des Mauszeigers; kann mit vordefinierten Cursor-Typen angepasst werden.

---

### X_cursor

**EN:** Large X cursor, often used as default on some systems.

**DE:** Großer X-Cursor, oft als Standard auf einigen Systemen verwendet.

---

### arrow

**EN:** Standard arrow pointer (default cursor).

**DE:** Standard-Pfeilzeiger (Standard-Cursor).

---

### bottom_left_corner / bottom_right_corner / top_left_corner / top_right_corner

**EN:** Corner resize cursors for diagonal resizing.

**DE:** Ecken-Größenänderungs-Cursor für diagonale Größenänderung.

---

### circle

**EN:** Circle cursor, often used for selection or targeting.

**DE:** Kreis-Cursor, oft verwendet für Auswahl oder Zielen.

---

### crosshair / cross

**EN:** Crosshair cursor for precise positioning or drawing.

**DE:** Fadenkreuz-Cursor für präzise Positionierung oder Zeichnen.

---

### fleur

**EN:** Four-way arrow cursor for moving objects in any direction.

**DE:** Vier-Wege-Pfeil-Cursor zum Bewegen von Objekten in jede Richtung.

---

### hand / hand1 / hand2

**EN:** Pointing hand cursor, typically used for clickable items or links.

**DE:** Zeigender Hand-Cursor, typischerweise verwendet für klickbare Elemente oder Links.

---

### ibeam / xterm

**EN:** I-beam cursor for text selection and editing.

**DE:** I-Strahl-Cursor für Textauswahl und -bearbeitung.

---

### none

**EN:** Invisible cursor (hides mouse pointer).

**DE:** Unsichtbarer Cursor (verbirgt Mauszeiger).

---

### pencil

**EN:** Pencil cursor for drawing or writing operations.

**DE:** Stift-Cursor für Zeichen- oder Schreiboperationen.

---

### pirate

**EN:** Skull and crossbones cursor (decorative/special purpose).

**DE:** Totenkopf-Cursor (dekorativ/Spezialzweck).

---

### plus

**EN:** Plus sign cursor for adding or creating operations.

**DE:** Plus-Zeichen-Cursor für Hinzufüge- oder Erstellungsoperationen.

---

### question_arrow

**EN:** Arrow with question mark for help or information mode.

**DE:** Pfeil mit Fragezeichen für Hilfe- oder Informationsmodus.

---

### sb_h_double_arrow

**EN:** Horizontal double-headed arrow for horizontal resizing.

**DE:** Horizontaler Doppelpfeil für horizontale Größenänderung.

---

### sb_v_double_arrow

**EN:** Vertical double-headed arrow for vertical resizing.

**DE:** Vertikaler Doppelpfeil für vertikale Größenänderung.

---

### size / sizing

**EN:** Cursor indicating resizable area.

**DE:** Cursor, der größenänderbaren Bereich anzeigt.

---

### target

**EN:** Target or bullseye cursor.

**DE:** Ziel- oder Bullseye-Cursor.

---

### umbrella

**EN:** Umbrella cursor (decorative/special purpose).

**DE:** Regenschirm-Cursor (dekorativ/Spezialzweck).

---

### watch / clock

**EN:** Clock or watch cursor indicating waiting or processing.

**DE:** Uhr- oder Watch-Cursor, der Warten oder Verarbeitung anzeigt.

---


## Dateisystem-Links / Filesystem Links

### Hard Link

**EN:** Direct reference to file's inode; multiple names for same data; file persists until all hard links deleted; cannot cross filesystem boundaries; Tcl: `file link -hard target linkname`; Unix: `ln`, Windows: mklink /H; shares same inode number.

**DE:** Direkte Referenz auf Datei-Inode; mehrere Namen für gleiche Daten; Datei bleibt bis alle Hard-Links gelöscht; kann nicht über Dateisystem-Grenzen; Tcl: `file link -hard target linkname`; Unix: `ln`, Windows: mklink /H; teilt gleiche Inode-Nummer.

---

### Inode

**EN:** Unix filesystem data structure storing file metadata; contains permissions, timestamps, disk locations; not filename; hard links share inode; Tcl: `file stat` returns inode in `ino` field; fundamental Unix filesystem concept.

**DE:** Unix-Dateisystem-Datenstruktur speichernd Datei-Metadaten; enthält Berechtigungen, Zeitstempel, Disk-Positionen; nicht Dateinamen; Hard-Links teilen Inode; Tcl: `file stat` gibt Inode in `ino`-Feld zurück; fundamentales Unix-Dateisystem-Konzept.

---

### Junction (Windows)

**EN:** Windows directory symbolic link; similar to Unix symlink but for directories only; NTFS feature; created with mklink /J; Tcl: `file link -symbolic` may create junction on Windows; differs from shortcut (.lnk file).

**DE:** Windows-Verzeichnis-symbolischer-Link; ähnlich Unix-Symlink aber nur für Verzeichnisse; NTFS-Feature; erstellt mit mklink /J; Tcl: `file link -symbolic` kann Junction auf Windows erstellen; unterscheidet sich von Shortcut (.lnk-Datei).

---

### Link

**EN:** Reference to file or directory; two types: hard link (direct reference to inode), symbolic/soft link (path reference); Tcl: `file link -symbolic target linkname` or `file link -hard`; Unix/Windows support; behavior differs by type.

**DE:** Referenz auf Datei oder Verzeichnis; zwei Typen: Hard-Link (direkte Referenz auf Inode), symbolischer/Soft-Link (Pfad-Referenz); Tcl: `file link -symbolic target linkname` oder `file link -hard`; Unix/Windows-Unterstützung; Verhalten unterscheidet sich nach Typ.

---

### Symbolic Link (Symlink/Soft Link)

**EN:** File containing path to another file; points to pathname; breaks if target moved/deleted; cross filesystem boundaries; Tcl: `file link -symbolic target linkname`; Unix: `ln -s`, Windows: mklink; most flexible link type.

**DE:** Datei mit Pfad zu anderer Datei; zeigt auf Pfadnamen; bricht wenn Ziel bewegt/gelöscht; über Dateisystem-Grenzen; Tcl: `file link -symbolic target linkname`; Unix: `ln -s`, Windows: mklink; flexibelster Link-Typ.

---


## Daten-Befehle / Data Commands

### Append

**EN:** Add content to the end of a variable or widget.

**DE:** Inhalt am Ende einer Variablen oder eines Widgets hinzufügen.

---

### Clear

**EN:** Remove all content from a widget or data structure.

**DE:** Allen Inhalt aus einem Widget oder einer Datenstruktur entfernen.

---

### Delete

**EN:** Remove text, items, or widgets from a specified range or position.

**DE:** Text, Elemente oder Widgets aus einem angegebenen Bereich oder Position entfernen.

---

### Index

**EN:** Position or identifier for accessing elements in widgets like text or listbox.

**DE:** Position oder Identifikator für den Zugriff auf Elemente in Widgets wie text oder listbox.

---

### Insert

**EN:** Add text or items at a specific position in a widget (e.g., text or listbox).

**DE:** Text oder Elemente an einer bestimmten Position in einem Widget hinzufügen (z.B. text oder listbox).

---

### Put

**EN:** Place or insert data into a widget or data structure.

**DE:** Daten in ein Widget oder eine Datenstruktur einfügen.

---

### Search

**EN:** Find text or patterns within text widgets or data structures.

**DE:** Text oder Muster innerhalb von Text-Widgets oder Datenstrukturen finden.

---

### Unset

**EN:** Remove a variable or array element from memory.

**DE:** Eine Variable oder ein Array-Element aus dem Speicher entfernen.

---


## Datenbank-Begriffe / Database Terms

### Auto-Commit

**EN:** Mode in which every successfully executed SQL statement is automatically committed without an explicit COMMIT. SQLite and PostgreSQL behave differently here — SQLite is auto-commit by default unless a transaction is opened explicitly; PostgreSQL follows the same default but isolation semantics differ. Important to know before writing transaction code that has to work cross-database.

**DE:** Modus, in dem jedes erfolgreich ausgefuehrte SQL-Statement automatisch commit-tet wird, ohne dass ein expliziter COMMIT gerufen werden muss. SQLite und Postgres verhalten sich hier unterschiedlich — SQLite ist per Default Auto-Commit ausser bei expliziter Transaktion; Postgres folgt dem gleichen Default, aber die Isolations-Semantik unterscheidet sich. Wichtig zu wissen bevor man cross-database Transaktions-Code schreibt.

---

### BLOB

**EN:** Binary Large Object — a SQL column type for binary data of arbitrary size. In Oratcl addressable as a separate LOB class. In SQLite handled via type affinity `BLOB`. Used for storing files, images, encoded data inside the database.

**DE:** Binary Large Object — eine SQL-Spalten-Form fuer binaere Daten beliebiger Groesse. In Oratcl als eigene LOB-Klasse ansprechbar. In SQLite ueber Type Affinity `BLOB`. Verwendet fuer das Speichern von Dateien, Bildern, kodierten Daten innerhalb der Datenbank.

---

### BM25

**EN:** Ranking function for full-text search, built into FTS5. Returns smaller values for more relevant matches (negative scores by convention). Used in `SELECT ... ORDER BY rank` queries against an FTS5 virtual table.

**DE:** Ranking-Funktion fuer Volltext-Suche, in FTS5 eingebaut. Liefert kleinere Werte fuer relevantere Treffer (per Konvention negative Scores). Verwendet in `SELECT ... ORDER BY rank`-Queries gegen FTS5 Virtual Tables.

---

### Bind-Parameter

**EN:** Placeholder in a SQL statement that is filled with a value at execution time. In TDBC, bind parameters are introduced with a colon (`:name`) and filled at `execute` via a Tcl dict. Prevents SQL injection and enables prepared-statement reuse. Standard for all production database code.

**DE:** Platzhalter in einer SQL-Anweisung, der zur Laufzeit mit einem Wert ersetzt wird. In TDBC werden Bind-Parameter mit Doppelpunkt eingeleitet (`:name`) und beim `execute` ueber ein Tcl-Dict gefuellt. Verhindert SQL-Injection und ermoeglicht Prepared-Statement-Wiederverwendung. Standard fuer Produktiv-Datenbank-Code.

---

### CLOB

**EN:** Character Large Object — PostgreSQL and Oracle column type for large text fields. SQLite has no separate CLOB type; large strings live in regular `TEXT` columns (which are arbitrary length).

**DE:** Character Large Object — Postgres- und Oracle-Form fuer grosse Text-Felder. SQLite kennt das nicht; grosse Strings werden in `TEXT`-Spalten gehalten (die ohnehin beliebig lang sind).

---

### Connection

**EN:** The primary TDBC object representing an open connection to the database. Typically created once per application and held. Source of `prepare` calls and the host for transactions.

**DE:** Das primaere TDBC-Objekt, das eine geoeffnete Verbindung zur Datenbank repraesentiert. Wird typischerweise einmal pro Anwendung angelegt und gehalten. Ursprung der `prepare`-Aufrufe und Traeger der Transaktionen.

---

### Connection-String

**EN:** ODBC notation for connection parameters, in the form `key=value;key=value;...`. The exact format is driver-specific. Used to bypass DSN configuration when supplying credentials inline. See connectionstrings.com for driver-specific examples.

**DE:** ODBC-Notation fuer Verbindungs-Parameter, in Form `Schluessel=Wert;Schluessel=Wert;...`. Genaues Format ist treiber-spezifisch. Verwendet um DSN-Konfiguration zu umgehen und Credentials inline zu liefern. Siehe connectionstrings.com fuer treiber-spezifische Beispiele.

---

### Cursor

**EN:** Database-internal concept of a pointer to a position in a result set. ODBC knows several cursor types (Forward-only, Static, Keyset, Dynamic). TDBC typically uses forward-only via `nextlist`/`nextdict`. Most application code does not deal with cursors directly.

**DE:** Datenbank-internes Konzept eines Zeigers auf eine Position im Result-Set. ODBC kennt mehrere Cursor-Typen (Forward-only, Static, Keyset, Dynamic). TDBC verwendet typischerweise Forward-only via `nextlist`/`nextdict`. Anwendungs-Code kommt selten direkt mit Cursors in Beruehrung.

---

### DDL

**EN:** Data Definition Language — SQL commands that change the schema: `CREATE`, `ALTER`, `DROP`. Counterpart to DML.

**DE:** Data Definition Language — SQL-Befehle, die das Schema veraendern: `CREATE`, `ALTER`, `DROP`. Gegenstueck zu DML.

---

### DML

**EN:** Data Manipulation Language — SQL commands that change or read data: `INSERT`, `UPDATE`, `DELETE`, `SELECT`. Counterpart to DDL.

**DE:** Data Manipulation Language — SQL-Befehle, die Daten veraendern oder lesen: `INSERT`, `UPDATE`, `DELETE`, `SELECT`. Gegenstueck zu DDL.

---

### DSN

**EN:** Data Source Name — a pre-configured connection string under a short alias. Stored platform-dependent: `/etc/odbc.ini` on Linux, ODBC Data Source Administrator on Windows, `/Library/ODBC/odbc.ini` on macOS. Allows separating credentials from application code.

**DE:** Data Source Name — vorkonfigurierter Connection-String unter einem kurzen Alias. Plattform-abhaengig gespeichert: `/etc/odbc.ini` auf Linux, ODBC-Datenquellen-Verwaltung auf Windows, `/Library/ODBC/odbc.ini` auf macOS. Erlaubt die Trennung von Credentials und Anwendungs-Code.

---

### Default-Schema

**EN:** The schema used by a database connection when no explicit prefix is given. PostgreSQL: queryable via `current_schema()`. Oracle: the schema of the connection user. SQLite: only `main` and `temp` plus `ATTACH`-mounted secondary databases.

**DE:** Das Schema, das bei einer DB-Connection ohne explizites Praefix benutzt wird. Postgres: ueber `current_schema()` abrufbar. Oracle: das Schema des Connection-Users. SQLite: nur `main` und `temp` plus per `ATTACH` zugeschaltete Sekundaer-DBs.

---

### Driver Manager

**EN:** ODBC component that mediates between application code and the concrete driver. Built into Windows; usually `unixODBC` on Linux; often `iODBC` on macOS. The application calls ODBC API functions; the manager routes them to the appropriate driver based on DSN or connection string.

**DE:** ODBC-Komponente, die zwischen Anwendungs-Code und konkretem Treiber vermittelt. Auf Windows eingebaut; auf Linux meist `unixODBC`; auf macOS oft `iODBC`. Die Anwendung ruft ODBC-API-Funktionen; der Manager leitet sie zum passenden Treiber basierend auf DSN oder Connection-String.

---

### Empty-String

**EN:** In Tcl the value `""`. Because Tcl has no NULL concept of its own, empty string is conventionally used as the Tcl representation of SQL NULL. This convention has consequences: a legitimately empty SQL TEXT value is indistinguishable from NULL when fetched via TDBC defaults.

**DE:** In Tcl der Wert `""`. Weil Tcl kein eigenes NULL-Konzept hat, wird Empty-String konventionell als Tcl-Repraesentation fuer SQL NULL verwendet. Diese Konvention hat Konsequenzen: ein legitim leerer SQL TEXT-Wert ist von NULL nicht mehr unterscheidbar wenn er ueber TDBC-Defaults geholt wird.

---

### FK (Foreign Key)

**EN:** Foreign key — column that references the primary key of another table, establishing a relationship. In SQLite *declared but not enforced* by default; enforcement is switched on via `PRAGMA foreign_keys = ON` (must be set on each new connection). PostgreSQL and Oracle enforce by default.

**DE:** Fremdschluessel — Spalte, die auf den Primaerschluessel einer anderen Tabelle verweist und damit eine Beziehung herstellt. In SQLite per Default *deklariert aber nicht erzwungen*; Erzwingung ueber `PRAGMA foreign_keys = ON` (muss bei jeder neuen Connection gesetzt werden). Postgres und Oracle erzwingen per Default.

---

### FTS5

**EN:** Full-Text Search module, version 5, of SQLite. A virtual-table extension providing full-text indexing and `MATCH` queries. Standard since SQLite 3.9. Supports tokenization, prefix matching, BM25 ranking, phrase queries. The earlier FTS3/FTS4 modules are deprecated.

**DE:** Full-Text Search Modul, Version 5, von SQLite. Eine Virtual-Table-Erweiterung, die Volltext-Indizierung und `MATCH`-Queries bereitstellt. Standard seit SQLite 3.9. Unterstuetzt Tokenisierung, Prefix-Matching, BM25-Ranking, Phrasen-Queries. Die frueheren FTS3/FTS4-Module sind veraltet.

---

### Glue-Code

**EN:** Tcl term for code that brings multiple underlying libraries or tools together — Tcl was originally designed as a glue language. In the database context, the typical Tcl application is glue between TDBC drivers, Tk GUI code, and external tools. Compared to writing the whole application in C or Java, Tcl glue is concise and fast to evolve.

**DE:** Tcl-Begriff fuer Code, der mehrere darunter liegende Bibliotheken oder Tools zusammenfuehrt — Tcl wurde urspruenglich als Glue-Sprache entworfen. Im Datenbank-Kontext ist die typische Tcl-Anwendung Glue zwischen TDBC-Treibern, Tk-GUI-Code und externen Tools. Gegenueber kompletter Implementierung in C oder Java ist Tcl-Glue kompakt und schnell weiterzuentwickeln.

---

### Information Schema

**EN:** SQL standard collection of views that expose schema metadata (tables, columns, constraints). Implemented in PostgreSQL and Oracle, not in SQLite — SQLite uses `sqlite_master` and `PRAGMA` commands instead. Used in cross-database schema introspection code.

**DE:** SQL-Standard-Sammlung von Views, die Schema-Metadaten zugaenglich machen (Tabellen, Spalten, Constraints). In PostgreSQL und Oracle implementiert, in SQLite nicht — dort gibt es stattdessen `sqlite_master` und `PRAGMA`. Verwendet in cross-database Schema-Introspection-Code.

---

### Instant Client

**EN:** Slim distribution of the Oracle client libraries, without a full Oracle installation. Used by Oratcl when `ORACLE_HOME` or `ORACLE_LIBRARY` points to it. Standard way to package Oracle connectivity without shipping the full server-side Oracle stack.

**DE:** Schmale Distribution der Oracle-Client-Bibliotheken, ohne vollstaendige Oracle-Installation. Wird von Oratcl genutzt, sofern `ORACLE_HOME` oder `ORACLE_LIBRARY` darauf zeigt. Standard-Weg um Oracle-Konnektivitaet zu paketieren ohne den ganzen Server-Stack mitzuliefern.

---

### JDBC

**EN:** Java Database Connectivity — the Java standard layer for database access. Structural model for TDBC: connection / statement / result set. Most concepts in TDBC have a direct JDBC analogue.

**DE:** Java Database Connectivity — die Java-Standardschicht fuer Datenbank-Zugriff. Strukturelles Vorbild fuer TDBC: Connection / Statement / Result Set. Die meisten Konzepte in TDBC haben ein direktes JDBC-Pendant.

---

### JSON1

**EN:** JSON function family in SQLite. Provides `json_extract`, `json_each`, `json_object`, `json_array`, `json_set`, `json_remove`, and more. Available as extension since SQLite 3.9; in the core since 3.38.0 (February 2022). Enables hybrid relational/document storage.

**DE:** JSON-Funktions-Familie in SQLite. Bietet `json_extract`, `json_each`, `json_object`, `json_array`, `json_set`, `json_remove` und mehr. Seit SQLite 3.9 als Erweiterung, seit 3.38.0 (Februar 2022) im Core. Ermoeglicht hybride relationale/Dokument-Speicherung.

---

### LOB

**EN:** Large Object — umbrella term for BLOB and CLOB. In Oratcl addressable as its own object class with the `oralob` command. Operations include reading in chunks (for memory efficiency), writing, length-querying.

**DE:** Large Object — Sammelbegriff fuer BLOB und CLOB. In Oratcl als eigene Objekt-Klasse mit `oralob`-Befehl ansprechbar. Operationen umfassen Chunk-weises Lesen (fuer Speicher-Effizienz), Schreiben, Laengen-Abfrage.

---

### Lazy-Loading

**EN:** Loading strategy where a library is loaded only when actually needed, not at startup. In Tcl, typically implemented with `package require` inside a function rather than at top level. Reduces startup time and memory footprint for features that are rarely used (e.g. PDF export).

**DE:** Lade-Strategie, bei der eine Bibliothek erst dann geladen wird, wenn sie tatsaechlich gebraucht wird, nicht beim Start. In Tcl typisch implementiert mit `package require` innerhalb einer Funktion statt auf Top-Level. Reduziert Startzeit und Memory-Footprint fuer selten genutzte Features (z.B. PDF-Export).

---

### MariaDB

**EN:** Community-driven fork of MySQL, started in 2009 by MySQL's original developers in response to Oracle's acquisition. Wire-protocol-compatible with MySQL (the same TDBC driver works), but with divergent feature development: MariaDB adds storage engines (Aria, ColumnStore, S3), query optimizer improvements, and JSON functions independent of MySQL's path. Default choice in many modern Linux distributions (Debian, Fedora, Arch) where it shipped as the `mysql` package. Tcl access via `tdbc::mysql` — works against either server.

**DE:** Community-getriebener Fork von MySQL, 2009 von MySQLs urspruenglichen Entwicklern als Reaktion auf Oracles Uebernahme gestartet. Wire-Protokoll-kompatibel mit MySQL (derselbe TDBC-Treiber funktioniert), aber mit auseinandergehender Feature-Entwicklung: MariaDB ergaenzt Storage-Engines (Aria, ColumnStore, S3), Query-Optimizer-Verbesserungen und JSON-Funktionen unabhaengig von MySQLs Pfad. Standardwahl in vielen modernen Linux-Distributionen (Debian, Fedora, Arch), wo es als `mysql`-Paket ausgeliefert wurde. Tcl-Zugriff via `tdbc::mysql` — funktioniert gegen beide Server.

---

### Mock-Connection

**EN:** Test pattern in which a TDBC connection is replaced by a TclOO object that records all method calls. Allows testing application code without a real database. Standard technique for unit tests of database wrapper code.

**DE:** Test-Pattern, bei dem eine TDBC-Connection durch ein TclOO-Objekt ersetzt wird, das alle Methoden-Aufrufe aufzeichnet. Erlaubt Tests ohne echte DB. Standard-Technik fuer Unit-Tests von Datenbank-Wrapper-Code.

---

### Multi-Statement-SQL

**EN:** A sequence of multiple SQL statements separated by semicolons, executed in a single call. TDBC does *not* process this — only one statement per call. The older `sqlite3` Tcl package can. Avoid in code intended to be portable across TDBC drivers.

**DE:** Eine Folge mehrerer SQL-Statements, mit Semikolons getrennt, in einem einzigen Aufruf ausgefuehrt. TDBC verarbeitet das *nicht* — pro Aufruf nur ein Statement. Das alte `sqlite3`-Tcl-Paket kann es. In Code der portabel ueber TDBC-Treiber sein soll vermeiden.

---

### MySQL

**EN:** Widely-deployed open-source relational database — historically the "M" in LAMP stack (Linux, Apache, MySQL, PHP). Owned by Oracle since 2010, which prompted the MariaDB fork. Strengths: huge installation base, good replication, mature tooling. Weaknesses (versus PostgreSQL): historically looser standards compliance, fewer advanced query features. Tcl access via TDBC driver `tdbc::mysql`. The wire protocol is shared between MySQL and MariaDB, so the same driver works for both — though feature-level compatibility may differ for newer constructs.

**DE:** Weit verbreitete Open-Source-Relationale-Datenbank — historisch das "M" im LAMP-Stack (Linux, Apache, MySQL, PHP). Seit 2010 im Besitz von Oracle, was den MariaDB-Fork ausgeloest hat. Staerken: riesige Installations-Basis, gute Replikation, reife Werkzeuge. Schwaechen (gegenueber PostgreSQL): historisch laxere Standard-Konformitaet, weniger fortgeschrittene Query-Features. Tcl-Zugriff via TDBC-Treiber `tdbc::mysql`. Das Wire-Protokoll wird zwischen MySQL und MariaDB geteilt, daher funktioniert derselbe Treiber fuer beide — auf Feature-Ebene kann die Kompatibilitaet fuer neuere Konstrukte allerdings differieren.

---

### NLS_LANG

**EN:** Environment variable for Oracle clients that sets language and encoding (e.g. `GERMAN_GERMANY.AL32UTF8`). Honoured by Oratcl. Critical for correct character handling between application and Oracle server.

**DE:** Umgebungsvariable fuer Oracle-Clients, die die Sprach- und Encoding-Einstellungen festlegt (z.B. `GERMAN_GERMANY.AL32UTF8`). Wird von Oratcl beachtet. Kritisch fuer korrekte Zeichenbehandlung zwischen Anwendung und Oracle-Server.

---

### OCI (Oracle Call Interface)

**EN:** Oracle's C-API for database access. Oratcl is a thin layer on top of OCI. The de-facto low-level interface for any Oracle integration in C or wrapper languages.

**DE:** Die C-API von Oracle fuer Datenbank-Zugriff. Oratcl ist eine duenne Schicht darueber. Die De-Facto-Low-Level-Schnittstelle fuer jede Oracle-Integration in C oder Wrapper-Sprachen.

---

### ODBC (Open Database Connectivity)

**EN:** Industry standard API for database access, specified language- and database-independent. In Tcl accessed via the `tdbc::odbc` package. Bridge architecture with Driver Manager and DB-specific driver. The standard fallback when no native TDBC driver exists for a given database.

**DE:** Industrie-Standard-API fuer Datenbank-Zugriff, sprache- und datenbank-unabhaengig spezifiziert. In Tcl ueber das `tdbc::odbc`-Paket angesprochen. Bruecken-Architektur mit Driver Manager und DB-spezifischem Treiber. Standard-Fallback wenn kein nativer TDBC-Treiber existiert.

---

### ORM (Object-Relational Mapper)

**EN:** Library that maps table rows to language objects (e.g. SQLAlchemy in Python, Hibernate in Java). In Tcl there is no dominant ORM. Trade-off: ORMs reduce boilerplate but add overhead and abstraction leaks. For Tcl, a lightweight middle path with TclOO + explicit SQL is common.

**DE:** Bibliothek, die Tabellen-Zeilen in Sprach-Objekte abbildet (z.B. SQLAlchemy in Python, Hibernate in Java). In Tcl gibt es kein dominantes ORM. Trade-Off: ORMs reduzieren Boilerplate, fuegen aber Overhead und Abstraktions-Lecks hinzu. Fuer Tcl ist ein leichtgewichtiger Mittelweg mit TclOO + expliziten SQL ueblich.

---

### Oratcl

**EN:** Tcl extension for Oracle database access. Does not follow the TDBC convention; offers its own API closer to OCI. Pre-dates TDBC. Used when TDBC's Oracle driver is unavailable or when fine-grained OCI control is needed.

**DE:** Tcl-Erweiterung fuer Oracle-Datenbank-Zugriff. Folgt nicht der TDBC-Konvention, sondern bietet eine eigene API, die enger an OCI verzahnt ist. Aelter als TDBC. Verwendet wenn TDBC-Oracle-Treiber nicht verfuegbar oder feingranulare OCI-Kontrolle gebraucht wird.

---

### PDO

**EN:** PHP Data Objects — the PHP standard layer for database access. Conceptual cousin of TDBC and JDBC: connection / prepared-statement / result set. Mentioned here as comparison.

**DE:** PHP Data Objects — die PHP-Standardschicht fuer Datenbank-Zugriff. Konzeptueller Verwandter von TDBC und JDBC: Connection / Prepared-Statement / Result Set. Hier als Vergleich erwaehnt.

---

### PRAGMA

**EN:** SQLite-specific SQL command that configures the connection or schema. Important pragmas: `PRAGMA foreign_keys = ON` (FK enforcement), `PRAGMA journal_mode = WAL` (write-ahead logging), `PRAGMA table_info(t)` (schema introspection), `PRAGMA integrity_check` (sanity check). Not portable to other databases.

**DE:** SQLite-spezifischer SQL-Befehl, der die Connection oder das Schema konfiguriert. Wichtige Pragmas: `PRAGMA foreign_keys = ON` (FK-Erzwingung), `PRAGMA journal_mode = WAL` (Write-Ahead Logging), `PRAGMA table_info(t)` (Schema-Introspektion), `PRAGMA integrity_check` (Sanity-Check). Nicht portabel zu anderen Datenbanken.

---

### PostgreSQL

**EN:** Open-source relational database — the most feature-complete open-source SQL system. Distinguished by strong standards compliance (PL/pgSQL stored procedures, advanced query features), rich type system (JSON, JSONB, arrays, ranges, custom types), and extensibility (PostGIS for geo-data, full-text search, foreign data wrappers). Tcl accesses PostgreSQL via the TDBC driver `tdbc::postgres` (`package require tdbc::postgres; tdbc::postgres::connection create db -host ...`). The non-TDBC `Pgtcl` extension also exists, older but with direct access to PostgreSQL-specific features. Often abbreviated "Postgres".

**DE:** Open-Source-Relationale-Datenbank — das funktional umfangreichste open-source SQL-System. Zeichnet sich aus durch starke Standard-Konformitaet (PL/pgSQL-Stored-Procedures, fortgeschrittene Query-Features), reichhaltiges Typ-System (JSON, JSONB, Arrays, Ranges, eigene Typen) und Erweiterbarkeit (PostGIS fuer Geo-Daten, Volltext-Suche, Foreign-Data-Wrapper). Tcl greift via TDBC-Treiber `tdbc::postgres` auf PostgreSQL zu (`package require tdbc::postgres; tdbc::postgres::connection create db -host ...`). Die Nicht-TDBC-Erweiterung `Pgtcl` existiert auch, aelter aber mit direktem Zugriff auf PostgreSQL-spezifische Features. Oft als "Postgres" abgekuerzt.

---

### Prepared Statement

**EN:** A SQL statement prepared by the database, then executed multiple times with different bind parameters. In TDBC created via `$conn prepare`. Benefits: prevents SQL injection, allows the database to cache the execution plan, faster for repeated execution.

**DE:** Ein zur Datenbank vorbereitetes SQL-Statement, das mehrfach mit verschiedenen Bind-Parametern ausgefuehrt werden kann. In TDBC durch `$conn prepare` erzeugt. Vorteile: verhindert SQL-Injection, erlaubt der DB den Execution-Plan zu cachen, schneller bei wiederholter Ausfuehrung.

---

### ResultSet

**EN:** TDBC object representing the result of a SQL query, iterated over with `nextlist`/`nextdict` or processed in bulk with `allrows`. Created by `$stmt execute`. Must be closed (or fully consumed) to free database resources.

**DE:** TDBC-Objekt, das das Ergebnis einer SQL-Abfrage repraesentiert. Wird mit `nextlist`/`nextdict` iteriert oder mit `allrows` in einem Rutsch verarbeitet. Erzeugt durch `$stmt execute`. Muss geschlossen (oder vollstaendig konsumiert) werden um DB-Ressourcen freizugeben.

---

### Round-Trip-Verifizierung

**EN:** Testing discipline: after each code-snapshot, the complete application cycle is manually walked through (init → diagnose → run → cleanup). Catches GUI bugs and integration issues that automated unit tests cannot reach. Complements unit testing rather than replacing it.

**DE:** Test-Disziplin: nach jedem Code-Snapshot wird der komplette Anwendungs-Zyklus manuell durchgespielt (init → diagnose → run → cleanup). Findet GUI-Bugs und Integrations-Probleme, die automatisierte Unit-Tests nicht greifen. Ergaenzt Unit-Testing, ersetzt es nicht.

---

### SQLState

**EN:** Standardized error code that is DB-portable (e.g. `23505` for unique-constraint violation). Defined by the SQL standard. In TDBC accessible via the error info; the TDBC method `tdbc::mapSqlState` converts to a Tcl-friendly name. Use SQLState for cross-database error handling instead of vendor-specific error numbers.

**DE:** Standardisierter Fehlercode, der DB-uebergreifend gilt (z.B. `23505` fuer Unique-Constraint-Verletzung). Vom SQL-Standard definiert. In TDBC ueber das Error-Info zugaenglich; die TDBC-Methode `tdbc::mapSqlState` konvertiert zu einem Tcl-freundlichen Namen. Verwende SQLState fuer cross-database Fehlerbehandlung statt vendor-spezifischer Fehlernummern.

---

### Savepoint

**EN:** SQL construct for nested transaction points. Allows partial rollback without aborting the entire transaction. Syntax: `SAVEPOINT name`, `ROLLBACK TO SAVEPOINT name`, `RELEASE SAVEPOINT name`. Supported by PostgreSQL, Oracle, SQLite (since 3.6.8). Useful for try/catch-style error handling in long transactions.

**DE:** SQL-Konstrukt fuer verschachtelte Transaktions-Punkte. Erlaubt partielles Zurueckrollen ohne die ganze Transaktion abzubrechen. Syntax: `SAVEPOINT name`, `ROLLBACK TO SAVEPOINT name`, `RELEASE SAVEPOINT name`. Unterstuetzt von Postgres, Oracle, SQLite (ab 3.6.8). Nuetzlich fuer try/catch-Fehlerbehandlung in langen Transaktionen.

---

### Schema-Migration

**EN:** Structured change of a schema (new columns, new tables) across versions of an application. TDBC offers no migration tools; typically implemented as a version-tracking pattern: store the schema version in a metadata table, run migrations in order, update the version on success.

**DE:** Strukturierte Veraenderung eines Schemas (neue Spalten, neue Tabellen) ueber die Versionen einer Anwendung hinweg. TDBC bietet keine Migrations-Werkzeuge; typisch implementiert als Versions-basiertes Pattern: Schema-Version in einer Metadata-Tabelle, Migrationen in Reihenfolge, bei Erfolg Version updaten.

---

### Statement

**EN:** TDBC object holding a prepared SQL statement. Created by `$conn prepare` and executed with `$stmt execute`. Can be re-executed multiple times with different bind parameters. Must be `close`d when no longer needed (or the connection close will cascade).

**DE:** TDBC-Objekt, das ein vorbereitetes SQL-Statement haelt. Wird von `$conn prepare` erzeugt und mit `$stmt execute` ausgefuehrt. Kann mehrfach mit unterschiedlichen Bind-Parametern ausgefuehrt werden. Muss `close`d werden wenn nicht mehr gebraucht (oder das Connection-Close cascadet).

---

### TDBC

**EN:** Tcl Database Connectivity — standard API for database access in Tcl. Shipped since Tcl 8.6 (2012). Provides connection / statement / result-set abstraction with vendor-specific drivers (`tdbc::sqlite3`, `tdbc::postgres`, `tdbc::mysql`, `tdbc::odbc`). Models after JDBC.

**DE:** Tcl Database Connectivity — Standard-API fuer Datenbank-Zugriff in Tcl. Seit Tcl 8.6 (2012) ausgeliefert. Bietet Connection / Statement / Result-Set Abstraktion mit treiber-spezifischen Drivern (`tdbc::sqlite3`, `tdbc::postgres`, `tdbc::mysql`, `tdbc::odbc`). Vorbild ist JDBC.

---

### TclOO

**EN:** Standard class mechanism in Tcl since version 8.6. Used by TDBC for connection-, statement-, and result-set objects. Lightweight: classes, methods, inheritance, mixins, filters. Predecessor systems (Snit, [incr Tcl]) still exist; TclOO is the modern standard.

**DE:** Standard-Klassen-Mechanik in Tcl seit Version 8.6. Wird von TDBC fuer Connection-, Statement- und ResultSet-Objekte verwendet. Leichtgewichtig: Klassen, Methoden, Vererbung, Mixins, Filter. Vorgaenger-Systeme (Snit, [incr Tcl]) existieren weiter; TclOO ist der moderne Standard.

---

### Tk

**EN:** GUI toolkit shipped with Tcl. Provides standard widgets (Button, Entry, Treeview, Canvas, Text) for Linux, Windows, and macOS. Native look-and-feel via ttk widget set (Themed Tk). The original GUI toolkit before Qt, GTK; still maintained and shipped with every Tcl distribution.

**DE:** GUI-Toolkit, das mit Tcl mitgeliefert wird. Bietet Standard-Widgets (Button, Entry, Treeview, Canvas, Text) fuer Linux, Windows und macOS. Natives Look-and-Feel ueber ttk-Widget-Set (Themed Tk). Das urspruengliche GUI-Toolkit vor Qt, GTK; weiterhin gepflegt und mit jeder Tcl-Distribution ausgeliefert.

---

### Type Affinity

**EN:** SQLite concept: column types are recommendations, not contracts. SQLite tries to convert values according to the column's declared affinity but accepts deviating types without error. Affinities: TEXT, NUMERIC, INTEGER, REAL, BLOB. The cause behind SQLite's surprising flexibility (and occasional surprises).

**DE:** SQLite-Konzept: Spalten-Typen sind Empfehlungen, keine Vertraege. SQLite versucht Werte gemaess der deklarierten Affinitaet zu konvertieren, akzeptiert aber abweichende Typen ohne Fehler. Affinitaeten: TEXT, NUMERIC, INTEGER, REAL, BLOB. Der Grund fuer SQLites ueberraschende Flexibilitaet (und gelegentliche Ueberraschungen).

---

### Upsert

**EN:** Combined INSERT-or-UPDATE in one statement. In SQLite since 3.24 (2018) via `INSERT ... ON CONFLICT(column) DO UPDATE SET ... = excluded....`. PostgreSQL has had `INSERT ... ON CONFLICT` since 9.5 (2016). MySQL uses `INSERT ... ON DUPLICATE KEY UPDATE`. Avoids the explicit "exists, then update or insert" pattern that has race conditions.

**DE:** Kombiniertes INSERT-or-UPDATE in einem Statement. In SQLite seit 3.24 (2018) ueber `INSERT ... ON CONFLICT(spalte) DO UPDATE SET ... = excluded....`. PostgreSQL hat `INSERT ... ON CONFLICT` seit 9.5 (2016). MySQL nutzt `INSERT ... ON DUPLICATE KEY UPDATE`. Vermeidet das explizite "Existiert, dann Update oder Insert"-Muster mit Race-Conditions.

---

### Vendoring

**EN:** Practice of keeping external libraries (e.g. `pdf4tcl`) directly inside the application directory, instead of relying on system packages. Makes the application self-contained and independently distributable. Trade-off: increases repo size, requires manual update tracking; eliminates "works on my machine" problems.

**DE:** Praxis, externe Bibliotheken (z.B. `pdf4tcl`) direkt im Anwendungs-Verzeichnis zu halten, statt sich auf System-Pakete zu verlassen. Macht die Anwendung selbst-staendig und unabhaengig verteilbar. Trade-Off: erhoeht Repo-Groesse, erfordert manuelles Update-Tracking; eliminiert "laeuft auf meiner Maschine"-Probleme.

---

### Virtual Table

**EN:** SQLite concept: a table whose content does not live in the DB file but is dynamically provided by a module. FTS5 tables are virtual tables; `json_each` and `json_tree` are table-valued functions that work similarly. Modules can be written in C and registered with SQLite to expose any data source as a SQL-queryable table.

**DE:** SQLite-Konzept: eine Tabelle, deren Inhalt nicht in der DB-Datei liegt, sondern dynamisch von einem Modul geliefert wird. FTS5-Tabellen sind Virtual Tables; `json_each` und `json_tree` sind Tabellen-Funktionen, die aehnlich funktionieren. Module koennen in C geschrieben und bei SQLite registriert werden um beliebige Datenquellen als SQL-abfragbare Tabelle bereitzustellen.

---

### WAL (Write-Ahead Logging)

**EN:** SQLite journal mode with much better concurrent-read performance than the default. Enabled via `PRAGMA journal_mode = WAL`. Writers don't block readers; the WAL file is separate from the main DB. Trade-off: WAL file needs occasional checkpoint (auto by default), backup needs the WAL file too.

**DE:** SQLite-Journal-Modus mit deutlich besserer parallel-Lese-Performance als der Default. Eingeschaltet durch `PRAGMA journal_mode = WAL`. Schreiber blockieren Leser nicht; die WAL-Datei ist separat von der Haupt-DB. Trade-Off: WAL-Datei braucht gelegentliche Checkpoints (per Default automatisch), Backup braucht die WAL-Datei mit.

---

### Wrapper

**EN:** Tcl layer over TDBC (or Oratcl) that enforces application-specific conventions: NULL handling, schema introspection, transaction lifecycle, error mapping. Typical in mid-size applications to centralize cross-cutting concerns. Distinguished from generic "database abstraction": a Wrapper encodes the specific application's policies, not a generic ORM.

**DE:** Tcl-Schicht ueber TDBC (oder Oratcl), die anwendungs-spezifische Konventionen erzwingt: NULL-Behandlung, Schema-Introspektion, Transaktions-Lifecycle, Error-Mapping. Typisch in mittelgrossen Anwendungen um Cross-Cutting-Concerns zu zentralisieren. Unterschied zur generischen "Datenbank-Abstraktion": ein Wrapper kodiert die Policies der spezifischen Anwendung, kein generisches ORM.

---

### Zero-Latency-Read

**EN:** Property of in-memory databases — no disk I/O, no network latency. SQLite with `:memory:` connection achieves this. Primarily relevant for tests (replacement for slow fixture loading) and for caching layers. Trade-off: data is lost when the process exits.

**DE:** Eigenschaft von In-Memory-Datenbanken — keine Disk-I/O, keine Netzwerk-Latenz. SQLite mit `:memory:`-Connection erreicht das. Primaer relevant fuer Tests (Ersatz fuer langsames Fixture-Laden) und fuer Cache-Schichten. Trade-Off: Daten gehen beim Prozess-Ende verloren.

---

### current_schema()

**EN:** PostgreSQL function that returns the current default schema of the connection user. Used in schema-introspection queries as a filter (e.g. `WHERE table_schema = current_schema()`). The Oracle equivalent is `USER`; SQLite has no equivalent (uses `main`/`temp`/attached).

**DE:** Postgres-Funktion, die das aktuelle Default-Schema des Connection-Users zurueckgibt. Wird in Schema-Introspection-Queries als Filter verwendet (z.B. `WHERE table_schema = current_schema()`). Oracle-Pendant: `USER`; SQLite hat kein Pendant (verwendet `main`/`temp`/attached).

---

### iODBC

**EN:** Open-source ODBC driver manager, traditionally used on macOS. Alternative to unixODBC. Both provide the same ODBC API; differences are in command-line tooling and minor config details.

**DE:** Open-Source-ODBC-Driver-Manager, traditionell auf macOS verbreitet. Alternative zu unixODBC. Beide liefern die gleiche ODBC-API; Unterschiede liegen in Kommandozeilen-Tools und kleinen Config-Details.

---

### parent_id-Pattern

**EN:** Modelling pattern for hierarchical data: each row has an optional `parent_id` column that references the primary key of the same table. Allows arbitrarily deep trees. Simpler than nested-set or materialized-path models; sufficient for navigation-style trees of moderate depth.

**DE:** Modellierungs-Pattern fuer hierarchische Daten: jede Zeile hat eine optionale Spalte `parent_id`, die auf den Primaerschluessel der eigenen Tabelle verweist. Erlaubt beliebig tiefe Baeume. Einfacher als Nested-Set oder Materialized-Path; ausreichend fuer Navigations-Baeume moderater Tiefe.

---

### pdf4tcl

**EN:** Tcl library for PDF generation. Pure-Tcl implementation. Used for reports, invoices, glossary PDFs, etc. Often vendored into applications (kept in the application's own directory) to avoid system-package dependency.

**DE:** Tcl-Bibliothek fuer PDF-Erzeugung. Pure-Tcl-Implementierung. Verwendet fuer Reports, Rechnungen, Glossar-PDFs etc. Oft vendored (im Anwendungs-Verzeichnis gehalten) um System-Paket-Abhaengigkeit zu vermeiden.

---

### pgtcl

**EN:** Older PostgreSQL-specific Tcl driver, predating TDBC. In current code typically replaced by `tdbc::postgres`. Still used in legacy applications.

**DE:** Aelterer Postgres-spezifischer Tcl-Treiber, vor TDBC entstanden. In aktuellem Code typischerweise durch `tdbc::postgres` ersetzt. Noch in Legacy-Anwendungen im Einsatz.

---

### rl_json

**EN:** Tcl library for robust JSON handling on the application side. Recommended for code that manipulates JSON beyond simple strings. Operations: get/set by JSON pointer, type-aware extraction, building documents incrementally. Faster than `tcllib::json` for non-trivial workloads.

**DE:** Tcl-Bibliothek fuer robustes JSON-Handling auf Anwendungs-Seite. Empfohlen fuer Code, der JSON jenseits einfacher Strings manipuliert. Operationen: get/set per JSON-Pointer, typsichere Extraktion, inkrementelles Dokument-Bauen. Schneller als `tcllib::json` bei nicht-trivialen Workloads.

---

### scott-Schema

**EN:** Classic Oracle example schema with two tables: `dept` (4 departments) and `emp` (14 employees). Used since Oracle's earliest documentation for tutorials and tests. Still a useful demo profile for any DB connectivity tooling.

**DE:** Klassisches Oracle-Beispiel-Schema mit zwei Tabellen: `dept` (4 Abteilungen) und `emp` (14 Mitarbeiter). Seit Oracles fruehester Dokumentation fuer Tutorials und Tests verwendet. Weiterhin ein nuetzliches Demo-Profil fuer jede DB-Konnektivitaets-Toolchain.

---

### sqlite3 (Tcl-Paket)

**EN:** The classic Tcl binding to SQLite, predating TDBC and offering a direct API to SQLite-specific features. Standard call: `sqlite3 db mydatabase.db; db eval "SELECT ..."`. Supports collations, custom functions, transactions, BLOB I/O, hooks (commit, update, rollback). Used heavily in Tcl code older than ~2012; new code is split between this and `tdbc::sqlite3` (the TDBC wrapper). Direct API is closer to the SQLite C library, often faster than TDBC for SQLite-only code.

**DE:** Die klassische Tcl-Bindung an SQLite, aelter als TDBC und mit direkter API zu SQLite-spezifischen Features. Standard-Aufruf: `sqlite3 db meinedatenbank.db; db eval "SELECT ..."`. Unterstuetzt Collations, eigene Funktionen, Transaktionen, BLOB-I/O, Hooks (commit, update, rollback). In Tcl-Code aelter als ~2012 stark verbreitet; neuer Code verteilt sich zwischen dieser API und `tdbc::sqlite3` (dem TDBC-Wrapper). Direkte API ist naeher an der SQLite-C-Bibliothek, oft schneller als TDBC fuer SQLite-only-Code.

---

### tablelist

**EN:** Tk extension widget for tabular and tree display. Provides more functionality than the standard `ttk::treeview` (column sorting, editable cells, cell-level coloring, embedded widgets in cells). Part of the BWidget/Tklib ecosystem. Standard tool in many production Tcl/Tk applications.

**DE:** Tk-Erweiterungs-Widget fuer tabellarische und Tree-Darstellung. Bietet mehr Funktionen als das Standard-`ttk::treeview` (Spalten-Sortierung, editierbare Zellen, Zell-Faerbung, eingebettete Widgets in Zellen). Teil des BWidget/Tklib-Oekosystems. Standardwerkzeug in vielen produktiven Tcl/Tk-Anwendungen.

---

### unixODBC

**EN:** Open-source ODBC driver manager, standard on most Linux distributions. Ships the `isql` CLI for DSN testing. Manages the per-user (`~/.odbc.ini`) and system (`/etc/odbc.ini`) DSN configurations.

**DE:** Open-Source-ODBC-Driver-Manager, Standard auf den meisten Linux-Distributionen. Liefert die `isql`-CLI zum Test von DSNs. Verwaltet die per-User (`~/.odbc.ini`) und System (`/etc/odbc.ini`) DSN-Konfigurationen.

---


## Datenbank-Operationen und Patterns / Database Operations and Patterns

### CRUD

**EN:** Acronym for four basic database operations: **C**reate (insert new records), **R**ead (query/retrieve records), **U**pdate (modify existing records), **D**elete (remove records); fundamental pattern in database applications; in TDBC: Create=`$db execute "INSERT..."`, Read=`$db allrows "SELECT..."`, Update=`$db execute "UPDATE..."`, Delete=`$db execute "DELETE..."`; basis for most data-driven applications; REST APIs often map to CRUD (POST=Create, GET=Read, PUT/PATCH=Update, DELETE=Delete).

**DE:** Akronym für vier grundlegende Datenbank-Operationen: **C**reate (neue Datensätze einfügen), **R**ead (Datensätze abfragen/abrufen), **U**pdate (existierende Datensätze ändern), **D**elete (Datensätze entfernen); fundamentales Muster in Datenbank-Anwendungen; in TDBC: Create=`$db execute "INSERT..."`, Read=`$db allrows "SELECT..."`, Update=`$db execute "UPDATE..."`, Delete=`$db execute "DELETE..."`; Basis für meiste datengetriebene Anwendungen; REST-APIs bilden oft auf CRUD ab (POST=Create, GET=Read, PUT/PATCH=Update, DELETE=Delete).

---

### Create (CRUD)

**EN:** Insert new record into database; SQL: `INSERT INTO table (columns) VALUES (values)`; TDBC: `$db execute "INSERT INTO users (name, email) VALUES (:name, :email)" -name $name -email $email`; assigns primary key; first operation in CRUD.

**DE:** Neuen Datensatz in Datenbank einfügen; SQL: `INSERT INTO table (columns) VALUES (values)`; TDBC: `$db execute "INSERT INTO users (name, email) VALUES (:name, :email)" -name $name -email $email`; weist Primärschlüssel zu; erste Operation in CRUD.

---

### DELETE (SQL)

**EN:** SQL statement removing records; syntax: `DELETE FROM table WHERE condition`; ⚠️ WARNING: without WHERE clause deletes ALL records; use transactions; CASCADE can delete related records; some prefer soft delete (marking inactive) over hard delete.

**DE:** SQL-Anweisung zum Entfernen von Datensätzen; Syntax: `DELETE FROM table WHERE condition`; ⚠️ WARNUNG: ohne WHERE-Klausel werden ALLE Datensätze gelöscht; Transaktionen verwenden; CASCADE kann verwandte Datensätze löschen; einige bevorzugen Soft-Delete (als inaktiv markieren) über Hard-Delete.

---

### Delete (CRUD)

**EN:** Remove records from database; SQL: `DELETE FROM table WHERE condition`; TDBC: `$db execute "DELETE FROM users WHERE id = :id" -id $id`; permanent operation (unless in transaction); should include WHERE clause; CASCADE deletes can affect related records.

**DE:** Datensätze aus Datenbank entfernen; SQL: `DELETE FROM table WHERE condition`; TDBC: `$db execute "DELETE FROM users WHERE id = :id" -id $id`; permanente Operation (außer in Transaktion); sollte WHERE-Klausel enthalten; CASCADE-Löschungen können verwandte Datensätze beeinflussen.

---

### Foreign Key

**EN:** Column referencing primary key in another table; establishes relationships between tables; enforces referential integrity; CASCADE options affect related records on delete/update; SQL: `FOREIGN KEY (user_id) REFERENCES users(id)`; fundamental for relational databases.

**DE:** Spalte referenzierend Primärschlüssel in anderer Tabelle; etabliert Beziehungen zwischen Tabellen; erzwingt referentielle Integrität; CASCADE-Optionen beeinflussen verwandte Datensätze bei Löschen/Aktualisieren; SQL: `FOREIGN KEY (user_id) REFERENCES users(id)`; fundamental für relationale Datenbanken.

---

### INSERT (SQL)

**EN:** SQL statement creating new record; syntax: `INSERT INTO table (col1, col2) VALUES (val1, val2)` or `INSERT INTO table SELECT...`; TDBC: use bind variables with `:name` syntax for safety; returns last insert ID in some databases.

**DE:** SQL-Anweisung zum Erstellen neuen Datensatzes; Syntax: `INSERT INTO table (col1, col2) VALUES (val1, val2)` oder `INSERT INTO table SELECT...`; TDBC: Bind-Variablen mit `:name`-Syntax für Sicherheit verwenden; gibt letzte Insert-ID in einigen Datenbanken zurück.

---

### ORM (Object-Relational Mapping)

**EN:** Technique mapping database tables to objects/classes; abstracts SQL; examples: SQLAlchemy (Python), Hibernate (Java); Tcl: TclOO objects can map to tables; simplifies CRUD operations but may sacrifice performance; automates common database tasks.

**DE:** Technik zum Abbilden von Datenbank-Tabellen auf Objekte/Klassen; abstrahiert SQL; Beispiele: SQLAlchemy (Python), Hibernate (Java); Tcl: TclOO-Objekte können auf Tabellen abbilden; vereinfacht CRUD-Operationen aber kann Performance opfern; automatisiert häufige Datenbank-Aufgaben.

---

### Primary Key

**EN:** Unique identifier for database record; typically auto-incrementing integer; ensures each row uniquely identifiable; used in joins, references; SQL: `id INTEGER PRIMARY KEY`; essential for CRUD operations, especially Update and Delete.

**DE:** Eindeutige Kennung für Datenbank-Datensatz; typischerweise auto-inkrementierender Integer; gewährleistet eindeutige Identifizierung jeder Zeile; verwendet in Joins, Referenzen; SQL: `id INTEGER PRIMARY KEY`; essentiell für CRUD-Operationen, besonders Update und Delete.

---

### Read (CRUD)

**EN:** Retrieve records from database; SQL: `SELECT columns FROM table WHERE condition`; TDBC: `$db allrows "SELECT * FROM users WHERE active = 1"`; most frequent operation; can include filtering, sorting, joining; returns result set.

**DE:** Datensätze aus Datenbank abrufen; SQL: `SELECT columns FROM table WHERE condition`; TDBC: `$db allrows "SELECT * FROM users WHERE active = 1"`; häufigste Operation; kann Filterung, Sortierung, Joins enthalten; gibt Ergebnismenge zurück.

---

### SELECT (SQL)

**EN:** SQL statement querying data; syntax: `SELECT columns FROM table WHERE condition ORDER BY column`; supports joins, subqueries, aggregation; TDBC: `$db foreach` or `$db allrows`; most versatile SQL command.

**DE:** SQL-Anweisung zum Abfragen von Daten; Syntax: `SELECT columns FROM table WHERE condition ORDER BY column`; unterstützt Joins, Subqueries, Aggregation; TDBC: `$db foreach` oder `$db allrows`; vielseitigster SQL-Befehl.

---

### SQL Injection

**EN:** Security vulnerability where malicious SQL code inserted via user input; prevented by: prepared statements, bind variables, parameterized queries; NEVER concatenate user input into SQL strings; TDBC bind variables (`:name`) prevent injection; major security risk.

**DE:** Sicherheitslücke, wo bösartiger SQL-Code über Benutzereingabe eingefügt wird; verhindert durch: Prepared Statements, Bind-Variablen, parametrisierte Queries; NIEMALS Benutzereingabe in SQL-Strings konkatenieren; TDBC-Bind-Variablen (`:name`) verhindern Injection; großes Sicherheitsrisiko.

---

### UPDATE (SQL)

**EN:** SQL statement modifying records; syntax: `UPDATE table SET col1=val1, col2=val2 WHERE condition`; ⚠️ WARNING: without WHERE clause updates ALL records; use transactions for safety; TDBC: prepared statements with bind variables.

**DE:** SQL-Anweisung zum Ändern von Datensätzen; Syntax: `UPDATE table SET col1=val1, col2=val2 WHERE condition`; ⚠️ WARNUNG: ohne WHERE-Klausel werden ALLE Datensätze aktualisiert; Transaktionen für Sicherheit verwenden; TDBC: Prepared Statements mit Bind-Variablen.

---

### Update (CRUD)

**EN:** Modify existing records; SQL: `UPDATE table SET column=value WHERE condition`; TDBC: `$db execute "UPDATE users SET email = :email WHERE id = :id" -email $email -id $id`; should include WHERE clause to avoid updating all records; returns number of affected rows.

**DE:** Existierende Datensätze ändern; SQL: `UPDATE table SET column=value WHERE condition`; TDBC: `$db execute "UPDATE users SET email = :email WHERE id = :id" -email $email -id $id`; sollte WHERE-Klausel enthalten um Aktualisierung aller Datensätze zu vermeiden; gibt Anzahl betroffener Zeilen zurück.

---

### WHERE Clause

**EN:** SQL filter condition; specifies which records to select/update/delete; syntax: `WHERE column = value`; operators: =, !=, <, >, <=, >=, LIKE, IN, BETWEEN; combine with AND, OR, NOT; ⚠️ CRITICAL: always use in UPDATE/DELETE to avoid affecting all records.

**DE:** SQL-Filter-Bedingung; spezifiziert welche Datensätze zu selektieren/aktualisieren/löschen; Syntax: `WHERE column = value`; Operatoren: =, !=, <, >, <=, >=, LIKE, IN, BETWEEN; kombinieren mit AND, OR, NOT; ⚠️ KRITISCH: immer in UPDATE/DELETE verwenden um Beeinflussen aller Datensätze zu vermeiden.

---


## Datenstrukturen / Data Structures

### Buffer

**EN:** Temporary storage for data in transit; used in I/O operations for efficiency.

**DE:** Temporärer Speicher für Daten in Übertragung; verwendet in E/A-Operationen für Effizienz.

---

### Dequeue

**EN:** Remove and return front element from queue (e.g., `lindex $queue 0; set queue [lrange $queue 1 end]`).

**DE:** Vorderstes Element aus Queue entfernen und zurückgeben (z.B. `lindex $queue 0; set queue [lrange $queue 1 end]`).

---

### Dictionary (dict)

**EN:** Key-value data structure (Tcl 8.5+); more efficient than arrays for large datasets (e.g., `dict set mydict key value`).

**DE:** Schlüssel-Wert-Datenstruktur (Tcl 8.5+); effizienter als Arrays für große Datensätze (z.B. `dict set mydict key value`).

---

### Enqueue

**EN:** Add element to rear of queue (e.g., `lappend queue $item`).

**DE:** Element hinten an Queue hinzufügen (z.B. `lappend queue $item`).

---

### Graph

**EN:** Data structure of nodes and edges; available via struct::graph package.

**DE:** Datenstruktur aus Knoten und Kanten; verfügbar über struct::graph-Paket.

---

### Hash Table

**EN:** Data structure for fast key-based lookup; Tcl arrays and dicts implement hash tables.

**DE:** Datenstruktur für schnelle schlüsselbasierte Suche; Tcl-Arrays und Dicts implementieren Hash-Tabellen.

---

### Linked List

**EN:** Data structure where each element points to next; can be implemented using Tcl lists or structs.

**DE:** Datenstruktur, bei der jedes Element auf das nächste zeigt; kann mit Tcl-Listen oder Strukturen implementiert werden.

---

### Matrix

**EN:** Two-dimensional array data structure; available via struct::matrix package.

**DE:** Zweidimensionale Array-Datenstruktur; verfügbar über struct::matrix-Paket.

---

### Pipe

**EN:** Unidirectional data channel between processes; created with `open "|command"` for process communication.

**DE:** Unidirektionaler Datenkanal zwischen Prozessen; erstellt mit `open "|command"` für Prozesskommunikation.

---

### Pop

**EN:** Remove and return top element from stack (e.g., using struct::stack or list operations).

**DE:** Oberstes Element von Stack entfernen und zurückgeben (z.B. mit struct::stack oder Listenoperationen).

---

### Push

**EN:** Add element to top of stack (e.g., `lappend stack $item` or using struct::stack).

**DE:** Element oben auf Stack hinzufügen (z.B. `lappend stack $item` oder mit struct::stack).

---

### Queue

**EN:** First-In-First-Out (FIFO) data structure; elements added at rear, removed from front.

**DE:** First-In-First-Out (FIFO) Datenstruktur; Elemente hinten hinzugefügt, vorne entfernt.

---

### Record

**EN:** Structured data type with named fields; available via struct::record package.

**DE:** Strukturierter Datentyp mit benannten Feldern; verfügbar über struct::record-Paket.

---

### Stack

**EN:** Last-In-First-Out (LIFO) data structure; elements added/removed from top.

**DE:** Last-In-First-Out (LIFO) Datenstruktur; Elemente werden oben hinzugefügt/entfernt.

---

### Stream

**EN:** Continuous flow of data through channel; general term for I/O channels.

**DE:** Kontinuierlicher Datenfluss durch Kanal; allgemeiner Begriff für E/A-Kanäle.

---

### Tree

**EN:** Hierarchical data structure with parent-child relationships; available via struct::tree package.

**DE:** Hierarchische Datenstruktur mit Eltern-Kind-Beziehungen; verfügbar über struct::tree-Paket.

---


## Debugging und Testing / Debugging and Testing

### Assertion

**EN:** Statement checking expected condition; fails if condition false; in tcltest: `-result` option checks return value, `-returnCodes` checks error status; custom assertions possible.

**DE:** Anweisung, die erwartete Bedingung prüft; schlägt fehl wenn Bedingung falsch; in tcltest: `-result`-Option prüft Rückgabewert, `-returnCodes` prüft Fehler-Status; eigene Assertions möglich.

---

### Breakpoint

**EN:** Marker in code where debugger pauses execution; allows inspection of state at specific point; set in debugger or with debug library; execution continues when resumed.

**DE:** Markierung im Code, wo Debugger Ausführung pausiert; erlaubt Inspektion des Zustands an spezifischem Punkt; gesetzt im Debugger oder mit Debug-Bibliothek; Ausführung fährt fort wenn fortgesetzt.

---

### Debug

**EN:** Process of finding and fixing errors; Tcl debugging techniques: `puts` statements, `catch` for errors, trace variables/commands, Tcl debuggers (TclPro Debugger, Komodo, Eclipse DLTK); interactive debugging in tclsh/wish.

**DE:** Prozess des Findens und Behebens von Fehlern; Tcl-Debug-Techniken: `puts`-Anweisungen, `catch` für Fehler, trace Variablen/Befehle, Tcl-Debugger (TclPro Debugger, Komodo, Eclipse DLTK); interaktives Debugging in tclsh/wish.

---

### Debugger

**EN:** Tool for interactive debugging; allows breakpoints, stepping, variable inspection; Tcl debuggers: TclPro Debugger (commercial, discontinued), Komodo IDE, Eclipse DLTK, tcldb (command-line); some IDEs have integrated Tcl debugging.

**DE:** Tool für interaktives Debugging; erlaubt Breakpoints, Stepping, Variablen-Inspektion; Tcl-Debugger: TclPro Debugger (kommerziell, eingestellt), Komodo IDE, Eclipse DLTK, tcldb (Kommandozeile); einige IDEs haben integriertes Tcl-Debugging.

---

### Mock Object

**EN:** Test object simulating real object; provides controlled behavior for testing; useful for testing interactions; implemented in Tcl with procedures or TclOO objects; isolates unit under test.

**DE:** Test-Objekt, das echtes Objekt simuliert; bietet kontrolliertes Verhalten für Tests; nützlich für Test von Interaktionen; implementiert in Tcl mit Prozeduren oder TclOO-Objekten; isoliert zu testende Einheit.

---

### Stack Trace

**EN:** List of procedure calls leading to current execution point; shows call hierarchy; generated on error; accessed via `$errorInfo` variable; useful for debugging; also via `info level` command.

**DE:** Liste von Prozedur-Aufrufen, die zu aktuellem Ausführungspunkt führen; zeigt Aufruf-Hierarchie; generiert bei Fehler; zugreifbar über `$errorInfo`-Variable; nützlich für Debugging; auch über `info level`-Befehl.

---

### Test Coverage

**EN:** Measure of code tested; percentage of code executed by tests; Tcl coverage tools available via extensions; goal: high coverage for reliability; identify untested code paths.

**DE:** Maß für getesteten Code; Prozentsatz von Code ausgeführt durch Tests; Tcl-Coverage-Tools verfügbar über Extensions; Ziel: hohe Abdeckung für Zuverlässigkeit; ungetestete Code-Pfade identifizieren.

---

### Test Suite

**EN:** Collection of related tests; typically in .test file; run with tcltest::runAllTests; organizes tests by feature or module; provides comprehensive coverage.

**DE:** Sammlung verwandter Tests; typischerweise in .test-Datei; ausgeführt mit tcltest::runAllTests; organisiert Tests nach Feature oder Modul; bietet umfassende Abdeckung.

---

### Unit Test

**EN:** Test of individual procedure or code unit; verifies correctness in isolation; written with tcltest; example: `test add-1.0 {test addition} -body {expr {2 + 2}} -result 4`.

**DE:** Test einer einzelnen Prozedur oder Code-Einheit; verifiziert Korrektheit isoliert; geschrieben mit tcltest; Beispiel: `test add-1.0 {test addition} -body {expr {2 + 2}} -result 4`.

---

### tcltest

**EN:** Standard Tcl testing framework; package for writing and running unit tests; provides test command, assertions, test harness; usage: `package require tcltest; tcltest::test testName {...}`; supports test constraints, cleanup, setup.

**DE:** Standard-Tcl-Testing-Framework; Paket zum Schreiben und Ausführen von Unit-Tests; bietet test-Befehl, Assertions, Test-Harness; Verwendung: `package require tcltest; tcltest::test testName {...}`; unterstützt Test-Constraints, Cleanup, Setup.

---


## Dialog-Typen / Dialog Types

### Button Types

**EN:** Dialog button configurations: `ok`, `okcancel`, `yesno`, `yesnocancel`, `retrycancel`, `abortretryignore`.

**DE:** Dialog-Button-Konfigurationen: `ok`, `okcancel`, `yesno`, `yesnocancel`, `retrycancel`, `abortretryignore`.

---

### Color Chooser (tk_chooseColor)

**EN:** Dialog for selecting color from color picker interface.

**DE:** Dialog zur Auswahl einer Farbe aus einer Farbauswahl-Oberfläche.

---

### Default Button

**EN:** Button automatically selected in dialog, activated by pressing Enter.

**DE:** Button automatisch ausgewählt im Dialog, aktiviert durch Drücken von Enter.

---

### Dialog

**EN:** Temporary window requesting user input or displaying information.

**DE:** Temporäres Fenster, das Benutzereingabe anfordert oder Informationen anzeigt.

---

### File Dialog (tk_chooseDirectory, tk_getOpenFile, tk_getSaveFile)

**EN:** Dialog for selecting files or directories from file system.

**DE:** Dialog zur Auswahl von Dateien oder Verzeichnissen aus dem Dateisystem.

---

### Message Box (tk_messageBox)

**EN:** Standard dialog displaying message with buttons like OK, Cancel, Yes, No.

**DE:** Standarddialog, der Nachricht mit Buttons wie OK, Abbrechen, Ja, Nein anzeigt.

---

### Message Types

**EN:** Dialog icon types: `info`, `warning`, `error`, `question`.

**DE:** Dialog-Icon-Typen: `info`, `warning`, `error`, `question`.

---

### Parent Window

**EN:** Window that dialog is associated with and typically stays on top of.

**DE:** Fenster, mit dem Dialog verknüpft ist und über dem er typischerweise bleibt.

---

### Return Value

**EN:** Value returned by dialog indicating user's choice (e.g., `ok`, `cancel`, `yes`, `no`).

**DE:** Wert, der von Dialog zurückgegeben wird und Benutzerauswahl anzeigt (z.B. `ok`, `cancel`, `yes`, `no`).

---

### Top Level

**EN:** Independent window separate from main application window, created with `toplevel` command.

**DE:** Unabhängiges Fenster getrennt vom Hauptanwendungsfenster, erstellt mit `toplevel`-Befehl.

---

### tk_chooseColor

**EN:** Standard color picker dialog. Syntax: tk_chooseColor ?-initialcolor #RRGGBB? ?-parent .w? ?-title "..."?. Returns a hex color string like "#a0b0c0" or empty on cancel.

**DE:** Standard-Farbauswahl-Dialog. Syntax: tk_chooseColor ?-initialcolor #RRGGBB? ?-parent .w? ?-title "..."?. Liefert einen Hex-Farbstring wie "#a0b0c0" oder leer bei Abbruch.

---

### tk_chooseDirectory

**EN:** Standard "choose directory" dialog. Syntax: tk_chooseDirectory ?-initialdir D? ?-mustexist 0|1? ?-parent .w? ?-title "..."?. Returns the selected directory path or empty on cancel.

**DE:** Standard-Dialog "Verzeichnis waehlen". Syntax: tk_chooseDirectory ?-initialdir D? ?-mustexist 0|1? ?-parent .w? ?-title "..."?. Liefert den gewaehlten Pfad oder leer bei Abbruch.

---

### tk_getOpenFile

**EN:** Standard "open file" dialog. Syntax: tk_getOpenFile ?-initialdir D? ?-initialfile F? ?-defaultextension .ext? ?-filetypes {{name patterns} ...}? ?-multiple 0|1? ?-parent .w? ?-title "..."?. Returns the selected file path (or list with -multiple 1), or empty on cancel.

**DE:** Standard-Dialog "Datei oeffnen". Syntax: tk_getOpenFile ?-initialdir D? ?-initialfile F? ?-defaultextension .ext? ?-filetypes {{Name Patterns} ...}? ?-multiple 0|1? ?-parent .w? ?-title "..."?. Liefert den gewaehlten Pfad (oder Liste bei -multiple 1), oder leer bei Abbruch.

---

### tk_getSaveFile

**EN:** Standard "save file" dialog. Same options as tk_getOpenFile (without -multiple). Returns the path to save to, or empty on cancel. Does not actually create the file — only the dialog; the script must do the writing.

**DE:** Standard-Dialog "Datei speichern". Gleiche Optionen wie tk_getOpenFile (ohne -multiple). Liefert den Speicher-Pfad oder leer bei Abbruch. Erzeugt die Datei NICHT — nur den Dialog; das Skript muss schreiben.

---

### tk_messageBox

**EN:** Standard modal message dialog. Syntax: tk_messageBox -message "..." -type ok|okcancel|yesno|yesnocancel|abortretryignore|retrycancel -icon info|warning|error|question -title "..." -parent .w. Returns the chosen button name (ok, cancel, yes, no, ...). Native look-and-feel on each platform.

**DE:** Standardisierter modaler Nachrichten-Dialog. Syntax: tk_messageBox -message "..." -type ok|okcancel|yesno|yesnocancel|abortretryignore|retrycancel -icon info|warning|error|question -title "..." -parent .w. Liefert den Namen des gewaehlten Buttons (ok, cancel, yes, no, ...). Native Optik je Plattform.

---

### tk_optionMenu

**EN:** Convenience constructor for an old-style option menu (button + popup). Syntax: tk_optionMenu .w varName value1 value2 ...; varName is bound to the selected value. Returns the menu widget path. For ttk applications use ttk::combobox instead.

**DE:** Komfort-Konstruktor fuer ein klassisches Option-Menue (Button + Popup). Syntax: tk_optionMenu .w varName value1 value2 ...; varName ist an den gewaehlten Wert gebunden. Liefert den Menue-Widget-Pfad. Bei ttk-Anwendungen ttk::combobox bevorzugen.

---

### tk_popup

**EN:** Display a menu as a context menu at a screen location. Syntax: tk_popup .menu x y ?initialIndex?. Used in <Button-3> bindings: bind .w <Button-3> "tk_popup .ctxmenu %X %Y". Native popup behavior per platform.

**DE:** Zeigt ein Menue als Kontext-Menue an einer Bildschirmposition. Syntax: tk_popup .menu x y ?initialIndex?. Verwendet in <Button-3>-Bindings: bind .w <Button-3> "tk_popup .ctxmenu %X %Y". Plattform-natives Popup-Verhalten.

---


## Dictionary-Subcommands / Dictionary Subcommands

### dict append

**EN:** Append value to existing dictionary key's value.

**DE:** Wert an vorhandenen Dictionary-Schlüssel-Wert anhängen.

---

### dict create

**EN:** Create dictionary from key-value pairs (e.g., `dict create key1 val1 key2 val2`).

**DE:** Dictionary aus Schlüssel-Wert-Paaren erstellen (z.B. `dict create key1 val1 key2 val2`).

---

### dict exists

**EN:** Test if key exists in dictionary; returns boolean.

**DE:** Testen, ob Schlüssel im Dictionary existiert; gibt Boolean zurück.

---

### dict filter

**EN:** Filter dictionary entries by key, value, or script (e.g., `dict filter $d key a*`).

**DE:** Dictionary-Einträge nach Schlüssel, Wert oder Skript filtern (z.B. `dict filter $d key a*`).

---

### dict for

**EN:** Iterate over dictionary key-value pairs (e.g., `dict for {k v} $mydict {...}`).

**DE:** Über Dictionary-Schlüssel-Wert-Paare iterieren (z.B. `dict for {k v} $mydict {...}`).

---

### dict get

**EN:** Retrieve value for key from dictionary (e.g., `dict get $mydict key1`).

**DE:** Wert für Schlüssel aus Dictionary abrufen (z.B. `dict get $mydict key1`).

---

### dict keys

**EN:** Return list of all keys in dictionary (e.g., `dict keys $mydict`).

**DE:** Liste aller Schlüssel im Dictionary zurückgeben (z.B. `dict keys $mydict`).

---

### dict map

**EN:** Iterate over a dictionary and produce a new dictionary by transforming each key/value pair. Syntax: dict map {keyVar valVar} dictionary body. Body's return value is the new value for that key. Like lmap but for dicts. Tcl 8.6+. Example: dict map {k v} $config {string toupper $v}.

**DE:** Iteriert ueber ein Dictionary und erzeugt ein neues Dictionary durch Transformation jedes Key/Value-Paars. Syntax: dict map {keyVar valVar} dictionary body. Rueckgabewert des Bodys ist der neue Wert fuer diesen Key. Wie lmap fuer Dicts. Tcl 8.6+. Beispiel: dict map {k v} $config {string toupper $v}.

---

### dict merge

**EN:** Merge multiple dictionaries, later values override earlier ones.

**DE:** Mehrere Dictionaries zusammenführen, spätere Werte überschreiben frühere.

---

### dict set

**EN:** Set key-value pair in dictionary (e.g., `dict set mydict key1 value1`).

**DE:** Schlüssel-Wert-Paar in Dictionary setzen (z.B. `dict set mydict key1 value1`).

---

### dict size

**EN:** Return number of key-value pairs in dictionary.

**DE:** Anzahl der Schlüssel-Wert-Paare im Dictionary zurückgeben.

---

### dict update

**EN:** Map dictionary keys to variables, execute script, update dictionary from variables.

**DE:** Dictionary-Schlüssel auf Variablen abbilden, Skript ausführen, Dictionary aus Variablen aktualisieren.

---

### dict values

**EN:** Return list of all values in dictionary (e.g., `dict values $mydict`).

**DE:** Liste aller Werte im Dictionary zurückgeben (z.B. `dict values $mydict`).

---

### dict with

**EN:** Import dictionary keys as variables in scope (e.g., `dict with mydict {puts $key1}`).

**DE:** Dictionary-Schlüssel als Variablen im Gültigkeitsbereich importieren (z.B. `dict with mydict {puts $key1}`).

---


## Display-Backends und Plattformen / Display Backends and Platforms

### DMA-BUF

**EN:** Linux kernel API for zero-copy buffer sharing between different subsystems (GPU, video decoder, camera, display). A file-descriptor handle that multiple components can map without copying the underlying memory. The key plumbing for efficient Wayland (compositor and client share GPU buffers), hardware-accelerated video, camera capture. Mostly invisible to application code but explains why modern Linux graphics is fast.

**DE:** Linux-Kernel-API fuer Zero-Copy-Buffer-Sharing zwischen verschiedenen Subsystemen (GPU, Video-Decoder, Kamera, Display). Ein Filedeskriptor-Handle, das mehrere Komponenten ohne Kopieren des darunter liegenden Speichers mappen koennen. Das Schluessel-Plumbing fuer effizientes Wayland (Compositor und Client teilen GPU-Buffer), Hardware-beschleunigtes Video, Kamera-Capture. Fuer Anwendungscode meist unsichtbar, erklaert aber warum moderne Linux-Grafik schnell ist.

---

### DRM / KMS

**EN:** Direct Rendering Manager (DRM) and Kernel Mode Setting (KMS) — Linux kernel subsystems for direct GPU access and display configuration. DRM handles GPU memory and command submission; KMS configures display modes (resolution, refresh rate), framebuffers, plane composition. Wayland compositors use DRM/KMS directly; X11 historically went through deeper userspace layers. Relevant for Tcl when bridging to low-level graphics (rare in standard apps).

**DE:** Direct Rendering Manager (DRM) und Kernel Mode Setting (KMS) — Linux-Kernel-Subsysteme fuer direkten GPU-Zugriff und Display-Konfiguration. DRM verwaltet GPU-Speicher und Command-Submission; KMS konfiguriert Display-Modi (Aufloesung, Refresh-Rate), Framebuffer, Plane-Composition. Wayland-Compositoren nutzen DRM/KMS direkt; X11 ging historisch ueber tiefere Userspace-Schichten. Relevant fuer Tcl wenn auf Low-Level-Grafik gebrueckt wird (in Standard-Apps selten).

---

### EGL

**EN:** Khronos-standard API that connects rendering APIs (OpenGL ES, OpenVG) to native window systems (X11, Wayland, Android, GBM). The "glue layer" between drawing and display. Required for GPU-accelerated rendering on Linux outside of GLX (the X11-only legacy). Tcl extensions that want hardware-accelerated 3D usually go through EGL.

**DE:** Khronos-Standard-API, die Render-APIs (OpenGL ES, OpenVG) mit nativen Fenster-Systemen (X11, Wayland, Android, GBM) verbindet. Die "Klebeschicht" zwischen Zeichnen und Display. Erforderlich fuer GPU-beschleunigtes Rendering auf Linux ausserhalb von GLX (dem X11-only Legacy). Tcl-Erweiterungen, die Hardware-beschleunigte 3D wollen, gehen meist ueber EGL.

---

### Hyprland

**EN:** Tiling Wayland compositor known for its visual polish (smooth animations, rounded corners, blur effects) and configurability. Written in C++ on top of wlroots. Popular in the rice-the-Linux-desktop community. Hosts tiling layouts plus floating windows, supports xdg-shell standards. Tk applications run on Hyprland via XWayland.

**DE:** Tiling-Wayland-Compositor, bekannt fuer visuellen Schliff (sanfte Animationen, abgerundete Ecken, Blur-Effekte) und Konfigurierbarkeit. Geschrieben in C++ auf Basis von wlroots. Beliebt in der "Rice-the-Linux-Desktop"-Community. Bietet Tiling-Layouts plus Floating-Fenster, unterstuetzt xdg-shell-Standards. Tk-Anwendungen laufen auf Hyprland ueber XWayland.

---

### KWin

**EN:** KDE's window manager and Wayland compositor. Long history as an X11 window manager; has full Wayland-compositor implementation since KDE Plasma 5. Highly themable, supports KDE's effects framework. The standard compositor under KDE Plasma sessions.

**DE:** KDEs Window-Manager und Wayland-Compositor. Lange Historie als X11-Window-Manager; hat seit KDE Plasma 5 eine vollwertige Wayland-Compositor-Implementierung. Stark themebar, unterstuetzt KDEs Effekt-Framework. Standard-Compositor in KDE-Plasma-Sitzungen.

---

### Mutter

**EN:** GNOME's compositor and window manager — handles both X11 mode (gnome-shell-on-X11) and Wayland mode (gnome-shell-on-wayland). Built on top of Clutter (now in-tree). The dominant Linux desktop compositor by user count, since GNOME ships on Ubuntu, Fedora Workstation, etc.

**DE:** GNOMEs Compositor und Window-Manager — behandelt sowohl X11-Modus (gnome-shell-on-X11) als auch Wayland-Modus (gnome-shell-on-wayland). Aufbauend auf Clutter (jetzt in-tree). Der dominante Linux-Desktop-Compositor nach Nutzerzahl, da GNOME auf Ubuntu, Fedora Workstation usw. mitgeliefert wird.

---

### Quartz

**EN:** Apple's graphics layer on macOS (and iOS). Combines window server (Quartz Compositor), 2D drawing engine (Core Graphics / Quartz 2D), and event dispatch. Tk on macOS targets the Aqua interface via Quartz; the `wish` binary is a Cocoa application. Resolution-independent rendering with PDF as its native graphics model.

**DE:** Apples Grafik-Schicht auf macOS (und iOS). Vereint Window-Server (Quartz Compositor), 2D-Zeichen-Engine (Core Graphics / Quartz 2D) und Event-Verteilung. Tk auf macOS spricht das Aqua-Interface ueber Quartz an; die `wish`-Binary ist eine Cocoa-Anwendung. Aufloesungsunabhaengiges Rendering mit PDF als nativem Grafik-Modell.

---

### Wayland

**EN:** Modern Linux display protocol, designed as a successor to X11. Simpler core, security-oriented (clients can't snoop on each other), GPU-friendly. Each Wayland session is governed by a compositor that combines window manager, display server, and compositing into one. Tk does not yet natively support Wayland — on Wayland sessions, Tk runs through XWayland (X11 compatibility layer). Native Tk-Wayland support is being explored.

**DE:** Modernes Linux-Display-Protokoll, entworfen als Nachfolger von X11. Schlankerer Kern, sicherheits-orientiert (Clients koennen sich nicht gegenseitig ausspionieren), GPU-freundlich. Jede Wayland-Sitzung wird von einem Compositor verwaltet, der Window-Manager, Display-Server und Compositing in einem vereint. Tk unterstuetzt Wayland noch nicht nativ — in Wayland-Sitzungen laeuft Tk ueber XWayland (X11-Kompatibilitaetsschicht). Nativer Tk-Wayland-Support wird erkundet.

---

### Wayland-Compositor

**EN:** A program that fulfils the Wayland-protocol server role: receives buffers from client applications, composites them into the final screen output, dispatches input events. Unlike X11 where window manager, server, and compositor were separate, Wayland fuses them. Major implementations: Mutter (GNOME), KWin (KDE), Hyprland (tiling), wlroots-based compositors (Sway, river, etc.).

**DE:** Programm, das die Wayland-Protokoll-Server-Rolle erfuellt: empfaengt Buffer von Client-Anwendungen, komponiert sie zur finalen Bildschirmausgabe, verteilt Eingabe-Ereignisse. Anders als bei X11, wo Window-Manager, Server und Compositor getrennt waren, vereint Wayland sie. Wichtige Implementierungen: Mutter (GNOME), KWin (KDE), Hyprland (Tiling), wlroots-basierte Compositoren (Sway, river, usw.).

---

### Win32

**EN:** Microsoft's C API for Windows (NT-family and later) — the layer that all Windows desktop applications target directly or indirectly. Tk on Windows binds to Win32 for window creation, GDI for drawing, message-pump integration. The `twapi` Tcl extension exposes large parts of Win32 to Tcl scripts. Coexists with newer Microsoft APIs (WinRT, .NET) but remains the foundation.

**DE:** Microsofts C-API fuer Windows (NT-Familie und spaeter) — die Schicht, die alle Windows-Desktop-Anwendungen direkt oder indirekt ansprechen. Tk auf Windows bindet an Win32 fuer Fenster-Erzeugung, GDI fuer Zeichnen, Message-Pump-Integration. Die `twapi`-Tcl-Erweiterung macht grosse Teile von Win32 fuer Tcl-Scripts zugaenglich. Koexistiert mit neueren Microsoft-APIs (WinRT, .NET), bleibt aber das Fundament.

---

### X11

**EN:** The X Window System, version 11 — the traditional Unix/Linux display protocol since 1987. Network-transparent (clients connect to a display server over a socket), modular, extension-heavy. Tk on Linux historically uses X11 via Xlib; ttk themes render through X11. Slowly being replaced by Wayland on modern Linux desktops but still the default on many distributions and the only option on macOS via XQuartz.

**DE:** Das X Window System, Version 11 — das traditionelle Unix/Linux-Display-Protokoll seit 1987. Netzwerk-transparent (Clients verbinden sich ueber Socket mit einem Display-Server), modular, erweiterungsreich. Tk auf Linux nutzt historisch X11 via Xlib; ttk-Themes rendern ueber X11. Wird auf modernen Linux-Desktops langsam durch Wayland ersetzt, ist aber auf vielen Distributionen weiter Default und auf macOS via XQuartz die einzige Option.

---

### XWayland

**EN:** X11 server that runs as a Wayland client — provides X11 compatibility for applications that have not been ported to native Wayland. Tk applications run on Wayland sessions through XWayland: the Tk binary speaks X11 protocol, XWayland translates it to Wayland and forwards to the compositor. Slightly higher overhead than native Wayland, but lets every X11 application work unchanged on Wayland. Native Tk-Wayland support is being explored but is not yet shipped (the `TK_USE_WAYLAND` build flag is experimental).

**DE:** X11-Server, der als Wayland-Client laeuft — bietet X11-Kompatibilitaet fuer Anwendungen, die nicht auf natives Wayland portiert sind. Tk-Anwendungen laufen auf Wayland-Sitzungen ueber XWayland: die Tk-Binary spricht X11-Protokoll, XWayland uebersetzt es nach Wayland und reicht es an den Compositor weiter. Etwas hoeherer Overhead als natives Wayland, aber jede X11-Anwendung funktioniert unveraendert auf Wayland. Nativer Tk-Wayland-Support wird erkundet, ist aber noch nicht ausgeliefert (das `TK_USE_WAYLAND`-Build-Flag ist experimentell).

---

### wlroots

**EN:** Modular library providing the building blocks for Wayland compositors: surface management, input handling, output configuration, xdg-shell implementation, screencopy. Used by Sway, Hyprland, river, dwl, and others. Lets compositor authors focus on policy (layouts, animations, keybindings) without re-implementing the protocol plumbing.

**DE:** Modulare Bibliothek, die die Bausteine fuer Wayland-Compositoren bereitstellt: Surface-Management, Input-Handling, Output-Konfiguration, xdg-shell-Implementierung, Screencopy. Wird von Sway, Hyprland, river, dwl und anderen genutzt. Erlaubt Compositor-Autoren sich auf Policy (Layouts, Animationen, Tastenkuerzel) zu konzentrieren, ohne die Protokoll-Plumbing neu zu implementieren.

---

### xdg-shell

**EN:** Standard Wayland-protocol extension for window management — defines top-level windows, popups, dialog roles, resize/move operations, focus model. Implemented by all modern Wayland compositors. The conceptual analog of "WM_PROTOCOLS" + window-manager hints in X11, but cleaner and protocol-level.

**DE:** Standard-Wayland-Protokoll-Erweiterung fuer Fenster-Management — definiert Top-Level-Fenster, Popups, Dialog-Rollen, Resize/Move-Operationen, Fokus-Modell. Implementiert von allen modernen Wayland-Compositoren. Das konzeptionelle Pendant zu "WM_PROTOCOLS" + Window-Manager-Hints unter X11, aber sauberer und auf Protokoll-Ebene.

---

### xkbcommon

**EN:** Library that handles keyboard mappings — converts low-level keycodes to keysyms based on the active layout (US, German, Dvorak, etc.). Honours the XKB (X Keyboard) configuration format. Used by Wayland compositors (X11 keyboard logic lived inside X server; Wayland delegates to clients via xkbcommon). Independent of any display protocol — can be used standalone.

**DE:** Bibliothek fuer Tastatur-Zuordnungen — konvertiert Low-Level-Keycodes zu Keysyms basierend auf dem aktiven Layout (US, Deutsch, Dvorak usw.). Befolgt das XKB- (X Keyboard) Konfigurationsformat. Wird von Wayland-Compositoren genutzt (X11-Tastatur-Logik lag im X-Server; Wayland delegiert ueber xkbcommon an Clients). Unabhaengig von einem Display-Protokoll — kann standalone genutzt werden.

---


## Distribution und Installation / Distribution and Installation

### --host / --build / --target

**EN:** Configure options specifying host, build, and target systems for cross-compilation.

**DE:** Configure-Optionen zum Spezifizieren von Host-, Build- und Ziel-Systemen für Cross-Kompilierung.

---

### Cross-compilation

**EN:** Compiling for different platform/architecture than build machine.

**DE:** Kompilieren für andere Plattform/Architektur als Build-Maschine.

---

### DESTDIR

**EN:** Staging directory for installation; final paths become $DESTDIR/$prefix/...

**DE:** Staging-Verzeichnis für Installation; finale Pfade werden $DESTDIR/$prefix/...

---

### VPATH Build

**EN:** Building in separate directory from source (out-of-tree build).

**DE:** Bauen in separatem Verzeichnis vom Quellcode (Out-of-Tree-Build).

---

### bindir

**EN:** Directory for executable programs (default $prefix/bin).

**DE:** Verzeichnis für ausführbare Programme (Standard $prefix/bin).

---

### datadir

**EN:** Directory for read-only data files (default $prefix/share).

**DE:** Verzeichnis für Nur-Lese-Daten-Dateien (Standard $prefix/share).

---

### includedir

**EN:** Directory for header files (default $prefix/include).

**DE:** Verzeichnis für Header-Dateien (Standard $prefix/include).

---

### libdir

**EN:** Directory for libraries (default $prefix/lib or $prefix/lib64).

**DE:** Verzeichnis für Bibliotheken (Standard $prefix/lib oder $prefix/lib64).

---

### make dist

**EN:** Create distribution tarball with all necessary source files.

**DE:** Distributions-Tarball mit allen notwendigen Quell-Dateien erstellen.

---

### make distcheck

**EN:** Create distribution and verify it can be built and installed correctly.

**DE:** Distribution erstellen und verifizieren, dass sie korrekt gebaut und installiert werden kann.

---

### make install-strip

**EN:** Install and strip binaries to remove debug symbols.

**DE:** Installieren und Binaries strippen um Debug-Symbole zu entfernen.

---

### make uninstall

**EN:** Remove installed files (if supported by Makefile).

**DE:** Installierte Dateien entfernen (falls von Makefile unterstützt).

---

### mandir

**EN:** Directory for man pages (default $prefix/share/man).

**DE:** Verzeichnis für Man-Pages (Standard $prefix/share/man).

---

### prefix

**EN:** Base directory for installation (default /usr/local); affects all installation paths.

**DE:** Basis-Verzeichnis für Installation (Standard /usr/local); beeinflusst alle Installations-Pfade.

---

### tarball

**EN:** Compressed archive (.tar.gz, .tar.bz2) containing source code distribution.

**DE:** Komprimiertes Archiv (.tar.gz, .tar.bz2) mit Quellcode-Distribution.

---


## Dokumentformate / Document Formats

### HTML (HyperText Markup Language)

**EN:** Standard web document format; markup language for web pages; Tcl can generate HTML (string operations, htmlparse in tcllib); parse HTML: htmlparse package; common for documentation, reports; Tk's html widget can display basic HTML.

**DE:** Standard-Web-Dokumentformat; Markup-Sprache für Webseiten; Tcl kann HTML generieren (String-Operationen, htmlparse in tcllib); HTML parsen: htmlparse-Paket; üblich für Dokumentation, Berichte; Tks html-Widget kann einfaches HTML anzeigen.

---

### LaTeX

**EN:** Document preparation system; high-quality typesetting for technical documents; Tcl can generate LaTeX source; compile with pdflatex: `exec pdflatex document.tex`; excellent for scientific papers, books; steep learning curve but powerful.

**DE:** Dokumenten-Erstellungs-System; hochwertiger Schriftsatz für technische Dokumente; Tcl kann LaTeX-Quelle generieren; kompilieren mit pdflatex: `exec pdflatex document.tex`; exzellent für wissenschaftliche Arbeiten, Bücher; steile Lernkurve aber mächtig.

---

### Markdown

**EN:** Lightweight markup language; plain text with formatting syntax; easy to read/write; converts to HTML, PDF; very popular for documentation; Tcl packages: markdown (tcllib) converts to HTML; GitHub, documentation sites use markdown; file extensions: .md, .markdown.

**DE:** Leichtgewichtige Markup-Sprache; Klartext mit Formatierungs-Syntax; einfach zu lesen/schreiben; konvertiert zu HTML, PDF; sehr beliebt für Dokumentation; Tcl-Pakete: markdown (tcllib) konvertiert zu HTML; GitHub, Dokumentations-Sites verwenden Markdown; Dateiendungen: .md, .markdown.

---

### PDF (Portable Document Format)

**EN:** Adobe document format preserving layout; platform-independent; widely used for final documents; Tcl can generate PDF via packages (pdf4tcl), or tools (Ghostscript, wkhtmltopdf); read/extract: exec pdftotext or packages; industry standard for documents.

**DE:** Adobe-Dokumentformat mit Layout-Erhaltung; plattformunabhängig; weit verbreitet für finale Dokumente; Tcl kann PDF generieren via Pakete (pdf4tcl) oder Tools (Ghostscript, wkhtmltopdf); lesen/extrahieren: exec pdftotext oder Pakete; Industrie-Standard für Dokumente.

---

### PostScript

**EN:** Page description language; predecessor to PDF; describes graphics and text; used by printers; Tcl can generate PostScript (canvas postscript command); file extension: .ps; convert to PDF with Ghostscript; less common now but still used in printing.

**DE:** Seitenbeschreibungs-Sprache; Vorgänger von PDF; beschreibt Grafiken und Text; verwendet von Druckern; Tcl kann PostScript generieren (canvas postscript-Befehl); Dateiendung: .ps; konvertieren zu PDF mit Ghostscript; weniger üblich jetzt aber noch in Druck verwendet.

---

### RTF (Rich Text Format)

**EN:** Microsoft rich text format; supports formatting (bold, colors, fonts); readable by many word processors; Tcl can generate/parse RTF with string operations or packages; format: text with control codes; cross-platform but dated; file extension: .rtf.

**DE:** Microsoft Rich-Text-Format; unterstützt Formatierung (fett, Farben, Schriften); lesbar von vielen Textverarbeitungen; Tcl kann RTF generieren/parsen mit String-Operationen oder Paketen; Format: Text mit Steuer-Codes; plattformübergreifend aber veraltet; Dateiendung: .rtf.

---

### XML (eXtensible Markup Language)

**EN:** Structured document format; hierarchical data representation; widely used for data exchange; Tcl packages: tdom (fast parser), xml (tcllib); namespaces, validation support; more verbose than JSON but powerful; file extension: .xml.

**DE:** Strukturiertes Dokumentformat; hierarchische Daten-Darstellung; weit verbreitet für Datenaustausch; Tcl-Pakete: tdom (schneller Parser), xml (tcllib); Namespaces, Validierungs-Unterstützung; ausführlicher als JSON aber mächtig; Dateiendung: .xml.

---


## Entwicklungsumgebung / Development Environment

### Editor

**EN:** Text editor for writing code; Tcl-friendly editors: Vim, Emacs, VS Code, Sublime Text, Notepad++; IDEs: Komodo, Eclipse DLTK; features: syntax highlighting, auto-completion, debugging; Tcl's text widget can be basis for custom editor.

**DE:** Text-Editor zum Schreiben von Code; Tcl-freundliche Editoren: Vim, Emacs, VS Code, Sublime Text, Notepad++; IDEs: Komodo, Eclipse DLTK; Features: Syntax-Hervorhebung, Auto-Vervollständigung, Debugging; Tcls Text-Widget kann Basis für eigenen Editor sein.

---

### Git

**EN:** Distributed version control system; most popular VCS; Tcl can call via exec: `exec git commit -m "message"`; Tcl packages: tclgit (bindings); tracks file changes, supports branching; essential modern tool.

**DE:** Verteiltes Versionskontroll-System; beliebtestes VCS; Tcl kann aufrufen via exec: `exec git commit -m "message"`; Tcl-Pakete: tclgit (Bindings); verfolgt Datei-Änderungen, unterstützt Branching; essentielles modernes Tool.

---

### IDE (Integrated Development Environment)

**EN:** Comprehensive development tool combining editor, debugger, build tools; Tcl IDEs: Komodo IDE (commercial), Eclipse DLTK (free), ActiveState Komodo; features: project management, debugging, version control integration; enhances productivity.

**DE:** Umfassendes Entwicklungs-Tool kombinierend Editor, Debugger, Build-Tools; Tcl-IDEs: Komodo IDE (kommerziell), Eclipse DLTK (kostenlos), ActiveState Komodo; Features: Projekt-Verwaltung, Debugging, Versionskontroll-Integration; steigert Produktivität.

---

### Project

**EN:** Collection of related source files, resources, and configuration; organizational unit in IDEs; typically in directory with subdirectories (src/, lib/, doc/, test/); version controlled (Git, SVN); may include build scripts, documentation; Tcl projects: .tcl files, packages, modules.

**DE:** Sammlung verwandter Quell-Dateien, Ressourcen und Konfiguration; organisatorische Einheit in IDEs; typischerweise in Verzeichnis mit Unterverzeichnissen (src/, lib/, doc/, test/); versionskontrolliert (Git, SVN); kann Build-Skripte, Dokumentation enthalten; Tcl-Projekte: .tcl-Dateien, Pakete, Module.

---

### Source Control

**EN:** Version control system tracking code changes; popular: Git, SVN, Mercurial; Tcl integration via exec or packages; essential for team development; tracks history, enables branching, merging; Tcl scripts for automation.

**DE:** Versionskontroll-System zur Verfolgung von Code-Änderungen; beliebt: Git, SVN, Mercurial; Tcl-Integration via exec oder Pakete; essentiell für Team-Entwicklung; verfolgt Historie, ermöglicht Branching, Merging; Tcl-Skripte für Automatisierung.

---


## Ereignisbehandlung / Event Handling

### Binding

**EN:** An association between an event pattern and a script to execute when that event occurs.

**DE:** Eine Zuordnung zwischen einem Ereignismuster und einem Skript, das ausgeführt wird, wenn dieses Ereignis eintritt.

---

### Callback

**EN:** A script or procedure that is executed in response to an event or action.

**DE:** Ein Skript oder eine Prozedur, die als Reaktion auf ein Ereignis oder eine Aktion ausgeführt wird.

---

### Event

**EN:** An occurrence such as a mouse click, key press, or window action that triggers code execution.

**DE:** Ein Vorkommnis wie ein Mausklick, Tastendruck oder eine Fensteraktion, das die Codeausführung auslöst.

---

### Event Loop

**EN:** The main loop that processes events (mouse, keyboard, timers, file I/O, idle callbacks) and updates the GUI. In Tk applications, the event loop starts automatically at script end as long as at least one window exists — explicit start is not normally needed. Explicit entry via `vwait varName` (block until variable changes) or `update` (process pending events once) is used in: non-GUI scripts that need event processing, scripts that block on a specific condition, and modal dialog patterns. Beware reentrancy: events nested inside `update`/`vwait` can fire while the calling code is still on the stack.

**DE:** Die Hauptschleife, die Events (Maus, Tastatur, Timer, File-I/O, Idle-Callbacks) verarbeitet und die GUI aktualisiert. In Tk-Anwendungen startet die Event-Schleife automatisch am Script-Ende, sofern mindestens ein Fenster existiert — expliziter Start ist normalerweise nicht noetig. Expliziter Einstieg via `vwait varName` (blockiert bis Variable sich aendert) oder `update` (verarbeitet anstehende Events einmal) wird verwendet in: Nicht-GUI-Scripts, die Event-Verarbeitung brauchen, Scripts die auf eine bestimmte Bedingung blockieren, und Modal-Dialog-Patterns. Achtung Reentrancy: Events innerhalb von `update`/`vwait` koennen feuern, waehrend der aufrufende Code noch auf dem Stack ist.

---

### Tk event loop (automatic startup)

**EN:** When a Tk script runs a GUI, the toolkit normally enters an event loop automatically; explicit `mainloop` or `vwait` is mainly needed for non-GUI Tcl scripts or for waiting on a variable—avoid redundant loop setup in typical Tk apps.

**DE:** Beim Start einer Tk-Oberfläche läuft die Ereignisschleife typischerweise automatisch; `mainloop` oder `vwait` sind vor allem für reines Tcl ohne Tk oder zum Warten auf eine Variable nötig—in üblichen Tk-Programmen keine doppelte Schleifeninitialisierung.

---

### fileevent

**EN:** Tcl command registering a script to run when a channel becomes readable or writable; basis for non-blocking, event-driven I/O (e.g., `fileevent $sock readable [list handle_data $sock]`); requires channel to be in non-blocking mode via `fconfigure -blocking 0`.

**DE:** Tcl-Befehl, der ein Skript registriert das ausgeführt wird wenn ein Channel les- oder schreibbar wird; Basis für non-blocking, ereignisgesteuerte I/O (z.B. `fileevent $sock readable [list handle_data $sock]`); erfordert Channel im non-blocking Modus via `fconfigure -blocking 0`.

---


## Escape-Sequenzen / Escape Sequences

### ANSI Escape Codes

**EN:** Terminal control sequences for text formatting and cursor control; format: ESC[...m for colors, ESC[...H for cursor position; example: `\033[31m` = red text, `\033[0m` = reset; Tcl: `puts "\033[1;31mRed Bold\033[0m"`.

**DE:** Terminal-Steuersequenzen für Text-Formatierung und Cursor-Kontrolle; Format: ESC[...m für Farben, ESC[...H für Cursor-Position; Beispiel: `\033[31m` = roter Text, `\033[0m` = zurücksetzen; Tcl: `puts "\033[1;31mRed Bold\033[0m"`.

---

### Escape Sequence

**EN:** Special character combination starting with backslash (\) or escape character; represents non-printable characters or special formatting; Tcl supports: \n, \t, \r, \\, \xHH, \uHHHH, etc.

**DE:** Spezielle Zeichen-Kombination beginnend mit Backslash (\) oder Escape-Zeichen; repräsentiert nicht-druckbare Zeichen oder spezielle Formatierung; Tcl unterstützt: \n, \t, \r, \\, \xHH, \uHHHH, etc.

---

### \UHHHHHHHH

**EN:** Extended Unicode escape in Tcl (8.6+); HHHHHHHH = eight hex digits; for code points above U+FFFF; example: `\U0001F600` = 😀.

**DE:** Erweitertes Unicode-Escape in Tcl (8.6+); HHHHHHHH = acht Hex-Ziffern; für Code-Punkte über U+FFFF; Beispiel: `\U0001F600` = 😀.

---

### \a (Alert/Bell)

**EN:** Alert/bell character (ASCII 7); triggers audible or visual alert; Tcl: `puts "\a"` may beep (depends on terminal settings).

**DE:** Alarm/Glocken-Zeichen (ASCII 7); löst hörbares oder visuelles Signal aus; Tcl: `puts "\a"` kann piepen (hängt von Terminal-Einstellungen ab).

---

### \b (Backspace)

**EN:** Backspace character (ASCII 8); moves cursor back one position; may or may not delete character depending on terminal.

**DE:** Rücktaste-Zeichen (ASCII 8); bewegt Cursor eine Position zurück; kann Zeichen löschen oder nicht je nach Terminal.

---

### \f (Form Feed)

**EN:** Form feed character (ASCII 12); advances to next page; rarely used in modern systems; historically for printer page breaks.

**DE:** Seitenvorschub-Zeichen (ASCII 12); rückt zur nächsten Seite vor; selten verwendet in modernen Systemen; historisch für Drucker-Seitenumbrüche.

---

### \uHHHH

**EN:** Unicode escape in Tcl; HHHH = four hex digits; example: `\u0041` = 'A', `\u20AC` = '€'; for code points U+0000 to U+FFFF.

**DE:** Unicode-Escape in Tcl; HHHH = vier Hex-Ziffern; Beispiel: `\u0041` = 'A', `\u20AC` = '€'; für Code-Punkte U+0000 bis U+FFFF.

---

### \xHH

**EN:** Hexadecimal byte escape in Tcl; HH = two hex digits; example: `\x41` = 'A', `\xFF` = byte 255; max \xFF (255).

**DE:** Hexadezimales Byte-Escape in Tcl; HH = zwei Hex-Ziffern; Beispiel: `\x41` = 'A', `\xFF` = Byte 255; max \xFF (255).

---


## Event Modifiers - Vollständig / Event Modifiers - Complete

### Alt (Modifier)

**EN:** Alt key modifier for events; also called Meta or Mod1 on some systems; specified as `<Alt-Key-f>`, `<Alt-F4>`.

**DE:** Alt-Tasten-Modifikator für Ereignisse; auch Meta oder Mod1 auf einigen Systemen genannt; angegeben als `<Alt-Key-f>`, `<Alt-F4>`.

---

### Button1-Button5 (Modifiers)

**EN:** Mouse button modifiers Button1 through Button5; Button1=left, Button2=middle, Button3=right, Button4/5=additional buttons.

**DE:** Mausbutton-Modifikatoren Button1 bis Button5; Button1=links, Button2=mitte, Button3=rechts, Button4/5=zusätzliche Buttons.

---

### Control (Modifier)

**EN:** Control/Ctrl key modifier for events; specified as `<Control-Key-c>`, `<Control-Button-1>`, etc.

**DE:** Control/Strg-Tasten-Modifikator für Ereignisse; angegeben als `<Control-Key-c>`, `<Control-Button-1>`, etc.

---

### Double (Modifier)

**EN:** Double-click event modifier; specified as `<Double-Button-1>`, `<Double-1>` (shorthand).

**DE:** Doppelklick-Ereignis-Modifikator; angegeben als `<Double-Button-1>`, `<Double-1>` (Kurzform).

---

### Meta (Modifier)

**EN:** Meta key modifier (same as Alt on many systems); specified as `<Meta-Key>`.

**DE:** Meta-Tasten-Modifikator (gleich wie Alt auf vielen Systemen); angegeben als `<Meta-Key>`.

---

### Mod1-Mod5 (Modifiers)

**EN:** Generic modifier keys Mod1 through Mod5; mapping system-dependent (Mod1 often Alt, Mod4 often Windows/Super key).

**DE:** Generische Modifikatortasten Mod1 bis Mod5; Zuordnung system-abhängig (Mod1 oft Alt, Mod4 oft Windows/Super-Taste).

---

### Shift (Modifier)

**EN:** Shift key modifier for events; specified as `<Shift-Button-1>`, `<Shift-Key-a>`, etc.

**DE:** Umschalttasten-Modifikator für Ereignisse; angegeben als `<Shift-Button-1>`, `<Shift-Key-a>`, etc.

---

### Triple (Modifier)

**EN:** Triple-click event modifier; specified as `<Triple-Button-1>`, `<Triple-1>` (shorthand).

**DE:** Dreifachklick-Ereignis-Modifikator; angegeben als `<Triple-Button-1>`, `<Triple-1>` (Kurzform).

---


## Event-Befehle / Event Commands

### <<ComboboxSelected>>

**EN:** Virtual event triggered when ttk::combobox selection changes.

**DE:** Virtuelles Ereignis, ausgelöst wenn ttk::combobox-Auswahl sich ändert.

---

### <<Cut>> <<Copy>> <<Paste>>

**EN:** Standard virtual events for clipboard operations; platform-independent.

**DE:** Standard-virtuelle Ereignisse für Zwischenablage-Operationen; plattformunabhängig.

---

### <<ListboxSelect>>

**EN:** Virtual event triggered when listbox selection changes.

**DE:** Virtuelles Ereignis, ausgelöst wenn Listbox-Auswahl sich ändert.

---

### <<MenuSelect>>

**EN:** Virtual event triggered when menu item is highlighted.

**DE:** Virtuelles Ereignis, ausgelöst wenn Menüelement hervorgehoben wird.

---

### <<Modified>>

**EN:** Virtual event triggered when text widget content is modified.

**DE:** Virtuelles Ereignis, ausgelöst wenn Text-Widget-Inhalt geändert wird.

---

### <<Selection>>

**EN:** Virtual event triggered when text selection changes.

**DE:** Virtuelles Ereignis, ausgelöst wenn Textauswahl sich ändert.

---

### event add

**EN:** Define virtual event and associate with physical event patterns (e.g., `event add <<Undo>> <Control-z>`).

**DE:** Virtuelles Ereignis definieren und mit physischen Ereignis-Mustern verknüpfen (z.B. `event add <<Undo>> <Control-z>`).

---

### event delete

**EN:** Remove virtual event definition or specific binding.

**DE:** Virtuelles Ereignis-Definition oder spezifisches Binding entfernen.

---

### event generate

**EN:** Programmatically create and send event to widget (e.g., `event generate .widget <<Custom>>`).

**DE:** Programmatisch Ereignis erstellen und an Widget senden (z.B. `event generate .widget <<Custom>>`).

---

### event info

**EN:** Query information about virtual events or physical event sequences.

**DE:** Informationen über virtuelle Ereignisse oder physische Ereignis-Sequenzen abfragen.

---


## Event-Modifikatoren / Event Modifiers

### Alt

**EN:** Alt key modifier for events (also called Meta or Option on some systems).

**DE:** Alt-Tasten-Modifikator für Ereignisse (auch Meta oder Option auf einigen Systemen genannt).

---

### Control

**EN:** Modifier key for events; specified as `<Control-Key>` or `<Control-Button-1>`.

**DE:** Modifikatortaste für Ereignisse; angegeben als `<Control-Key>` oder `<Control-Button-1>`.

---

### Double

**EN:** Double-click event modifier; specified as `<Double-Button-1>`.

**DE:** Doppelklick-Ereignis-Modifikator; angegeben als `<Double-Button-1>`.

---

### Lock

**EN:** Caps Lock modifier for keyboard events.

**DE:** Feststelltasten-Modifikator für Tastatur-Ereignisse.

---

### Shift

**EN:** Shift key modifier for events.

**DE:** Umschalttaste-Modifikator für Ereignisse.

---

### Triple

**EN:** Triple-click event modifier; specified as `<Triple-Button-1>`.

**DE:** Dreifachklick-Ereignis-Modifikator; angegeben als `<Triple-Button-1>`.

---


## Event-Typen / Event Types

### ButtonPress (Button)

**EN:** Mouse button click event; specified as `<Button-1>` for left click, `<Button-2>` for middle, `<Button-3>` for right.

**DE:** Mausklick-Ereignis; angegeben als `<Button-1>` für Linksklick, `<Button-2>` für Mitte, `<Button-3>` für Rechts.

---

### ButtonRelease

**EN:** Event triggered when a mouse button is released.

**DE:** Ereignis, das ausgelöst wird, wenn eine Maustaste losgelassen wird.

---

### Destroy

**EN:** Event triggered when a widget is destroyed.

**DE:** Ereignis, das ausgelöst wird, wenn ein Widget zerstört wird.

---

### Enter

**EN:** Event triggered when the mouse pointer enters a widget's area.

**DE:** Ereignis, das ausgelöst wird, wenn der Mauszeiger den Bereich eines Widgets betritt.

---

### Expose

**EN:** Event triggered when part of a window becomes visible and needs redrawing.

**DE:** Ereignis, das ausgelöst wird, wenn ein Teil eines Fensters sichtbar wird und neu gezeichnet werden muss.

---

### FocusIn

**EN:** Event triggered when a widget receives keyboard focus.

**DE:** Ereignis, das ausgelöst wird, wenn ein Widget den Tastaturfokus erhält.

---

### FocusOut

**EN:** Event triggered when a widget loses keyboard focus.

**DE:** Ereignis, das ausgelöst wird, wenn ein Widget den Tastaturfokus verliert.

---

### KeyPress (Key)

**EN:** Keyboard key press event; specified as `<Key>` or `<KeyPress>`.

**DE:** Tastatur-Tastendruck-Ereignis; angegeben als `<Key>` oder `<KeyPress>`.

---

### KeyRelease

**EN:** Event triggered when a keyboard key is released.

**DE:** Ereignis, das ausgelöst wird, wenn eine Tastaturtaste losgelassen wird.

---

### Leave

**EN:** Event triggered when the mouse pointer leaves a widget's area.

**DE:** Ereignis, das ausgelöst wird, wenn der Mauszeiger den Bereich eines Widgets verlässt.

---

### Map

**EN:** Event triggered when a widget becomes visible on screen.

**DE:** Ereignis, das ausgelöst wird, wenn ein Widget auf dem Bildschirm sichtbar wird.

---

### Motion

**EN:** Event triggered when the mouse moves.

**DE:** Ereignis, das ausgelöst wird, wenn die Maus bewegt wird.

---

### Unmap

**EN:** Event triggered when a widget is removed from the screen.

**DE:** Ereignis, das ausgelöst wird, wenn ein Widget vom Bildschirm entfernt wird.

---


## Farben / Colors

### #000000

**EN:** Hex code for black color (minimum values for all RGB components: 0, 0, 0).

**DE:** Hex-Code für die Farbe Schwarz (Minimalwerte für alle RGB-Komponenten: 0, 0, 0).

---

### #0000FF

**EN:** Hex code for pure blue (red=0, green=0, blue=255).

**DE:** Hex-Code für reines Blau (Rot=0, Grün=0, Blau=255).

---

### #00FF00

**EN:** Hex code for pure green (red=0, green=255, blue=0).

**DE:** Hex-Code für reines Grün (Rot=0, Grün=255, Blau=0).

---

### #FF0000

**EN:** Hex code for pure red (red=255, green=0, blue=0).

**DE:** Hex-Code für reines Rot (Rot=255, Grün=0, Blau=0).

---

### #FFFFFF

**EN:** Hex code for white color (maximum values for all RGB components: 255, 255, 255).

**DE:** Hex-Code für die Farbe Weiß (Maximalwerte für alle RGB-Komponenten: 255, 255, 255).

---

### #RGB Format

**EN:** Three-digit shorthand hex format (e.g., `#F00` = `#FF0000`); each digit is doubled.

**DE:** Dreistelliges Kurzformat in Hex (z.B. `#F00` = `#FF0000`); jede Ziffer wird verdoppelt.

---

### #RRGGBB Format

**EN:** Six-digit hex format where each pair represents intensity (00-FF) for red, green, and blue.

**DE:** Sechsstelliges Hex-Format, wobei jedes Paar die Intensität (00-FF) für Rot, Grün und Blau darstellt.

---

### Active Background (activebackground)

**EN:** The background color when a widget is active or being interacted with.

**DE:** Die Hintergrundfarbe, wenn ein Widget aktiv ist oder mit ihm interagiert wird.

---

### Active Foreground (activeforeground)

**EN:** The foreground color when a widget is active or being interacted with.

**DE:** Die Vordergrundfarbe, wenn ein Widget aktiv ist oder mit ihm interagiert wird.

---

### Background (bg)

**EN:** The background color of a widget or window.

**DE:** Die Hintergrundfarbe eines Widgets oder Fensters.

---

### Color

**EN:** Specification of color using names (e.g., `red`, `blue`) or hex codes (e.g., `#FF0000`).

**DE:** Spezifikation von Farbe mit Namen (z.B. `red`, `blue`) oder Hex-Codes (z.B. `#FF0000`).

---

### Disabled Foreground (disabledforeground)

**EN:** The foreground color when a widget is in disabled state.

**DE:** Die Vordergrundfarbe, wenn ein Widget im deaktivierten Zustand ist.

---

### Foreground (fg)

**EN:** The color of text or the main content of a widget.

**DE:** Die Farbe von Text oder dem Hauptinhalt eines Widgets.

---

### Gray Levels

**EN:** Shades of gray specified as `gray0` (black) through `gray100` (white), or hex codes with equal RGB values.

**DE:** Graustufen angegeben als `gray0` (schwarz) bis `gray100` (weiß), oder Hex-Codes mit gleichen RGB-Werten.

---

### Hex Color Code

**EN:** Color specified with hexadecimal notation; format `#RRGGBB` where RR=red, GG=green, BB=blue (e.g., `#FF0000` for red, `#00FF00` for green, `#0000FF` for blue).

**DE:** Farbe mit Hexadezimalnotation angegeben; Format `#RRGGBB` wobei RR=Rot, GG=Grün, BB=Blau (z.B. `#FF0000` für Rot, `#00FF00` für Grün, `#0000FF` für Blau).

---

### Highlight Color (highlightcolor)

**EN:** The color of the focus highlight border when a widget has keyboard focus.

**DE:** Die Farbe des Fokus-Hervorhebungsrahmens, wenn ein Widget den Tastaturfokus hat.

---

### Named Colors

**EN:** Predefined color names like `red`, `blue`, `green`, `yellow`, `cyan`, `magenta`, `white`, `black`, `gray`.

**DE:** Vordefinierte Farbnamen wie `red`, `blue`, `green`, `yellow`, `cyan`, `magenta`, `white`, `black`, `gray`.

---

### RGB

**EN:** Color specification using Red, Green, Blue components (e.g., `rgb(255, 0, 0)` or `#FF0000`).

**DE:** Farbspezifikation mit Rot-, Grün-, Blau-Komponenten (z.B. `rgb(255, 0, 0)` oder `#FF0000`).

---

### Select Background (selectbackground)

**EN:** The background color of selected text or items.

**DE:** Die Hintergrundfarbe von markiertem Text oder Elementen.

---

### Select Foreground (selectforeground)

**EN:** The foreground color of selected text or items.

**DE:** Die Vordergrundfarbe von markiertem Text oder Elementen.

---


## Fenster und Layout / Windows and Layout

### Frame

**EN:** A container widget used to group and organize other widgets within a window.

**DE:** Ein Container-Widget zum Gruppieren und Organisieren anderer Widgets innerhalb eines Fensters.

---

### Geometry Manager

**EN:** A system for arranging widgets in a window (pack, grid, or place).

**DE:** Ein System zur Anordnung von Widgets in einem Fenster (pack, grid oder place).

---

### Grid

**EN:** A geometry manager that arranges widgets in a two-dimensional table structure.

**DE:** Ein Geometry-Manager, der Widgets in einer zweidimensionalen Tabellenstruktur anordnet.

---

### Pack

**EN:** A geometry manager that arranges widgets in blocks along the sides of their container.

**DE:** Ein Geometry-Manager, der Widgets in Blöcken entlang der Seiten ihres Containers anordnet.

---

### Place

**EN:** A geometry manager that positions widgets at absolute or relative coordinates.

**DE:** Ein Geometry-Manager, der Widgets an absoluten oder relativen Koordinaten positioniert.

---

### Window

**EN:** A top-level or child container for widgets, referenced by a pathname starting with `.`

**DE:** Ein Container der obersten Ebene oder ein Untercontainer für Widgets, referenziert durch einen Pfadnamen beginnend mit `.`

---


## Fenster-Management / Window Management

### Deiconify

**EN:** Restore a minimized window to its normal state.

**DE:** Ein minimiertes Fenster in seinen normalen Zustand wiederherstellen.

---

### Geometry

**EN:** The size and position of a window in format `widthxheight+x+y`.

**DE:** Die Größe und Position eines Fensters im Format `widthxheight+x+y`.

---

### Iconify

**EN:** Minimize a window to an icon or taskbar entry.

**DE:** Ein Fenster zu einem Symbol oder Taskleisten-Eintrag minimieren.

---

### Protocol

**EN:** Handler for window manager events (e.g., `WM_DELETE_WINDOW` for close button).

**DE:** Handler für Window-Manager-Ereignisse (z.B. `WM_DELETE_WINDOW` für Schließen-Button).

---

### Resizable

**EN:** Specifies whether a window can be resized by the user.

**DE:** Gibt an, ob ein Fenster vom Benutzer in der Größe verändert werden kann.

---

### Title

**EN:** The text displayed in the window's title bar; set with `wm title`.

**DE:** Der Text, der in der Titelleiste des Fensters angezeigt wird; gesetzt mit `wm title`.

---

### Transient

**EN:** A secondary window that stays on top of its parent window.

**DE:** Ein sekundäres Fenster, das über seinem Elternfenster bleibt.

---

### Withdraw

**EN:** Completely hide a window without destroying it.

**DE:** Ein Fenster vollständig verbergen, ohne es zu zerstören.

---


## File I/O-Begriffe / File I/O Terms

### Binary Mode

**EN:** File access mode for binary data without line-ending translation.

**DE:** Dateizugriffsmodus für Binärdaten ohne Zeilenende-Übersetzung.

---

### Channel

**EN:** I/O stream handle for file, socket, or pipe operations.

**DE:** E/A-Stream-Handle für Datei-, Socket- oder Pipe-Operationen.

---

### Encoding

**EN:** Character encoding for file operations (e.g., utf-8, iso8859-1).

**DE:** Zeichenkodierung für Dateioperationen (z.B. utf-8, iso8859-1).

---

### File Mode

**EN:** Access mode when opening file: `r` (read), `w` (write/create), `a` (append), `r+` (read/write), `w+` (read/write/create), `a+` (read/append).

**DE:** Zugriffsmodus beim Öffnen von Datei: `r` (lesen), `w` (schreiben/erstellen), `a` (anhängen), `r+` (lesen/schreiben), `w+` (lesen/schreiben/erstellen), `a+` (lesen/anhängen).

---

### Translation

**EN:** Line-ending conversion mode: `auto`, `lf`, `cr`, `crlf`, or `binary`.

**DE:** Zeilenende-Konvertierungsmodus: `auto`, `lf`, `cr`, `crlf` oder `binary`.

---

### cd

**EN:** Change current working directory (e.g., `cd /home/user`).

**DE:** Aktuelles Arbeitsverzeichnis wechseln (z.B. `cd /home/user`).

---

### chan configure

**EN:** Modern equivalent of `fconfigure`. Syntax: chan configure channelId ?option? ?value? ?option value...?. Common options: -buffering line|full|none, -encoding utf-8, -translation binary|crlf|lf|auto, -blocking 0|1, -eofchar char, -buffersize bytes. Use -encoding utf-8 + -translation binary for safe binary I/O.

**DE:** Modernes Gegenstueck zu `fconfigure`. Syntax: chan configure channelId ?option? ?value? ?option value...?. Wichtige Optionen: -buffering line|full|none, -encoding utf-8, -translation binary|crlf|lf|auto, -blocking 0|1, -eofchar char, -buffersize bytes. -encoding utf-8 + -translation binary fuer sichere binaer-I/O.

---

### chan create

**EN:** Create a reflected channel (refchan) backed by Tcl procedures. Syntax: chan create {read|write|read write} cmdPrefix. The cmdPrefix is a command that handles the channel operations (read, write, close, blocking, watch, ...). Used for in-memory channels, streaming filters, custom protocols.

**DE:** Erzeugt einen reflektierten Kanal (refchan) der von Tcl-Prozeduren bedient wird. Syntax: chan create {read|write|read write} cmdPrefix. Der cmdPrefix ist ein Kommando das die Kanal-Operationen (read, write, close, blocking, watch, ...) bedient. Verwendet fuer In-Memory-Kanaele, Streaming-Filter, eigene Protokolle.

---

### chan event

**EN:** Modern equivalent of the deprecated `fileevent` command. Syntax: chan event channelId readable|writable ?script?. Without script: returns the current callback. With empty string: removes the callback. Same semantics as fileevent; chan event is preferred in new code.

**DE:** Modernes Gegenstueck zum veralteten `fileevent`-Kommando. Syntax: chan event channelId readable|writable ?script?. Ohne Skript: liefert den aktuellen Callback. Mit leerem String: entfernt den Callback. Gleiche Semantik wie fileevent; chan event ist in neuem Code bevorzugt.

---

### chan postevent

**EN:** Post a fileevent on a reflected channel. Syntax: chan postevent channelId eventList (eventList contains "read", "write"). Used inside a refchan implementation to trigger fileevent callbacks when data becomes available or writable.

**DE:** Postet ein fileevent auf einem reflektierten Kanal. Syntax: chan postevent channelId eventList (eventList enthaelt "read", "write"). Verwendet innerhalb einer refchan-Implementation um fileevent-Callbacks auszuloesen wenn Daten verfuegbar/schreibbar werden.

---

### close

**EN:** Close open file channel and flush buffers (e.g., `close $fp`).

**DE:** Offenen Datei-Kanal schließen und Puffer leeren (z.B. `close $fp`).

---

### eof

**EN:** Check if end-of-file has been reached (e.g., `eof $fp`).

**DE:** Prüfen, ob Dateiende erreicht wurde (z.B. `eof $fp`).

---

### fconfigure

**EN:** Configure channel options like buffering, encoding, translation mode.

**DE:** Kanal-Optionen wie Pufferung, Kodierung, Übersetzungsmodus konfigurieren.

---

### file

**EN:** Command with subcommands for file operations: `exists`, `delete`, `copy`, `rename`, `mkdir`, `size`, `mtime`, etc.

**DE:** Befehl mit Unterbefehlen für Dateioperationen: `exists`, `delete`, `copy`, `rename`, `mkdir`, `size`, `mtime`, etc.

---

### flush

**EN:** Force buffered output to be written immediately to file.

**DE:** Gepufferte Ausgabe sofort in Datei schreiben erzwingen.

---

### gets

**EN:** Read single line from file channel (e.g., `gets $fp line`).

**DE:** Einzelne Zeile aus Datei-Kanal lesen (z.B. `gets $fp line`).

---

### glob

**EN:** Find files matching pattern with wildcards (e.g., `glob *.txt`).

**DE:** Dateien finden, die Muster mit Wildcards entsprechen (z.B. `glob *.txt`).

---

### glob -directory

**EN:** glob option that anchors the search to a specific directory. Syntax: glob -directory dir ?-options? pattern. The pattern is matched against entries in dir, not against the joined path. Cleaner and faster than `glob "$dir/*"` because Tcl handles the join. Combined with -tails to get only the basenames.

**DE:** glob-Option die die Suche auf ein bestimmtes Verzeichnis verankert. Syntax: glob -directory dir ?-options? pattern. Das Pattern wird gegen Eintraege in dir geprueft, nicht gegen den verbundenen Pfad. Sauberer und schneller als `glob "$dir/*"` weil Tcl das Verbinden uebernimmt. Mit -tails kombiniert liefert es nur Basenamen.

---

### glob -nocomplain

**EN:** glob option that suppresses the "no files matched" error and returns an empty list instead. Syntax: glob -nocomplain ?-options? pattern. Without it, glob raises an error when nothing matches — useful when iterating over potentially empty directories.

**DE:** glob-Option die den "keine Dateien gefunden"-Fehler unterdrueckt und stattdessen eine leere Liste liefert. Syntax: glob -nocomplain ?-options? pattern. Ohne diese Option wirft glob einen Fehler bei keinem Treffer — nuetzlich beim Iterieren ueber moeglicherweise leere Verzeichnisse.

---

### glob -tails

**EN:** glob option that returns only the matching basenames, not the full path. Syntax: glob -directory dir -tails pattern. Without -directory: not very useful. Common pattern: `glob -directory $dir -tails *.tcl`.

**DE:** glob-Option die nur die treffenden Basenamen liefert, nicht den vollen Pfad. Syntax: glob -directory dir -tails pattern. Ohne -directory: wenig sinnvoll. Verbreitetes Muster: `glob -directory $dir -tails *.tcl`.

---

### glob -types

**EN:** glob option that restricts matches by file type. Syntax: glob -types typespec ?-options? pattern. typespec can be: a list of single-char types (d=dir, f=file, l=link, b=block, c=char, p=pipe, s=socket), or a list of permission strings ({readable writable}), or a TYPE list for special filesystems. Common: `glob -types d *` for directories only.

**DE:** glob-Option die Treffer nach Datei-Typ einschraenkt. Syntax: glob -types typespec ?-options? pattern. typespec kann sein: Liste einzelner Typ-Buchstaben (d=Verzeichnis, f=Datei, l=Link, b=Block, c=Char, p=Pipe, s=Socket), Liste von Berechtigungs-Strings ({readable writable}), oder TYPE-Liste fuer spezielle Filesysteme. Verbreitet: `glob -types d *` fuer nur Verzeichnisse.

---

### open

**EN:** Open file and return channel handle for reading/writing (e.g., `set fp [open "file.txt" r]`).

**DE:** Datei öffnen und Kanal-Handle zum Lesen/Schreiben zurückgeben (z.B. `set fp [open "file.txt" r]`).

---

### puts

**EN:** Write string to file channel or stdout (e.g., `puts $fp "Hello World"`).

**DE:** String in Datei-Kanal oder stdout schreiben (z.B. `puts $fp "Hello World"`).

---

### pwd

**EN:** Return current working directory path.

**DE:** Aktuellen Arbeitsverzeichnis-Pfad zurückgeben.

---

### read

**EN:** Read data from file channel; can read entire file or specified number of bytes.

**DE:** Daten aus Datei-Kanal lesen; kann ganze Datei oder angegebene Anzahl Bytes lesen.

---

### refchan

**EN:** Reflected channel — a Tcl-implemented channel created via `chan create`. The handler proc receives one of these subcommand requests: initialize, finalize, watch, read, write, seek, blocking, configure, cget, cgetall. Each must respond appropriately. Enables custom channel sources without C code.

**DE:** Reflektierter Kanal — ein in Tcl implementierter Kanal, erzeugt mit `chan create`. Der Handler-Proc erhaelt einen dieser Subkommando-Requests: initialize, finalize, watch, read, write, seek, blocking, configure, cget, cgetall. Jeder muss passend antworten. Ermoeglicht eigene Kanal-Quellen ohne C-Code.

---

### seek

**EN:** Change current position in file channel (e.g., `seek $fp 0 start`).

**DE:** Aktuelle Position im Datei-Kanal ändern (z.B. `seek $fp 0 start`).

---

### stderr

**EN:** Standard error channel (error message output).

**DE:** Standard-Fehler-Kanal (Fehlermeldungs-Ausgabe).

---

### stdin

**EN:** Standard input channel (keyboard input).

**DE:** Standard-Eingabe-Kanal (Tastatureingabe).

---

### stdout

**EN:** Standard output channel (screen output).

**DE:** Standard-Ausgabe-Kanal (Bildschirmausgabe).

---

### tell

**EN:** Return current read/write position in file channel.

**DE:** Aktuelle Lese-/Schreibposition im Datei-Kanal zurückgeben.

---


## File-Subcommands / File Subcommands

### file atime

**EN:** Get or set the access time of a file (Unix epoch seconds). Syntax: file atime name ?newTime?. Without newTime: returns the access time. With newTime: sets it (requires write permission). Updating atime is restricted on some filesystems (noatime mount).

**DE:** Liefert oder setzt die Access-Zeit einer Datei (Unix-Epoch-Sekunden). Syntax: file atime name ?newTime?. Ohne newTime: liefert die Access-Zeit. Mit newTime: setzt sie (erfordert Schreibrechte). Atime-Updates sind auf manchen Dateisystemen eingeschraenkt (noatime mount).

---

### file attributes

**EN:** Query or set platform-specific file attributes (permissions, ownership, etc.).

**DE:** Plattformspezifische Dateiattribute abfragen oder setzen (Berechtigungen, Eigentümer, etc.).

---

### file copy

**EN:** Copy files or directories. Syntax: file copy ?-force? ?--? source ?source...? target. -force overwrites existing target. -- ends option processing. With multiple sources, target must be a directory. Cross-platform abstraction over OS copy semantics.

**DE:** Kopiert Dateien oder Verzeichnisse. Syntax: file copy ?-force? ?--? source ?source...? target. -force ueberschreibt existierende Ziele. -- beendet Options-Verarbeitung. Bei mehreren Quellen muss target ein Verzeichnis sein. Plattformuebergreifende Abstraktion ueber OS-Copy-Semantik.

---

### file delete

**EN:** Delete files or directories. Syntax: file delete ?-force? ?--? pathname ?pathname...?. -force allows deleting non-empty directories recursively and ignores nonexistent files. Without -force: empty directories only; nonexistent files raise an error.

**DE:** Loescht Dateien oder Verzeichnisse. Syntax: file delete ?-force? ?--? pathname ?pathname...?. -force erlaubt das rekursive Loeschen nicht-leerer Verzeichnisse und ignoriert nicht existierende Dateien. Ohne -force: nur leere Verzeichnisse; nicht existierende Dateien werfen einen Fehler.

---

### file dirname

**EN:** Return directory portion of file path (e.g., `file dirname /home/user/file.txt` = `/home/user`).

**DE:** Verzeichnis-Teil des Dateipfads zurückgeben (z.B. `file dirname /home/user/file.txt` = `/home/user`).

---

### file executable

**EN:** Test whether a file is executable by the current process. Syntax: file executable name. Returns 1 or 0. On Unix: checks the x bit and access permissions. On Windows: checks for .exe/.com/.bat extensions and PATHEXT.

**DE:** Prueft ob eine Datei fuer den aktuellen Prozess ausfuehrbar ist. Syntax: file executable name. Liefert 1 oder 0. Auf Unix: prueft x-Bit und Zugriffsrechte. Auf Windows: prueft auf .exe/.com/.bat-Endungen und PATHEXT.

---

### file exists

**EN:** Test whether a path exists (file, directory, or other entry). Syntax: file exists name. Returns 1 if the path can be accessed, 0 otherwise. Use file isfile / file isdirectory for more specific tests. Common guard before opening files.

**DE:** Prueft ob ein Pfad existiert (Datei, Verzeichnis oder anderer Eintrag). Syntax: file exists name. Liefert 1 wenn zugreifbar, 0 sonst. Fuer spezifischere Pruefungen file isfile / file isdirectory nutzen. Verbreiteter Guard vor open.

---

### file extension

**EN:** Return file extension including dot (e.g., `file extension file.txt` = `.txt`).

**DE:** Dateiendung inklusive Punkt zurückgeben (z.B. `file extension file.txt` = `.txt`).

---

### file isdirectory

**EN:** Test whether a path is a directory. Syntax: file isdirectory name. Returns 1 only if the path exists and is a directory; 0 if it's a file or does not exist.

**DE:** Prueft ob ein Pfad ein Verzeichnis ist. Syntax: file isdirectory name. Liefert 1 nur wenn der Pfad existiert und ein Verzeichnis ist; 0 wenn Datei oder nicht existent.

---

### file isdirectory / file isfile

**EN:** Test if path is directory/regular file.

**DE:** Testen, ob Pfad Verzeichnis/reguläre Datei ist.

---

### file isfile

**EN:** Test whether a path is a regular file. Syntax: file isfile name. Returns 1 only if the path exists and is a regular file (not a directory or device). Counterpart of file isdirectory.

**DE:** Prueft ob ein Pfad eine regulaere Datei ist. Syntax: file isfile name. Liefert 1 nur wenn der Pfad existiert und eine regulaere Datei ist (kein Verzeichnis und kein Device). Gegenstueck zu file isdirectory.

---

### file join

**EN:** Join path components with platform-appropriate separator (e.g., `file join /home user file.txt`).

**DE:** Pfad-Komponenten mit plattformgerechtem Trenner verbinden (z.B. `file join /home user file.txt`).

---

### file link

**EN:** Create symbolic or hard link, or return link target if file is link.

**DE:** Symbolischen oder harten Link erstellen oder Link-Ziel zurückgeben, wenn Datei ein Link ist.

---

### file mkdir

**EN:** Create directories. Syntax: file mkdir directoryname ?directoryname...?. Creates intermediate directories as needed (like mkdir -p). Does nothing for already-existing directories (silently succeeds). Raises an error if the path exists as a file.

**DE:** Erzeugt Verzeichnisse. Syntax: file mkdir directoryname ?directoryname...?. Erzeugt Zwischen-Verzeichnisse wenn noetig (wie mkdir -p). Tut nichts bei bereits existierenden Verzeichnissen (still erfolgreich). Fehler wenn der Pfad als Datei existiert.

---

### file mtime

**EN:** Get or set the modification time of a file (Unix epoch seconds). Syntax: file mtime name ?newTime?. Without newTime: returns the mtime. With newTime: sets it. Typical use: touch-like behavior `file mtime $f [clock seconds]`.

**DE:** Liefert oder setzt die Modification-Zeit einer Datei (Unix-Epoch-Sekunden). Syntax: file mtime name ?newTime?. Ohne newTime: liefert die mtime. Mit newTime: setzt sie. Typische Verwendung: touch-aehnlich `file mtime $f [clock seconds]`.

---

### file normalize

**EN:** Convert path to absolute canonical form, resolving .. and symlinks.

**DE:** Pfad in absolute kanonische Form konvertieren, .. und Symlinks auflösen.

---

### file pathtype

**EN:** Classify a path as absolute, relative, or volumerelative. Syntax: file pathtype name. Returns one of: absolute (starts with separator or volume), relative (no anchor), volumerelative (Windows: C: without slash). Used in path-manipulation logic.

**DE:** Klassifiziert einen Pfad als absolute, relative oder volumerelative. Syntax: file pathtype name. Liefert: absolute (mit Trenner oder Volume), relative (kein Anker), volumerelative (Windows: C: ohne Slash). Verwendet in Pfad-Manipulations-Logik.

---

### file readable

**EN:** Test whether a file is readable by the current process. Syntax: file readable name. Returns 1 or 0. Uses access(2) semantics: checks for the effective user, not just file mode bits.

**DE:** Prueft ob eine Datei fuer den aktuellen Prozess lesbar ist. Syntax: file readable name. Liefert 1 oder 0. Verwendet access(2)-Semantik: prueft den effektiven Benutzer, nicht nur die Datei-Mode-Bits.

---

### file readable / file writable / file executable

**EN:** Test if file has read/write/execute permission for current user.

**DE:** Testen, ob Datei Lese-/Schreib-/Ausführungsberechtigung für aktuellen Benutzer hat.

---

### file rename

**EN:** Rename or move files / directories. Syntax: file rename ?-force? ?--? source ?source...? target. Combines rename (within same filesystem) and move semantics. -force overwrites existing target. With multiple sources, target must be a directory.

**DE:** Benennt Dateien/Verzeichnisse um oder verschiebt sie. Syntax: file rename ?-force? ?--? source ?source...? target. Kombiniert rename (innerhalb desselben Dateisystems) und Move-Semantik. -force ueberschreibt vorhandene Ziele. Bei mehreren Quellen muss target ein Verzeichnis sein.

---

### file rootname

**EN:** Return filename without extension (e.g., `file rootname file.txt` = `file`).

**DE:** Dateinamen ohne Endung zurückgeben (z.B. `file rootname file.txt` = `file`).

---

### file size

**EN:** Return the size of a file in bytes. Syntax: file size name. Raises an error if the file does not exist. For directories, returns a small implementation-defined number (directory entry size). Use [file size $f] before reading to allocate buffers.

**DE:** Liefert die Groesse einer Datei in Bytes. Syntax: file size name. Fehler wenn die Datei nicht existiert. Bei Verzeichnissen: ein kleiner implementierungsspezifischer Wert (Verzeichniseintrags-Groesse). Vor read aufrufen um Puffer zu allokieren.

---

### file split

**EN:** Split path into list of components (e.g., `file split /home/user/file.txt` = `/` `home` `user` `file.txt`).

**DE:** Pfad in Liste von Komponenten aufteilen (z.B. `file split /home/user/file.txt` = `/` `home` `user` `file.txt`).

---

### file stat

**EN:** Get filesystem metadata for a path into an array. Syntax: file stat name arrayName. The array is filled with: atime, ctime, mtime, dev, gid, ino, mode, nlink, size, type, uid. Equivalent to the Unix stat(2) system call. Use file lstat for symlinks without following them.

**DE:** Liefert Dateisystem-Metadaten eines Pfades in ein Array. Syntax: file stat name arrayName. Das Array wird gefuellt mit: atime, ctime, mtime, dev, gid, ino, mode, nlink, size, type, uid. Entspricht dem Unix-stat(2)-Aufruf. file lstat fuer Symlinks ohne Folgen.

---

### file stat / file lstat

**EN:** Store file information in array variable (size, mtime, type, etc.); lstat doesn't follow symlinks.

**DE:** Dateiinformationen in Array-Variable speichern (Größe, mtime, Typ, etc.); lstat folgt Symlinks nicht.

---

### file tail

**EN:** Return filename portion of path without directory (e.g., `file tail /home/user/file.txt` = `file.txt`).

**DE:** Dateinamen-Teil des Pfads ohne Verzeichnis zurückgeben (z.B. `file tail /home/user/file.txt` = `file.txt`).

---

### file tempfile

**EN:** Create a temporary file and return its name (Tcl 8.6+). Syntax: file tempfile ?nameVar? ?template?. Without nameVar: returns the name. With nameVar: opens the file, sets nameVar to its path, returns the channel. Template may include directory or file-name pattern. Uses OS-specific secure temp creation.

**DE:** Erzeugt eine temporaere Datei und liefert ihren Namen (Tcl 8.6+). Syntax: file tempfile ?nameVar? ?template?. Ohne nameVar: liefert den Namen. Mit nameVar: oeffnet die Datei, setzt nameVar auf ihren Pfad, liefert den Kanal. Template darf Verzeichnis oder Datei-Pattern enthalten. Nutzt OS-spezifische sichere Temp-Erzeugung.

---

### file type

**EN:** Return file type: `file`, `directory`, `characterSpecial`, `blockSpecial`, `fifo`, `link`, `socket`.

**DE:** Dateityp zurückgeben: `file`, `directory`, `characterSpecial`, `blockSpecial`, `fifo`, `link`, `socket`.

---

### file writable

**EN:** Test whether a file is writable by the current process. Syntax: file writable name. Returns 1 or 0. For directories, tests whether new entries can be created.

**DE:** Prueft ob eine Datei fuer den aktuellen Prozess schreibbar ist. Syntax: file writable name. Liefert 1 oder 0. Bei Verzeichnissen: prueft ob neue Eintraege erstellt werden koennen.

---


## Focus und Raise/Lower / Focus and Raise/Lower

### focus

**EN:** Query or set keyboard focus to widget (e.g., `focus .entry`).

**DE:** Tastaturfokus auf Widget abfragen oder setzen (z.B. `focus .entry`).

---

### focus -force

**EN:** Force focus to widget even if application doesn't have focus.

**DE:** Fokus auf Widget erzwingen, auch wenn Anwendung keinen Fokus hat.

---

### focus -lastfor

**EN:** Return widget that last had focus in window.

**DE:** Widget zurückgeben, das zuletzt Fokus im Fenster hatte.

---

### grab

**EN:** Confine pointer and keyboard events to specific window and its descendants.

**DE:** Zeiger- und Tastatur-Ereignisse auf bestimmtes Fenster und Nachkommen beschränken.

---

### grab current

**EN:** Return window that currently has grab, if any.

**DE:** Fenster zurückgeben, das aktuell Grab hat, falls vorhanden.

---

### grab release

**EN:** Release grab on window, restoring normal event processing.

**DE:** Grab auf Fenster freigeben, normale Ereignisverarbeitung wiederherstellen.

---

### grab set

**EN:** Establish local grab on window (events within application only).

**DE:** Lokalen Grab auf Fenster etablieren (Ereignisse nur innerhalb Anwendung).

---

### grab set -global

**EN:** Establish global grab (all events system-wide directed to window).

**DE:** Globalen Grab etablieren (alle Ereignisse systemweit an Fenster geleitet).

---

### grab status

**EN:** Return grab type for window: none, local, or global.

**DE:** Grab-Typ für Fenster zurückgeben: none, local oder global.

---

### lift

**EN:** Synonym for raise; bring window to front.

**DE:** Synonym für raise; Fenster nach vorne bringen.

---

### lower

**EN:** Push window to back of stacking order (e.g., `lower .win`).

**DE:** Fenster an Rückseite der Stapelreihenfolge schieben (z.B. `lower .win`).

---

### raise

**EN:** Bring window to front of stacking order (e.g., `raise .win`).

**DE:** Fenster an Vorderseite der Stapelreihenfolge bringen (z.B. `raise .win`).

---


## Formatierung / Formatting

### %d %s %f %x (Format Codes)

**EN:** Format specifiers: %d (decimal), %s (string), %f (float), %x (hex), %o (octal), %c (char).

**DE:** Format-Spezifizierer: %d (Dezimal), %s (String), %f (Float), %x (Hex), %o (Oktal), %c (Zeichen).

---

### binary decode

**EN:** Decode an encoded textual representation to binary data. Syntax: binary decode format ?-strict? data. Formats: base64, hex, uuencode. -strict raises an error on whitespace/padding inconsistencies. Counterpart to binary encode.

**DE:** Dekodiert eine kodierte Text-Darstellung zu Binaerdaten. Syntax: binary decode format ?-strict? data. Formate: base64, hex, uuencode. -strict wirft einen Fehler bei Whitespace-/Padding-Inkonsistenzen. Gegenstueck zu binary encode.

---

### binary encode

**EN:** Encode binary data to a textual representation. Syntax: binary encode format data. Formats: base64, hex, uuencode. Tcl 8.6+. Inverse of binary decode. Common for embedding binary data in text protocols (HTTP basic auth, JSON, email).

**DE:** Kodiert Binaerdaten in eine textuelle Darstellung. Syntax: binary encode format data. Formate: base64, hex, uuencode. Tcl 8.6+. Umkehrung von binary decode. Verbreitet beim Einbetten von Binaerdaten in Textprotokolle (HTTP-Basic-Auth, JSON, E-Mail).

---

### binary format

**EN:** Convert values to binary string using format codes (e.g., `binary format "i" 42`).

**DE:** Werte in Binär-String mit Format-Codes konvertieren (z.B. `binary format "i" 42`).

---

### binary scan

**EN:** Parse binary string and extract values using format codes.

**DE:** Binär-String parsen und Werte mit Format-Codes extrahieren.

---

### format

**EN:** Format string using printf-style format specifiers (e.g., `format "%d %s" 42 "hello"`).

**DE:** String mit printf-Stil-Format-Spezifizierern formatieren (z.B. `format "%d %s" 42 "hello"`).

---

### scan

**EN:** Parse string using format specifiers, extracting values (e.g., `scan "42 hello" "%d %s" num str`).

**DE:** String mit Format-Spezifizierern parsen, Werte extrahieren (z.B. `scan "42 hello" "%d %s" num str`).

---


## Fortgeschrittene Konzepte / Advanced Concepts

### Array

**EN:** An associative data structure using key-value pairs, implemented as string-indexed collections.

**DE:** Eine assoziative Datenstruktur mit Schlüssel-Wert-Paaren, implementiert als string-indizierte Sammlungen.

---

### Extension

**EN:** Additional functionality added to Tcl, often written in C, providing new commands or capabilities.

**DE:** Zusätzliche Funktionalität, die zu Tcl hinzugefügt wird, oft in C geschrieben, und neue Befehle oder Fähigkeiten bereitstellt.

---

### Namespace

**EN:** A container for commands and variables that helps organize code and prevent naming conflicts.

**DE:** Ein Container für Befehle und Variablen, der hilft, Code zu organisieren und Namenskonflikte zu vermeiden.

---

### Trace

**EN:** A mechanism to monitor and trigger actions when variables are read, written, or unset.

**DE:** Ein Mechanismus zum Überwachen und Auslösen von Aktionen, wenn Variablen gelesen, geschrieben oder gelöscht werden.

---


## Füllungen und Ränder / Fill and Borders

### Border Width (borderwidth)

**EN:** Width of the widget's border in pixels.

**DE:** Breite des Widget-Rands in Pixeln.

---

### Fill

**EN:** Specifies whether a widget or shape should expand to fill available space or have interior color.

**DE:** Gibt an, ob ein Widget oder eine Form sich ausdehnen soll, um verfügbaren Raum zu füllen oder Innenfarbe haben soll.

---

### Flat

**EN:** Relief style with no 3D effect; appears completely flat.

**DE:** Relief-Stil ohne 3D-Effekt; erscheint völlig flach.

---

### Groove

**EN:** Relief style creating a grooved border effect.

**DE:** Relief-Stil, der einen gerillten Randeffekt erzeugt.

---

### Outline

**EN:** The border color of a shape or canvas item.

**DE:** Die Randfarbe einer Form oder eines Canvas-Elements.

---

### Raised

**EN:** Relief style making the widget appear elevated above the background.

**DE:** Relief-Stil, der das Widget über dem Hintergrund erhöht erscheinen lässt.

---

### Relief

**EN:** 3D border style for widgets; options include `flat`, `raised`, `sunken`, `groove`, `ridge`.

**DE:** 3D-Randstil für Widgets; Optionen umfassen `flat`, `raised`, `sunken`, `groove`, `ridge`.

---

### Ridge

**EN:** Relief style creating a ridged border effect, opposite of groove.

**DE:** Relief-Stil, der einen gerippten Randeffekt erzeugt, Gegenteil von groove.

---

### Stipple

**EN:** A bitmap pattern used to create textured fills or stippled drawing.

**DE:** Ein Bitmap-Muster, das verwendet wird, um texturierte Füllungen oder punktierte Zeichnungen zu erstellen.

---

### Sunken

**EN:** Relief style making the widget appear pressed into the background.

**DE:** Relief-Stil, der das Widget in den Hintergrund gedrückt erscheinen lässt.

---


## Geometry-Verwaltung / Geometry Management

### Geometry-Negotiation

**EN:** Tk's mechanism for resolving widget sizes through a back-and-forth between widgets (which request a size based on content) and the geometry manager (which decides what they actually get, based on container layout and `pack`/`grid`/`place` rules). Triggers cascade: a child changes content → requests new size → parent re-runs layout → may request its own new size → grandparent re-runs layout. Implemented in `tkGeometry.c` plus the per-manager files. Why layout sometimes "settles" after a few visible jumps on resize: it's the negotiation converging.

**DE:** Tks Mechanismus zur Aufloesung von Widget-Groessen durch Hin-und-Her zwischen Widgets (die eine Groesse basierend auf Inhalt anfordern) und dem Geometry-Manager (der basierend auf Container-Layout und `pack`/`grid`/`place`-Regeln entscheidet, was sie tatsaechlich bekommen). Trigger kaskadieren: ein Kind aendert Inhalt → fordert neue Groesse → Parent berechnet Layout neu → fordert evtl. selbst neue Groesse → Grandparent berechnet Layout neu. Implementiert in `tkGeometry.c` plus den Pro-Manager-Dateien. Warum Layout beim Resize manchmal nach ein paar sichtbaren Spruengen "settelt": das ist die Negotiation, die konvergiert.

---

### grid

**EN:** Geometry manager that arranges widgets in a row/column grid. Syntax: grid .widget -row N -column N ?-rowspan N? ?-columnspan N? ?-sticky nsew? ?-padx N? ?-pady N?. Use grid columnconfigure / grid rowconfigure with -weight to make rows/columns expand. Most flexible Tk geometry manager; preferred for forms and dashboards.

**DE:** Geometry-Manager der Widgets in einem Zeilen/Spalten-Raster anordnet. Syntax: grid .widget -row N -column N ?-rowspan N? ?-columnspan N? ?-sticky nsew? ?-padx N? ?-pady N?. Mit grid columnconfigure / grid rowconfigure und -weight skalieren Zeilen/Spalten beim Resize. Flexibelster Geometry-Manager; bevorzugt fuer Formulare und Dashboards.

---

### pack

**EN:** Geometry manager that arranges widgets in horizontal or vertical strips inside their parent. Syntax: pack .widget ?-side top|bottom|left|right? ?-fill x|y|both|none? ?-expand 0|1? ?-padx N? ?-pady N? ?-anchor n|s|e|w|center?. Common pattern for simple top-down or side-by-side layouts. Use pack forget to remove a widget without destroying it.

**DE:** Geometry-Manager der Widgets in horizontalen oder vertikalen Streifen innerhalb des Eltern-Widgets anordnet. Syntax: pack .widget ?-side top|bottom|left|right? ?-fill x|y|both|none? ?-expand 0|1? ?-padx N? ?-pady N? ?-anchor n|s|e|w|center?. Verbreitetes Muster fuer einfache Top-Down- oder Nebeneinander-Layouts. Mit pack forget kann ein Widget ohne Zerstoerung entfernt werden.

---

### place

**EN:** Geometry manager for absolute or relative pixel positioning of widgets. Syntax: place .widget -x N -y N ?-width N? ?-height N? ?-relx 0..1? ?-rely 0..1? ?-relwidth 0..1? ?-relheight 0..1? ?-anchor nsew?. Used for free-form layouts (overlays, custom positioning). Does not auto-resize like pack/grid; useful for canvas-style layouts.

**DE:** Geometry-Manager fuer absolute oder relative Pixel-Positionierung von Widgets. Syntax: place .widget -x N -y N ?-width N? ?-height N? ?-relx 0..1? ?-rely 0..1? ?-relwidth 0..1? ?-relheight 0..1? ?-anchor nsew?. Verwendet fuer Frei-Form-Layouts (Overlays, eigene Positionierung). Kein Auto-Resize wie pack/grid; nuetzlich fuer Canvas-aehnliche Layouts.

---


## Grafik-Grundbegriffe / Graphics Fundamentals

### Antialiasing

**EN:** Rendering technique that smooths jagged edges of vector shapes by colouring boundary pixels with partial coverage values, producing the illusion of sub-pixel precision. Without antialiasing, diagonal lines and curves look stair-stepped. Tk Canvas does not antialias by default; `tko::path` does (enable via `set ::path::antialias 1`). Cairo and PDF output are antialiased throughout.

**DE:** Render-Technik, die ausgefranste Kanten von Vektorformen glaettet, indem Randpixel mit Teil-Deckungswerten gefaerbt werden, was die Illusion sub-pixel-genauer Praezision erzeugt. Ohne Antialiasing sehen diagonale Linien und Kurven treppenartig aus. Tk-Canvas antialiased per Default nicht; `tko::path` schon (aktivieren ueber `set ::path::antialias 1`). Cairo- und PDF-Output sind durchgaengig antialiased.

---

### Bounding Box

**EN:** Smallest axis-aligned rectangle that fully contains a graphical object — usually expressed as `{x1 y1 x2 y2}` with upper-left and lower-right corners. The Canvas `bbox` command returns this for items or item groups; PDF tools use it for hit-testing and clip regions. Useful for "does this fit", "where should this go", "what region needs redrawing".

**DE:** Kleinstes achsenparalleles Rechteck, das ein grafisches Objekt vollstaendig umschliesst — meist ausgedrueckt als `{x1 y1 x2 y2}` mit oberer-linker und unterer-rechter Ecke. Der Canvas-`bbox`-Befehl liefert sie fuer Items oder Item-Gruppen; PDF-Tools nutzen sie fuer Hit-Testing und Clip-Regionen. Nuetzlich fuer "passt das", "wo platziert man das", "welcher Bereich muss neu gezeichnet werden".

---

### DPI

**EN:** Dots Per Inch — pixel density measurement. Standard for screen rendering: 96 dpi (Windows/CSS convention) or 72 dpi (classic macOS/PostScript convention). PDF uses 72 dpi consistently (1 pt = 1/72 inch). Conversion between pixels and points needs a DPI assumption: at 96 dpi, 1 px = 0.75 pt; at 72 dpi, 1 px = 1 pt. High-DPI/Retina screens raise this to 144 or 192 dpi but the logical-pixel coordinate system usually still uses 96.

**DE:** Dots Per Inch — Pixel-Dichte-Mass. Standard fuer Bildschirm-Rendering: 96 dpi (Windows/CSS-Konvention) oder 72 dpi (klassische macOS-/PostScript-Konvention). PDF verwendet durchgaengig 72 dpi (1 pt = 1/72 Inch). Umrechnung zwischen Pixeln und Points braucht eine DPI-Annahme: bei 96 dpi ist 1 px = 0.75 pt; bei 72 dpi ist 1 px = 1 pt. High-DPI-/Retina-Bildschirme heben das auf 144 oder 192 dpi, aber das logische Pixel-Koordinatensystem nutzt meist weiter 96.

---

### Font-Backend (Cairo)

**EN:** Cairo's abstraction for font systems — FreeType (used on Linux/cross-platform), Win32 fonts (GDI), Quartz fonts (macOS Core Text), user fonts (custom rendering). The font backend handles glyph lookup, hinting, anti-aliasing. Decoupled from the surface backend: a PDF surface can use FreeType fonts; an X11 surface can use Quartz fonts in theory (in practice each platform usually pairs surface + font backends from the same OS). Configurable at Cairo build time.

**DE:** Cairos Abstraktion fuer Font-Systeme — FreeType (verwendet auf Linux/Cross-Plattform), Win32-Fonts (GDI), Quartz-Fonts (macOS Core Text), User-Fonts (eigene Renderer). Das Font-Backend uebernimmt Glyph-Lookup, Hinting, Anti-Aliasing. Entkoppelt vom Surface-Backend: eine PDF-Surface kann FreeType-Fonts nutzen; eine X11-Surface kann theoretisch Quartz-Fonts nutzen (in der Praxis paart jede Plattform meist Surface- + Font-Backends desselben OS). Konfigurierbar zur Cairo-Build-Zeit.

---

### Koordinatensystem (Tk vs PDF)

**EN:** Tk widgets, Canvas, and `tko::path` all use the same convention: origin (0,0) at top-left, x increases right, y increases downwards, unit is pixels. PDF's native convention is the opposite — origin at bottom-left, y increases upwards, unit is points (1/72 inch). `pdf4tcl`'s `-orient true` flag flips the PDF axis to match the Tk convention, removing the constant mental conversion. Recommendation: always use `-orient true` and treat PDF coordinates exactly like Canvas coordinates.

**DE:** Tk-Widgets, Canvas und `tko::path` verwenden alle dieselbe Konvention: Ursprung (0,0) oben links, x waechst nach rechts, y waechst nach unten, Einheit Pixel. PDFs native Konvention ist umgekehrt — Ursprung unten links, y waechst nach oben, Einheit Points (1/72 Inch). `pdf4tcl`s `-orient true`-Flag dreht die PDF-Achse so, dass sie der Tk-Konvention entspricht, was die staendige mentale Umrechnung erspart. Empfehlung: immer `-orient true` nutzen und PDF-Koordinaten genauso behandeln wie Canvas-Koordinaten.

---

### Surface-Backend (Cairo)

**EN:** Cairo's abstraction for output targets — image, PDF, SVG, PostScript, X11 window, Win32 DC, Quartz CGContext, OpenGL, etc. Each backend implements the Cairo drawing operations for its target medium. A drawing program writes Cairo calls once; choosing a different surface backend retargets to a different output. The `image` backend (rendering to an in-memory buffer) is always available and is the base for testing; others are optional and depend on system libraries.

**DE:** Cairos Abstraktion fuer Ausgabeziele — Image, PDF, SVG, PostScript, X11-Fenster, Win32-DC, Quartz-CGContext, OpenGL usw. Jedes Backend implementiert die Cairo-Zeichenoperationen fuer sein Zielmedium. Ein Zeichenprogramm schreibt Cairo-Aufrufe einmal; ein anderes Surface-Backend lenkt die Ausgabe auf ein anderes Ziel um. Das `image`-Backend (Rendering in einen In-Memory-Buffer) ist immer verfuegbar und Basis fuer Tests; andere sind optional und haengen von System-Bibliotheken ab.

---


## Grundlegende Begriffe / Basic Terms

### Interpreter

**EN:** The Tcl runtime environment that executes Tcl scripts and commands.

**DE:** Die Tcl-Laufzeitumgebung, die Tcl-Skripte und Befehle ausführt.

---

### Tcl (Tool Command Language)

**EN:** A dynamic scripting language designed for rapid prototyping, scripted applications, and GUIs. Pronounced "tickle."

**DE:** Eine dynamische Skriptsprache für schnelles Prototyping, Skriptanwendungen und grafische Benutzeroberflächen. Wird "Tickel" ausgesprochen.

---

### Tk (Toolkit)

**EN:** A cross-platform GUI toolkit that provides widgets for building graphical user interfaces with Tcl.

**DE:** Ein plattformübergreifendes GUI-Toolkit, das Widgets für die Erstellung grafischer Benutzeroberflächen mit Tcl bereitstellt.

---

### Widget

**EN:** A graphical user interface element such as a button, label, entry field, or window.

**DE:** Ein Element der grafischen Benutzeroberfläche wie ein Button, Label, Eingabefeld oder Fenster.

---


## Grundlegende Konzepte / Fundamental Concepts

### Interpreted Language

**EN:** Language where code is executed directly by interpreter without separate compilation step; Tcl can interpret or compile to bytecode at runtime.

**DE:** Sprache, bei der Code direkt vom Interpreter ausgeführt wird ohne separaten Kompilierungs-Schritt; Tcl kann interpretieren oder zur Laufzeit zu Bytecode kompilieren.

---

### Programming Language

**EN:** Tcl (Tool Command Language) is a dynamic, interpreted programming language designed for rapid prototyping, scripting, and GUI development; string-based with automatic type conversion.

**DE:** Tcl (Tool Command Language) ist eine dynamische, interpretierte Programmiersprache für schnelles Prototyping, Scripting und GUI-Entwicklung; string-basiert mit automatischer Typ-Konvertierung.

---

### Script

**EN:** Text file containing sequence of Tcl commands; typically saved with `.tcl` extension; executed by Tcl interpreter; can be run with `source filename.tcl` or `tclsh filename.tcl`.

**DE:** Textdatei mit Sequenz von Tcl-Befehlen; typischerweise mit `.tcl`-Endung gespeichert; ausgeführt vom Tcl-Interpreter; kann mit `source filename.tcl` oder `tclsh filename.tcl` ausgeführt werden.

---

### Scripting Language

**EN:** Type of programming language designed for automating tasks and rapid development; Tcl is a scripting language with interpreted execution and dynamic typing.

**DE:** Art von Programmiersprache für Automatisierung von Aufgaben und schnelle Entwicklung; Tcl ist eine Skriptsprache mit interpretierter Ausführung und dynamischer Typisierung.

---

### Tcl Script

**EN:** Program written in Tcl language; contains commands, procedures, and control structures; interpreted line-by-line or compiled to bytecode.

**DE:** Programm geschrieben in Tcl-Sprache; enthält Befehle, Prozeduren und Kontrollstrukturen; interpretiert Zeile-für-Zeile oder kompiliert zu Bytecode.

---


## Hash-Funktionen und Hash-Tables / Hash Functions and Hash Tables

### Checksum

**EN:** Hash value used to verify data integrity; detects accidental changes or corruption; common algorithms: md5, sha1, sha256, crc32.

**DE:** Hash-Wert zur Überprüfung von Datenintegrität; erkennt versehentliche Änderungen oder Korruption; häufige Algorithmen: md5, sha1, sha256, crc32.

---

### Hash

**EN:** 1) Hash function: algorithm converting data to fixed-size value (see md5, sha1, sha256); 2) Hash table: data structure for fast key-based lookup (Tcl arrays and dicts use hash tables internally).

**DE:** 1) Hash-Funktion: Algorithmus, der Daten in Wert fester Größe konvertiert (siehe md5, sha1, sha256); 2) Hash-Tabelle: Datenstruktur für schnelle schlüsselbasierte Suche (Tcl-Arrays und Dicts verwenden intern Hash-Tabellen).

---

### Hash Collision

**EN:** Situation where hash function produces same hash value for different inputs; resolved by chaining or open addressing in hash tables.

**DE:** Situation, wo Hash-Funktion denselben Hash-Wert für verschiedene Eingaben erzeugt; gelöst durch Chaining oder Open Addressing in Hash-Tabellen.

---

### Hash Function

**EN:** Cryptographic or non-cryptographic function mapping data to fixed-size hash value; used for checksums, data integrity, indexing; available via tcllib (md5, sha1, sha256).

**DE:** Kryptografische oder nicht-kryptografische Funktion, die Daten auf Hash-Wert fester Größe abbildet; verwendet für Checksums, Datenintegrität, Indexierung; verfügbar über tcllib (md5, sha1, sha256).

---

### md5

**EN:** Message Digest Algorithm 5; 128-bit cryptographic hash function; available in tcllib; produces 32-character hex string (e.g., `package require md5; md5::md5 -hex "data"`).

**DE:** Message Digest Algorithm 5; 128-Bit kryptografische Hash-Funktion; verfügbar in tcllib; erzeugt 32-Zeichen Hex-String (z.B. `package require md5; md5::md5 -hex "data"`).

---

### sha1

**EN:** Secure Hash Algorithm 1; 160-bit cryptographic hash function; available in tcllib; produces 40-character hex string.

**DE:** Secure Hash Algorithm 1; 160-Bit kryptografische Hash-Funktion; verfügbar in tcllib; erzeugt 40-Zeichen Hex-String.

---

### sha256

**EN:** Secure Hash Algorithm 256; 256-bit cryptographic hash function; stronger than md5/sha1; available in tcllib; produces 64-character hex string.

**DE:** Secure Hash Algorithm 256; 256-Bit kryptografische Hash-Funktion; stärker als md5/sha1; verfügbar in tcllib; erzeugt 64-Zeichen Hex-String.

---


## Häufige Widgets / Common Widgets

### Button

**EN:** A clickable widget that executes a command when pressed.

**DE:** Ein anklickbares Widget, das beim Drücken einen Befehl ausführt.

---

### Canvas

**EN:** A drawing widget for creating graphics, shapes, and custom visualizations.

**DE:** Ein Zeichnungs-Widget zum Erstellen von Grafiken, Formen und benutzerdefinierten Visualisierungen.

---

### Entry

**EN:** A single-line text input widget for user data entry.

**DE:** Ein einzeiliges Texteingabe-Widget für die Dateneingabe durch den Benutzer.

---

### Label

**EN:** A widget that displays text or images, typically non-interactive.

**DE:** Ein Widget, das Text oder Bilder anzeigt, normalerweise nicht interaktiv.

---

### Listbox

**EN:** A widget displaying a scrollable list of items from which users can select.

**DE:** Ein Widget, das eine scrollbare Liste von Elementen anzeigt, aus denen Benutzer auswählen können.

---

### Menu

**EN:** A widget providing a list of commands or options, often used in menu bars.

**DE:** Ein Widget, das eine Liste von Befehlen oder Optionen bereitstellt, oft in Menüleisten verwendet.

---

### Scale

**EN:** A slider widget allowing users to select a numeric value from a range.

**DE:** Ein Schieberegler-Widget, mit dem Benutzer einen numerischen Wert aus einem Bereich auswählen können.

---

### Text

**EN:** A multi-line text widget supporting formatted text, tags, and embedded widgets.

**DE:** Ein mehrzeiliges Text-Widget, das formatierten Text, Tags und eingebettete Widgets unterstützt.

---


## Index-Spezifikationen / Index Specifications

### +/- count chars/lines/words

**EN:** Relative index modifiers in text widget (e.g., `insert +5 chars`, `1.0 +3 lines`).

**DE:** Relative Index-Modifikatoren in Text-Widget (z.B. `insert +5 chars`, `1.0 +3 lines`).

---

### @x,y

**EN:** Index at screen coordinates x,y relative to widget.

**DE:** Index an Bildschirmkoordinaten x,y relativ zu Widget.

---

### end

**EN:** Special index referring to position after last character/item (e.g., `end` in text, listbox, entry).

**DE:** Spezieller Index, der auf Position nach letztem Zeichen/Element verweist (z.B. `end` in Text, Listbox, Entry).

---

### insert

**EN:** Special index referring to current insertion cursor position in text or entry widget.

**DE:** Spezieller Index, der auf aktuelle Einfügecursor-Position in Text- oder Entry-Widget verweist.

---

### line.char

**EN:** Text widget index format: line number (1-based) and character position (0-based) (e.g., `1.0`, `5.12`).

**DE:** Text-Widget-Index-Format: Zeilennummer (1-basiert) und Zeichenposition (0-basiert) (z.B. `1.0`, `5.12`).

---

### linestart / lineend

**EN:** Text widget modifiers for start/end of line (e.g., `insert linestart`).

**DE:** Text-Widget-Modifikatoren für Anfang/Ende der Zeile (z.B. `insert linestart`).

---

### wordstart / wordend

**EN:** Text widget modifiers for start/end of word (e.g., `insert wordstart`).

**DE:** Text-Widget-Modifikatoren für Anfang/Ende des Wortes (z.B. `insert wordstart`).

---


## Info-Befehle / Info Commands

### info args

**EN:** Return list of argument names for specified procedure.

**DE:** Liste der Argumentnamen für angegebene Prozedur zurückgeben.

---

### info body

**EN:** Return body (implementation) of specified procedure.

**DE:** Body (Implementierung) der angegebenen Prozedur zurückgeben.

---

### info commands

**EN:** Return list of all defined commands, optionally matching pattern.

**DE:** Liste aller definierten Befehle zurückgeben, optional mit Muster-Abgleich.

---

### info coroutine

**EN:** Return the name of the currently running coroutine, or empty if not inside one. Syntax: info coroutine. Used inside a coroutine to find its own command name (for example to register itself with an event handler).

**DE:** Liefert den Namen der aktuell laufenden Coroutine, oder leer wenn ausserhalb. Syntax: info coroutine. Innerhalb einer Coroutine genutzt um den eigenen Kommandonamen zu finden (z.B. um sich bei einem Event-Handler anzumelden).

---

### info default

**EN:** Check if procedure argument has default value and return it.

**DE:** Prüfen, ob Prozedur-Argument Standardwert hat und diesen zurückgeben.

---

### info exists

**EN:** Test if variable exists in current scope (e.g., `info exists myvar`).

**DE:** Testen, ob Variable im aktuellen Gültigkeitsbereich existiert (z.B. `info exists myvar`).

---

### info globals

**EN:** Return list of all global variables, optionally matching pattern.

**DE:** Liste aller globalen Variablen zurückgeben, optional mit Muster-Abgleich.

---

### info hostname

**EN:** Return network hostname of current machine.

**DE:** Netzwerk-Hostnamen der aktuellen Maschine zurückgeben.

---

### info locals

**EN:** Return list of local variables in current procedure.

**DE:** Liste lokaler Variablen in aktueller Prozedur zurückgeben.

---

### info nameofexecutable

**EN:** Return full path of Tcl executable.

**DE:** Vollständigen Pfad der Tcl-Ausführungsdatei zurückgeben.

---

### info object

**EN:** TclOO introspection ensemble. Subcommands: info object class, methods, vars, namespace, isa, definition, mixins, filters, forward. Used to query an object's class, what methods it responds to, what state it holds. Counterpart for class introspection: info class.

**DE:** TclOO-Introspektions-Ensemble. Subkommandos: info object class, methods, vars, namespace, isa, definition, mixins, filters, forward. Verwendet um die Klasse eines Objekts, seine Methoden und seinen Zustand zu erfragen. Gegenstueck fuer Klassen-Introspektion: info class.

---

### info patchlevel

**EN:** Return Tcl version including patch level (e.g., "8.6.13").

**DE:** Tcl-Version inklusive Patch-Level zurückgeben (z.B. "8.6.13").

---

### info procs

**EN:** Return list of defined procedures, optionally matching pattern.

**DE:** Liste definierter Prozeduren zurückgeben, optional mit Muster-Abgleich.

---

### info script

**EN:** Return name of currently executing script file.

**DE:** Namen der aktuell ausgeführten Skript-Datei zurückgeben.

---

### info sharedlibextension

**EN:** Return platform-specific shared library extension (.so, .dll, .dylib).

**DE:** Plattformspezifische Shared-Library-Endung zurückgeben (.so, .dll, .dylib).

---

### info tclversion

**EN:** Return major.minor Tcl version (e.g., "8.6").

**DE:** Major.Minor Tcl-Version zurückgeben (z.B. "8.6").

---

### info vars

**EN:** Return list of all variables in scope, optionally matching pattern.

**DE:** Liste aller Variablen im Gültigkeitsbereich zurückgeben, optional mit Muster-Abgleich.

---


## Interpreter und Alias / Interpreter and Alias

### Alias

**EN:** Alternative name for command; shortcuts for frequently used commands; shell aliases: `alias ll='ls -la'`; Tcl interpreter aliases: `interp alias {} ll {} ls -la`; simplifies complex commands; improves productivity; deleted with unalias.

**DE:** Alternativer Name für Befehl; Shortcuts für häufig verwendete Befehle; Shell-Aliases: `alias ll='ls -la'`; Tcl-Interpreter-Aliases: `interp alias {} ll {} ls -la`; vereinfacht komplexe Befehle; verbessert Produktivität; gelöscht mit unalias.

---

### Interpreter (Extended)

**EN:** Program executing scripts; Tcl interpreter executes Tcl code; tclsh (console), wish (GUI); can be embedded in applications; manages memory, bytecode, commands; multiple interpreters possible (safe interpreters); C API: Tcl_CreateInterp; fundamental to Tcl architecture.

**DE:** Programm, das Skripte ausführt; Tcl-Interpreter führt Tcl-Code aus; tclsh (Konsole), wish (GUI); kann in Anwendungen eingebettet werden; verwaltet Speicher, Bytecode, Befehle; mehrere Interpreter möglich (Safe-Interpreter); C-API: Tcl_CreateInterp; fundamental für Tcl-Architektur.

---

### interp alias

**EN:** Create command alias in interpreter; syntax: `interp alias {slave} {srcCmd} {targetInterp} {targetCmd} ?args?`; maps one command to another; can add default arguments; useful for customization; example: `interp alias {} ? {} info commands`.

**DE:** Befehls-Alias im Interpreter erstellen; Syntax: `interp alias {slave} {srcCmd} {targetInterp} {targetCmd} ?args?`; bildet einen Befehl auf anderen ab; kann Standard-Argumente hinzufügen; nützlich für Anpassung; Beispiel: `interp alias {} ? {} info commands`.

---

### interp aliases

**EN:** List all aliases defined in a slave interpreter. Syntax: interp aliases interpName. Returns a list of alias names (as known in the slave). Used to introspect a slave interpreter or to verify expected aliases were created.

**DE:** Listet alle Aliase eines Slave-Interpreters auf. Syntax: interp aliases interpName. Liefert eine Liste der Alias-Namen (wie im Slave bekannt). Verwendet zur Introspektion eines Slave-Interpreters oder zur Verifikation erwarteter Aliase.

---

### interp expose

**EN:** Make a hidden command visible in a slave interpreter. Syntax: interp expose interpName cmdName ?asName?. Counterpart to `interp hide`. Used by safe interpreter setup to selectively unhide commands like file operations after policies are loaded.

**DE:** Macht ein verstecktes Kommando in einem Slave-Interpreter sichtbar. Syntax: interp expose interpName cmdName ?asName?. Gegenstueck zu `interp hide`. Verwendet bei Safe-Interpreter-Setup um z.B. file-Operationen selektiv freizuschalten nachdem Policies geladen sind.

---

### interp hide

**EN:** Make a command invisible in a slave interpreter (still callable via `interp invokehidden`). Syntax: interp hide interpName cmdName ?asName?. The hidden command is no longer accessible to scripts in the slave but the master can still invoke it. Used for privileged operations.

**DE:** Macht ein Kommando in einem Slave-Interpreter unsichtbar (noch ueber `interp invokehidden` aufrufbar). Syntax: interp hide interpName cmdName ?asName?. Skripte im Slave koennen es nicht mehr aufrufen, der Master schon. Verwendet fuer privilegierte Operationen.

---

### interp invokehidden

**EN:** Invoke a hidden command in a slave interpreter from the master. Syntax: interp invokehidden interpName ?-namespace ns? ?-global? cmdName ?args...?. Bypasses the slave's hide policy. The fundamental tool for safe interpreters that need controlled access to dangerous operations.

**DE:** Ruft ein verstecktes Kommando in einem Slave-Interpreter vom Master aus auf. Syntax: interp invokehidden interpName ?-namespace ns? ?-global? cmdName ?args...?. Umgeht die Hide-Policy. Grundwerkzeug fuer Safe-Interpreter die kontrollierten Zugriff auf gefaehrliche Operationen brauchen.

---

### interp issafe

**EN:** Test whether an interpreter is a safe interpreter. Syntax: interp issafe ?interpName?. Returns 1 if it was created with -safe. Used to branch behavior between trusted and untrusted contexts.

**DE:** Prueft ob ein Interpreter ein Safe-Interpreter ist. Syntax: interp issafe ?interpName?. Liefert 1 wenn er mit -safe erstellt wurde. Verwendet um zwischen trusted und untrusted Kontexten zu unterscheiden.

---

### interp limit

**EN:** Set time or command-execution limits on a slave interpreter (sandbox). Syntax: interp limit interpName time|commands ?-value N? ?-granularity N? ?-seconds T? ?-milliseconds T? ?-command script?. The -command script runs when the limit is hit. Used to constrain untrusted code in a safe interpreter.

**DE:** Setzt Zeit- oder Kommando-Limits auf einen Slave-Interpreter (Sandbox). Syntax: interp limit interpName time|commands ?-value N? ?-granularity N? ?-seconds T? ?-milliseconds T? ?-command script?. Das -command Skript laeuft beim Erreichen des Limits. Verwendet um unvertrauten Code in einem Safe-Interpreter zu beschraenken.

---

### interp recursionlimit

**EN:** Get or set the maximum command-call nesting depth for an interpreter. Syntax: interp recursionlimit interpName ?newLimit?. Default is 1000. Reaching the limit raises "too many nested evaluations". Used to detect runaway recursion or to allow deep nesting in known-safe scripts.

**DE:** Liefert oder setzt die maximale Kommando-Aufruf-Verschachtelungstiefe eines Interpreters. Syntax: interp recursionlimit interpName ?newLimit?. Standard ist 1000. Bei Erreichen: "too many nested evaluations". Verwendet zur Erkennung von Endlosrekursion oder bei bewusst tiefer Verschachtelung.

---

### interp share

**EN:** Share an open channel between interpreters. Syntax: interp share fromInterp channelId toInterp. The channel remains usable in both interpreters; closing it in one does not close it in the other. Each share increments a reference count.

**DE:** Teilt einen offenen Kanal zwischen Interpretern. Syntax: interp share fromInterp channelId toInterp. Der Kanal bleibt in beiden Interpretern nutzbar; schliessen in einem schliesst ihn nicht im anderen. Jedes Share erhoeht einen Referenz-Zaehler.

---

### interp transfer

**EN:** Move an open channel from one interpreter to another. Syntax: interp transfer fromInterp channelId toInterp. After transfer, the channel is no longer available in fromInterp. Contrast with interp share where it stays in both.

**DE:** Verschiebt einen offenen Kanal von einem Interpreter zum anderen. Syntax: interp transfer fromInterp channelId toInterp. Nach dem Transfer ist der Kanal in fromInterp nicht mehr verfuegbar. Im Gegensatz zu interp share wo er in beiden bleibt.

---


## Konfiguration und Optionen / Configuration and Options

### Configure

**EN:** To set or modify widget options after creation using the `configure` command.

**DE:** Optionen eines Widgets nach der Erstellung mit dem `configure`-Befehl setzen oder ändern.

---

### Option

**EN:** A configuration parameter for a widget, such as `-text`, `-width`, or `-foreground`.

**DE:** Ein Konfigurationsparameter für ein Widget, wie `-text`, `-width` oder `-foreground`.

---

### cget

**EN:** Command to retrieve the current value of a widget option.

**DE:** Befehl zum Abrufen des aktuellen Werts einer Widget-Option.

---


## Kontrollstrukturen / Control Structures

### break

**EN:** Immediately exit from loop or switch statement.

**DE:** Sofortiger Ausstieg aus Schleife oder Switch-Anweisung.

---

### catch

**EN:** Trap errors and prevent script termination (e.g., `catch {risky_command} result`).

**DE:** Fehler abfangen und Skript-Abbruch verhindern (z.B. `catch {risky_command} result`).

---

### continue

**EN:** Skip remainder of current loop iteration and proceed to next iteration.

**DE:** Rest der aktuellen Schleifenausführung überspringen und zur nächsten Iteration übergehen.

---

### else

**EN:** Alternative branch in if statement; executes when if condition is false.

**DE:** Alternative Verzweigung in if-Anweisung; wird ausgeführt, wenn if-Bedingung falsch ist.

---

### elseif

**EN:** Additional conditional branch; checked if previous conditions are false.

**DE:** Zusätzliche bedingte Verzweigung; wird überprüft, wenn vorherige Bedingungen falsch sind.

---

### error

**EN:** Generate error and throw exception with message (e.g., `error "Invalid input"`).

**DE:** Fehler erzeugen und Ausnahme mit Nachricht werfen (z.B. `error "Invalid input"`).

---

### for

**EN:** Loop with initialization, condition, and increment (e.g., `for {set i 0} {$i < 10} {incr i} {...}`).

**DE:** Schleife mit Initialisierung, Bedingung und Inkrement (z.B. `for {set i 0} {$i < 10} {incr i} {...}`).

---

### foreach

**EN:** Loop that iterates over list elements (e.g., `foreach item $list {puts $item}`).

**DE:** Schleife, die über Listenelemente iteriert (z.B. `foreach item $list {puts $item}`).

---

### if

**EN:** Conditional statement; executes code block if condition is true (e.g., `if {$x > 0} {puts "positive"}`).

**DE:** Bedingte Anweisung; führt Codeblock aus, wenn Bedingung wahr ist (z.B. `if {$x > 0} {puts "positive"}`).

---

### return

**EN:** Exit from procedure and optionally return a value (e.g., `return $result`).

**DE:** Aus Prozedur aussteigen und optional einen Wert zurückgeben (z.B. `return $result`).

---

### switch

**EN:** Multi-way conditional; matches value against multiple patterns (e.g., `switch $color {red {...} blue {...}}`).

**DE:** Mehrfachverzweigung; vergleicht Wert mit mehreren Mustern (z.B. `switch $color {red {...} blue {...}}`).

---

### try

**EN:** Modern error handling; execute code with trap, finally, and on clauses (Tcl 8.6+).

**DE:** Moderne Fehlerbehandlung; Code mit trap-, finally- und on-Klauseln ausführen (Tcl 8.6+).

---

### while

**EN:** Loop that repeats code block while condition remains true (e.g., `while {$i < 10} {incr i}`).

**DE:** Schleife, die Codeblock wiederholt, solange Bedingung wahr bleibt (z.B. `while {$i < 10} {incr i}`).

---


## Koordinaten und Einheiten / Coordinates and Units

### Centimeter (c)

**EN:** Metric unit; one centimeter on the display.

**DE:** Metrische Einheit; ein Zentimeter auf dem Display.

---

### Coordinate

**EN:** A numerical position in 2D space, specified as x and y values (e.g., `100 50`).

**DE:** Eine numerische Position im 2D-Raum, angegeben als x- und y-Werte (z.B. `100 50`).

---

### Inch (i)

**EN:** Imperial unit; one inch on the display.

**DE:** Imperiale Einheit; ein Zoll auf dem Display.

---

### Millimeter (m)

**EN:** Metric unit; one millimeter on the display.

**DE:** Metrische Einheit; ein Millimeter auf dem Display.

---

### Pixel (px)

**EN:** The default unit of measurement; one screen pixel.

**DE:** Die Standard-Maßeinheit; ein Bildschirmpixel.

---

### Point (p)

**EN:** A typographical unit equal to 1/72 of an inch.

**DE:** Eine typografische Einheit gleich 1/72 Zoll.

---

### Units

**EN:** Specification of measurement system for dimensions (pixels by default, but can be points, cm, mm, inches).

**DE:** Spezifikation des Maßsystems für Dimensionen (standardmäßig Pixel, kann aber Punkte, cm, mm, Zoll sein).

---

### X-Coordinate

**EN:** Horizontal position measured from the left edge of the window or canvas.

**DE:** Horizontale Position, gemessen vom linken Rand des Fensters oder Canvas.

---

### Y-Coordinate

**EN:** Vertical position measured from the top edge of the window or canvas.

**DE:** Vertikale Position, gemessen vom oberen Rand des Fensters oder Canvas.

---


## Linien und Muster / Lines and Patterns

### Cap Style (capstyle)

**EN:** Appearance of line ends; options include `butt`, `projecting`, or `round`.

**DE:** Aussehen der Linienenden; Optionen umfassen `butt`, `projecting` oder `round`.

---

### Dash

**EN:** Pattern specification for dashed lines, defined as a list of pixel lengths (e.g., `-dash {5 2}` for 5 pixels on, 2 off).

**DE:** Musterspezifikation für gestrichelte Linien, definiert als Liste von Pixellängen (z.B. `-dash {5 2}` für 5 Pixel an, 2 aus).

---

### Dash-Dot

**EN:** Line pattern alternating between dashes and dots.

**DE:** Linienmuster, das zwischen Strichen und Punkten wechselt.

---

### Dot

**EN:** Line pattern consisting of small dots with gaps.

**DE:** Linienmuster bestehend aus kleinen Punkten mit Lücken.

---

### Join Style (joinstyle)

**EN:** Appearance of line corners where segments meet; options include `miter`, `bevel`, or `round`.

**DE:** Aussehen der Linienecken, wo Segmente sich treffen; Optionen umfassen `miter`, `bevel` oder `round`.

---

### Solid

**EN:** Continuous line style without gaps; the default line style.

**DE:** Durchgehender Linienstil ohne Lücken; der Standard-Linienstil.

---

### Width

**EN:** Thickness of a line or border, specified in pixels or other units.

**DE:** Dicke einer Linie oder eines Rahmens, angegeben in Pixeln oder anderen Einheiten.

---


## Listen-Operationen / List Operations

### join

**EN:** Join list elements into string with separator (e.g., `join {a b c} ","` = `a,b,c`).

**DE:** Listenelemente in String mit Trennzeichen zusammenfügen (z.B. `join {a b c} ","` = `a,b,c`).

---

### lappend

**EN:** Append elements to end of list variable (e.g., `lappend mylist item1 item2`).

**DE:** Elemente am Ende der Listen-Variable anhängen (z.B. `lappend mylist item1 item2`).

---

### lindex

**EN:** Retrieve element at specified index from list (e.g., `lindex $mylist 0`).

**DE:** Element am angegebenen Index aus Liste abrufen (z.B. `lindex $mylist 0`).

---

### linsert

**EN:** Insert elements into list at specified position (e.g., `linsert $mylist 2 newitem`).

**DE:** Elemente an angegebener Position in Liste einfügen (z.B. `linsert $mylist 2 newitem`).

---

### llength

**EN:** Return number of elements in list (e.g., `llength $mylist`).

**DE:** Anzahl der Elemente in Liste zurückgeben (z.B. `llength $mylist`).

---

### lrange

**EN:** Extract sublist from start to end index (e.g., `lrange $mylist 1 3`).

**DE:** Teilliste von Start- bis End-Index extrahieren (z.B. `lrange $mylist 1 3`).

---

### lrepeat

**EN:** Create list by repeating elements specified number of times (e.g., `lrepeat 5 0` = `0 0 0 0 0`).

**DE:** Liste erstellen durch Wiederholen von Elementen angegebene Anzahl Male (z.B. `lrepeat 5 0` = `0 0 0 0 0`).

---

### lreplace

**EN:** Replace list elements in range with new elements (e.g., `lreplace $mylist 1 2 new1 new2`).

**DE:** Listenelemente im Bereich durch neue Elemente ersetzen (z.B. `lreplace $mylist 1 2 new1 new2`).

---

### lreverse

**EN:** Reverse order of list elements (e.g., `lreverse {a b c}` = `c b a`).

**DE:** Reihenfolge der Listenelemente umkehren (z.B. `lreverse {a b c}` = `c b a`).

---

### lsearch

**EN:** Search list for element matching pattern; returns index or -1 (e.g., `lsearch $mylist "pattern"`).

**DE:** Liste nach Element durchsuchen, das Muster entspricht; gibt Index oder -1 zurück (z.B. `lsearch $mylist "pattern"`).

---

### lsort

**EN:** Sort list elements; options include `-ascii`, `-integer`, `-real`, `-increasing`, `-decreasing`.

**DE:** Listenelemente sortieren; Optionen umfassen `-ascii`, `-integer`, `-real`, `-increasing`, `-decreasing`.

---

### split

**EN:** Split string into list using delimiter (e.g., `split "a,b,c" ","` = `a b c`).

**DE:** String in Liste aufteilen mit Trennzeichen (z.B. `split "a,b,c" ","` = `a b c`).

---


## Listen-Subcommands / List Subcommands

### lassign

**EN:** Assign list elements to variables (e.g., `lassign $list var1 var2 var3`).

**DE:** Listenelemente Variablen zuweisen (z.B. `lassign $list var1 var2 var3`).

---

### lcontains

**EN:** Tcl 8.7+ command to test list membership. Syntax: lcontains list element. Returns 1 if the element appears in the list (exact equality), 0 otherwise. Cleaner than `expr {$elem in $list}` for one-off tests; equivalent to `lsearch -exact $list $elem >= 0`.

**DE:** Tcl-8.7+-Kommando zur Pruefung der Listen-Mitgliedschaft. Syntax: lcontains list element. Liefert 1 wenn das Element in der Liste vorkommt (exakte Gleichheit), 0 sonst. Sauberer als `expr {$elem in $list}` bei einmaligen Tests; aequivalent zu `lsearch -exact $list $elem >= 0`.

---

### ledit

**EN:** Tcl 9 list command: in-place edit of a list element. Syntax: ledit listVar first last ?element...?. Combines lreplace and assignment in one operation, avoiding the typical `set list [lreplace $list i j ...]` pattern. Returns the new list. Tcl 9+.

**DE:** Tcl-9-Listen-Kommando: In-Place-Bearbeitung eines Listen-Elements. Syntax: ledit listVar first last ?element...?. Kombiniert lreplace und Zuweisung in einer Operation; ersetzt das uebliche `set list [lreplace $list i j ...]`-Muster. Liefert die neue Liste. Tcl 9+.

---

### lmap

**EN:** Map command over list elements, collecting results (e.g., `lmap x $list {expr {$x * 2}}`).

**DE:** Befehl über Listenelemente abbilden, Ergebnisse sammeln (z.B. `lmap x $list {expr {$x * 2}}`).

---

### lpop

**EN:** Tcl 8.7+ list command: remove and return the last element of a list (or any specified index). Syntax: lpop listVar ?index?. Without index: removes and returns the last element. With index: removes and returns at that index (supports end, end-N).

**DE:** Tcl-8.7+-Listen-Kommando: Entfernt das letzte Element einer Liste (oder ein angegebener Index) und liefert es zurueck. Syntax: lpop listVar ?index?. Ohne Index: entfernt und liefert das letzte Element. Mit Index: entfernt und liefert an dem Index (unterstuetzt end, end-N).

---

### lsearch -inline

**EN:** lsearch option that returns the matching elements themselves instead of their indices. Syntax: lsearch -inline ?-options? list pattern. With -all: returns all matching elements. Combined with -nocase, -exact, -glob, -regexp, -regexp -inline -all is a quick filter.

**DE:** lsearch-Option die die treffenden Elemente selbst statt ihrer Indices liefert. Syntax: lsearch -inline ?-options? list pattern. Mit -all: liefert alle treffenden Elemente. Kombiniert mit -nocase, -exact, -glob, -regexp; -regexp -inline -all ist ein schneller Filter.

---

### lset

**EN:** Set element in list at index to new value (e.g., `lset mylist 2 "newvalue"`).

**DE:** Element in Liste an Index auf neuen Wert setzen (z.B. `lset mylist 2 "newvalue"`).

---

### lsort -unique

**EN:** lsort option that removes duplicates after sorting. Syntax: lsort -unique ?-options? list. Combined with -nocase, -decreasing, -dictionary, -integer, -real. Common idiom to dedupe a list: lsort -unique $list. For unsorted dedupe, see lreverse + lsort tricks.

**DE:** lsort-Option die Duplikate nach dem Sortieren entfernt. Syntax: lsort -unique ?-options? list. Kombiniert mit -nocase, -decreasing, -dictionary, -integer, -real. Idiom zum Deduplizieren: lsort -unique $list. Fuer unsortiertes Dedupe siehe lreverse + lsort-Tricks.

---


## Math-Funktionen / Math Functions

### abs

**EN:** Absolute value function (e.g., `expr {abs(-5)}` = 5).

**DE:** Absolutwert-Funktion (z.B. `expr {abs(-5)}` = 5).

---

### acos / asin / atan / atan2

**EN:** Inverse trigonometric functions; atan2 takes y,x arguments for full circle range.

**DE:** Inverse trigonometrische Funktionen; atan2 nimmt y,x-Argumente für vollen Kreisbereich.

---

### ceil / floor

**EN:** Round up/down to nearest integer (e.g., `ceil 4.2` = 5, `floor 4.8` = 4).

**DE:** Auf nächste Ganzzahl auf-/abrunden (z.B. `ceil 4.2` = 5, `floor 4.8` = 4).

---

### cos / sin / tan

**EN:** Basic trigonometric functions; arguments in radians.

**DE:** Grundlegende trigonometrische Funktionen; Argumente in Radiant.

---

### cosh / sinh / tanh

**EN:** Hyperbolic trigonometric functions.

**DE:** Hyperbolische trigonometrische Funktionen.

---

### exp / log / log10

**EN:** Exponential (e^x), natural logarithm, base-10 logarithm functions.

**DE:** Exponential (e^x), natürlicher Logarithmus, Basis-10-Logarithmus-Funktionen.

---

### expr division (integer vs floating-point)

**EN:** In Tcl `expr`, dividing two integers uses integer division (`5/2` → 2); if any operand is floating-point, the result is floating-point (`5.0/2` → 2.5). Use explicit double() or decimal literals when fractional results are required.

**DE:** In Tcl `expr` ist Division zweier Ganzzahlen ganzzahlig (`5/2` → 2); ist ein Operand Fließkomma, ist das Ergebnis Fließkomma (`5.0/2` → 2.5). Für Bruchteile double() oder Dezimal-Literale verwenden.

---

### int / double

**EN:** Convert to integer/floating-point (e.g., `expr {int(4.7)}` = 4).

**DE:** In Ganzzahl/Gleitkommazahl konvertieren (z.B. `expr {int(4.7)}` = 4).

---

### min / max

**EN:** Return minimum/maximum of arguments (Tcl 8.5+; e.g., `expr {min(5, 3, 8)}` = 3).

**DE:** Minimum/Maximum der Argumente zurückgeben (Tcl 8.5+; z.B. `expr {min(5, 3, 8)}` = 3).

---

### pow

**EN:** Power function; equivalent to ** operator (e.g., `pow(2, 8)` = 256).

**DE:** Potenz-Funktion; äquivalent zu **-Operator (z.B. `pow(2, 8)` = 256).

---

### rand / srand

**EN:** Generate random float 0.0-1.0; srand seeds random number generator.

**DE:** Zufällige Gleitkommazahl 0.0-1.0 erzeugen; srand initialisiert Zufallszahlengenerator.

---

### round

**EN:** Round to nearest integer (e.g., `round 4.5` = 5, `round 4.4` = 4).

**DE:** Auf nächste Ganzzahl runden (z.B. `round 4.5` = 5, `round 4.4` = 4).

---

### sqrt

**EN:** Square root function (e.g., `expr {sqrt(16)}` = 4.0).

**DE:** Quadratwurzel-Funktion (z.B. `expr {sqrt(16)}` = 4.0).

---

### wide / entier

**EN:** Convert to wide integer (64-bit) / exact integer representation.

**DE:** In Wide-Integer (64-Bit) / exakte Ganzzahl-Darstellung konvertieren.

---


## Menü-Begriffe / Menu Terms

### Accelerator

**EN:** Keyboard shortcut text displayed next to menu item (for display only, binding must be done separately).

**DE:** Tastaturkürzel-Text, der neben Menüelement angezeigt wird (nur zur Anzeige, Binding muss separat erfolgen).

---

### Cascade

**EN:** Menu entry that opens a submenu when selected.

**DE:** Menüeintrag, der ein Untermenü öffnet, wenn er ausgewählt wird.

---

### Checkbutton Entry

**EN:** Menu item with checkbox that toggles on/off state.

**DE:** Menüelement mit Checkbox, das einen Ein/Aus-Zustand umschaltet.

---

### Command Entry

**EN:** Menu item that executes a command when selected.

**DE:** Menüelement, das einen Befehl ausführt, wenn es ausgewählt wird.

---

### Invoke

**EN:** Programmatically activate a menu entry as if user selected it.

**DE:** Einen Menüeintrag programmatisch aktivieren, als ob Benutzer ihn ausgewählt hätte.

---

### Menubar

**EN:** Horizontal menu typically at top of window containing menu items.

**DE:** Horizontales Menü typischerweise oben im Fenster, das Menüelemente enthält.

---

### Menubutton

**EN:** Button widget that displays a menu when clicked.

**DE:** Button-Widget, das ein Menü anzeigt, wenn es geklickt wird.

---

### Popup Menu

**EN:** Context menu that appears at mouse position, typically on right-click.

**DE:** Kontextmenü, das an Mausposition erscheint, typischerweise bei Rechtsklick.

---

### Post

**EN:** Display a menu at specific screen coordinates.

**DE:** Ein Menü an bestimmten Bildschirmkoordinaten anzeigen.

---

### Radiobutton Entry

**EN:** Menu item that's part of mutually exclusive group selection.

**DE:** Menüelement, das Teil einer sich gegenseitig ausschließenden Gruppenauswahl ist.

---

### Separator

**EN:** Horizontal line dividing menu sections for visual organization.

**DE:** Horizontale Linie, die Menüabschnitte zur visuellen Organisation trennt.

---

### Tearoff

**EN:** Feature allowing menu to be detached into separate window; enabled/disabled with `-tearoff` option.

**DE:** Funktion, die es erlaubt, Menü in separates Fenster abzutrennen; aktiviert/deaktiviert mit `-tearoff`-Option.

---

### Underline

**EN:** Character position in menu label to underline for keyboard mnemonics.

**DE:** Zeichenposition im Menü-Label zum Unterstreichen für Tastatur-Mnemonics.

---

### Unpost

**EN:** Remove a posted menu from display.

**DE:** Ein angezeigtes Menü von der Anzeige entfernen.

---


## NLP und Text-Verarbeitung / NLP and Text Processing

### Lexer (Lexical Analyzer)

**EN:** Program converting character sequence into token sequence; first phase of parsing; implementable in Tcl with regexp and string commands.

**DE:** Programm, das Zeichen-Sequenz in Token-Sequenz konvertiert; erste Phase des Parsings; implementierbar in Tcl mit regexp und String-Befehlen.

---

### NLP (Natural Language Processing)

**EN:** Computational processing of human language; Tcl used for text manipulation, tokenization, parsing in NLP pipelines; tcllib provides text processing tools.

**DE:** Rechnerische Verarbeitung menschlicher Sprache; Tcl verwendet für Text-Manipulation, Tokenisierung, Parsing in NLP-Pipelines; tcllib bietet Text-Verarbeitungs-Tools.

---

### Parser

**EN:** Program analyzing text structure according to grammar rules; Tcl suitable for writing parsers using string operations and regular expressions.

**DE:** Programm, das Text-Struktur nach Grammatik-Regeln analysiert; Tcl geeignet zum Schreiben von Parsern mit String-Operationen und regulären Ausdrücken.

---

### Regular Expression (NLP Context)

**EN:** Pattern matching tool essential for NLP tasks; Tcl's `regexp` and `regsub` commands powerful for text extraction and transformation.

**DE:** Mustererkennungs-Tool essentiell für NLP-Aufgaben; Tcls `regexp`- und `regsub`-Befehle mächtig für Text-Extraktion und -Transformation.

---

### String Matching

**EN:** Finding patterns in text; fundamental NLP operation; Tcl provides `string match`, `regexp`, `string first/last` for various matching needs.

**DE:** Finden von Mustern in Text; fundamentale NLP-Operation; Tcl bietet `string match`, `regexp`, `string first/last` für verschiedene Matching-Bedürfnisse.

---

### Text Corpus

**EN:** Large collection of text used for linguistic analysis; Tcl can process text corpora with file I/O and string operations.

**DE:** Große Sammlung von Text für linguistische Analyse; Tcl kann Text-Korpora mit File-I/O und String-Operationen verarbeiten.

---

### Token

**EN:** Individual meaningful unit from text (word, punctuation, etc.); result of tokenization process.

**DE:** Einzelne bedeutungsvolle Einheit aus Text (Wort, Interpunktion, etc.); Ergebnis des Tokenisierungs-Prozesses.

---

### Tokenization

**EN:** Process of splitting text into words, phrases, or symbols (tokens); in Tcl: `split`, `regexp`, or custom procedures.

**DE:** Prozess des Aufteilens von Text in Wörter, Phrasen oder Symbole (Token); in Tcl: `split`, `regexp` oder eigene Prozeduren.

---


## Namespaces

### namespace children

**EN:** List all child namespaces of a namespace. Syntax: namespace children ?namespace? ?pattern?. Without arguments: children of the current namespace. With pattern: glob-filter. Used to discover module sub-namespaces or to walk the namespace tree.

**DE:** Listet alle Kind-Namespaces eines Namespace auf. Syntax: namespace children ?namespace? ?pattern?. Ohne Argumente: Kinder des aktuellen Namespace. Mit Pattern: Glob-Filter. Verwendet um Modul-Sub-Namespaces zu entdecken oder den Namespace-Baum zu durchwandern.

---

### namespace current

**EN:** Return the fully qualified name of the namespace currently in effect. Syntax: namespace current. At top level: returns `::`. Inside a namespace eval block: returns `::namespace_name`. Useful in metaprogramming and in procs that need to know their own home.

**DE:** Liefert den voll qualifizierten Namen des aktuell gueltigen Namespace. Syntax: namespace current. Auf Top-Level: liefert `::`. Innerhalb namespace eval: liefert `::namespace_name`. Nuetzlich in Metaprogrammierung und in Procs die ihren eigenen Heimat-Namespace kennen muessen.

---

### namespace exists

**EN:** Test whether a namespace exists. Syntax: namespace exists name. Returns 1 or 0. Used to guard against creating duplicate namespaces or to check for optional modules.

**DE:** Prueft ob ein Namespace existiert. Syntax: namespace exists name. Liefert 1 oder 0. Verwendet um Duplikat-Namespaces zu vermeiden oder optionale Module zu pruefen.

---

### namespace export

**EN:** Declare which commands of the current namespace are visible to namespace import. Syntax: namespace export ?-clear? ?pattern...?. Patterns match command names within this namespace. Without -clear: adds to existing exports. With -clear: replaces. Without arguments: lists current exports. By default nothing is exported.

**DE:** Deklariert welche Kommandos des aktuellen Namespace fuer namespace import sichtbar sind. Syntax: namespace export ?-clear? ?pattern...?. Patterns passen auf Kommandonamen innerhalb dieses Namespace. Ohne -clear: ergaenzt; mit -clear: ersetzt. Ohne Argumente: listet aktuelle Exports. Standard: nichts exportiert.

---

### namespace forget

**EN:** Remove imports brought in by `namespace import`. Syntax: namespace forget ?pattern...?. Patterns are glob, e.g. `::mylib::*`. Counterpart to namespace import. Without arguments: no-op (does not remove all imports).

**DE:** Entfernt Imports die per `namespace import` hereingeholt wurden. Syntax: namespace forget ?pattern...?. Patterns sind Glob, z.B. `::mylib::*`. Gegenstueck zu namespace import. Ohne Argumente: No-op (entfernt nicht alle Imports).

---

### namespace import

**EN:** Import commands from another namespace into the current one. Syntax: namespace import ?-force? ?pattern...?. Patterns are glob, e.g. ::mylib::*. After import the commands are callable by their short name. -force overrides existing names. Counterpart: namespace forget.

**DE:** Importiert Kommandos aus einem anderen Namespace in den aktuellen. Syntax: namespace import ?-force? ?pattern...?. Patterns sind Glob, z.B. ::mylib::*. Nach Import sind die Kommandos per Kurzname aufrufbar. -force ueberschreibt existierende Namen. Gegenstueck: namespace forget.

---

### namespace inscope

**EN:** Execute a script in a specified namespace. Syntax: namespace inscope ns script ?args...?. Differs from `namespace eval` in argument handling: ns is treated as a list, args are appended to script before execution. Mostly internal; namespace eval is preferred for ordinary use.

**DE:** Fuehrt ein Skript in einem angegebenen Namespace aus. Syntax: namespace inscope ns script ?args...?. Unterscheidet sich von `namespace eval` in der Argumentbehandlung: ns wird als Liste behandelt, args werden vor der Ausfuehrung an das Skript angehaengt. Meist intern; namespace eval ist bei normaler Nutzung bevorzugt.

---

### namespace origin

**EN:** For an imported command, return the original (un-imported) fully qualified name. Syntax: namespace origin command. Returns the name itself if the command is not imported. Used to find the source definition of an imported alias.

**DE:** Liefert fuer ein importiertes Kommando den originalen (nicht importierten) voll qualifizierten Namen. Syntax: namespace origin command. Liefert den Namen selbst wenn das Kommando nicht importiert ist. Verwendet um die Original-Definition eines importierten Alias zu finden.

---

### namespace parent

**EN:** Return the parent namespace of a given namespace. Syntax: namespace parent ?namespace?. Without argument: parent of the current namespace. Top level (`::`) has no parent (returns ""). Used in introspection.

**DE:** Liefert den Eltern-Namespace eines gegebenen Namespace. Syntax: namespace parent ?namespace?. Ohne Argument: Elternteil des aktuellen Namespace. Top-Level (`::`) hat keinen Elternteil (liefert ""). Verwendet bei Introspektion.

---

### namespace path

**EN:** Get or set the search path of a namespace for unqualified command lookup. Syntax: namespace path ?{ns1 ns2 ...}?. Without arguments: returns the current path. With list: sets the path. Allows commands defined in another namespace to be called by short name within this namespace.

**DE:** Liefert oder setzt den Suchpfad eines Namespace fuer unqualifizierten Kommando-Lookup. Syntax: namespace path ?{ns1 ns2 ...}?. Ohne Argumente: liefert den aktuellen Pfad. Mit Liste: setzt den Pfad. Ermoeglicht in anderen Namespaces definierte Kommandos hier per Kurzname aufzurufen.

---

### namespace qualifiers

**EN:** Return everything except the last component of a fully qualified name. Syntax: namespace qualifiers name. Example: `namespace qualifiers ::foo::bar::baz` returns `::foo::bar`. Counterpart to namespace tail. Useful to derive the parent namespace of a command.

**DE:** Liefert alles ausser der letzten Komponente eines voll qualifizierten Namens. Syntax: namespace qualifiers name. Beispiel: `namespace qualifiers ::foo::bar::baz` ergibt `::foo::bar`. Gegenstueck zu namespace tail. Hilfreich um den Eltern-Namespace eines Kommandos zu ermitteln.

---

### namespace tail

**EN:** Return the last component of a fully qualified name. Syntax: namespace tail name. Example: `namespace tail ::foo::bar::baz` returns `baz`. Common in metaprogramming when you need the bare command name independent of its namespace.

**DE:** Liefert die letzte Komponente eines voll qualifizierten Namens. Syntax: namespace tail name. Beispiel: `namespace tail ::foo::bar::baz` ergibt `baz`. Verbreitet in Metaprogrammierung wenn man den nackten Kommandonamen unabhaengig vom Namespace braucht.

---

### namespace which

**EN:** Resolve a command name to its fully qualified path within the namespace search hierarchy. Syntax: namespace which ?-command|-variable? name. Without -command/-variable: defaults to -command. Returns "" if the name does not resolve. Used to debug namespace resolution and to detect command shadowing.

**DE:** Loest einen Kommandonamen zu seinem voll qualifizierten Pfad innerhalb der Namespace-Suchhierarchie auf. Syntax: namespace which ?-command|-variable? name. Ohne -command/-variable: Standard ist -command. Liefert "" wenn der Name nicht aufloest. Verwendet zum Debuggen der Namespace-Aufloesung und zum Erkennen von Kommando-Shadowing.

---


## Netzwerk-Tools / Network Tools

### API Call

**EN:** Request to web service/API; typically HTTP-based (REST, SOAP); sends data, receives response; Tcl tools: http package, rest package, curl; JSON/XML common formats; authentication often required (tokens, keys).

**DE:** Anfrage an Web-Service/API; typischerweise HTTP-basiert (REST, SOAP); sendet Daten, empfängt Antwort; Tcl-Tools: http-Paket, rest-Paket, curl; JSON/XML übliche Formate; Authentifizierung oft erforderlich (Tokens, Keys).

---

### HTTP Request

**EN:** Message sent to web server; methods: GET (retrieve), POST (submit), PUT (update), DELETE (remove); Tcl: http package, curl, or sockets; includes headers, optional body; response has status code, headers, body.

**DE:** Nachricht an Web-Server gesendet; Methoden: GET (abrufen), POST (einreichen), PUT (aktualisieren), DELETE (entfernen); Tcl: http-Paket, curl oder Sockets; enthält Header, optionalen Body; Antwort hat Status-Code, Header, Body.

---

### curl

**EN:** Command-line tool for data transfer; supports HTTP, HTTPS, FTP, many protocols; download files, test APIs; Tcl call: `exec curl -o file.html https://example.com`; alternative to http package for complex requests; widely used for REST APIs.

**DE:** Kommandozeilen-Tool für Datenübertragung; unterstützt HTTP, HTTPS, FTP, viele Protokolle; Dateien herunterladen, APIs testen; Tcl-Aufruf: `exec curl -o file.html https://example.com`; Alternative zu http-Paket für komplexe Anfragen; weit verbreitet für REST-APIs.

---

### wget

**EN:** Command-line web downloader; recursive downloading, resume broken downloads; simpler than curl for basic tasks; Tcl call: `exec wget https://example.com/file.zip`; Unix/Linux standard; good for scripted downloads, mirror websites.

**DE:** Kommandozeilen-Web-Downloader; rekursives Herunterladen, unterbrochene Downloads fortsetzen; einfacher als curl für Basis-Aufgaben; Tcl-Aufruf: `exec wget https://example.com/file.zip`; Unix/Linux-Standard; gut für geskriptete Downloads, Websites spiegeln.

---


## Object-Oriented Tcl (TclOO) / Objektorientiertes Tcl

### Encapsulation

**EN:** OO principle of bundling data and methods, hiding internal implementation.

**DE:** OO-Prinzip der Bündelung von Daten und Methoden, Verbergen interner Implementierung.

---

### Inheritance

**EN:** OO mechanism where class derives properties and methods from parent class.

**DE:** OO-Mechanismus, bei dem Klasse Eigenschaften und Methoden von Elternklasse ableitet.

---

### Polymorphism

**EN:** OO principle allowing objects of different classes to be treated uniformly through common interface.

**DE:** OO-Prinzip, das Objekte verschiedener Klassen ermöglicht, einheitlich durch gemeinsame Schnittstelle behandelt zu werden.

---

### TclOO private method (callback limitation)

**EN:** Methods whose names are not exported (often written with a leading `_` by convention) are not valid as callback command prefixes; only exported (public) methods are safe to pass to `-command` and similar.

**DE:** Nicht exportierte Methoden (üblich mit führendem `_`) eignen sich nicht als Callback-Befehl; an `-command` u. Ä. nur exportierte, öffentliche Methoden übergeben.

---

### TclOO variable name collision

**EN:** If multiple classes in one object’s hierarchy (superclass, mixin, subclass) each `variable`-declare the same simple name, they refer to the same storage in the object namespace—unexpected sharing; use distinct names (e.g. with a class prefix) for “private” data.

**DE:** Deklarieren mehrere Klassen derselben Hierarchie (Superclass, Mixin, Subklasse) dieselbe einfache Variable, teilen sie sich einen Speicher im Objekt-Namespace—unerwartetes Teilen; für „private“ Daten eindeutige Namen (z. B. Klassenpräfix) verwenden.

---

### TclOO variable visibility (existence vs. visibility)

**EN:** In TclOO, instance variables live in a single per-object namespace; they exist for the whole object, but the `variable` declaration only makes them directly visible in the class that declared them—subclasses must redeclare parent variables to use the same storage with unqualified names. See the Tcl wiki “Variables in TclOO”.

**DE:** In TclOO liegen Instanzvariablen in einem gemeinsamen Objekt-Namespace; sie existieren für das ganze Objekt, sind aber mit unqualifiziertem Namen nur in der deklarierenden Klasse sichtbar—Unterklassen müssen Eltern-Variablen erneut deklarieren, um denselben Speicher zu nutzen. Vgl. Tcl-Wiki „Variables in TclOO“.

---

### classmethod

**EN:** Define method on class itself rather than instances (static method).

**DE:** Methode auf Klasse selbst definieren statt auf Instanzen (statische Methode).

---

### constructor

**EN:** Special method called when object is created; initializes object state (e.g., `constructor {args} {...}`).

**DE:** Spezielle Methode, die beim Erstellen des Objekts aufgerufen wird; initialisiert Objektzustand (z.B. `constructor {args} {...}`).

---

### create

**EN:** Instantiate object from class (e.g., `set obj [MyClass new]` or `MyClass create obj`).

**DE:** Objekt aus Klasse instanziieren (z.B. `set obj [MyClass new]` oder `MyClass create obj`).

---

### destroy

**EN:** Explicitly destroy object and call its destructor (e.g., `$obj destroy`).

**DE:** Objekt explizit zerstören und seinen Destruktor aufrufen (z.B. `$obj destroy`).

---

### destructor

**EN:** Special method called when object is destroyed; performs cleanup (e.g., `destructor {...}`).

**DE:** Spezielle Methode, die beim Zerstören des Objekts aufgerufen wird; führt Aufräumarbeiten aus (z.B. `destructor {...}`).

---

### export / unexport

**EN:** Control method visibility; exported methods are public, unexported are private.

**DE:** Methodensichtbarkeit steuern; exportierte Methoden sind öffentlich, nicht exportierte sind privat.

---

### filter

**EN:** Method called before/after other methods for cross-cutting concerns like logging.

**DE:** Methode, die vor/nach anderen Methoden aufgerufen wird für querschnittliche Belange wie Logging.

---

### forward

**EN:** Delegate method calls to another object or command.

**DE:** Methodenaufrufe an anderes Objekt oder Befehl delegieren.

---

### info class

**EN:** Query information about classes and objects (e.g., `info class instances MyClass`).

**DE:** Informationen über Klassen und Objekte abfragen (z.B. `info class instances MyClass`).

---

### method

**EN:** Define instance method in class (e.g., `method getName {} {return $name}`).

**DE:** Instanzmethode in Klasse definieren (z.B. `method getName {} {return $name}`).

---

### mixin

**EN:** Add class as mixin to provide additional methods without inheritance.

**DE:** Klasse als Mixin hinzufügen, um zusätzliche Methoden ohne Vererbung bereitzustellen.

---

### my

**EN:** Shorthand for invoking methods on current object (e.g., `my methodName` instead of `$self methodName`).

**DE:** Kurzform für Aufruf von Methoden auf aktuellem Objekt (z.B. `my methodName` statt `$self methodName`).

---

### new

**EN:** Create anonymous object instance with auto-generated name (e.g., `[MyClass new]`).

**DE:** Anonyme Objektinstanz mit automatisch generiertem Namen erstellen (z.B. `[MyClass new]`).

---

### next

**EN:** Call next method in method chain (superclass or mixin); enables method chaining.

**DE:** Nächste Methode in Methodenkette aufrufen (Superclass oder Mixin); ermöglicht Method-Chaining.

---

### oo::abstract

**EN:** Tcl 9 class type: a class that cannot be instantiated directly with `new`/`create`, but can be subclassed. Syntax: oo::abstract create Base { ... }. Used to define an interface or partial implementation that requires concrete subclasses. Subclasses become instantiable as usual.

**DE:** Tcl-9-Klassentyp: eine Klasse die nicht direkt per `new`/`create` instanziiert werden kann, aber abgeleitet werden darf. Syntax: oo::abstract create Base { ... }. Verwendet fuer Interfaces oder Teil-Implementationen die konkrete Unterklassen erfordern. Unterklassen sind normal instanziierbar.

---

### oo::class

**EN:** Create new class definition in TclOO (e.g., `oo::class create MyClass {...}`).

**DE:** Neue Klassendefinition in TclOO erstellen (z.B. `oo::class create MyClass {...}`).

---

### oo::define filter

**EN:** Method filters in TclOO — wrap method calls with pre/post logic, similar to AOP advice. Syntax: oo::define ClassName filter methodName ?methodName...?. Filter methods receive the original method invocation; can call `next` to proceed. Common uses: logging, authorization checks, caching.

**DE:** Method-Filter in TclOO — umhuellt Method-Aufrufe mit Pre/Post-Logik, aehnlich wie AOP-Advice. Syntax: oo::define ClassName filter methodName ?methodName...?. Filter-Methoden erhalten den Original-Aufruf; koennen `next` aufrufen um weiterzugehen. Anwendung: Logging, Berechtigungs-Pruefung, Caching.

---

### oo::mixinto

**EN:** Add or remove a mixin on a specific object instance (per-object mixin), instead of the class. Syntax: oo::mixinto $obj ?className...?. Without arguments: returns the current per-object mixins. With class names: replaces the mixin list for that one object only. Useful for instance-specific behavior without affecting the class.

**DE:** Fuegt einem konkreten Objekt einen Mixin hinzu oder entfernt ihn (instanz-spezifischer Mixin), statt fuer die Klasse. Syntax: oo::mixinto $obj ?className...?. Ohne Argumente: liefert die aktuellen Per-Objekt-Mixins. Mit Klassennamen: ersetzt die Mixin-Liste fuer dieses eine Objekt. Nuetzlich fuer instanz-spezifisches Verhalten ohne die Klasse zu aendern.

---

### oo::object

**EN:** Base object type in TclOO; all objects inherit from oo::object.

**DE:** Basis-Objekttyp in TclOO; alle Objekte erben von oo::object.

---

### self

**EN:** Reference to current object instance within methods (e.g., `$self methodName`).

**DE:** Referenz auf aktuelle Objektinstanz innerhalb von Methoden (z.B. `$self methodName`).

---

### superclass

**EN:** Specify parent class for inheritance (e.g., `superclass ParentClass`).

**DE:** Elternklasse für Vererbung angeben (z.B. `superclass ParentClass`).

---

### variable

**EN:** Tcl command with two related uses. (1) Inside a `namespace eval` block, declares a namespace-scoped variable: `namespace eval ::myns { variable count 0 }`. The variable is accessible via fully-qualified name (`$::myns::count`) or via `variable count` in procs of that namespace. (2) Inside a TclOO class body, declares an instance variable accessible in methods without explicit `my variable`: `oo::class create Counter { variable count; constructor {} { set count 0 } }`. In both cases, `variable` is a declaration that links a name to the appropriate scope; it does NOT assign a value unless given as second argument.

**DE:** Tcl-Befehl mit zwei verwandten Verwendungen. (1) In einem `namespace eval`-Block deklariert er eine namespace-bezogene Variable: `namespace eval ::myns { variable count 0 }`. Die Variable ist via voll-qualifizierten Namen (`$::myns::count`) oder via `variable count` in Procs dieses Namespaces zugaenglich. (2) In einem TclOO-Klassen-Body deklariert er eine Instanzvariable, die in Methoden ohne explizites `my variable` zugaenglich ist: `oo::class create Counter { variable count; constructor {} { set count 0 } }`. In beiden Faellen ist `variable` eine Deklaration, die einen Namen mit dem passenden Scope verknuepft; er weist KEINEN Wert zu, ausser einer wird als zweites Argument uebergeben.

---


## Operatoren / Operators

### ! (Logical NOT)

**EN:** Logical NOT operator; negates boolean value (e.g., `!$flag`).

**DE:** Logischer NICHT-Operator; negiert booleschen Wert (z.B. `!$flag`).

---

### & (Bitwise AND)

**EN:** Bitwise AND operator; performs AND operation on each bit pair (e.g., `0b1100 & 0b1010` = `0b1000`).

**DE:** Bitweises UND; führt UND-Operation auf jedem Bitpaar aus (z.B. `0b1100 & 0b1010` = `0b1000`).

---

### && (Logical AND)

**EN:** Logical AND operator; returns true only if both operands are true (e.g., `$x > 0 && $y < 10`).

**DE:** Logischer UND-Operator; gibt nur wahr zurück, wenn beide Operanden wahr sind (z.B. `$x > 0 && $y < 10`).

---

### << (Left Shift)

**EN:** Bitwise left shift operator; shifts bits left, filling with zeros (e.g., `5 << 2` = 20).

**DE:** Bitweises Links-Verschieben; verschiebt Bits nach links, füllt mit Nullen (z.B. `5 << 2` = 20).

---

### >> (Right Shift)

**EN:** Bitwise right shift operator; shifts bits right (e.g., `20 >> 2` = 5).

**DE:** Bitweises Rechts-Verschieben; verschiebt Bits nach rechts (z.B. `20 >> 2` = 5).

---

### ^ (Bitwise XOR)

**EN:** Bitwise exclusive OR operator; returns 1 when bits differ (e.g., `0b1100 ^ 0b1010` = `0b0110`).

**DE:** Bitweises exklusives ODER; gibt 1 zurück, wenn Bits unterschiedlich sind (z.B. `0b1100 ^ 0b1010` = `0b0110`).

---

### | (Bitwise OR)

**EN:** Bitwise OR operator; performs OR operation on each bit pair (e.g., `0b1100 | 0b1010` = `0b1110`).

**DE:** Bitweises ODER; führt ODER-Operation auf jedem Bitpaar aus (z.B. `0b1100 | 0b1010` = `0b1110`).

---

### || (Logical OR)

**EN:** Logical OR operator; returns true if at least one operand is true (e.g., `$x < 0 || $x > 100`).

**DE:** Logischer ODER-Operator; gibt wahr zurück, wenn mindestens ein Operand wahr ist (z.B. `$x < 0 || $x > 100`).

---

### ~ (Bitwise NOT)

**EN:** Bitwise NOT operator; inverts all bits (one's complement).

**DE:** Bitweises NICHT; invertiert alle Bits (Einerkomplement).

---


## Option Database / Ressourcen-Datenbank

### Priority

**EN:** Option database entry precedence level (widgetDefault, startupFile, userDefault, interactive).

**DE:** Prioritätsstufe des Options-Datenbank-Eintrags (widgetDefault, startupFile, userDefault, interactive).

---

### Resource Pattern

**EN:** Hierarchical pattern for option matching (* for wildcard, . for hierarchy).

**DE:** Hierarchisches Muster für Options-Abgleich (* für Wildcard, . für Hierarchie).

---

### Widget Class

**EN:** General widget type used in option database (Button, Entry, Text, etc.).

**DE:** Allgemeiner Widget-Typ, verwendet in Options-Datenbank (Button, Entry, Text, etc.).

---

### option add

**EN:** Add option pattern to resource database (e.g., `option add *Button.background blue`).

**DE:** Options-Muster zur Ressourcen-Datenbank hinzufügen (z.B. `option add *Button.background blue`).

---

### option clear

**EN:** Clear all entries from option database.

**DE:** Alle Einträge aus Options-Datenbank löschen.

---

### option get

**EN:** Query option value from database for widget (e.g., `option get .button background Button`).

**DE:** Optionswert aus Datenbank für Widget abfragen (z.B. `option get .button background Button`).

---

### option readfile

**EN:** Load options from X11-style resource file.

**DE:** Optionen aus X11-Stil-Ressourcen-Datei laden.

---


## OptionMenu-Begriffe / OptionMenu Terms

### Menu Name

**EN:** Pathname of menu widget created by tk_optionMenu for further customization.

**DE:** Pfadname des von tk_optionMenu erstellten Menü-Widgets für weitere Anpassungen.

---

### OptionMenu (tk_optionMenu)

**EN:** Widget displaying a menubutton with dropdown list of mutually exclusive choices.

**DE:** Widget, das einen Menubutton mit Dropdown-Liste sich gegenseitig ausschließender Auswahlmöglichkeiten anzeigt.

---

### Values

**EN:** List of choices available in OptionMenu dropdown.

**DE:** Liste der verfügbaren Auswahlmöglichkeiten in OptionMenu-Dropdown.

---


## PDF in Tcl / PDF in Tcl

### 14 Standard-PDF-Fonts

**EN:** The 14 Type 1 fonts guaranteed by the PDF standard to be available in every viewer without embedding: Helvetica (4 variants: regular, Bold, Oblique, BoldOblique), Times (4 variants: Roman, Bold, Italic, BoldItalic), Courier (4 variants: regular, Bold, Oblique, BoldOblique), Symbol (Greek + math), ZapfDingbats (decorative). Naming gotcha: Helvetica/Courier use `-Oblique`, Times uses `-Italic`.

**DE:** Die 14 Type-1-Fonts, die der PDF-Standard garantiert in jedem Viewer ohne Einbettung verfuegbar haelt: Helvetica (4 Varianten: regular, Bold, Oblique, BoldOblique), Times (4 Varianten: Roman, Bold, Italic, BoldItalic), Courier (4 Varianten: regular, Bold, Oblique, BoldOblique), Symbol (Griechisch + Mathematik), ZapfDingbats (Schmuckzeichen). Namens-Falle: Helvetica/Courier verwenden `-Oblique`, Times verwendet `-Italic`.

---

### AcroForm

**EN:** Acrobat-Form — Adobe's standard for interactive form fields in PDF documents. Defines field types (text, checkbox, choice, radio, button, signature), positions, default values, and validation. Filled via PDF viewer or programmatically (e.g. with `pdf4tcl`'s `addForm`). The successor standard, XFA, is being deprecated by Adobe in favour of AcroForm.

**DE:** Acrobat-Form — Adobes Standard fuer interaktive Formularfelder in PDF-Dokumenten. Definiert Feldtypen (Text, Checkbox, Auswahl, Radio, Button, Signatur), Positionen, Default-Werte und Validierung. Wird per PDF-Viewer oder programmatisch (z.B. mit `pdf4tcl`s `addForm`) befuellt. Der Nachfolge-Standard XFA wird von Adobe zugunsten von AcroForm wieder aufgegeben.

---

### Ascender

**EN:** In typography, the part of a lowercase letter that extends above the x-height — for example, the upper stems in "b", "d", "h", "k". Relevant in PDF text positioning: with a font size of N points, ascenders reach about 0.75 * N above the baseline. In `pdf4tcl`, the y-coordinate of a `$pdf text` call is the baseline, so the visual top of the text sits roughly `0.75 * fontSize` above that y.

**DE:** In der Typografie der Teil eines Kleinbuchstabens, der ueber die x-Hoehe hinausragt — z.B. die Aufstriche in "b", "d", "h", "k". Relevant fuer PDF-Textpositionierung: bei Schriftgroesse N Points reichen Ascender etwa 0.75 * N ueber die Baseline. In `pdf4tcl` bezeichnet die y-Koordinate eines `$pdf text`-Aufrufs die Baseline; die visuelle Oberkante des Texts liegt also etwa `0.75 * fontSize` darueber.

---

### CID-Font

**EN:** Character Identifier Font — PDF font technology for languages with very large character sets (CJK — Chinese, Japanese, Korean). Maps character IDs to glyphs via a CMap (character map). Required when PDF text contains characters beyond the WinAnsi encoding of the standard fonts. `pdf4tcl` supports CID fonts via its CIDFont extension; setup involves loading a CMap file and registering the font.

**DE:** Character Identifier Font — PDF-Font-Technologie fuer Sprachen mit sehr grossen Zeichensaetzen (CJK — Chinesisch, Japanisch, Koreanisch). Bildet Character-IDs ueber eine CMap (Character Map) auf Glyphen ab. Erforderlich wenn PDF-Text Zeichen jenseits der WinAnsi-Kodierung der Standard-Fonts enthaelt. `pdf4tcl` unterstuetzt CID-Fonts ueber seine CIDFont-Erweiterung; Setup beinhaltet das Laden einer CMap-Datei und Registrierung des Fonts.

---

### Descender

**EN:** In typography, the part of a lowercase letter that extends below the baseline — for example, the lower stems in "g", "j", "p", "q", "y". With a font size of N points, descenders reach about 0.25 * N below the baseline. In PDF text-box layouts, descenders must be accounted for to prevent text running into the next row.

**DE:** In der Typografie der Teil eines Kleinbuchstabens, der unter die Baseline reicht — z.B. die Abstriche in "g", "j", "p", "q", "y". Bei Schriftgroesse N Points reichen Descender etwa 0.25 * N unter die Baseline. In PDF-Textbox-Layouts muessen Descender beruecksichtigt werden, damit Text nicht in die naechste Zeile rutscht.

---

### PDF-Encryption

**EN:** PDF document encryption via owner-password (full edit rights) and user-password (open + restricted rights, e.g. no copy/print). Variants by algorithm: 40-bit RC4 (PDF 1.3, weak), 128-bit RC4 (PDF 1.4), 128-bit AES (PDF 1.6), 256-bit AES (PDF 1.7+). Lower-strength variants are trivially breakable today; only AES-256 offers serious protection. `pdf4tcl` supports up to 128-bit AES.

**DE:** PDF-Dokument-Verschluesselung mit Eigentuemer-Passwort (volle Bearbeitungsrechte) und Benutzer-Passwort (oeffnen + eingeschraenkte Rechte, z.B. kein Kopieren/Drucken). Varianten nach Algorithmus: 40-bit RC4 (PDF 1.3, schwach), 128-bit RC4 (PDF 1.4), 128-bit AES (PDF 1.6), 256-bit AES (PDF 1.7+). Schwaechere Varianten sind heute trivial zu brechen; nur AES-256 bietet echten Schutz. `pdf4tcl` unterstuetzt bis 128-bit AES.

---

### PDF/A

**EN:** PDF/Archive — ISO 19005 standard for long-term archival of PDF documents. Restricts the full PDF feature set: requires embedded fonts, prohibits encryption and JavaScript, mandates colour-space declarations. Variants: PDF/A-1 (oldest, strictest), PDF/A-2 (allows JPEG 2000), PDF/A-3 (allows embedded files). Converting an arbitrary PDF to PDF/A typically uses Ghostscript or veraPDF.

**DE:** PDF/Archive — ISO-19005-Standard fuer Langzeit-Archivierung von PDF-Dokumenten. Schraenkt den vollen PDF-Funktionsumfang ein: erfordert eingebettete Fonts, verbietet Verschluesselung und JavaScript, schreibt Farbraum-Deklarationen vor. Varianten: PDF/A-1 (am aeltesten, am striktesten), PDF/A-2 (erlaubt JPEG 2000), PDF/A-3 (erlaubt eingebettete Dateien). Konvertierung beliebiger PDFs zu PDF/A typischerweise mit Ghostscript oder veraPDF.

---

### Page Context Pattern

**EN:** Design pattern in `pdf4tcllib` for centralizing all page-layout values in one dictionary: page width and height, margins, safe area, orientation. Created via `pdf4tcllib::page::context a4 -margin 20 -orient true`. Keys come in two flavours: descriptive (`page_w`, `top`, `left`) and short (`PW`, `SY`, `SX`). Replaces scattered magic numbers in source code with a single configuration point.

**DE:** Design-Pattern in `pdf4tcllib` zur Zentralisierung aller Seitenlayout-Werte in einem Dictionary: Seitenbreite und -hoehe, Raender, sichere Flaeche, Orientierung. Erzeugt ueber `pdf4tcllib::page::context a4 -margin 20 -orient true`. Schluessel kommen in zwei Varianten: ausfuehrlich (`page_w`, `top`, `left`) und kurz (`PW`, `SY`, `SX`). Ersetzt verstreute Magic-Numbers im Quellcode durch einen einzigen Konfigurationspunkt.

---

### Point (pt)

**EN:** PDF's fundamental unit of length: 1 pt = 1/72 inch ≈ 0.3528 mm. All `pdf4tcl` coordinates and sizes are in points. Standard conversions: A4 = 595.28 * 841.89 pt; 1 cm = 28.346 pt; 1 mm = 2.8346 pt. Helper procs (`mm_to_pt`, `cm_to_pt`) are a common pattern to keep source code in millimetres while the output is in points.

**DE:** PDFs grundlegende Laengeneinheit: 1 pt = 1/72 Inch ≈ 0.3528 mm. Alle `pdf4tcl`-Koordinaten und -Groessen sind in Points. Standard-Umrechnungen: A4 = 595.28 * 841.89 pt; 1 cm = 28.346 pt; 1 mm = 2.8346 pt. Helper-Prozeduren (`mm_to_pt`, `cm_to_pt`) sind ein uebliches Muster, um Quellcode in Millimetern zu halten waehrend die Ausgabe in Points ist.

---

### Tk Photo Image

**EN:** Tk's in-memory image data type, created with `image create photo`. The native image format consumed by `pdf4tcl`'s `$pdf image` command. Supports PNG, GIF natively; JPEG from Tk 8.6 onwards. To use `pdf4tcl` with images, `package require Tk` is mandatory (the Tk runtime is needed even when no window is displayed). Photo images consume memory and must be released with `image delete` after use.

**DE:** Tks In-Memory-Bilddatentyp, erzeugt mit `image create photo`. Das native Bild-Format, das `pdf4tcl`s `$pdf image`-Befehl konsumiert. Unterstuetzt PNG, GIF nativ; JPEG ab Tk 8.6. Um `pdf4tcl` mit Bildern zu nutzen, ist `package require Tk` Pflicht (die Tk-Runtime wird gebraucht, auch wenn kein Fenster angezeigt wird). Photo Images verbrauchen Speicher und muessen nach Gebrauch mit `image delete` freigegeben werden.

---

### WinAnsi

**EN:** The character encoding used by the 14 standard PDF fonts (Helvetica, Times, Courier, Symbol, ZapfDingbats). Largely identical to Windows-1252 / CP1252: covers Latin-1 plus a few extras (euro sign, smart quotes). Characters outside WinAnsi (Cyrillic, Greek beyond Symbol, CJK) cannot be rendered by the standard fonts — those need embedded TrueType fonts or a CID-Font.

**DE:** Die Zeichen-Kodierung der 14 Standard-PDF-Fonts (Helvetica, Times, Courier, Symbol, ZapfDingbats). Weitgehend identisch mit Windows-1252 / CP1252: deckt Latin-1 plus ein paar Extras (Euro-Zeichen, typografische Anfuehrungszeichen) ab. Zeichen ausserhalb von WinAnsi (Kyrillisch, Griechisch jenseits von Symbol, CJK) koennen von den Standard-Fonts nicht dargestellt werden — dafuer braucht es eingebettete TrueType-Fonts oder eine CID-Font.

---

### drawTextBox

**EN:** `pdf4tcl` command for laying out wrapped text inside a rectangular box. Parameters: x, y, width, height, text, optional `-align (left|center|right|justify)`. Calculates the number of lines needed (returnable via `-linesvar`), allows dry-run (`-dryrun 1`) for height pre-calculation. The standard tool for paragraphs longer than a single text line.

**DE:** `pdf4tcl`-Befehl zum Layouten von umbrochenem Text in einer rechteckigen Box. Parameter: x, y, Breite, Hoehe, Text, optional `-align (left|center|right|justify)`. Berechnet die benoetigte Zeilenzahl (ueber `-linesvar` zurueckholbar), erlaubt Trockenlauf (`-dryrun 1`) fuer Hoehen-Vorberechnung. Das Standardwerkzeug fuer Absaetze laenger als eine Textzeile.

---

### gsave / grestore

**EN:** PDF/PostScript graphics-state operators — `gsave` (save) pushes the current graphics state (transformation matrix, colours, line width, dash pattern, etc.) onto a stack; `grestore` (restore) pops it. Used to scope transformations: any `rotate`/`translate`/`scale` between `gsave` and `grestore` affects only the operations in between. Forgetting `grestore` means subsequent drawing inherits the transformation unexpectedly.

**DE:** PDF/PostScript-Grafikzustand-Operatoren — `gsave` (save) legt den aktuellen Grafikzustand (Transformationsmatrix, Farben, Linienbreite, Strichmuster usw.) auf einen Stack; `grestore` (restore) holt ihn wieder runter. Dient dazu, Transformationen zu kapseln: `rotate`/`translate`/`scale` zwischen `gsave` und `grestore` wirken nur auf die Operationen dazwischen. Vergessenes `grestore` bedeutet, dass nachfolgende Zeichenoperationen die Transformation ueberraschend erben.

---

### pdf4tcllib

**EN:** Tcl module that extends `pdf4tcl` with Unicode-safe text, automatic emoji fallbacks (e.g. heart → `<3`), the Page Context Pattern, paragraph wrapping (`text::writeParagraph`), and high-level tables (`table::simpleTable`, `table::render`). Packaged as a single .tm file (~2700 lines, v0.1.1). Used internally by `mdpdf` and `mdhelp_pdf`. The standard companion library on top of `pdf4tcl`'s low-level core.

**DE:** Tcl-Modul, das `pdf4tcl` um Unicode-sicheren Text, automatische Emoji-Fallbacks (z.B. Herz → `<3`), das Page Context Pattern, Absatz-Umbruch (`text::writeParagraph`) und High-Level-Tabellen (`table::simpleTable`, `table::render`) erweitert. Verpackt als einzelne .tm-Datei (~2700 Zeilen, v0.1.1). Wird intern von `mdpdf` und `mdhelp_pdf` genutzt. Die Standard-Begleitbibliothek auf Basis von `pdf4tcl`s Low-Level-Core.

---

### pdfdoclib

**EN:** Higher-level PDF abstraction library on top of `pdf4tcl`. Provides document-style primitives — DIN letters, styled paragraphs, page layouts — instead of raw `text`/`line`/`rectangle` calls. Current version 0.4. Useful when generating PDFs that follow a consistent document style (letters, reports, invoices) rather than ad-hoc layouts.

**DE:** Hoehere PDF-Abstraktionsschicht auf Basis von `pdf4tcl`. Bietet Dokument-Primitive — DIN-Briefe, formatierte Absaetze, Seitenlayouts — statt roher `text`/`line`/`rectangle`-Aufrufe. Aktuelle Version 0.4. Nuetzlich beim Erzeugen von PDFs, die einem konsistenten Dokumentstil folgen (Briefe, Reports, Rechnungen), statt Ad-Hoc-Layouts.

---

### pdfgrid

**EN:** Table-rendering library on top of `pdf4tcl`. Adds features the raw `pdf4tcl` core does not have: per-column widths and alignments, row striping, header styling, automatic sum/subtotal rows, conditional formatting (colour by value). Current version 0.3.6. Use when generating invoices, balance sheets, structured-data exports.

**DE:** Tabellen-Render-Bibliothek auf Basis von `pdf4tcl`. Fuegt Features hinzu die der reine `pdf4tcl`-Core nicht hat: spaltenweise Breiten und Ausrichtungen, Zeilen-Streifen, Header-Styling, automatische Summen-/Zwischensummen-Zeilen, Conditional Formatting (Farbe nach Wert). Aktuelle Version 0.3.6. Verwendet beim Erzeugen von Rechnungen, Bilanzen, strukturierten Daten-Exporten.

---

### pdftextboxlib

**EN:** Extended TextBox library on top of `pdf4tcl`. Goes beyond the built-in `drawTextBox` with inline formatting options: bold/italic spans within a paragraph, inline colour changes, mixed-font segments, hyperlinks. Current version 1.0. Use when paragraph text needs richer formatting than a single font/colour per call.

**DE:** Erweiterte TextBox-Bibliothek auf Basis von `pdf4tcl`. Geht ueber das eingebaute `drawTextBox` hinaus mit Inline-Formatierungsoptionen: Fett/Kursiv-Spans innerhalb eines Absatzes, Inline-Farbwechsel, gemischte Font-Segmente, Hyperlinks. Aktuelle Version 1.0. Verwendet wenn Absatztext reichere Formatierung braucht als ein einzelner Font/eine einzelne Farbe pro Aufruf.

---

### startPage / endPage

**EN:** `pdf4tcl` commands for the page lifecycle: `$pdf startPage` begins a new page; `$pdf endPage` finalizes it. Each page in a multi-page document must be explicitly bracketed. Drawing operations outside a page (before `startPage` or after `endPage`) produce errors. The last page must be `endPage`d before `write` is called, otherwise it is missing or corrupt in the output PDF.

**DE:** `pdf4tcl`-Befehle fuer den Seitenlebenszyklus: `$pdf startPage` beginnt eine neue Seite; `$pdf endPage` schliesst sie ab. Jede Seite eines mehrseitigen Dokuments muss explizit geklammert werden. Zeichenoperationen ausserhalb einer Seite (vor `startPage` oder nach `endPage`) produzieren Fehler. Die letzte Seite muss `endPage` gerufen werden bevor `write` aufgerufen wird, sonst fehlt sie oder ist defekt im Ausgabe-PDF.

---


## Positionierung und Anker / Positioning and Anchors

### Anchor

**EN:** Specifies which part of a widget or element is positioned at the given coordinates (e.g., `n`, `s`, `e`, `w`, `center`).

**DE:** Gibt an, welcher Teil eines Widgets oder Elements an den gegebenen Koordinaten positioniert wird (z.B. `n`, `s`, `e`, `w`, `center`).

---

### Center

**EN:** Center anchor point; positions the center of an element at the specified location.

**DE:** Mittlerer Ankerpunkt; positioniert die Mitte eines Elements an der angegebenen Stelle.

---

### East (e)

**EN:** Right center anchor point; positions the right edge of an element at the specified location.

**DE:** Rechter mittlerer Ankerpunkt; positioniert die rechte Kante eines Elements an der angegebenen Stelle.

---

### North (n)

**EN:** Top center anchor point; positions the top edge of an element at the specified location.

**DE:** Oberer mittlerer Ankerpunkt; positioniert die obere Kante eines Elements an der angegebenen Stelle.

---

### Northeast (ne)

**EN:** Top-right corner anchor point.

**DE:** Oberer rechter Ecken-Ankerpunkt.

---

### Northwest (nw)

**EN:** Top-left corner anchor point; often used as the default anchor position.

**DE:** Oberer linker Ecken-Ankerpunkt; wird oft als Standard-Ankerposition verwendet.

---

### South (s)

**EN:** Bottom center anchor point; positions the bottom edge of an element at the specified location.

**DE:** Unterer mittlerer Ankerpunkt; positioniert die untere Kante eines Elements an der angegebenen Stelle.

---

### Southeast (se)

**EN:** Bottom-right corner anchor point.

**DE:** Unterer rechter Ecken-Ankerpunkt.

---

### Southwest (sw)

**EN:** Bottom-left corner anchor point.

**DE:** Unterer linker Ecken-Ankerpunkt.

---

### West (w)

**EN:** Left center anchor point; positions the left edge of an element at the specified location.

**DE:** Linker mittlerer Ankerpunkt; positioniert die linke Kante eines Elements an der angegebenen Stelle.

---


## Prozess-Management / Process Management

### Auto_execok

**EN:** Check if command is executable and return full path; used internally by exec.

**DE:** Prüfen, ob Befehl ausführbar ist und vollständigen Pfad zurückgeben; intern von exec verwendet.

---

### Background Execution

**EN:** Run command in background by appending `&` in exec (e.g., `exec command &`).

**DE:** Befehl im Hintergrund ausführen durch Anhängen von `&` in exec (z.B. `exec command &`).

---

### Exit

**EN:** Terminate Tcl script with optional exit code (e.g., `exit 0`).

**DE:** Tcl-Skript mit optionalem Exit-Code beenden (z.B. `exit 0`).

---

### Exit Code

**EN:** Numeric value returned by process indicating success (0) or error (non-zero).

**DE:** Numerischer Wert, den Prozess zurückgibt und Erfolg (0) oder Fehler (nicht-null) anzeigt.

---

### Load

**EN:** Load compiled extension (shared library) into interpreter (e.g., `load libname.so`).

**DE:** Kompilierte Erweiterung (Shared Library) in Interpreter laden (z.B. `load libname.so`).

---

### Pipeline

**EN:** Chain of commands where output of one becomes input of next (e.g., `exec cat file | grep pattern`).

**DE:** Kette von Befehlen, bei der Ausgabe eines zum Eingang des nächsten wird (z.B. `exec cat file | grep pattern`).

---

### Redirection

**EN:** Redirect command input/output to files using `<`, `>`, `>>`, `2>` in exec.

**DE:** Befehl Ein-/Ausgabe zu Dateien umleiten mit `<`, `>`, `>>`, `2>` in exec.

---

### STDIN/STDOUT/STDERR Redirection

**EN:** Control standard streams in exec: `<@stdin`, `>@stdout`, `2>@stderr`.

**DE:** Standard-Streams in exec steuern: `<@stdin`, `>@stdout`, `2>@stderr`.

---

### Source

**EN:** Execute Tcl script from file in current interpreter (e.g., `source script.tcl`).

**DE:** Tcl-Skript aus Datei im aktuellen Interpreter ausführen (z.B. `source script.tcl`).

---

### env Array

**EN:** Global array containing environment variables (e.g., `$env(PATH)`, `$env(HOME)`).

**DE:** Globales Array mit Umgebungsvariablen (z.B. `$env(PATH)`, `$env(HOME)`).

---

### exec

**EN:** Execute external command and return output (e.g., `exec ls -l`); blocks until command completes.

**DE:** Externen Befehl ausführen und Ausgabe zurückgeben (z.B. `exec ls -l`); blockiert bis Befehl abgeschlossen ist.

---

### open "|command"

**EN:** Open pipe to external command for input/output communication (e.g., `open "|grep pattern" r`).

**DE:** Pipe zu externem Befehl öffnen für Ein-/Ausgabe-Kommunikation (z.B. `open "|grep pattern" r`).

---

### pid

**EN:** Return process ID of Tcl interpreter or channel process (e.g., `pid` or `pid $channel`).

**DE:** Prozess-ID des Tcl-Interpreters oder Kanal-Prozesses zurückgeben (z.B. `pid` oder `pid $channel`).

---


## Prozess-Verwaltung / Process Management

### Child Process

**EN:** Process created by current process; typically created with `exec` or `open "|command"` in Tcl.

**DE:** Prozess erstellt von aktuellem Prozess; typischerweise erstellt mit `exec` oder `open "|command"` in Tcl.

---

### Daemon Process

**EN:** Background process running without terminal; often started at boot; common in Unix/Linux systems.

**DE:** Hintergrund-Prozess ohne Terminal; oft beim Booten gestartet; häufig in Unix/Linux-Systemen.

---

### Parent Process

**EN:** Process that created current process; in Tcl, often shell or tclsh that launched script.

**DE:** Prozess, der aktuellen Prozess erstellt hat; in Tcl oft Shell oder tclsh, das Skript gestartet hat.

---

### Process ID (PID)

**EN:** Unique numeric identifier assigned by operating system to running process; used for process management, signaling, monitoring.

**DE:** Eindeutige numerische Kennung vom Betriebssystem zugewiesen an laufenden Prozess; verwendet für Prozess-Verwaltung, Signalisierung, Überwachung.

---

### Process Table

**EN:** Operating system data structure tracking all running processes with PIDs, state, resource usage.

**DE:** Betriebssystem-Datenstruktur, die alle laufenden Prozesse mit PIDs, Zustand, Ressourcen-Nutzung verfolgt.

---

### Zombie Process

**EN:** Terminated process whose exit status hasn't been collected by parent; shows in process table until parent calls wait.

**DE:** Beendeter Prozess, dessen Exit-Status nicht vom Eltern gesammelt wurde; erscheint in Prozesstabelle bis Eltern wait aufruft.

---


## REST API-Bibliothek / REST API Library

### API Token

**EN:** Authentication token for REST API access, typically in header or query parameter.

**DE:** Authentifizierungs-Token für REST-API-Zugriff, typischerweise in Header oder Query-Parameter.

---

### Authorization Header

**EN:** HTTP header containing credentials for API authentication (Bearer token, Basic auth, etc.).

**DE:** HTTP-Header mit Zugangsdaten für API-Authentifizierung (Bearer-Token, Basic-Auth, etc.).

---

### Content-Type

**EN:** HTTP header specifying format of request/response body (application/json, text/xml, etc.).

**DE:** HTTP-Header, der Format des Anfrage-/Antwort-Bodys spezifiziert (application/json, text/xml, etc.).

---

### REST Endpoint

**EN:** URL path representing specific resource or operation in REST API.

**DE:** URL-Pfad, der spezifische Ressource oder Operation in REST-API repräsentiert.

---

### rest

**EN:** Tcllib module for creating REST API clients (e.g., `package require rest`).

**DE:** Tcllib-Modul zum Erstellen von REST-API-Clients (z.B. `package require rest`).

---

### rest::create_interface

**EN:** Define REST API interface with endpoints and parameters (e.g., `rest::create_interface myapi {...}`).

**DE:** REST-API-Schnittstelle mit Endpunkten und Parametern definieren (z.B. `rest::create_interface myapi {...}`).

---

### rest::delete

**EN:** Make HTTP DELETE request to remove resource at REST endpoint.

**DE:** HTTP-DELETE-Anfrage zum Entfernen von Ressource an REST-Endpunkt stellen.

---

### rest::format_auto

**EN:** Automatically detect and format request/response data (JSON, XML, etc.).

**DE:** Anfrage-/Antwort-Daten automatisch erkennen und formatieren (JSON, XML, etc.).

---

### rest::get

**EN:** Make HTTP GET request to REST endpoint (e.g., `rest::get $url -query {param value}`).

**DE:** HTTP-GET-Anfrage an REST-Endpunkt stellen (z.B. `rest::get $url -query {param value}`).

---

### rest::parameters

**EN:** Define expected parameters for REST API endpoint with validation.

**DE:** Erwartete Parameter für REST-API-Endpunkt mit Validierung definieren.

---

### rest::parse_opts

**EN:** Parse and validate REST API call options and parameters.

**DE:** REST-API-Aufruf-Optionen und Parameter parsen und validieren.

---

### rest::patch

**EN:** Make HTTP PATCH request to partially update resource.

**DE:** HTTP-PATCH-Anfrage zum teilweisen Aktualisieren von Ressource stellen.

---

### rest::post

**EN:** Make HTTP POST request with data to REST endpoint (e.g., `rest::post $url -data $jsonData`).

**DE:** HTTP-POST-Anfrage mit Daten an REST-Endpunkt stellen (z.B. `rest::post $url -data $jsonData`).

---

### rest::put

**EN:** Make HTTP PUT request to update resource at REST endpoint.

**DE:** HTTP-PUT-Anfrage zum Aktualisieren von Ressource an REST-Endpunkt stellen.

---


## Regular Expressions / Reguläre Ausdrücke

### $ (Dollar)

**EN:** Regex anchor matching end of string or line.

**DE:** Regex-Anker, der Ende von String oder Zeile trifft.

---

### ( ) (Capture Group)

**EN:** Regex grouping for capturing matched substrings; accessed via matchVar in regexp.

**DE:** Regex-Gruppierung zum Erfassen übereinstimmender Teilstrings; Zugriff über matchVar in regexp.

---

### (?:...) (Non-capturing Group)

**EN:** Regex group without capturing matched substring.

**DE:** Regex-Gruppe ohne Erfassen des übereinstimmenden Teilstrings.

---

### + (Plus)

**EN:** Regex quantifier matching one or more occurrences of preceding element.

**DE:** Regex-Quantifizierer, der ein oder mehr Vorkommen des vorhergehenden Elements trifft.

---

### -all

**EN:** Regsub option to replace all occurrences instead of just first.

**DE:** Regsub-Option zum Ersetzen aller Vorkommen statt nur des ersten.

---

### -indices

**EN:** Regexp option returning indices of matches instead of matched strings.

**DE:** Regexp-Option, die Indizes von Treffern statt übereinstimmende Strings zurückgibt.

---

### -inline

**EN:** Regexp option returning list of all matched substrings.

**DE:** Regexp-Option, die Liste aller übereinstimmenden Teilstrings zurückgibt.

---

### -nocase

**EN:** Regexp option for case-insensitive matching.

**DE:** Regexp-Option für groß-/kleinschreibungs-unabhängiges Matching.

---

### . (Dot)

**EN:** Regex wildcard matching any single character except newline.

**DE:** Regex-Wildcard, die jedes einzelne Zeichen außer Zeilenumbruch trifft.

---

### ? (Question Mark)

**EN:** Regex quantifier matching zero or one occurrence of preceding element (optional).

**DE:** Regex-Quantifizierer, der null oder ein Vorkommen des vorhergehenden Elements trifft (optional).

---

### Backslash Escape

**EN:** Escape special regex characters to match them literally (e.g., `\.` matches literal dot).

**DE:** Spezielle Regex-Zeichen maskieren, um sie buchstäblich zu treffen (z.B. `\.` trifft buchstäblichen Punkt).

---

### Greedy / Non-greedy

**EN:** Quantifier behavior: greedy matches maximum possible, non-greedy (with `?`) matches minimum (e.g., `.*?`).

**DE:** Quantifizierer-Verhalten: Greedy trifft Maximum möglich, Non-greedy (mit `?`) trifft Minimum (z.B. `.*?`).

---

### [ ] (Character Class)

**EN:** Regex character set matching any single character within brackets (e.g., `[abc]`, `[0-9]`, `[a-zA-Z]`).

**DE:** Regex-Zeichensatz, der jedes einzelne Zeichen innerhalb der Klammern trifft (z.B. `[abc]`, `[0-9]`, `[a-zA-Z]`).

---

### [^ ] (Negated Character Class)

**EN:** Regex character set matching any character NOT in brackets (e.g., `[^0-9]` matches non-digits).

**DE:** Regex-Zeichensatz, der jedes Zeichen trifft, das NICHT in Klammern ist (z.B. `[^0-9]` trifft Nicht-Ziffern).

---

### \* (Asterisk)

**EN:** Regex quantifier matching zero or more occurrences of preceding element.

**DE:** Regex-Quantifizierer, der null oder mehr Vorkommen des vorhergehenden Elements trifft.

---

### \b (Word Boundary)

**EN:** Regex anchor matching position between word and non-word character.

**DE:** Regex-Anker, der Position zwischen Wort- und Nicht-Wort-Zeichen trifft.

---

### \d \D

**EN:** Regex shortcuts: `\d` matches digit [0-9], `\D` matches non-digit.

**DE:** Regex-Abkürzungen: `\d` trifft Ziffer [0-9], `\D` trifft Nicht-Ziffer.

---

### \s \S

**EN:** Regex shortcuts: `\s` matches whitespace (space, tab, newline), `\S` matches non-whitespace.

**DE:** Regex-Abkürzungen: `\s` trifft Leerzeichen (Space, Tab, Zeilenumbruch), `\S` trifft Nicht-Leerzeichen.

---

### \w \W

**EN:** Regex shortcuts: `\w` matches word character [a-zA-Z0-9_], `\W` matches non-word character.

**DE:** Regex-Abkürzungen: `\w` trifft Wortzeichen [a-zA-Z0-9_], `\W` trifft Nicht-Wortzeichen.

---

### ^ (Caret)

**EN:** Regex anchor matching start of string or line.

**DE:** Regex-Anker, der Anfang von String oder Zeile trifft.

---

### regexp

**EN:** Match string against regular expression pattern; returns 1 if match found, 0 otherwise (e.g., `regexp {pattern} $string`).

**DE:** String gegen regulären Ausdruck-Muster abgleichen; gibt 1 zurück bei Treffer, 0 sonst (z.B. `regexp {pattern} $string`).

---

### regexp -indices

**EN:** regexp option that writes index pairs {first last} into result variables instead of substring values. Syntax: regexp -indices ?-options? pattern string ?matchVar? ?subVar...?. Useful when you need to do further string operations using the positions (e.g. for replacement, slicing).

**DE:** regexp-Option die Index-Paare {erster letzter} in die Resultat-Variablen schreibt statt der Substring-Werte. Syntax: regexp -indices ?-options? pattern string ?matchVar? ?subVar...?. Hilfreich wenn weitere String-Operationen mit den Positionen folgen (Ersetzung, Slicing).

---

### regexp -inline

**EN:** regexp option that returns the captured submatches as a list, instead of writing them into variables. Syntax: regexp -inline ?-options? pattern string. Returns: {full_match group1 group2 ...} or empty list if no match. Combined with -all: returns all matches concatenated. Cleaner than match-vars for inline use.

**DE:** regexp-Option die die Capture-Subgruppen als Liste liefert, statt sie in Variablen zu schreiben. Syntax: regexp -inline ?-options? pattern string. Liefert: {full_match gruppe1 gruppe2 ...} oder leere Liste bei kein Treffer. Mit -all: liefert alle Matches konkateniert. Sauberer als Match-Variablen bei Inline-Nutzung.

---

### regexp -line

**EN:** regexp option that enables newline-sensitive matching. Syntax: regexp -line ?-options? pattern string. Equivalent to combining -lineanchor (^ and $ match line boundaries) and -linestop (dot does not match newline). Standard mode for line-oriented patterns.

**DE:** regexp-Option die Newline-sensitives Matching aktiviert. Syntax: regexp -line ?-options? pattern string. Entspricht -lineanchor (^ und $ matchen Zeilengrenzen) und -linestop (Punkt matcht keine Newline) kombiniert. Standardmodus fuer zeilen-orientierte Patterns.

---

### regexp -nocase

**EN:** regexp option for case-insensitive matching. Syntax: regexp -nocase ?-options? pattern string ?matchVar? ?subVar...?. ASCII-only case folding (does not handle locale-specific case rules). Combined with other options like -inline, -all, -indices.

**DE:** regexp-Option fuer case-insensitive Matching. Syntax: regexp -nocase ?-options? pattern string ?matchVar? ?subVar...?. ASCII-Case-Folding (keine locale-spezifischen Case-Regeln). Mit anderen Optionen kombinierbar wie -inline, -all, -indices.

---

### regsub

**EN:** Substitute matched pattern in string with replacement (e.g., `regsub {old} $string "new" result`).

**DE:** Gefundenes Muster im String durch Ersetzung substituieren (z.B. `regsub {old} $string "new" result`).

---

### regsub -all

**EN:** regsub option that replaces all occurrences instead of just the first. Syntax: regsub -all ?-options? pattern string subSpec ?varName?. With varName: writes result into the variable, returns count of replacements. Without: returns the result string. Substitution back-references: \\1, \\2, ..., \\& for full match.

**DE:** regsub-Option die alle Treffer ersetzt statt nur den ersten. Syntax: regsub -all ?-options? pattern string subSpec ?varName?. Mit varName: schreibt das Resultat in die Variable, liefert die Anzahl Ersetzungen. Ohne: liefert den Resultat-String. Substitutions-Backreferences: \\1, \\2, ..., \\& fuer den gesamten Match.

---

### {n} {n,} {n,m}

**EN:** Regex quantifiers for exact, minimum, or range of repetitions (e.g., `{3}`, `{2,}`, `{2,5}`).

**DE:** Regex-Quantifizierer für exakte, minimale oder Bereich von Wiederholungen (z.B. `{3}`, `{2,}`, `{2,5}`).

---

### | (Alternation)

**EN:** Regex OR operator matching left or right pattern (e.g., `cat|dog`).

**DE:** Regex-ODER-Operator, der linkes oder rechtes Muster trifft (z.B. `cat|dog`).

---


## Runtime und Speicher / Runtime and Memory

### Garbage Collection (Tcl)

**EN:** Automatic memory management using reference counting; Tcl_Obj freed when reference count reaches zero; no mark-and-sweep like Java/Python; deterministic cleanup; circular references possible but rare.

**DE:** Automatische Speicherverwaltung mit Reference Counting; Tcl_Obj freigegeben wenn Reference Count null erreicht; kein Mark-and-Sweep wie Java/Python; deterministische Bereinigung; zirkuläre Referenzen möglich aber selten.

---

### Heap

**EN:** Memory region for dynamic allocation; Tcl objects allocated on heap; managed by Tcl memory allocator; grows as needed; distinct from stack (used for procedure calls).

**DE:** Speicher-Region für dynamische Allokation; Tcl-Objekte allokiert auf Heap; verwaltet von Tcl-Memory-Allocator; wächst bei Bedarf; unterschiedlich von Stack (verwendet für Prozedur-Aufrufe).

---

### Memory / Speicher

**EN:** RAM used by Tcl interpreter and application; Tcl manages automatically with garbage collection; variables stored as Tcl_Obj with reference counting; memory leaks rare due to automatic management; monitor with `memory` command (if compiled with memory debugging).

**DE:** RAM verwendet von Tcl-Interpreter und Anwendung; Tcl verwaltet automatisch mit Garbage Collection; Variablen gespeichert als Tcl_Obj mit Reference Counting; Memory Leaks selten durch automatische Verwaltung; überwachen mit `memory`-Befehl (wenn mit Memory-Debugging kompiliert).

---

### Memory Leak

**EN:** Situation where allocated memory not released; rare in Tcl due to automatic management; possible with C extensions if not properly coded; debug with `memory` command or valgrind.

**DE:** Situation, wo allokierter Speicher nicht freigegeben wird; selten in Tcl durch automatische Verwaltung; möglich mit C-Extensions wenn nicht richtig codiert; Debugging mit `memory`-Befehl oder valgrind.

---

### Reference Counting

**EN:** Memory management technique; each Tcl_Obj has counter tracking references; increment on assignment, decrement on unset; object freed when count reaches zero; efficient and predictable.

**DE:** Speicherverwaltungs-Technik; jedes Tcl_Obj hat Zähler, der Referenzen verfolgt; Inkrement bei Zuweisung, Dekrement bei Unset; Objekt freigegeben wenn Zähler null erreicht; effizient und vorhersagbar.

---

### Runtime

**EN:** Execution environment for Tcl programs; includes interpreter, libraries, and system resources; tclsh (console) or wish (GUI) runtimes; can be embedded in applications; manages memory, bytecode compilation, event loop.

**DE:** Ausführungsumgebung für Tcl-Programme; umfasst Interpreter, Bibliotheken und System-Ressourcen; tclsh (Konsole) oder wish (GUI) Laufzeiten; kann in Anwendungen eingebettet werden; verwaltet Speicher, Bytecode-Kompilierung, Event-Loop.

---

### Stack Overflow

**EN:** Error when call stack exceeds limit; caused by deep recursion or infinite recursion; Tcl detects and reports error; fix: use iteration, tail recursion (`tailcall`), or increase stack size.

**DE:** Fehler wenn Call-Stack Limit überschreitet; verursacht durch tiefe Rekursion oder unendliche Rekursion; Tcl erkennt und meldet Fehler; Lösung: Iteration verwenden, Tail-Rekursion (`tailcall`) oder Stack-Größe erhöhen.

---

### memory command

**EN:** Debug command for memory usage information (requires Tcl compiled with memory debugging); subcommands: `memory info` (statistics), `memory active` (list active allocations), `memory validate` (check integrity); not available in standard Tcl builds.

**DE:** Debug-Befehl für Speichernutzungs-Informationen (erfordert Tcl kompiliert mit Memory-Debugging); Unterbefehle: `memory info` (Statistiken), `memory active` (aktive Allokationen auflisten), `memory validate` (Integrität prüfen); nicht verfügbar in Standard-Tcl-Builds.

---

### tclsh

**EN:** Tcl shell; console-based Tcl interpreter runtime; no GUI support; runs Tcl scripts from files or interactively; command: `tclsh script.tcl` or `tclsh` for interactive shell.

**DE:** Tcl-Shell; konsolenbasierte Tcl-Interpreter-Laufzeit; keine GUI-Unterstützung; führt Tcl-Skripte aus Dateien oder interaktiv aus; Befehl: `tclsh script.tcl` oder `tclsh` für interaktive Shell.

---

### wish

**EN:** Windowing shell; Tcl/Tk interpreter with GUI support; runtime for Tk applications; includes complete Tcl interpreter plus Tk widgets; command: `wish script.tcl` or `wish` for interactive GUI shell.

**DE:** Windowing-Shell; Tcl/Tk-Interpreter mit GUI-Unterstützung; Laufzeit für Tk-Anwendungen; enthält vollständigen Tcl-Interpreter plus Tk-Widgets; Befehl: `wish script.tcl` oder `wish` für interaktive GUI-Shell.

---


## Safe Interpreter / Safe-Interpreter

### safe::interpAddToAccessPath

**EN:** Add a directory to a safe interpreter's accessible file paths. Syntax: safe::interpAddToAccessPath slave directory. Returns a virtual token like $1/. The slave can read files there (via source, open) but does not see the real host path. Part of the safe:: high-level API on top of low-level interp commands.

**DE:** Fuegt ein Verzeichnis den zugreifbaren Pfaden eines Safe-Interpreters hinzu. Syntax: safe::interpAddToAccessPath slave directory. Liefert ein virtuelles Token wie $1/. Der Slave kann dort Dateien lesen (per source, open), sieht aber nicht den echten Host-Pfad. Teil der safe::-Hi-Level-API ueber den Low-Level-interp-Befehlen.

---

### safe::interpConfigure

**EN:** Get or set configuration options of a safe interpreter. Syntax: safe::interpConfigure slave ?option? ?value? ... Options: -accessPath, -statics, -nested, -deleteHook. Without option: returns full configuration. Used to inspect or change limits after creation.

**DE:** Liefert oder setzt Konfigurationsoptionen eines Safe-Interpreters. Syntax: safe::interpConfigure slave ?option? ?value? ... Optionen: -accessPath, -statics, -nested, -deleteHook. Ohne Option: liefert die volle Konfiguration. Verwendet zur Inspektion oder Aenderung von Limits nach Erstellung.

---

### safe::interpDelete

**EN:** Delete a safe interpreter and run its delete hook. Syntax: safe::interpDelete slave. Equivalent to interp delete plus the cleanup the safe:: API installed. Preferred over plain interp delete for safe interpreters.

**DE:** Loescht einen Safe-Interpreter und fuehrt seinen Delete-Hook aus. Syntax: safe::interpDelete slave. Entspricht interp delete plus dem Cleanup den die safe::-API installiert hat. Bevorzugt gegenueber reinem interp delete bei Safe-Interpretern.

---

### safe::loadTk

**EN:** Load Tk into a safe interpreter in a restricted form. Syntax: safe::loadTk slave ?-use windowPath?. Loaded Tk is constrained: no native menus, no system dialogs that touch the filesystem, no global resource access. Allows GUI in untrusted code with limited damage potential.

**DE:** Laedt Tk in einen Safe-Interpreter in eingeschraenkter Form. Syntax: safe::loadTk slave ?-use windowPath?. Geladenes Tk ist eingeschraenkt: keine nativen Menues, keine System-Dialoge die das Dateisystem beruehren, kein globaler Ressourcen-Zugriff. Erlaubt GUI in unvertrauten Code mit begrenztem Schadenpotenzial.

---


## Scrollbar-Begriffe / Scrollbar Terms

### Activate

**EN:** Highlight a scrollbar element (arrow1, arrow2, slider).

**DE:** Ein Scrollbar-Element hervorheben (arrow1, arrow2, slider).

---

### Arrow1 / Arrow2

**EN:** Scrollbar arrow buttons at top/left and bottom/right for incremental scrolling.

**DE:** Scrollbar-Pfeil-Buttons oben/links und unten/rechts für inkrementelles Scrollen.

---

### Delta

**EN:** Convert pixel motion to fraction of scrollbar movement.

**DE:** Pixelbewegung in Bruchteil der Scrollbar-Bewegung umwandeln.

---

### Fraction

**EN:** Convert pixel coordinate to scrollbar fraction value (0.0 to 1.0).

**DE:** Pixelkoordinate in Scrollbar-Bruchteilwert umwandeln (0.0 bis 1.0).

---

### Get

**EN:** Retrieve current scrollbar position and size values.

**DE:** Aktuelle Scrollbar-Position und Größenwerte abrufen.

---

### Identify

**EN:** Determine which scrollbar element is at given coordinates.

**DE:** Bestimmen, welches Scrollbar-Element sich an gegebenen Koordinaten befindet.

---

### Jump

**EN:** Scrollbar mode where view updates only when slider is released (not during drag).

**DE:** Scrollbar-Modus, bei dem Ansicht nur aktualisiert wird, wenn Slider losgelassen wird (nicht während Ziehen).

---

### Orient

**EN:** Scrollbar orientation: `vertical` (default) or `horizontal`.

**DE:** Scrollbar-Ausrichtung: `vertical` (Standard) oder `horizontal`.

---

### Scrollbar

**EN:** Widget for scrolling through content that exceeds visible area; can be vertical or horizontal.

**DE:** Widget zum Scrollen durch Inhalt, der den sichtbaren Bereich überschreitet; kann vertikal oder horizontal sein.

---

### Scrollcommand

**EN:** Command linking scrollbar to scrollable widget (e.g., `-yscrollcommand`).

**DE:** Befehl, der Scrollbar mit scrollbarem Widget verknüpft (z.B. `-yscrollcommand`).

---

### Set

**EN:** Configure scrollbar position and size based on visible portion (called by scrolled widget).

**DE:** Scrollbar-Position und -Größe basierend auf sichtbarem Bereich konfigurieren (von gescrolltem Widget aufgerufen).

---

### Slider

**EN:** The movable part of scrollbar indicating current view position.

**DE:** Der bewegliche Teil der Scrollbar, der die aktuelle Ansichtsposition anzeigt.

---

### Trough

**EN:** The background track area of scrollbar where slider moves.

**DE:** Der Hintergrund-Track-Bereich der Scrollbar, in dem sich der Slider bewegt.

---

### Xscrollcommand / Yscrollcommand

**EN:** Options connecting widget's horizontal/vertical scrolling to scrollbar.

**DE:** Optionen, die horizontales/vertikales Scrollen des Widgets mit Scrollbar verbinden.

---


## Shell und Skript-Umgebungen / Shell and Script Environments

### Shebang (#!)

**EN:** First line in script specifying interpreter; format: `#!/path/to/interpreter`; Unix/Linux only; makes script executable; for Tcl: `#!/usr/bin/tclsh` or `#!/usr/bin/env tclsh`; Windows doesn't use shebangs.

**DE:** Erste Zeile im Skript, die Interpreter spezifiziert; Format: `#!/path/to/interpreter`; nur Unix/Linux; macht Skript ausführbar; für Tcl: `#!/usr/bin/tclsh` oder `#!/usr/bin/env tclsh`; Windows verwendet keine Shebangs.

---

### Shell Script

**EN:** Script written for Unix shell (sh, bash, etc.); text file with shell commands; executable with chmod +x; shebang line specifies shell; Tcl more powerful for complex tasks but shell scripts common for system tasks.

**DE:** Skript geschrieben für Unix-Shell (sh, bash, etc.); Text-Datei mit Shell-Befehlen; ausführbar mit chmod +x; Shebang-Zeile spezifiziert Shell; Tcl mächtiger für komplexe Aufgaben aber Shell-Skripte üblich für System-Aufgaben.

---

### bash

**EN:** Bourne-Again Shell; enhanced Unix shell with more features than sh; most common Linux shell; supports arrays, functions, advanced scripting; Tcl scripts can call bash: `exec bash -c "command"`; compatible with sh scripts.

**DE:** Bourne-Again Shell; erweiterte Unix-Shell mit mehr Features als sh; häufigste Linux-Shell; unterstützt Arrays, Funktionen, fortgeschrittenes Scripting; Tcl-Skripte können bash aufrufen: `exec bash -c "command"`; kompatibel mit sh-Skripten.

---

### bat / .bat (Batch File)

**EN:** Windows batch script file; contains series of commands for cmd.exe; DOS/Windows equivalent of shell scripts; simple scripting language; call from Tcl: `exec cmd /c script.bat`; limited compared to Tcl but widely used on Windows.

**DE:** Windows-Batch-Skript-Datei; enthält Serie von Befehlen für cmd.exe; DOS/Windows-Äquivalent von Shell-Skripten; einfache Skriptsprache; Aufruf von Tcl: `exec cmd /c script.bat`; limitiert verglichen mit Tcl aber weit verbreitet auf Windows.

---

### cmd (Windows)

**EN:** Windows Command Processor; command-line interpreter for Windows; replaces older COMMAND.COM; executes batch files (.bat, .cmd); Tcl calls: `exec cmd /c "command"`; different syntax from Unix shells; uses backslash for paths.

**DE:** Windows-Befehls-Prozessor; Kommandozeilen-Interpreter für Windows; ersetzt älteres COMMAND.COM; führt Batch-Dateien aus (.bat, .cmd); Tcl-Aufrufe: `exec cmd /c "command"`; andere Syntax als Unix-Shells; verwendet Backslash für Pfade.

---

### sh (Shell)

**EN:** Unix shell (Bourne shell); command interpreter and scripting language; standard on Unix/Linux; invokes scripts with `#!/bin/sh` shebang; Tcl can call shell scripts: `exec sh script.sh`; modern systems often use bash as sh.

**DE:** Unix-Shell (Bourne-Shell); Befehls-Interpreter und Skriptsprache; Standard auf Unix/Linux; ruft Skripte auf mit `#!/bin/sh` Shebang; Tcl kann Shell-Skripte aufrufen: `exec sh script.sh`; moderne Systeme verwenden oft bash als sh.

---


## Socket/Netzwerk-Begriffe / Socket/Network Terms

### Accept

**EN:** Accept incoming connection on server socket; returns new channel for client.

**DE:** Eingehende Verbindung auf Server-Socket annehmen; gibt neuen Kanal für Client zurück.

---

### Blocking

**EN:** Channel mode where operations wait until complete; set with `fconfigure -blocking`.

**DE:** Kanal-Modus, bei dem Operationen warten, bis sie vollständig sind; gesetzt mit `fconfigure -blocking`.

---

### Buffering

**EN:** Channel buffer mode: `full`, `line`, or `none`; controls when data is flushed.

**DE:** Kanal-Puffermodus: `full`, `line` oder `none`; steuert, wann Daten geleert werden.

---

### Client Socket

**EN:** Socket connecting to remote server for communication.

**DE:** Socket, der sich mit entferntem Server zur Kommunikation verbindet.

---

### Connect

**EN:** Establish connection from client to server socket.

**DE:** Verbindung von Client zu Server-Socket herstellen.

---

### Fileevent

**EN:** Register callback for channel events (readable, writable); enables asynchronous I/O.

**DE:** Callback für Kanal-Ereignisse registrieren (readable, writable); ermöglicht asynchrone E/A.

---

### Host

**EN:** Network hostname or IP address for socket connection.

**DE:** Netzwerk-Hostname oder IP-Adresse für Socket-Verbindung.

---

### Listen

**EN:** Server socket waiting for incoming connections.

**DE:** Server-Socket wartet auf eingehende Verbindungen.

---

### Non-blocking

**EN:** Channel mode where operations return immediately; enables asynchronous I/O.

**DE:** Kanal-Modus, bei dem Operationen sofort zurückkehren; ermöglicht asynchrone E/A.

---

### Port

**EN:** Network port number for socket communication (e.g., 80 for HTTP, 443 for HTTPS).

**DE:** Netzwerk-Portnummer für Socket-Kommunikation (z.B. 80 für HTTP, 443 für HTTPS).

---

### Readable

**EN:** Fileevent condition indicating data available for reading from channel.

**DE:** Fileevent-Bedingung, die anzeigt, dass Daten zum Lesen aus Kanal verfügbar sind.

---

### Server Socket

**EN:** Socket listening for incoming client connections; created with `-server` option.

**DE:** Socket, der auf eingehende Client-Verbindungen wartet; erstellt mit `-server`-Option.

---

### URL

**EN:** Uniform Resource Locator; web address for network resources.

**DE:** Uniform Resource Locator; Webadresse für Netzwerkressourcen.

---

### Writable

**EN:** Fileevent condition indicating channel ready for writing data.

**DE:** Fileevent-Bedingung, die anzeigt, dass Kanal bereit zum Schreiben von Daten ist.

---

### http Package

**EN:** Tcl package for HTTP client operations (e.g., `package require http`).

**DE:** Tcl-Paket für HTTP-Client-Operationen (z.B. `package require http`).

---

### socket

**EN:** Create network socket connection to server or listen for connections (e.g., `socket localhost 8080`).

**DE:** Netzwerk-Socket-Verbindung zum Server erstellen oder auf Verbindungen warten (z.B. `socket localhost 8080`).

---


## Sonstige wichtige Begriffe / Other Important Terms

### Bold

**EN:** Font weight style making text appear thicker and darker.

**DE:** Schriftgewicht-Stil, der Text dicker und dunkler erscheinen lässt.

---

### Expand

**EN:** Whether a widget should expand to fill extra space in pack geometry manager.

**DE:** Ob ein Widget sich ausdehnen soll, um zusätzlichen Raum im Pack-Geometry-Manager zu füllen.

---

### Focus

**EN:** The widget that currently receives keyboard input.

**DE:** Das Widget, das aktuell Tastatureingaben erhält.

---

### Font

**EN:** Specification of typeface, size, and style for text display (e.g., `{Arial 12 bold}`).

**DE:** Spezifikation von Schriftart, Größe und Stil für Textanzeige (z.B. `{Arial 12 bold}`).

---

### Font Family

**EN:** The typeface name such as Arial, Times, Courier, Helvetica.

**DE:** Der Schriftartname wie Arial, Times, Courier, Helvetica.

---

### Font Size

**EN:** The size of the font in points (positive) or pixels (negative).

**DE:** Die Größe der Schrift in Punkten (positiv) oder Pixeln (negativ).

---

### Grab

**EN:** Restrict input to a specific window or widget, blocking other windows.

**DE:** Eingabe auf ein bestimmtes Fenster oder Widget beschränken, andere Fenster blockieren.

---

### Ipadding (ipadx, ipady)

**EN:** Internal padding inside a widget's border; affects widget's internal spacing.

**DE:** Interner Abstand innerhalb der Widget-Grenze; beeinflusst die interne Abstände des Widgets.

---

### Italic

**EN:** Font style that slants text to the right for emphasis.

**DE:** Schriftstil, der Text zur Betonung nach rechts neigt.

---

### Modal

**EN:** A window or dialog that blocks interaction with other windows until closed.

**DE:** Ein Fenster oder Dialog, das Interaktion mit anderen Fenstern blockiert, bis es geschlossen wird.

---

### Overstrike

**EN:** Font decoration that draws a line through the middle of text (strikethrough).

**DE:** Schriftdekoration, die eine Linie durch die Mitte des Textes zieht (durchgestrichen).

---

### Padding (padx, pady)

**EN:** Extra space added around a widget; `padx` for horizontal, `pady` for vertical.

**DE:** Zusätzlicher Raum um ein Widget; `padx` für horizontal, `pady` für vertikal.

---

### Photo

**EN:** Full-color image type in Tk, supporting various image formats.

**DE:** Vollfarben-Bildtyp in Tk, unterstützt verschiedene Bildformate.

---

### Roman

**EN:** Normal, upright font style (opposite of italic).

**DE:** Normaler, aufrechter Schriftstil (Gegenteil von kursiv).

---

### Side

**EN:** Which side to pack a widget against (top, bottom, left, right).

**DE:** An welcher Seite ein Widget angeordnet werden soll (top, bottom, left, right).

---

### Sticky

**EN:** Specifies which sides of grid cell a widget should stick to (n, s, e, w, or combinations).

**DE:** Gibt an, an welchen Seiten der Grid-Zelle ein Widget haften soll (n, s, e, w oder Kombinationen).

---

### Weight

**EN:** Relative size proportion for grid rows/columns when resizing; higher weight gets more space.

**DE:** Relative Größenproportion für Grid-Zeilen/-Spalten beim Skalieren; höheres Gewicht erhält mehr Platz.

---


## Spezielle Tcl-Zeichen / Special Tcl Characters

### " " (Quotes)

**EN:** Double quotes group words allowing substitution of variables and commands within.

**DE:** Doppelte Anführungszeichen gruppieren Wörter und erlauben Substitution von Variablen und Befehlen darin.

---

### # (Comment)

**EN:** Hash marks beginning of comment; text after # on line is ignored (must be at command start).

**DE:** Raute markiert Beginn eines Kommentars; Text nach # auf Zeile wird ignoriert (muss am Befehlsanfang stehen).

---

### $ (Variable Substitution)

**EN:** Dollar sign triggers variable substitution; replaces `$varname` with variable's value.

**DE:** Dollarzeichen löst Variablensubstitution aus; ersetzt `$varname` durch Wert der Variable.

---

### , (Comma)

**EN:** Comma separates list elements or function arguments in expressions.

**DE:** Komma trennt Listenelemente oder Funktionsargumente in Ausdrücken.

---

### ... (Ellipsis)

**EN:** Three dots used in some contexts to indicate continuation or range.

**DE:** Drei Punkte verwendet in einigen Kontexten, um Fortsetzung oder Bereich anzuzeigen.

---

### :: (Namespace Separator)

**EN:** Double colon separates namespace components in qualified names (e.g., `::tk::button`).

**DE:** Doppelter Doppelpunkt trennt Namespace-Komponenten in qualifizierten Namen (z.B. `::tk::button`).

---

### ; (Semicolon)

**EN:** Command separator; allows multiple commands on one line (e.g., `set x 5; set y 10`). ⚠️ **Best Practice Note:** Using semicolons is UNCOMMON in Tcl/Tk code; best practice is to write one command per line WITHOUT semicolons for better readability, maintainability, and debugging. Semicolons are mainly used in interactive shell or one-liners.

**DE:** Befehlstrenner; erlaubt mehrere Befehle auf einer Zeile (z.B. `set x 5; set y 10`). ⚠️ **Best-Practice-Hinweis:** Semikolons sind UNÜBLICH in Tcl/Tk-Code; Best Practice ist eine Anweisung pro Zeile OHNE Semikolon für bessere Lesbarkeit, Wartbarkeit und Debugging. Semikolons werden hauptsächlich in interaktiver Shell oder One-Linern verwendet.

---

### [ ] (Command Substitution)

**EN:** Square brackets execute enclosed command and substitute its result (e.g., `set total [expr $a + $b]`).

**DE:** Eckige Klammern führen eingeschlossenen Befehl aus und substituieren sein Ergebnis (z.B. `set total [expr $a + $b]`).

---

### \ (Backslash/Escape)

**EN:** Escape character; prevents special interpretation of next character or creates special sequences (`\n`, `\t`, `\\`).

**DE:** Escape-Zeichen; verhindert spezielle Interpretation des nächsten Zeichens oder erstellt Sondersequenzen (`\n`, `\t`, `\\`).

---

### \$ \[ \] (Escaped Special Characters)

**EN:** Escaped versions of special characters to use them literally without substitution.

**DE:** Escaped Versionen von Sonderzeichen, um sie buchstäblich ohne Substitution zu verwenden.

---

### \\ (Backslash Literal)

**EN:** Escape sequence for literal backslash character.

**DE:** Escape-Sequenz für literales Backslash-Zeichen.

---

### \n (Newline)

**EN:** Escape sequence for newline/line break character.

**DE:** Escape-Sequenz für Zeilenumbruch-Zeichen.

---

### \r (Carriage Return)

**EN:** Escape sequence for carriage return character.

**DE:** Escape-Sequenz für Wagenrücklauf-Zeichen.

---

### \t (Tab)

**EN:** Escape sequence for horizontal tab character.

**DE:** Escape-Sequenz für horizontales Tabulator-Zeichen.

---

### { } (Grouping/Literal)

**EN:** Curly braces group words and prevent substitution; used for code blocks and literal strings.

**DE:** Geschweifte Klammern gruppieren Wörter und verhindern Substitution; verwendet für Codeblöcke und literale Strings.

---


## Spezielle Werte und Konzepte / Special Values and Concepts

### Control Character

**EN:** Non-printable ASCII character (0-31, 127); controls display/behavior: \n (newline), \t (tab), \r (carriage return), etc.; not visible but has effect; often escaped in strings; can cause display issues.

**DE:** Nicht-druckbares ASCII-Zeichen (0-31, 127); steuert Anzeige/Verhalten: \n (Zeilenumbruch), \t (Tab), \r (Wagenrücklauf), etc.; nicht sichtbar aber hat Effekt; oft escaped in Strings; kann Anzeige-Probleme verursachen.

---

### Empty String

**EN:** String with zero length; Tcl's equivalent of null/nil in other languages; represented as "" or {}; default value for many operations; test: `$var eq ""` or `![string length $var]`; not same as undefined variable.

**DE:** String mit Länge null; Tcls Äquivalent von null/nil in anderen Sprachen; dargestellt als "" oder {}; Standard-Wert für viele Operationen; Test: `$var eq ""` oder `![string length $var]`; nicht gleich wie undefinierte Variable.

---

### NULL

**EN:** Concept of "no value" or "nothing"; ⚠️ Tcl has NO null value - uses empty string "" instead; empty string tests: `$var eq ""` or `string length $var == 0`; different from undefined (variable doesn't exist); C extensions use NULL pointer but Tcl doesn't expose this.

**DE:** Konzept von "kein Wert" oder "nichts"; ⚠️ Tcl hat KEINEN null-Wert - verwendet stattdessen leeren String ""; Leerer-String-Tests: `$var eq ""` oder `string length $var == 0`; anders als undefined (Variable existiert nicht); C-Extensions verwenden NULL-Pointer aber Tcl exponiert dies nicht.

---

### Printable Character

**EN:** Character that produces visible output; ASCII 32-126 (space through ~); excludes control characters (0-31, 127); test in Tcl: `string is print $char`; important for display, validation; non-printable may need escaping.

**DE:** Zeichen, das sichtbare Ausgabe erzeugt; ASCII 32-126 (Leerzeichen bis ~); schließt Steuerzeichen aus (0-31, 127); Test in Tcl: `string is print $char`; wichtig für Anzeige, Validierung; nicht-druckbare benötigen möglicherweise Escaping.

---

### Undefined Variable

**EN:** Variable that doesn't exist; different from empty string; accessing causes error; test existence: `info exists varname`; use default values: `${varname:-default}` in some contexts; common source of errors.

**DE:** Variable, die nicht existiert; anders als leerer String; Zugriff verursacht Fehler; Existenz testen: `info exists varname`; Standard-Werte verwenden: `${varname:-default}` in einigen Kontexten; häufige Fehlerquelle.

---

### Whitespace

**EN:** Invisible spacing characters; includes space (32), tab (\t), newline (\n), carriage return (\r); Tcl word separator; trim with `string trim`; test: `string is space $char`; often ignored in parsing.

**DE:** Unsichtbare Abstandszeichen; umfasst Leerzeichen (32), Tab (\t), Zeilenumbruch (\n), Wagenrücklauf (\r); Tcl-Wort-Trenner; entfernen mit `string trim`; Test: `string is space $char`; oft ignoriert beim Parsen.

---

### prefix (Build System)

**EN:** Installation base directory; default `/usr/local`; affects all installation paths (bindir, libdir, etc.); set with `./configure --prefix=/path`; typical values: `/usr`, `/usr/local`, `/opt/software`, `$HOME/local`; all installed files under prefix hierarchy.

**DE:** Installations-Basis-Verzeichnis; Standard `/usr/local`; beeinflusst alle Installations-Pfade (bindir, libdir, etc.); setzen mit `./configure --prefix=/path`; typische Werte: `/usr`, `/usr/local`, `/opt/software`, `$HOME/local`; alle installierten Dateien unter Prefix-Hierarchie.

---


## Stack-Level und Scope / Stack Level and Scope

### Call Stack

**EN:** Sequence of procedure calls leading to current execution point; levels represent depth.

**DE:** Sequenz von Prozeduraufrufen, die zum aktuellen Ausführungspunkt führen; Levels repräsentieren Tiefe.

---

### Frame (Stack Frame)

**EN:** Execution context containing local variables, return address, and procedure state.

**DE:** Ausführungskontext mit lokalen Variablen, Rücksprungadresse und Prozedur-Zustand.

---

### Global Scope

**EN:** Top-level scope where variables are accessible throughout entire program.

**DE:** Oberste Ebene des Gültigkeitsbereichs, wo Variablen im gesamten Programm zugreifbar sind.

---

### Level

**EN:** Stack frame level in call hierarchy; level 0 is current procedure, level 1 is caller, etc.

**DE:** Stack-Frame-Ebene in Aufruf-Hierarchie; Level 0 ist aktuelle Prozedur, Level 1 ist Aufrufer, etc.

---

### Local Variable

**EN:** Variable accessible only within current procedure or block.

**DE:** Variable nur innerhalb aktueller Prozedur oder Block zugreifbar.

---

### Scope

**EN:** Region of code where variable is accessible; can be local, global, or namespace scope.

**DE:** Codebereich, in dem Variable zugreifbar ist; kann lokaler, globaler oder Namespace-Gültigkeitsbereich sein.

---

### Stack Frame

**EN:** Data structure storing local variables and execution state for each procedure call.

**DE:** Datenstruktur, die lokale Variablen und Ausführungszustand für jeden Prozeduraufruf speichert.

---

### global

**EN:** Tcl command that imports a variable from the global namespace (`::`) into the current procedure scope. `global myvar` does NOT make `myvar` globally accessible — that variable already exists at global level; `global` simply creates a local-scope alias so the proc can read and write it as `$myvar`. Without `global`, a proc accessing `$myvar` would create or read a local variable of the same name. Companion to `variable` (which does the equivalent for namespace-scoped variables) and `upvar` (which links to any caller frame).

**DE:** Tcl-Befehl, der eine Variable aus dem globalen Namespace (`::`) in den aktuellen Prozedur-Scope importiert. `global myvar` macht `myvar` NICHT global zugaenglich — diese Variable existiert bereits auf globaler Ebene; `global` erzeugt nur einen Local-Scope-Alias, sodass die Proc sie als `$myvar` lesen und schreiben kann. Ohne `global` wuerde eine Proc, die auf `$myvar` zugreift, eine lokale Variable gleichen Namens erzeugen oder lesen. Pendant zu `variable` (das dasselbe fuer Namespace-bezogene Variablen tut) und `upvar` (das auf jeden Caller-Frame verlinkt).

---

### global vs variable (scope clarification)

**EN:** `global name` links the local scope to an existing variable in the global namespace (`::name`). `variable name` creates or links to a namespace variable when used inside `namespace eval`, or declares a TclOO instance variable inside a class definition—different mechanisms; `global` never declares namespace-scoped variables.

**DE:** `global name` bindet den lokalen Kontext an eine bestehende Variable im globalen Namespace (`::name`). `variable name` legt im Kontext von `namespace eval` eine Namespace-Variable an bzw. verknüpft sie, in TclOO-Klassen deklariert es eine Instanzvariable—unterschiedliche Mechanismen; `global` deklariert keine Namespace-Variablen.

---

### info level

**EN:** Query information about stack levels; returns procedure name and arguments at specified level.

**DE:** Informationen über Stack-Levels abfragen; gibt Prozedurnamen und Argumente auf angegebener Ebene zurück.

---

### namespace

**EN:** Tcl mechanism for grouping commands and variables to avoid name collisions; created with `namespace eval`; supports nested hierarchy with `::` separator (e.g., `namespace eval ::myns { proc helper {} {...} }`); related: `namespace import`, `namespace export`, `namespace current`.

**DE:** Tcl-Mechanismus zum Gruppieren von Befehlen und Variablen zur Vermeidung von Namenskonflikten; erstellt mit `namespace eval`; unterstützt verschachtelte Hierarchie mit `::`-Trenner (z.B. `namespace eval ::myns { proc helper {} {...} }`); verwandt: `namespace import`, `namespace export`, `namespace current`.

---

### namespace eval

**EN:** Execute script in specified namespace context (e.g., `namespace eval ::myns {...}`).

**DE:** Skript in angegebenem Namespace-Kontext ausführen (z.B. `namespace eval ::myns {...}`).

---

### uplevel

**EN:** Execute script in different stack level (e.g., `uplevel 1 {set x 5}` sets variable in caller's context).

**DE:** Skript in anderer Stack-Ebene ausführen (z.B. `uplevel 1 {set x 5}` setzt Variable im Kontext des Aufrufers).

---

### upvar

**EN:** Create local reference to variable in different stack level (e.g., `upvar 1 varname localname`).

**DE:** Lokale Referenz auf Variable in anderer Stack-Ebene erstellen (z.B. `upvar 1 varname localname`).

---


## String-Operationen / String Operations

### Concatenation

**EN:** String concatenation by placing strings next to each other or using `append` command.

**DE:** String-Verkettung durch Aneinandersetzen von Strings oder Verwendung des `append`-Befehls.

---

### Match Pattern

**EN:** Pattern matching with `string match` using wildcards: `*` (any chars), `?` (single char), `[abc]` (char set).

**DE:** Mustererkennung mit `string match` unter Verwendung von Wildcards: `*` (beliebige Zeichen), `?` (einzelnes Zeichen), `[abc]` (Zeichensatz).

---

### Regular Expression

**EN:** Pattern matching using `regexp` with full regex syntax for complex string operations.

**DE:** Mustererkennung mit `regexp` unter Verwendung vollständiger Regex-Syntax für komplexe String-Operationen.

---


## String-Subcommands / String Subcommands

### string cat

**EN:** Concatenate strings without interpreter overhead (Tcl 8.6+; e.g., `string cat $a $b $c`).

**DE:** Strings ohne Interpreter-Overhead verketten (Tcl 8.6+; z.B. `string cat $a $b $c`).

---

### string compare

**EN:** Compare strings lexicographically; returns -1, 0, or 1.

**DE:** Strings lexikographisch vergleichen; gibt -1, 0 oder 1 zurück.

---

### string equal

**EN:** Test string equality; returns boolean (more efficient than `==` for strings).

**DE:** String-Gleichheit testen; gibt Boolean zurück (effizienter als `==` für Strings).

---

### string first / string last

**EN:** Find first/last occurrence of substring in string; returns index or -1.

**DE:** Erstes/letztes Vorkommen von Substring in String finden; gibt Index oder -1 zurück.

---

### string is

**EN:** Test if string matches type: `alnum`, `alpha`, `digit`, `integer`, `double`, `boolean`, etc.

**DE:** Testen, ob String Typ entspricht: `alnum`, `alpha`, `digit`, `integer`, `double`, `boolean`, etc.

---

### string map

**EN:** Perform multiple string replacements using mapping list (e.g., `string map {old new bad good} $str`).

**DE:** Mehrere String-Ersetzungen mit Mapping-Liste durchführen (z.B. `string map {old new bad good} $str`).

---

### string range

**EN:** Extract substring from start to end index (e.g., `string range $str 0 5`).

**DE:** Substring von Start- bis End-Index extrahieren (z.B. `string range $str 0 5`).

---

### string repeat

**EN:** Repeat string specified number of times (e.g., `string repeat "-" 40`).

**DE:** String angegebene Anzahl Male wiederholen (z.B. `string repeat "-" 40`).

---

### string replace

**EN:** Replace characters in range with new string (e.g., `string replace $str 2 5 "new"`).

**DE:** Zeichen im Bereich durch neuen String ersetzen (z.B. `string replace $str 2 5 "new"`).

---

### string tolower / string toupper

**EN:** Convert string to lowercase/uppercase.

**DE:** String in Kleinbuchstaben/Großbuchstaben konvertieren.

---

### string totitle

**EN:** Convert first character of each word to uppercase, rest to lowercase.

**DE:** Ersten Buchstaben jedes Wortes in Großbuchstaben, Rest in Kleinbuchstaben konvertieren.

---

### string trim

**EN:** Remove leading and trailing characters (whitespace by default) from string.

**DE:** Führende und nachfolgende Zeichen (standardmäßig Leerzeichen) aus String entfernen.

---

### string trimleft / string trimright

**EN:** Remove characters from left/right side of string only.

**DE:** Zeichen nur von linker/rechter Seite des Strings entfernen.

---


## System-Bibliotheken / System Libraries

### CMake

**EN:** Cross-platform build-system generator. Reads a `CMakeLists.txt` declarative description and emits native build files (Makefiles on Unix, MSBuild on Windows, Ninja, Xcode projects). Standard for C/C++ libraries; Tcl extensions written in C often use CMake instead of the older TEA (Tcl Extension Architecture). Run sequence: `cmake -B build .`, then `cmake --build build`.

**DE:** Plattformuebergreifender Build-System-Generator. Liest eine deklarative `CMakeLists.txt`-Beschreibung und emittiert native Build-Dateien (Makefiles auf Unix, MSBuild auf Windows, Ninja, Xcode-Projekte). Standard fuer C/C++-Bibliotheken; Tcl-Erweiterungen in C nutzen oft CMake statt der aelteren TEA (Tcl Extension Architecture). Ablauf: `cmake -B build .`, dann `cmake --build build`.

---

### Fontconfig

**EN:** Linux library that resolves font requests — "find me a font that is Sans-Serif, Bold, 12pt" — by scanning installed fonts and matching against a configuration database (`/etc/fonts/`, `~/.fonts/`, system caches). Used by Cairo, Pango, GTK, Qt, and most modern Linux graphics. Tk on Linux integrates with Fontconfig for font discovery in `font names` and `font configure`. Not present on Windows/macOS.

**DE:** Linux-Bibliothek, die Font-Anfragen aufloest — "finde einen Font, der Sans-Serif, Bold, 12pt ist" — indem sie installierte Fonts scannt und gegen eine Konfigurations-Datenbank (`/etc/fonts/`, `~/.fonts/`, System-Caches) matcht. Genutzt von Cairo, Pango, GTK, Qt und den meisten modernen Linux-Grafiken. Tk auf Linux integriert mit Fontconfig fuer Font-Discovery in `font names` und `font configure`. Auf Windows/macOS nicht vorhanden.

---

### GLib

**EN:** Low-level utility library from the GTK ecosystem — provides data structures (hash tables, lists, trees), event loop (GMainLoop), threading primitives, file utilities, type system (GObject). The foundation that GTK, Cairo (optionally), Pango build on. Not directly used from Tcl, but understanding it helps when reading source code of cairo-bindings or porting GTK examples to Tcl.

**DE:** Low-Level-Utility-Bibliothek aus dem GTK-Oekosystem — bietet Datenstrukturen (Hash-Tabellen, Listen, Baeume), Event-Loop (GMainLoop), Threading-Primitive, File-Utilities, Type-System (GObject). Das Fundament, auf dem GTK, Cairo (optional), Pango aufbauen. Aus Tcl heraus nicht direkt genutzt, aber ihr Verstaendnis hilft beim Lesen von Quellcode der Cairo-Bindings oder beim Portieren von GTK-Beispielen nach Tcl.

---

### HarfBuzz

**EN:** Open-source text-shaping engine — the standard for converting Unicode text to positioned glyphs across modern software (Firefox, Chrome, LibreOffice, GTK, Qt, KDE, Android, ChromeOS). Handles OpenType features: ligatures, contextual alternates, kerning, complex scripts (Arabic, Devanagari, Thai, etc.). Tk 9 uses it for shaping after Bidi run analysis. Pronounced "harf-buzz" (Arabic "movement of letters"). Companion to FreeType (which provides the raster glyphs HarfBuzz positions).

**DE:** Open-Source-Text-Shaping-Engine — der Standard zur Konvertierung von Unicode-Text in positionierte Glyphen in moderner Software (Firefox, Chrome, LibreOffice, GTK, Qt, KDE, Android, ChromeOS). Behandelt OpenType-Features: Ligaturen, kontextuelle Alternativen, Kerning, komplexe Schriften (Arabisch, Devanagari, Thai usw.). Tk 9 nutzt es fuer Shaping nach Bidi-Run-Analyse. Ausgesprochen "harf-buzz" (Arabisch "Bewegung der Buchstaben"). Pendant zu FreeType (das die Raster-Glyphen liefert, die HarfBuzz positioniert).

---

### ICU

**EN:** International Components for Unicode — IBM/open-source library for full Unicode support: case mapping, collation (locale-aware sorting), normalization (NFC/NFD/NFKC/NFKD), text boundary analysis, calendar/time-zone math, message formatting. Large, comprehensive, heavyweight. Tcl 9 borrows ICU's collation algorithm in some places but does not link ICU directly; the build-time choice is "use ICU or use Tcl's own simpler implementations". Distinct from HarfBuzz (which is shaping-only).

**DE:** International Components for Unicode — IBM-/Open-Source-Bibliothek fuer vollen Unicode-Support: Case-Mapping, Collation (locale-bewusste Sortierung), Normalisierung (NFC/NFD/NFKC/NFKD), Text-Grenzen-Analyse, Kalender-/Zeitzonen-Mathematik, Nachrichten-Formatierung. Gross, umfassend, schwergewichtig. Tcl 9 borgt ICUs Collation-Algorithmus an einigen Stellen, linkt ICU aber nicht direkt; die Build-Wahl ist "ICU nutzen oder Tcls eigene einfachere Implementierung". Verschieden von HarfBuzz (das nur Shaping macht).

---

### OpenGL

**EN:** Cross-platform 3D graphics API maintained by Khronos. Provides immediate-mode and shader-based rendering, depth/stencil buffers, texture management. The Tcl world accesses OpenGL through extensions: Togl (Tk widget for OpenGL contexts), TclOpenGL. Modern OpenGL (3.x+) is core-profile and shader-only; older code uses the deprecated fixed-function pipeline.

**DE:** Plattformuebergreifende 3D-Grafik-API von Khronos. Bietet Immediate-Mode- und Shader-basiertes Rendering, Tiefen-/Stencil-Buffer, Texture-Management. Die Tcl-Welt spricht OpenGL ueber Erweiterungen an: Togl (Tk-Widget fuer OpenGL-Kontexte), TclOpenGL. Modernes OpenGL (3.x+) ist Core-Profile und Shader-only; aelterer Code nutzt die veraltete Fixed-Function-Pipeline.

---

### Pango

**EN:** Text-layout library originally from GNOME — handles font selection (via Fontconfig), shaping (via HarfBuzz), bidirectional text (Arabic, Hebrew), complex scripts (Indic, Arabic ligatures). The text-rendering side of the Cairo/Pango pair. Tcl encounters Pango indirectly: when Cairo bindings render text, Pango may be the underlying shaper. Not commonly used directly from Tcl.

**DE:** Text-Layout-Bibliothek urspruenglich aus GNOME — uebernimmt Font-Auswahl (via Fontconfig), Shaping (via HarfBuzz), bidirektionalen Text (Arabisch, Hebraeisch), komplexe Schriften (indische, arabische Ligaturen). Die Text-Render-Seite des Cairo/Pango-Paares. Tcl beruehrt Pango indirekt: wenn Cairo-Bindings Text rendern, kann Pango der darunter liegende Shaper sein. Aus Tcl heraus nicht haeufig direkt verwendet.

---

### SDL

**EN:** Simple DirectMedia Layer — cross-platform multimedia library for games and interactive applications. Provides window management, input (keyboard/mouse/joystick), audio, OpenGL/Vulkan context creation. Bridges between OS abstractions. Tcl bindings exist (TclSDL2, sdltcl) but are less common than Tk for typical GUI work; SDL shines for game-style applications. Often used as a backup display target on platforms where Tk is limited.

**DE:** Simple DirectMedia Layer — plattformuebergreifende Multimedia-Bibliothek fuer Spiele und interaktive Anwendungen. Bietet Fenster-Management, Eingabe (Tastatur/Maus/Joystick), Audio, OpenGL/Vulkan-Kontext-Erzeugung. Brueckt zwischen OS-Abstraktionen. Tcl-Bindings existieren (TclSDL2, sdltcl), sind aber weniger gaengig als Tk fuer typische GUI-Arbeit; SDL glaenzt bei Spiele-artigen Anwendungen. Oft als Backup-Display-Target auf Plattformen, wo Tk limitiert ist.

---

### SheenBidi

**EN:** C library implementing the Unicode Bidirectional Algorithm (UAX #9) — takes logical-order text and produces visual-order runs with their bidi levels. Used by Tk 9's Unix build (`tk-src/unix/bidi/`, vendored as a unity build via `SheenBidi.c`). Faster and smaller than the historic FriBidi. Output is consumed by HarfBuzz for the actual glyph shaping. Build activation: `--enable-bidi` in Tk 9's configure.

**DE:** C-Bibliothek, die den Unicode Bidirectional Algorithm (UAX #9) implementiert — nimmt Text in logischer Reihenfolge und produziert visuelle-Reihenfolge-Runs mit ihren Bidi-Levels. Verwendet von Tk 9s Unix-Build (`tk-src/unix/bidi/`, vendored als Unity-Build via `SheenBidi.c`). Schneller und kleiner als das historische FriBidi. Output wird von HarfBuzz fuer das eigentliche Glyph-Shaping konsumiert. Build-Aktivierung: `--enable-bidi` in Tk 9s configure.

---


## System-Initialisierung / System Initialization

### Initialization Script

**EN:** Script run at startup to configure environment; can be custom script for application initialization; set with TCLLIBPATH or modify init.tcl; used for auto-loading setup, package paths, global variables.

**DE:** Skript beim Start ausgeführt zum Konfigurieren der Umgebung; kann eigenes Skript für Anwendungs-Initialisierung sein; gesetzt mit TCLLIBPATH oder init.tcl ändern; verwendet für Auto-Loading-Setup, Paket-Pfade, globale Variablen.

---

### init.tcl

**EN:** Tcl initialization script executed automatically when interpreter starts; located in tcl_library directory; defines auto-loading, unknown command handler, package system initialization; sets up `auto_path`, `tcl_pkgPath`; creates `auto_load`, `auto_mkindex` procedures; critical for Tcl runtime environment.

**DE:** Tcl-Initialisierungs-Skript automatisch ausgeführt beim Interpreter-Start; befindet sich in tcl_library-Verzeichnis; definiert Auto-Loading, Unknown-Command-Handler, Paket-System-Initialisierung; setzt `auto_path`, `tcl_pkgPath`; erstellt `auto_load`, `auto_mkindex`-Prozeduren; kritisch für Tcl-Laufzeitumgebung.

---

### tk.tcl

**EN:** Tk initialization script; executed when Tk package loaded; sets up Tk-specific bindings, options, and procedures; located in tk_library directory; defines standard Tk behaviors.

**DE:** Tk-Initialisierungs-Skript; ausgeführt wenn Tk-Paket geladen wird; richtet Tk-spezifische Bindings, Optionen und Prozeduren ein; befindet sich in tk_library-Verzeichnis; definiert Standard-Tk-Verhalten.

---

### tk_library

**EN:** Global variable containing path to Tk library directory; contains tk.tcl and Tk support files; set when Tk loaded; typically `$prefix/lib/tk8.6`.

**DE:** Globale Variable mit Pfad zum Tk-Bibliotheks-Verzeichnis; enthält tk.tcl und Tk-Unterstützungs-Dateien; gesetzt wenn Tk geladen; typischerweise `$prefix/lib/tk8.6`.

---


## Systemvariablen / System Variables

### argc / argv / argv0

**EN:** Command-line argument count, list, and program name.

**DE:** Kommandozeilen-Argument-Anzahl, -Liste und Programmname.

---

### auto_path

**EN:** List of directories searched for packages and scripts.

**DE:** Liste von Verzeichnissen, die nach Paketen und Skripten durchsucht werden.

---

### errorCode

**EN:** Machine-readable error code from most recent error.

**DE:** Maschinenlesbarer Fehler-Code vom letzten Fehler.

---

### errorInfo

**EN:** Stack trace from most recent error.

**DE:** Stack-Trace vom letzten Fehler.

---

### tcl_library

**EN:** Directory containing standard Tcl library scripts.

**DE:** Verzeichnis mit Standard-Tcl-Bibliotheks-Skripten.

---

### tcl_patchLevel

**EN:** Detailed Tcl version including patch level (e.g., "8.6.13").

**DE:** Detaillierte Tcl-Version inklusive Patch-Level (z.B. "8.6.13").

---

### tcl_platform

**EN:** Array containing platform information (os, machine, platform, wordSize, etc.).

**DE:** Array mit Plattform-Informationen (os, machine, platform, wordSize, etc.).

---

### tcl_platform(machine)

**EN:** Hardware architecture (x86_64, arm64, etc.).

**DE:** Hardware-Architektur (x86_64, arm64, etc.).

---

### tcl_platform(os)

**EN:** Operating system name (Linux, Windows NT, Darwin, etc.).

**DE:** Betriebssystem-Name (Linux, Windows NT, Darwin, etc.).

---

### tcl_platform(platform)

**EN:** Platform type: unix, windows, or macintosh.

**DE:** Plattform-Typ: unix, windows oder macintosh.

---

### tcl_version

**EN:** Tcl version string (e.g., "8.6").

**DE:** Tcl-Versions-String (z.B. "8.6").

---


## TDBC (Tcl Database Connectivity) / TDBC (Tcl-Datenbank-Konnektivität)

### $db allrows

**EN:** Execute query and return all rows as list of dictionaries.

**DE:** Query ausführen und alle Zeilen als Liste von Dictionaries zurückgeben.

---

### $db begintransaction

**EN:** Begin database transaction (e.g., `$db begintransaction`).

**DE:** Datenbank-Transaktion beginnen (z.B. `$db begintransaction`).

---

### $db close

**EN:** Close database connection and release resources.

**DE:** Datenbank-Verbindung schließen und Ressourcen freigeben.

---

### $db commit

**EN:** Commit current transaction, making changes permanent.

**DE:** Aktuelle Transaktion committen, Änderungen permanent machen.

---

### $db connect

**EN:** Create database connection (e.g., `tdbc::sqlite3::connection create db "database.db"`).

**DE:** Datenbank-Verbindung erstellen (z.B. `tdbc::sqlite3::connection create db "database.db"`).

---

### $db execute

**EN:** Execute SQL statement directly without preparation (e.g., `$db execute "CREATE TABLE..."`).

**DE:** SQL-Statement direkt ohne Vorbereitung ausführen (z.B. `$db execute "CREATE TABLE..."`).

---

### $db foreach

**EN:** Iterate over query results (e.g., `$db foreach row "SELECT * FROM users" {...}`).

**DE:** Über Query-Ergebnisse iterieren (z.B. `$db foreach row "SELECT * FROM users" {...}`).

---

### $db prepare

**EN:** Prepare SQL statement for execution (e.g., `$db prepare "SELECT * FROM users WHERE id=:id"`).

**DE:** SQL-Statement für Ausführung vorbereiten (z.B. `$db prepare "SELECT * FROM users WHERE id=:id"`).

---

### $db rollback

**EN:** Roll back current transaction, discarding all changes.

**DE:** Aktuelle Transaktion zurückrollen, alle Änderungen verwerfen.

---

### $rs close

**EN:** Close result set and release resources.

**DE:** Ergebnismenge schließen und Ressourcen freigeben.

---

### $rs columns

**EN:** Return list of column names in result set.

**DE:** Liste der Spaltennamen in Ergebnismenge zurückgeben.

---

### $rs nextrow

**EN:** Advance to next row in result set; returns 1 if available, 0 if exhausted.

**DE:** Zur nächsten Zeile in Ergebnismenge vorrücken; gibt 1 zurück wenn verfügbar, 0 wenn erschöpft.

---

### $rs rowcount

**EN:** Return number of rows affected by statement (INSERT, UPDATE, DELETE).

**DE:** Anzahl der von Statement betroffenen Zeilen zurückgeben (INSERT, UPDATE, DELETE).

---

### $stmt allrows

**EN:** Execute prepared statement and return all result rows.

**DE:** Vorbereitetes Statement ausführen und alle Ergebnis-Zeilen zurückgeben.

---

### $stmt close

**EN:** Close prepared statement and release resources.

**DE:** Vorbereitetes Statement schließen und Ressourcen freigeben.

---

### $stmt execute

**EN:** Execute prepared statement with parameter values (e.g., `$stmt execute -id 42`).

**DE:** Vorbereitetes Statement mit Parameter-Werten ausführen (z.B. `$stmt execute -id 42`).

---

### $stmt foreach

**EN:** Execute prepared statement and iterate over results.

**DE:** Vorbereitetes Statement ausführen und über Ergebnisse iterieren.

---

### Bind Variable

**EN:** Named placeholder in SQL statement (e.g., `:id`, `:name`) for parameter binding.

**DE:** Benannter Platzhalter in SQL-Statement (z.B. `:id`, `:name`) für Parameter-Bindung.

---

### Transaction

**EN:** Database transaction grouping multiple operations for atomic execution.

**DE:** Datenbank-Transaktion, die mehrere Operationen für atomare Ausführung gruppiert.

---

### tdbc

**EN:** Tcl Database Connectivity - standard database abstraction layer (e.g., `package require tdbc`).

**DE:** Tcl Database Connectivity - Standard-Datenbank-Abstraktionsschicht (z.B. `package require tdbc`).

---

### tdbc::connection

**EN:** Database connection object providing query and transaction methods.

**DE:** Datenbank-Verbindungs-Objekt mit Query- und Transaktions-Methoden.

---

### tdbc::mysql

**EN:** TDBC driver for MySQL/MariaDB databases (e.g., `package require tdbc::mysql`).

**DE:** TDBC-Treiber für MySQL/MariaDB-Datenbanken (z.B. `package require tdbc::mysql`).

---

### tdbc::odbc

**EN:** TDBC driver for ODBC data sources (e.g., `package require tdbc::odbc`).

**DE:** TDBC-Treiber für ODBC-Datenquellen (z.B. `package require tdbc::odbc`).

---

### tdbc::postgres

**EN:** TDBC driver for PostgreSQL databases (e.g., `package require tdbc::postgres`).

**DE:** TDBC-Treiber für PostgreSQL-Datenbanken (z.B. `package require tdbc::postgres`).

---

### tdbc::resultset

**EN:** Result set object from query execution providing row iteration and column access.

**DE:** Ergebnismenge-Objekt aus Query-Ausführung mit Zeilen-Iteration und Spalten-Zugriff.

---

### tdbc::sqlite3

**EN:** TDBC driver for SQLite databases (e.g., `package require tdbc::sqlite3`).

**DE:** TDBC-Treiber für SQLite-Datenbanken (z.B. `package require tdbc::sqlite3`).

---

### tdbc::statement

**EN:** Prepared SQL statement object that can be executed multiple times with different parameters.

**DE:** Vorbereitetes SQL-Statement-Objekt, das mehrfach mit verschiedenen Parametern ausgeführt werden kann.

---


## TEA (Tcl Extension Architecture) / TEA (Tcl-Extension-Architektur)

### --with-tcl

**EN:** Configure option specifying directory containing tclConfig.sh.

**DE:** Configure-Option zum Angeben des Verzeichnisses mit tclConfig.sh.

---

### --with-tk

**EN:** Configure option specifying directory containing tkConfig.sh.

**DE:** Configure-Option zum Angeben des Verzeichnisses mit tkConfig.sh.

---

### TEA

**EN:** Tcl Extension Architecture; standardized build system for Tcl extensions using autotools.

**DE:** Tcl Extension Architecture; standardisiertes Build-System für Tcl-Extensions mit autotools.

---

### TEA_ADD_SOURCES / TEA_ADD_HEADERS

**EN:** TEA macros specifying source and header files for extension.

**DE:** TEA-Makros zum Spezifizieren von Quell- und Header-Dateien für Extension.

---

### TEA_INIT

**EN:** TEA macro initializing extension build configuration.

**DE:** TEA-Makro zum Initialisieren der Extension-Build-Konfiguration.

---

### TEA_LOAD_TCLCONFIG / TEA_LOAD_TKCONFIG

**EN:** TEA macros loading Tcl/Tk build configuration settings.

**DE:** TEA-Makros zum Laden von Tcl/Tk-Build-Konfigurations-Einstellungen.

---

### TEA_PATH_TCLCONFIG

**EN:** TEA macro locating Tcl installation and tclConfig.sh file.

**DE:** TEA-Makro zum Lokalisieren von Tcl-Installation und tclConfig.sh-Datei.

---

### TEA_PUBLIC_TCL_HEADERS

**EN:** TEA macro making Tcl headers available to extension build.

**DE:** TEA-Makro zum Verfügbarmachen von Tcl-Headern für Extension-Build.

---

### pkgIndex.tcl

**EN:** Package index file mapping package names to load scripts for auto-loading.

**DE:** Paket-Index-Datei, die Paketnamen auf Lade-Skripte für Auto-Loading abbildet.

---

### tcl.m4

**EN:** Autoconf macros file providing TEA functionality for finding Tcl/Tk and configuring extensions.

**DE:** Autoconf-Makros-Datei, die TEA-Funktionalität zum Finden von Tcl/Tk und Konfigurieren von Extensions bietet.

---

### tclConfig.sh

**EN:** File containing Tcl build configuration (compiler flags, paths, version).

**DE:** Datei mit Tcl-Build-Konfiguration (Compiler-Flags, Pfade, Version).

---

### tclconfig

**EN:** Directory containing TEA autoconf macros (tcl.m4) for Tcl extension building.

**DE:** Verzeichnis mit TEA-autoconf-Makros (tcl.m4) für Tcl-Extension-Bau.

---

### tkConfig.sh

**EN:** File containing Tk build configuration for building Tk extensions.

**DE:** Datei mit Tk-Build-Konfiguration für Bau von Tk-Extensions.

---


## TTK Theme und Style / TTK Theme and Style

### Element

**EN:** Basic building block of ttk widget appearance (border, field, indicator, etc.).

**DE:** Grundbaustein des TTK-Widget-Aussehens (Border, Field, Indicator, etc.).

---

### Theme

**EN:** Consistent visual appearance system for ttk widgets; includes clam, alt, default, classic.

**DE:** Konsistentes visuelles Erscheinungsbild-System für TTK-Widgets; umfasst clam, alt, default, classic.

---

### ttk::style

**EN:** Configure ttk widget appearance using theme system (e.g., `ttk::style configure TButton -background blue`).

**DE:** TTK-Widget-Aussehen mit Theme-System konfigurieren (z.B. `ttk::style configure TButton -background blue`).

---

### ttk::style configure

**EN:** Set default options for ttk widget style class.

**DE:** Standard-Optionen für TTK-Widget-Stil-Klasse setzen.

---

### ttk::style element create

**EN:** Create custom theme element for ttk widgets.

**DE:** Benutzerdefiniertes Theme-Element für TTK-Widgets erstellen.

---

### ttk::style layout

**EN:** Define or query element layout for ttk widget style.

**DE:** Element-Layout für TTK-Widget-Stil definieren oder abfragen.

---

### ttk::style lookup

**EN:** Query effective option value for style in specific state.

**DE:** Effektiven Optionswert für Stil in spezifischem Zustand abfragen.

---

### ttk::style map

**EN:** Set state-dependent options for ttk widget style (e.g., map active, disabled states).

**DE:** Zustandsabhängige Optionen für TTK-Widget-Stil setzen (z.B. active, disabled Zustände abbilden).

---

### ttk::style theme names

**EN:** Return list of available ttk themes.

**DE:** Liste verfügbarer TTK-Themes zurückgeben.

---

### ttk::style theme use

**EN:** Set active ttk theme (e.g., `ttk::style theme use clam`).

**DE:** Aktives TTK-Theme setzen (z.B. `ttk::style theme use clam`).

---


## TTK-Widgets / TTK Widgets

### ttk::combobox

**EN:** Themed dropdown / typeahead widget. Syntax: ttk::combobox .cb -textvariable v -values {a b c} -state normal|readonly|disabled -postcommand cmd. Generates <<ComboboxSelected>> event on selection. -state readonly prevents free-text entry. The themed alternative to tk_optionMenu and a custom listbox+entry combination.

**DE:** Themed Dropdown- / Typeahead-Widget. Syntax: ttk::combobox .cb -textvariable v -values {a b c} -state normal|readonly|disabled -postcommand cmd. Generiert <<ComboboxSelected>>-Event bei Auswahl. -state readonly verhindert Freitext. Themed-Alternative zu tk_optionMenu und einer Custom-Listbox+Entry-Kombination.

---

### ttk::notebook

**EN:** Tabbed widget container. Syntax: ttk::notebook .nb; .nb add .frame -text "Tab1" -underline 0; .nb select .frame; .nb tab .frame -text "...". Generates <<NotebookTabChanged>> event. Themed alternative to BWidget NoteBook. Each tab hosts a child frame.

**DE:** Tab-Container-Widget. Syntax: ttk::notebook .nb; .nb add .frame -text "Tab1" -underline 0; .nb select .frame; .nb tab .frame -text "...". Generiert <<NotebookTabChanged>>-Event. Themed-Alternative zum BWidget-NoteBook. Jeder Tab beherbergt einen Child-Frame.

---

### ttk::progressbar

**EN:** Progress indicator. Syntax: ttk::progressbar .pb -mode determinate|indeterminate -maximum 100 -value 50 -variable v -orient horizontal|vertical. determinate: shows progress 0..max. indeterminate: animation, no concrete value. Use .pb start ?ms? / .pb stop for indeterminate animation.

**DE:** Fortschritts-Anzeige. Syntax: ttk::progressbar .pb -mode determinate|indeterminate -maximum 100 -value 50 -variable v -orient horizontal|vertical. determinate: zeigt Fortschritt 0..max. indeterminate: Animation, kein konkreter Wert. .pb start ?ms? / .pb stop fuer indeterminate-Animation.

---

### ttk::separator

**EN:** Themed line widget for visual separation. Syntax: ttk::separator .sep -orient horizontal|vertical. Replaces the old TLabel-with-relief workaround. Often used in toolbars and forms.

**DE:** Themed Linien-Widget fuer visuelle Trennung. Syntax: ttk::separator .sep -orient horizontal|vertical. Ersetzt den alten TLabel-mit-Relief-Workaround. Oft in Toolbars und Formularen genutzt.

---

### ttk::sizegrip

**EN:** Resize handle in the bottom-right corner of a window (visual cue for resize). Syntax: ttk::sizegrip .sg. Pack at the bottom-right of a toplevel. On X11/macOS the OS handles resize anyway; on Windows this is a visible cue.

**DE:** Resize-Griff in der unteren rechten Ecke eines Fensters (visuelles Feedback). Syntax: ttk::sizegrip .sg. In die untere rechte Ecke eines Toplevels packen. Auf X11/macOS uebernimmt das OS das Resize ohnehin; auf Windows ist das ein sichtbarer Hinweis.

---

### ttk::spinbox

**EN:** TTK version of spinbox widget with up/down arrows for numeric input.

**DE:** TTK-Version des Spinbox-Widgets mit Auf/Ab-Pfeilen für numerische Eingabe.

---

### ttk::treeview

**EN:** TTK widget displaying hierarchical data in tree or table format (already mentioned but adding here for completeness).

**DE:** TTK-Widget zur Anzeige hierarchischer Daten in Baum- oder Tabellenformat (bereits erwähnt, aber hier für Vollständigkeit).

---


## Tabellen und Layout / Tables and Layout

### Cell

**EN:** Individual element at row/column intersection in table; contains single data value; in grid: widget occupies cell(s); in tablelist: editable or read-only cell.

**DE:** Einzelnes Element an Zeilen-/Spalten-Kreuzung in Tabelle; enthält einzelnen Daten-Wert; in Grid: Widget belegt Zelle(n); in tablelist: bearbeitbare oder schreibgeschützte Zelle.

---

### Column

**EN:** Vertical line in table or grid; contains cells down rows; in grid manager: `-column` option; in tablelist: each column has header and type; in text: character position in line.

**DE:** Vertikale Linie in Tabelle oder Raster; enthält Zellen nach unten; in Grid-Manager: `-column`-Option; in tablelist: jede Spalte hat Header und Typ; im Text: Zeichen-Position in Zeile.

---

### Columnspan

**EN:** Number of columns cell occupies in grid; in Tk: `-columnspan` option (e.g., `grid .widget -columnspan 3`); cell extends horizontally across multiple columns.

**DE:** Anzahl der Spalten, die Zelle im Grid belegt; in Tk: `-columnspan`-Option (z.B. `grid .widget -columnspan 3`); Zelle erstreckt sich horizontal über mehrere Spalten.

---

### Grid (Layout)

**EN:** Table-like layout system in Tk; arranges widgets in rows and columns; cells can span multiple rows/columns; command: `grid .widget -row 0 -column 0`.

**DE:** Tabellenartiges Layout-System in Tk; ordnet Widgets in Zeilen und Spalten an; Zellen können mehrere Zeilen/Spalten überspannen; Befehl: `grid .widget -row 0 -column 0`.

---

### Row

**EN:** Horizontal line in table or grid; contains cells across columns; in Tcl grid manager: `-row` option specifies row position; in tablelist: each row is data record.

**DE:** Horizontale Linie in Tabelle oder Raster; enthält Zellen über Spalten; in Tcl-Grid-Manager: `-row`-Option spezifiziert Zeilen-Position; in tablelist: jede Zeile ist Datensatz.

---

### Rowspan

**EN:** Number of rows cell occupies in grid; in Tk: `-rowspan` option (e.g., `grid .widget -rowspan 2`); cell extends vertically across multiple rows.

**DE:** Anzahl der Zeilen, die Zelle im Grid belegt; in Tk: `-rowspan`-Option (z.B. `grid .widget -rowspan 2`); Zelle erstreckt sich vertikal über mehrere Zeilen.

---

### Table

**EN:** Two-dimensional data structure arranged in rows and columns; Tcl packages: tablelist (tklib), tktable; can be implemented with grid geometry manager or text widget.

**DE:** Zweidimensionale Datenstruktur angeordnet in Zeilen und Spalten; Tcl-Pakete: tablelist (tklib), tktable; kann mit Grid-Geometry-Manager oder Text-Widget implementiert werden.

---

### Table Header

**EN:** Top row in table containing column names/titles; typically fixed and styled differently; in tablelist: configured with `-columns` option.

**DE:** Oberste Zeile in Tabelle mit Spalten-Namen/Titeln; typischerweise fixiert und anders gestaltet; in tablelist: konfiguriert mit `-columns`-Option.

---


## Tag-Systeme / Tag Systems

### Bindtag

**EN:** Tag in bindtags list determining event binding lookup order; controls which bindings fire for widget events.

**DE:** Tag in Bindtags-Liste, der Event-Binding-Lookup-Reihenfolge bestimmt; steuert welche Bindings für Widget-Ereignisse feuern.

---

### Tag (Canvas)

**EN:** Label associated with canvas items for grouping and manipulation; one item can have multiple tags; special tag `all` refers to all items; `current` refers to item under mouse.

**DE:** Label verknüpft mit Canvas-Elementen für Gruppierung und Manipulation; ein Element kann mehrere Tags haben; spezieller Tag `all` bezieht sich auf alle Elemente; `current` bezieht sich auf Element unter Maus.

---

### Tag (General)

**EN:** Named identifier associated with data or elements; used in multiple Tcl/Tk contexts: text widget tags, canvas tags, bindtags, HTML-like tags.

**DE:** Benannte Kennung verknüpft mit Daten oder Elementen; verwendet in mehreren Tcl/Tk-Kontexten: Text-Widget-Tags, Canvas-Tags, Bindtags, HTML-ähnliche Tags.

---

### Tag (Text Widget)

**EN:** Named region in text widget for applying formatting, bindings, or properties to character ranges; multiple tags can overlap (e.g., `.text tag add bold 1.0 1.5`).

**DE:** Benannte Region im Text-Widget zum Anwenden von Formatierung, Bindings oder Eigenschaften auf Zeichenbereiche; mehrere Tags können überlappen (z.B. `.text tag add bold 1.0 1.5`).

---

### Tag Names (Text Widget)

**EN:** Command returning list of all tags defined in text widget (e.g., `.text tag names`).

**DE:** Befehl, der Liste aller im Text-Widget definierten Tags zurückgibt (z.B. `.text tag names`).

---

### Tag Priority (Text Widget)

**EN:** Order in which text tags are applied when overlapping; later tags have higher priority; controlled by tag creation order or `tag raise`/`tag lower` commands.

**DE:** Reihenfolge, in der Text-Tags angewendet werden wenn überlappend; spätere Tags haben höhere Priorität; gesteuert durch Tag-Erstellungs-Reihenfolge oder `tag raise`/`tag lower`-Befehle.

---

### Tag Range

**EN:** Start and end indices defining region where tag is applied in text widget; one tag can have multiple ranges.

**DE:** Start- und End-Indizes, die Region definieren, wo Tag im Text-Widget angewendet wird; ein Tag kann mehrere Bereiche haben.

---


## Tcl-Befehle erweitert / Tcl Commands Extended

### delete

**EN:** Context-dependent: text widget: delete characters (`.text delete 1.0 end`); listbox: delete items (`.listbox delete 0 end`); canvas: use `delete` tag; not standalone Tcl command; widget-specific; removes content without destroying widget.

**DE:** Kontext-abhängig: Text-Widget: Zeichen löschen (`.text delete 1.0 end`); Listbox: Elemente löschen (`.listbox delete 0 end`); Canvas: `delete`-Tag verwenden; kein eigenständiger Tcl-Befehl; Widget-spezifisch; entfernt Inhalt ohne Widget zu zerstören.

---

### forget

**EN:** Remove widget from geometry manager without destroying; syntax: `pack forget .widget` or `grid forget .widget`; widget still exists but not displayed; can be re-managed later; useful for hiding/showing widgets; retains widget state.

**DE:** Widget von Geometry-Manager entfernen ohne zu zerstören; Syntax: `pack forget .widget` oder `grid forget .widget`; Widget existiert noch aber nicht angezeigt; kann später wieder verwaltet werden; nützlich für Verstecken/Zeigen von Widgets; behält Widget-Zustand.

---


## Tcl-Deployment und Distribution / Tcl Deployment and Distribution

### BAWT

**EN:** Build All With Tcl — cross-compilation framework for Tcl/Tk and its ecosystem. Builds Tcl, Tk, and many extensions for multiple target platforms from one configuration. Used to produce the Tclkit/Tclbi distributions on tcl3d.org. Approach: declarative build descriptions per package, automatic dependency ordering, cross-toolchain support. Useful when needing custom Tcl distributions or supporting many platforms.

**DE:** Build All With Tcl — Cross-Kompilations-Framework fuer Tcl/Tk und sein Oekosystem. Baut Tcl, Tk und viele Erweiterungen fuer mehrere Zielplattformen aus einer Konfiguration. Wird verwendet um die Tclkit/Tclbi-Distributionen auf tcl3d.org zu produzieren. Ansatz: deklarative Build-Beschreibungen pro Paket, automatische Abhaengigkeits-Ordnung, Cross-Toolchain-Support. Nuetzlich wenn man eigene Tcl-Distributionen oder viele Plattformen unterstuetzen muss.

---

### Bytecode (Tcl)

**EN:** Compiled intermediate representation of Tcl scripts; generated automatically at runtime by Tcl interpreter for faster execution; stored in memory as Tcl_Obj internal representation; transparent to programmer; can be pre-compiled with TclPro or tbcload.

**DE:** Kompilierte Zwischendarstellung von Tcl-Skripten; automatisch zur Laufzeit vom Tcl-Interpreter generiert für schnellere Ausführung; im Speicher gespeichert als Tcl_Obj interne Darstellung; transparent für Programmierer; kann mit TclPro oder tbcload vorkompiliert werden.

---

### FreeWrap

**EN:** Tool wrapping Tcl/Tk applications into standalone executables; alternative to starpack approach; creates single .exe (Windows) or binary (Unix); includes interpreter and all dependencies; simpler than starkit/sdx but less flexible.

**DE:** Tool zum Verpacken von Tcl/Tk-Anwendungen in eigenständige ausführbare Dateien; Alternative zu Starpack-Ansatz; erstellt einzelne .exe (Windows) oder Binary (Unix); enthält Interpreter und alle Abhängigkeiten; einfacher als starkit/sdx aber weniger flexibel.

---

### Metakit

**EN:** Embedded database library used as the VFS backend for classic Tcl 8.6 Starpacks. A single-file, column-oriented database that Starkits/Starpacks use to package application files (Tcl scripts, libraries, images, etc.) into the appended VFS. Accessed via the `vfs::mk4` Tcl extension. Predates ZipFS by about two decades; replaced in Tcl 9 by ZipFS for simplicity. Still mature and stable for Tcl 8.6 deployment.

**DE:** Eingebettete Datenbank-Bibliothek, die als VFS-Backend fuer klassische Tcl-8.6-Starpacks verwendet wird. Eine single-file spalten-orientierte Datenbank, die Starkits/Starpacks nutzen, um Anwendungsdateien (Tcl-Scripts, Bibliotheken, Bilder usw.) in das angehaengte VFS zu packen. Angesprochen ueber die `vfs::mk4`-Tcl-Erweiterung. Etwa zwei Jahrzehnte aelter als ZipFS; in Tcl 9 zugunsten von ZipFS ersetzt. Fuer Tcl-8.6-Deployment weiterhin reif und stabil.

---

### SDX (Starkit Developer eXtension)

**EN:** Tool for creating, manipulating, and wrapping starkits/starpacks; commands: `sdx qwrap` (create starkit), `sdx unwrap` (extract), `sdx wrap` (package); manages VFS and metadata; essential for starkit development.

**DE:** Tool zum Erstellen, Manipulieren und Verpacken von Starkits/Starpacks; Befehle: `sdx qwrap` (Starkit erstellen), `sdx unwrap` (extrahieren), `sdx wrap` (paketieren); verwaltet VFS und Metadaten; essentiell für Starkit-Entwicklung.

---

### Starkit

**EN:** Self-contained Tcl application archive; ZIP file with .kit extension containing Tcl scripts, libraries, and resources; uses Virtual File System; runs with tclkit; format: standard ZIP with main.tcl entry point in VFS.

**DE:** Eigenständiges Tcl-Anwendungs-Archiv; ZIP-Datei mit .kit-Endung enthaltend Tcl-Skripte, Bibliotheken und Ressourcen; verwendet Virtual File System; läuft mit tclkit; Format: Standard-ZIP mit main.tcl-Einstiegspunkt im VFS.

---

### Starpack

**EN:** Starkit wrapped with tclkit runtime into single executable; combines application and interpreter; truly standalone - no external dependencies; created by appending starkit to tclkit; platform-specific.

**DE:** Starkit verpackt mit tclkit-Laufzeit in einzelne ausführbare Datei; kombiniert Anwendung und Interpreter; wirklich eigenständig - keine externen Abhängigkeiten; erstellt durch Anhängen von Starkit an tclkit; plattformspezifisch.

---

### TclCompiler

**EN:** Tool compiling Tcl scripts to bytecode or native code; multiple implementations: TclPro Compiler (commercial, discontinued), tbcload (bytecode), various third-party tools; improves startup time and provides some obfuscation.

**DE:** Tool zum Kompilieren von Tcl-Skripten zu Bytecode oder nativem Code; mehrere Implementierungen: TclPro Compiler (kommerziell, eingestellt), tbcload (Bytecode), verschiedene Drittanbieter-Tools; verbessert Startzeit und bietet etwas Verschleierung.

---

### Tclkit

**EN:** Single-file Tcl/Tk runtime combining interpreter, libraries, and Virtual File System (VFS); self-contained executable for deployment; no installation needed; available for multiple platforms; runs starkits and standalone scripts.

**DE:** Einzeldatei Tcl/Tk-Laufzeitumgebung, die Interpreter, Bibliotheken und Virtual File System (VFS) kombiniert; eigenständige ausführbare Datei für Deployment; keine Installation nötig; verfügbar für mehrere Plattformen; führt Starkits und eigenständige Skripte aus.

---

### VFS (Virtual File System)

**EN:** Tcl package providing virtual file system layer; allows ZIP archives, HTTP, FTP to appear as directories; used by starkits for embedded resources; transparent to Tcl file operations; `package require vfs`.

**DE:** Tcl-Paket mit virtueller Dateisystem-Schicht; ermöglicht ZIP-Archive, HTTP, FTP als Verzeichnisse erscheinen zu lassen; verwendet von Starkits für eingebettete Ressourcen; transparent für Tcl-Datei-Operationen; `package require vfs`.

---

### ZipFS

**EN:** ZIP-based virtual filesystem built into Tcl 9 core. Mounts ZIP files as if they were directories, so any Tcl code that does `open`, `glob`, `source`, `file exists` works transparently against ZIP contents. The mechanism that makes Zipkits work. Used at runtime via `zipfs mount /vfs/myapp myapp.zip`. Replaces Metakit/VFS as the standard deployment infrastructure in Tcl 9.

**DE:** ZIP-basiertes virtuelles Dateisystem, eingebaut im Tcl-9-Core. Mountet ZIP-Dateien, als waeren sie Verzeichnisse, sodass jeder Tcl-Code mit `open`, `glob`, `source`, `file exists` transparent auf ZIP-Inhalte zugreift. Der Mechanismus, der Zipkits ermoeglicht. Zur Laufzeit verwendet via `zipfs mount /vfs/myapp myapp.zip`. Ersetzt Metakit/VFS als Standard-Deployment-Infrastruktur in Tcl 9.

---

### Zipkit

**EN:** Tcl 9 single-file-binary format. The successor to Starpack: instead of Metakit + SDX, a Zipkit is a Tcl interpreter binary with a ZIP archive appended at the end. The interpreter mounts the appended ZIP as ZipFS at startup. No external tools needed for creation — `tclsh9` can build Zipkits itself via the built-in `zipfs mkimg` command. Smaller than Starpacks, simpler to build, but Tcl-9-only.

**DE:** Tcl-9-Single-File-Binary-Format. Nachfolger des Starpacks: statt Metakit + SDX ist ein Zipkit eine Tcl-Interpreter-Binary mit angehaengtem ZIP-Archiv am Ende. Der Interpreter mountet das angehaengte ZIP als ZipFS beim Start. Keine externen Werkzeuge zur Erzeugung noetig — `tclsh9` baut Zipkits selbst via den eingebauten `zipfs mkimg`-Befehl. Kleiner als Starpacks, einfacher zu bauen, aber Tcl-9-only.

---

### tbcload

**EN:** Tcl package loading precompiled bytecode files (.tbc extension); provides bytecode compilation and loading; improves startup performance; basic code obfuscation; usage: `package require tbcload; source script.tbc`.

**DE:** Tcl-Paket zum Laden vorkompilierter Bytecode-Dateien (.tbc-Endung); bietet Bytecode-Kompilierung und -Laden; verbessert Startperformance; grundlegende Code-Verschleierung; Verwendung: `package require tbcload; source script.tbc`.

---


## Tcl-Konzepte / Tcl Concepts

### ABI

**EN:** Application Binary Interface — the contract between compiled code modules: function-calling conventions, struct layout, register usage, name mangling, symbol visibility. Distinct from API (source-level interface): two code bases can be source-compatible but ABI-incompatible if compiled with different compilers, struct definitions, or alignment rules. For Tcl C extensions: matching ABI between extension and Tcl interpreter is critical — wrong ABI causes crashes, not compile errors. Tcl's Stubs mechanism exists specifically to insulate extensions from interpreter-version ABI changes.

**DE:** Application Binary Interface — der Vertrag zwischen kompilierten Code-Modulen: Funktions-Aufrufkonventionen, Struct-Layout, Register-Nutzung, Name-Mangling, Symbol-Sichtbarkeit. Verschieden von API (Source-Level-Schnittstelle): zwei Code-Basen koennen source-kompatibel, aber ABI-inkompatibel sein, wenn sie mit unterschiedlichen Compilern, Struct-Definitionen oder Alignment-Regeln kompiliert werden. Fuer Tcl-C-Erweiterungen: uebereinstimmende ABI zwischen Erweiterung und Tcl-Interpreter ist kritisch — falsche ABI verursacht Crashs, keine Compile-Errors. Tcls Stubs-Mechanismus existiert genau um Erweiterungen vor Interpreter-Versions-ABI-Aenderungen zu isolieren.

---

### API

**EN:** Application Programming Interface — the source-code-level contract between code modules: which functions exist, what arguments they take, what types they return, what they do. Generally stable across compilers, OSes, and architectures (a function declared the same way will compile the same way). Tcl-level analog: the documented commands of a package. C-level analog: the headers an extension exposes. Distinct from ABI (binary-level contract).

**DE:** Application Programming Interface — der Source-Code-Level-Vertrag zwischen Code-Modulen: welche Funktionen existieren, welche Argumente sie nehmen, welche Typen sie zurueckgeben, was sie tun. In der Regel stabil ueber Compiler, OSes und Architekturen hinweg (eine gleich deklarierte Funktion kompiliert gleich). Tcl-Level-Pendant: die dokumentierten Befehle eines Pakets. C-Level-Pendant: die Header, die eine Erweiterung exponiert. Verschieden von ABI (Binary-Level-Vertrag).

---

### Bind-Substitutions (%)

**EN:** Special `%`-prefixed sequences in Tk `bind` scripts that Tk substitutes with event-specific values just before the script runs. The most common: `%W` (widget), `%x` `%y` (mouse coords relative to widget), `%X` `%Y` (root coords), `%K` (keysym), `%A` (ASCII char), `%b` (button number), `%s` (state modifier bits), `%T` (event type), `%t` (timestamp). The full list is in the `bind` man page. Use them in `bind` arguments, never elsewhere — they only get expanded by Tk's binding interpreter. Common pitfall: must be doubled in Tcl-substituted strings (`"%W"` not `%W` if the binding string is also passing through Tcl interpolation).

**DE:** Spezielle mit `%` praefigierte Sequenzen in Tk-`bind`-Scripts, die Tk kurz vor Script-Ausfuehrung mit Event-spezifischen Werten ersetzt. Die haeufigsten: `%W` (Widget), `%x` `%y` (Maus-Koordinaten relativ zum Widget), `%X` `%Y` (Root-Koordinaten), `%K` (Keysym), `%A` (ASCII-Zeichen), `%b` (Button-Nummer), `%s` (State-Modifier-Bits), `%T` (Event-Typ), `%t` (Zeitstempel). Vollstaendige Liste in der `bind`-Manpage. Nur in `bind`-Argumenten benutzen, sonst nirgends — sie werden nur von Tks Binding-Interpreter expandiert. Haeufige Falle: muessen verdoppelt werden, wenn der Binding-String auch durch Tcl-Interpolation laeuft.

---

### Channel-Driver

**EN:** The C-level interface for implementing custom Tcl channels. A Channel-Driver is a struct of function pointers (`Tcl_ChannelType`) implementing `read`, `write`, `seek`, `close`, `getOptions`, `setOptions`, `watch`, etc. Once registered via `Tcl_CreateChannel`, the driver presents a new channel type to scripts that works with all standard Tcl I/O commands (`puts`, `gets`, `read`, `chan event`). Used by Tcl extensions for sockets, pipes, memory channels, encrypted channels, compression channels.

**DE:** Die C-Level-Schnittstelle zum Implementieren eigener Tcl-Kanaele. Ein Channel-Driver ist ein Struct aus Funktions-Zeigern (`Tcl_ChannelType`), die `read`, `write`, `seek`, `close`, `getOptions`, `setOptions`, `watch` usw. implementieren. Einmal via `Tcl_CreateChannel` registriert, praesentiert der Driver Scripts einen neuen Kanal-Typ, der mit allen Standard-Tcl-IO-Befehlen funktioniert (`puts`, `gets`, `read`, `chan event`). Verwendet von Tcl-Erweiterungen fuer Sockets, Pipes, Memory-Kanaele, verschluesselte Kanaele, Kompressions-Kanaele.

---

### ClientData

**EN:** Generic pointer type in the Tcl C-API, used as a type-erased payload for callbacks. When you register a command, trace, or channel handler via the Tcl C-API, you pass a `ClientData` value that gets passed back to your callback. Effectively `void *` with a Tcl-specific name. Idiomatic usage: the `ClientData` points to a C struct holding the extension's per-callback state.

**DE:** Generischer Pointer-Typ in der Tcl-C-API, verwendet als typ-geloeschte Nutzlast fuer Callbacks. Beim Registrieren eines Befehls, Traces oder Channel-Handlers via Tcl-C-API uebergibt man einen `ClientData`-Wert, der an den eigenen Callback zurueck uebergeben wird. Im Wesentlichen `void *` mit Tcl-spezifischem Namen. Idiomatische Verwendung: das `ClientData` zeigt auf ein C-Struct mit dem Pro-Callback-Zustand der Erweiterung.

---

### Closure (Tcl)

**EN:** A function bundled with a captured environment of variable values. Tcl supports closures three ways: (1) `apply {{args} body $namespace}` — Lambda forms with namespace context; (2) capturing values into a `dict` or list passed to the callback; (3) TclOO objects holding state. The first is the most direct: `set incr [list apply {{x} {return [expr {$x + 1}]}}]; {*}$incr 5` works as a true closure. Common use: deferred callbacks for `after`, `bind`, `fileevent` where the callback needs values from the current scope. Distinct from "closure" in the math sense (transitive closure of a graph) — this entry is the language-design meaning.

**DE:** Eine Funktion gebuendelt mit einer gefangenen Umgebung von Variablenwerten. Tcl unterstuetzt Closures auf drei Wegen: (1) `apply {{args} body $namespace}` — Lambda-Form mit Namespace-Kontext; (2) Werte in einen `dict` oder eine Liste packen, die an den Callback uebergeben wird; (3) TclOO-Objekte mit Zustand. Erste Variante ist am direktesten: `set incr [list apply {{x} {return [expr {$x + 1}]}}]; {*}$incr 5` funktioniert als echte Closure. Typischer Einsatz: aufgeschobene Callbacks fuer `after`, `bind`, `fileevent`, bei denen der Callback Werte aus dem aktuellen Scope braucht. Verschieden von "Closure" im mathematischen Sinn (transitive Huelle eines Graphen) — dieser Eintrag meint die Sprachdesign-Bedeutung.

---

### Command-Prefix

**EN:** A Tcl design pattern: a callback is represented as a partial command — a list of words that will later be extended with additional arguments and executed. Used pervasively: `bind`, `after`, `trace add variable`, `fileevent`, channel `-command` options, ensemble dispatch. The pattern: `lappend cmd ...` and later `{*}$cmd extra_arg`. Allows clean parameter capture and is type-safe (a script string would need quoting/eval).

**DE:** Ein Tcl-Design-Pattern: ein Callback wird als partieller Befehl dargestellt — eine Liste von Wortern, die spaeter mit zusaetzlichen Argumenten erweitert und ausgefuehrt wird. Allgegenwaertig: `bind`, `after`, `trace add variable`, `fileevent`, Kanal-`-command`-Optionen, Ensemble-Dispatch. Das Muster: `lappend cmd ...` und spaeter `{*}$cmd extra_arg`. Erlaubt sauberes Parameter-Capture und ist typsicher (ein Script-String braeuchte Quoting/eval).

---

### Duality (Tcl)

**EN:** Tcl's core type model: every value has two representations simultaneously — a string form (the canonical, always-up-to-date Unicode text) and an internal form (a list, dict, integer, double, etc., cached for fast access). When a value is used as a string, the string form is read; when used as a list, the cached list representation is used. The two are kept in sync by the interpreter. Distinct from "shimmering": duality is the *static* property of having both representations; shimmering is the *dynamic* cost of repeatedly switching between them.

**DE:** Tcls Kern-Typ-Modell: jeder Wert hat zwei Repraesentationen gleichzeitig — eine String-Form (der kanonische, immer aktuelle Unicode-Text) und eine interne Form (eine Liste, ein Dict, ein Integer, ein Double usw., fuer schnellen Zugriff gecached). Wird der Wert als String genutzt, wird die String-Form gelesen; wird er als Liste genutzt, wird die gecachte Listen-Repraesentation genutzt. Der Interpreter haelt beide synchron. Verschieden von "Shimmering": Duality ist die *statische* Eigenschaft, beide Repraesentationen zu haben; Shimmering ist der *dynamische* Aufwand staendigen Hin-und-Her-Wechselns.

---

### Encoding-Profile

**EN:** Tcl 9 concept: a profile controls how `encoding convertto` / `convertfrom` handle invalid byte sequences or characters not representable in the target encoding. Three profiles: `strict` (raise an error on any invalid input — default in Tcl 9), `replace` (substitute U+FFFD for invalid input), `tcl8` (the lenient Tcl-8 behaviour for backward compatibility). Set via `encoding convertto -profile replace utf-8 $str`. A breaking change from Tcl 8.6 where lenient was implicit.

**DE:** Tcl-9-Konzept: ein Profil steuert wie `encoding convertto` / `convertfrom` mit ungueltigen Byte-Sequenzen oder im Ziel-Encoding nicht darstellbaren Zeichen umgehen. Drei Profile: `strict` (Fehler bei jeder ungueltigen Eingabe — Default in Tcl 9), `replace` (Ersetzung mit U+FFFD bei ungueltiger Eingabe), `tcl8` (das nachsichtige Tcl-8-Verhalten fuer Abwaerts-Kompatibilitaet). Gesetzt via `encoding convertto -profile replace utf-8 $str`. Eine Breaking Change gegenueber Tcl 8.6, wo nachsichtiges Verhalten implizit war.

---

### IDNA

**EN:** Internationalized Domain Names in Applications — standard (RFC 5891 / Punycode RFC 3492) for representing domain names with non-ASCII characters. `encoding convertto idna "münchen.de"` returns the ASCII Punycode form. Supported by Tcl's `encoding` command since Tcl 9.0. Used for HTTP requests, DNS lookups, certificate validation — anywhere a domain name must be in ASCII over the wire.

**DE:** Internationalized Domain Names in Applications — Standard (RFC 5891 / Punycode RFC 3492) zur Darstellung von Domain-Namen mit nicht-ASCII-Zeichen. `encoding convertto idna "muenchen.de"` liefert die ASCII-Punycode-Form. Vom `encoding`-Befehl in Tcl seit 9.0 unterstuetzt. Verwendet fuer HTTP-Requests, DNS-Lookups, Zertifikats-Validierung — ueberall wo ein Domain-Name on-the-wire ASCII sein muss.

---

### Idle-Callback

**EN:** A callback registered via `after idle script` — runs not after a fixed delay, but when the event loop becomes idle (no other events pending, no `update` running). Standard mechanism for deferring work that should happen "soon, after the current chaos settles" — typical use: redrawing a widget after multiple property changes, without doing it once per change. Implemented as a separate priority queue in the event loop; idle callbacks fire just before the event loop would block waiting for new events. Counterpart to `after $ms script` which fires on a timer.

**DE:** Ein Callback, registriert via `after idle script` — laeuft nicht nach einer festen Verzoegerung, sondern wenn die Eventloop idle wird (keine anderen Events ausstehend, kein `update` laufend). Standard-Mechanismus zum Verschieben von Arbeit, die "bald, nachdem das aktuelle Chaos sich gelegt hat" passieren soll — typischer Einsatz: ein Widget nach mehreren Property-Aenderungen neu zeichnen, ohne das pro Aenderung zu tun. Implementiert als separate Prioritaets-Queue in der Eventloop; Idle-Callbacks feuern direkt bevor die Eventloop blockieren wuerde, um auf neue Events zu warten. Pendant zu `after $ms script`, das auf einen Timer feuert.

---

### Internal Representation (intrep)

**EN:** The cached, typed form of a Tcl_Obj alongside its canonical string form. When you `set x 42`, the string form is `"42"` and the intrep gets set to an integer once arithmetic touches it. When `lindex $list 0` is called, the list's intrep is the parsed C-array of items. Reads through the intrep are O(1); falling back to re-parsing the string would be O(n). Custom intreps (declared via Tcl_ObjType) are how extensions like rl_json or sqlite3 keep parsed-and-typed data on the Tcl side without repeated parse cost.

**DE:** Die gecachte, typisierte Form eines Tcl_Obj neben seiner kanonischen String-Form. Bei `set x 42` ist die String-Form `"42"` und der intrep wird auf Integer gesetzt, sobald Arithmetik ihn beruehrt. Bei `lindex $list 0` ist der intrep der Liste das geparste C-Array der Elemente. Lesezugriffe ueber den intrep sind O(1); ein Fallback auf Re-Parsen des Strings waere O(n). Eigene Intreps (deklariert via Tcl_ObjType) sind das Mittel, mit dem Erweiterungen wie rl_json oder sqlite3 geparste und typisierte Daten auf Tcl-Seite halten ohne wiederholten Parse-Aufwand.

---

### MVC (Model-View-Controller)

**EN:** Architectural pattern that separates an application into three concerns: Model (data and business rules), View (the visual representation of the data), Controller (input handling and coordination). In Tcl/Tk, the Tk widget hierarchy is the View; Model is typically pure-Tcl objects (often TclOO or `dict` structures) with no Tk dependencies; Controller is the binding/callback layer. Variant patterns common in Tcl/Tk practice: MVP (Model-View-Presenter), MVVM (Model-View-ViewModel), and the simpler Observer pattern. The point is decoupling — Model code should be testable without instantiating Tk.

**DE:** Architektur-Pattern, das eine Anwendung in drei Belange trennt: Model (Daten und Geschaeftsregeln), View (visuelle Repraesentation der Daten), Controller (Eingabe-Handling und Koordination). In Tcl/Tk ist die Tk-Widget-Hierarchie die View; Model sind typisch reine Tcl-Objekte (oft TclOO oder `dict`-Strukturen) ohne Tk-Abhaengigkeiten; Controller ist die Binding-/Callback-Schicht. Verbreitete Varianten in Tcl/Tk-Praxis: MVP (Model-View-Presenter), MVVM (Model-View-ViewModel) und das einfachere Observer-Pattern. Punkt ist Entkoppelung — Model-Code sollte ohne Tk-Instanzierung testbar sein.

---

### Notifier (Tcl)

**EN:** Tcl's platform-abstraction layer for the event loop — wraps the OS event mechanism (select/poll/epoll on Linux, kqueue on macOS/BSD, WaitForMultipleObjects on Windows) into a uniform interface. The Notifier polls file descriptors, timers, and other event sources, and dispatches them to Tcl callbacks. Replaceable: an embedder of Tcl can install a custom Notifier (e.g. to integrate with another event loop like GLib's). Implemented in `tclNotify.c` and platform-specific files like `tclUnixNotfy.c`.

**DE:** Tcls Plattform-Abstraktions-Schicht fuer die Eventloop — kapselt den OS-Event-Mechanismus (select/poll/epoll unter Linux, kqueue unter macOS/BSD, WaitForMultipleObjects unter Windows) in eine einheitliche Schnittstelle. Der Notifier pollt Filedeskriptoren, Timer und andere Eventquellen und dispatched sie an Tcl-Callbacks. Ersetzbar: ein Tcl-Einbettender kann einen eigenen Notifier installieren (z.B. zur Integration mit einer anderen Eventloop wie GLibs). Implementiert in `tclNotify.c` und plattform-spezifischen Dateien wie `tclUnixNotfy.c`.

---

### Reentrancy

**EN:** A property of Tcl's event loop: a callback may itself enter the event loop (via `update`, `vwait`, `tkwait`, modal dialogs) — at which point further events fire while the first callback is still on the stack. The result is "reentrant" execution: callbacks stacked inside callbacks. Common source of subtle bugs ("why does my button handler run twice?"). Mitigation: avoid `update` in handlers; use `after idle` to defer work; design with reentrancy in mind. Implemented in `tclEvent.c` / `tclNotify.c`.

**DE:** Eine Eigenschaft von Tcls Eventloop: ein Callback kann selbst die Eventloop betreten (via `update`, `vwait`, `tkwait`, modale Dialoge) — woraufhin weitere Events feuern, waehrend der erste Callback noch auf dem Stack ist. Resultat: "reentrante" Ausfuehrung — Callbacks stapeln sich in Callbacks. Haeufige Quelle subtiler Bugs ("warum laeuft mein Button-Handler zweimal?"). Gegenmittel: `update` in Handlern vermeiden; `after idle` zum Verschieben von Arbeit nutzen; mit Reentrancy im Hinterkopf entwerfen. Implementiert in `tclEvent.c` / `tclNotify.c`.

---

### TCL_MEM_DEBUG

**EN:** Compile-time define that activates Tcl's debugging memory allocator. When enabled (typically via `--enable-symbols=mem` at configure time), `ckalloc`/`ckfree` become checked allocators tracking every block; the Tcl-level `memory` command becomes available for inspection (`memory info`, `memory active file`, `memory trace on`, `memory validate on`). Must be set consistently across Tcl-core and all extensions in one build — mixing debug and non-debug allocators causes hopeless confusion. Standard development setup, disabled for production.

**DE:** Compile-Zeit-Define, das Tcls Debug-Memory-Allokator aktiviert. Bei Aktivierung (typisch via `--enable-symbols=mem` bei configure) werden `ckalloc`/`ckfree` zu gepruefte Allokatoren, die jeden Block tracken; der Tcl-Level-`memory`-Befehl wird zur Inspektion verfuegbar (`memory info`, `memory active file`, `memory trace on`, `memory validate on`). Muss konsistent in Tcl-Core und allen Erweiterungen eines Builds gesetzt sein — Mischen von Debug und Non-Debug fuehrt zu hoffnungsloser Verwirrung. Standard-Entwicklungs-Setup, fuer Production deaktiviert.

---

### TIP

**EN:** Tcl Improvement Proposal — the formal process for proposing, discussing, and ratifying changes to the Tcl/Tk core. Each TIP gets a number (TIP 100, TIP 352, etc.), an author, a state (Draft, Final, Accepted, Rejected, Withdrawn), and a detailed specification. TIPs are how new language features (`const`, `lseq`, encoding profiles), new commands, and policy changes get standardized. The Tcl Style Guide is itself TIP 352. The TIP archive lives at `core.tcl-lang.org/tips/`.

**DE:** Tcl Improvement Proposal — der formale Prozess zur Vorschlag, Diskussion und Ratifizierung von Aenderungen am Tcl/Tk-Kern. Jeder TIP bekommt eine Nummer (TIP 100, TIP 352, usw.), einen Autor, einen Status (Draft, Final, Accepted, Rejected, Withdrawn) und eine detaillierte Spezifikation. TIPs sind der Weg, wie neue Sprachfeatures (`const`, `lseq`, Encoding-Profile), neue Befehle und Policy-Aenderungen standardisiert werden. Der Tcl Style Guide ist selbst TIP 352. Das TIP-Archiv liegt auf `core.tcl-lang.org/tips/`.

---

### Tcl C-API

**EN:** The C-language interface to the Tcl interpreter — the set of functions, types, and macros (`Tcl_CreateInterp`, `Tcl_Eval`, `Tcl_NewObj`, `Tcl_SetResult`, ...) that lets C code embed or extend Tcl. Stable across Tcl versions only via the Stubs mechanism. Documented in the `Tcl_xxx(3)` man pages. The foundation for every Tcl extension that contains compiled code (vs. pure-Tcl `.tm` modules).

**DE:** Die C-Sprachen-Schnittstelle zum Tcl-Interpreter — der Satz von Funktionen, Typen und Makros (`Tcl_CreateInterp`, `Tcl_Eval`, `Tcl_NewObj`, `Tcl_SetResult`, ...), der C-Code erlaubt, Tcl einzubetten oder zu erweitern. Stabil ueber Tcl-Versionen hinweg nur via Stubs-Mechanismus. Dokumentiert in den `Tcl_xxx(3)`-Manpages. Das Fundament fuer jede Tcl-Erweiterung mit kompiliertem Code (im Gegensatz zu pure-Tcl-`.tm`-Modulen).

---

### Tcl_Interp

**EN:** The Tcl C-API struct representing a Tcl interpreter — the most important type in the API. Holds the command table, variable namespaces, result string, error info, current frame, stubs table. Every Tcl C-API call that operates on a script context takes a `Tcl_Interp *` as its first argument. Created via `Tcl_CreateInterp`, destroyed via `Tcl_DeleteInterp`. A single process can have many `Tcl_Interp`s (one per thread, plus child interpreters via `interp create`).

**DE:** Das Tcl-C-API-Struct, das einen Tcl-Interpreter repraesentiert — der wichtigste Typ in der API. Haelt die Befehlstabelle, Variable-Namespaces, Result-String, Error-Info, aktuellen Frame, Stubs-Tabelle. Jeder Tcl-C-API-Aufruf, der in einem Script-Kontext arbeitet, nimmt einen `Tcl_Interp *` als erstes Argument. Erzeugt via `Tcl_CreateInterp`, zerstoert via `Tcl_DeleteInterp`. Ein Prozess kann viele `Tcl_Interp`s haben (einer pro Thread, plus Kind-Interpreter via `interp create`).

---

### Tcl_InvalidateStringRep

**EN:** Tcl C-API function that marks a Tcl_Obj's cached string form as stale — must be called after mutating the intrep, so the next string read regenerates it. The companion to `updateStringProc` in a Tcl_ObjType. Forgetting `Tcl_InvalidateStringRep` after modifying intrep is one of the classic Tcl C-extension bugs: subsequent reads see the *old* string while the intrep contains new data.

**DE:** Tcl-C-API-Funktion, die die gecachte String-Form eines Tcl_Obj als veraltet markiert — muss aufgerufen werden nach dem Mutieren des Intreps, sodass das naechste String-Lesen ihn neu erzeugt. Das Pendant zu `updateStringProc` in einem Tcl_ObjType. `Tcl_InvalidateStringRep` nach Intrep-Modifikation zu vergessen ist einer der klassischen Tcl-C-Erweiterungs-Bugs: nachfolgende Lesezugriffe sehen den *alten* String, waehrend der Intrep neue Daten enthaelt.

---

### Tcl_ObjType

**EN:** C struct in the Tcl C-API that describes a custom internal representation type for a `Tcl_Obj`. Defines four callbacks: `freeIntRepProc` (cleanup), `dupIntRepProc` (copy on duplication), `updateStringProc` (rebuild canonical string form), `setFromAnyProc` (parse from a string). Lets a C extension cache parsed forms (e.g. JSON DOM, compiled regex, parsed date) on a Tcl value so subsequent reads avoid re-parsing. The basis of every type-specialized Tcl extension.

**DE:** C-Struct in der Tcl-C-API, das einen eigenen Internal-Representation-Typ fuer einen `Tcl_Obj` beschreibt. Definiert vier Callbacks: `freeIntRepProc` (Cleanup), `dupIntRepProc` (Kopie bei Duplikation), `updateStringProc` (kanonische String-Form neu bauen), `setFromAnyProc` (Parse aus String). Erlaubt einer C-Erweiterung, geparste Formen (z.B. JSON-DOM, kompilierte Regex, geparstes Datum) auf einem Tcl-Wert zu cachen, sodass nachfolgende Lesezugriffe das erneute Parsen umgehen. Grundlage jeder typ-spezialisierten Tcl-Erweiterung.

---

### Undo/Redo-Pattern

**EN:** Architectural pattern for reversing and re-applying user actions. Tk's Text widget has it built-in via `-undo true`, exposing `edit undo` / `edit redo` subcommands. For Canvas, custom data structures, and other UI state, the common implementations are: (a) Command pattern — store each action as a command object with `do`/`undo` methods, push to an undo-stack; (b) Memento pattern — store full state snapshots, switch between them. The Command approach is more memory-efficient; the Memento approach is simpler to implement. Critical detail: clear the redo-stack on any new user action (so branching the history doesn't get confusing).

**DE:** Architektur-Pattern zum Rueckgaengig-Machen und Wieder-Anwenden von Benutzeraktionen. Tks Text-Widget hat es eingebaut ueber `-undo true`, das `edit undo` / `edit redo`-Unterbefehle bereitstellt. Fuer Canvas, eigene Datenstrukturen und sonstigen UI-Zustand sind die ueblichen Implementierungen: (a) Command-Pattern — jede Aktion als Befehlsobjekt mit `do`/`undo`-Methoden speichern, auf einen Undo-Stack pushen; (b) Memento-Pattern — vollstaendige Zustands-Snapshots speichern und zwischen ihnen wechseln. Der Command-Ansatz ist speichereffizienter; der Memento-Ansatz einfacher zu implementieren. Kritisches Detail: Redo-Stack bei jeder neuen Benutzeraktion leeren (damit Verzweigen der Historie nicht verwirrt).

---

### Zero-Copy

**EN:** Design pattern where data is shared between subsystems without intermediate copies — typically by passing a pointer plus length, or by mapping the same memory into multiple address spaces. In Tcl C-extensions: returning data from C to Tcl via a Tcl_Obj that wraps the C buffer directly (no `memcpy`), or sharing JSON DOM trees between rl_json and a C library. Saves both CPU and memory for large payloads. Trade-off: more complex memory-ownership rules.

**DE:** Design-Pattern, bei dem Daten zwischen Subsystemen ohne Zwischenkopien geteilt werden — typischerweise durch Uebergabe eines Pointers plus Laenge, oder durch Mappen desselben Speichers in mehrere Adressraeume. In Tcl-C-Erweiterungen: Daten von C nach Tcl ueber einen Tcl_Obj zurueckgeben, der den C-Buffer direkt umhuellt (kein `memcpy`), oder JSON-DOM-Baeume zwischen rl_json und einer C-Bibliothek teilen. Spart CPU und Speicher bei grossen Datenmengen. Trade-Off: komplexere Memory-Ownership-Regeln.

---

### _ANSI_ARGS_

**EN:** C macro defined in `tcl.h` that allows procedure prototypes to work on both ANSI-C and pre-ANSI K&R compilers. Usage: `EXTERN int Tcl_Eval _ANSI_ARGS_((Tcl_Interp *interp, char *cmd));`. On ANSI compilers it expands to the full argument list; on K&R compilers it expands to `()`. Largely historical now — every relevant compiler is ANSI — but appears throughout the Tcl 8.x C-API headers and older extension code.

**DE:** C-Makro, definiert in `tcl.h`, das Prozedur-Prototypen sowohl mit ANSI-C- als auch mit Pre-ANSI-K&R-Compilern funktionieren laesst. Verwendung: `EXTERN int Tcl_Eval _ANSI_ARGS_((Tcl_Interp *interp, char *cmd));`. Bei ANSI-Compilern expandiert es zur vollen Argumentliste; bei K&R-Compilern zu `()`. Inzwischen weitgehend historisch — jeder relevante Compiler ist ANSI — taucht aber in den Tcl-8.x-C-API-Headern und in alterer Erweiterungs-Code auf.

---

### argv

**EN:** Built-in Tcl variable holding the command-line arguments passed to the script as a Tcl list. Counterpart: `argc` for the count, `argv0` for the program name. Standard idiom for arg parsing: `foreach arg $argv { ... }`. Available in every Tcl script run from the shell.

**DE:** Eingebaute Tcl-Variable, die die an das Script uebergebenen Kommandozeilen-Argumente als Tcl-Liste haelt. Pendant: `argc` fuer die Anzahl, `argv0` fuer den Programm-Namen. Standard-Idiom fuer Argument-Parsing: `foreach arg $argv { ... }`. In jedem aus der Shell gestarteten Tcl-Script verfuegbar.

---

### argv0

**EN:** Built-in Tcl variable holding the name of the program being executed — what was given as `argv[0]` to the C `main`. Useful for re-executing oneself, error messages, or behaviour that depends on the program name (a script could behave differently when invoked as `tclsh` vs. `wish` vs. a custom name).

**DE:** Eingebaute Tcl-Variable mit dem Namen des laufenden Programms — das, was als `argv[0]` an die C-`main` uebergeben wurde. Nuetzlich fuer Selbst-Reexecution, Fehlermeldungen oder Verhalten, das vom Programm-Namen abhaengt (ein Script koennte sich anders verhalten, wenn es als `tclsh` vs. `wish` vs. unter eigenem Namen aufgerufen wird).

---

### ckalloc / ckfree

**EN:** Memory-allocation wrappers in the Tcl C-API that route through Tcl's allocator. Use `ckalloc(size)` instead of `malloc`, `ckfree(ptr)` instead of `free`, `ckrealloc(ptr, size)` instead of `realloc`. When the Tcl core is built with `TCL_MEM_DEBUG`, these become checked allocators that detect double-frees, leaks, and buffer overruns — exposed via the Tcl-level `memory` command. Without `TCL_MEM_DEBUG`, they are thin wrappers with no overhead. Required for all extension memory that may be passed back to Tcl.

**DE:** Memory-Allokations-Wrapper in der Tcl-C-API, die durch Tcls Allokator gehen. `ckalloc(size)` statt `malloc`, `ckfree(ptr)` statt `free`, `ckrealloc(ptr, size)` statt `realloc`. Wenn der Tcl-Core mit `TCL_MEM_DEBUG` gebaut wird, sind das gepruefte Allokatoren, die Double-Frees, Leaks und Buffer-Ueberlaeufe erkennen — exponiert ueber den Tcl-Level-`memory`-Befehl. Ohne `TCL_MEM_DEBUG` sind sie duenne Wrapper ohne Overhead. Pflicht fuer alle Erweiterungs-Speicher, die an Tcl zurueckgereicht werden koennen.

---

### encoding (Befehl)

**EN:** Tcl ensemble command for character-encoding operations. Subcommands: `encoding system ?name?` (query/set the system encoding), `encoding names` (list available encodings), `encoding convertto ?-profile profile? encoding string` (convert Tcl-internal string to bytes), `encoding convertfrom ?-profile profile? encoding bytes` (convert bytes to Tcl-internal string), `encoding dirs ?list?` (encoding-file search path). Tcl 9 adds `-profile strict|replace|tcl8` to handle invalid sequences. Separate from `fconfigure -encoding` which is per-channel.

**DE:** Tcl-Ensemble-Befehl fuer Zeichen-Encoding-Operationen. Unterbefehle: `encoding system ?name?` (System-Encoding abfragen/setzen), `encoding names` (verfuegbare Encodings auflisten), `encoding convertto ?-profile profile? encoding string` (Tcl-internen String in Bytes konvertieren), `encoding convertfrom ?-profile profile? encoding bytes` (Bytes in Tcl-internen String konvertieren), `encoding dirs ?list?` (Encoding-Datei-Suchpfad). Tcl 9 ergaenzt `-profile strict|replace|tcl8` fuer ungueltige Sequenzen. Verschieden von `fconfigure -encoding`, das pro Kanal arbeitet.

---

### exit (Befehl)

**EN:** Tcl command that terminates the application. `exit ?returncode?` ends the process with the given return code (default 0). Before exiting, registered cleanup handlers run (e.g. `exit` handlers added via `package require Tk`'s window close-down). Distinct from `return` (which exits a proc) and `break` (which exits a loop). In a Tk application, closing the last window typically calls `exit 0` automatically. Returning a non-zero code is the convention for "an error happened" — useful when the Tcl script is invoked from a shell that checks the exit code.

**DE:** Tcl-Befehl, der die Anwendung beendet. `exit ?returncode?` beendet den Prozess mit dem angegebenen Return-Code (Default 0). Vor dem Beenden laufen registrierte Cleanup-Handler (z.B. `exit`-Handler, die `package require Tk` beim Schliessen des Fensters hinzugefuegt hat). Verschieden von `return` (das eine Proc verlaesst) und `break` (das eine Schleife verlaesst). In einer Tk-Anwendung ruft das Schliessen des letzten Fensters typisch automatisch `exit 0` auf. Einen Non-Zero-Code zurueckzugeben ist die Konvention fuer "ein Fehler ist passiert" — nuetzlich wenn das Tcl-Script aus einer Shell aufgerufen wird, die den Exit-Code prueft.

---

### info frame

**EN:** Tcl introspection command that returns information about the current or specified stack frame: file, line number, command text, calling proc, namespace. `info frame 0` returns the current frame; `info frame -1` the caller. The primary tool for error reporters and custom stack traces — gives more detail than `info level`. Available since Tcl 8.5.

**DE:** Tcl-Introspection-Befehl, der Information ueber den aktuellen oder spezifizierten Stack-Frame liefert: Datei, Zeilennummer, Befehlstext, aufrufende Prozedur, Namespace. `info frame 0` liefert den aktuellen Frame; `info frame -1` den Aufrufer. Das primaere Werkzeug fuer Error-Reporter und eigene Stack-Traces — liefert mehr Detail als `info level`. Verfuegbar seit Tcl 8.5.

---

### info library

**EN:** Tcl introspection subcommand returning the path to the Tcl runtime library directory — where `init.tcl`, `tcltest`, `msgcat`, and other built-in `.tcl` files live. Use case: locating Tcl-side resources programmatically (e.g. an extension finding shared scripts). Typical value: `/usr/lib/tcl9.0` or `C:\Tcl\lib\tcl9.0`.

**DE:** Tcl-Introspection-Unterbefehl, der den Pfad zum Tcl-Runtime-Library-Verzeichnis liefert — wo `init.tcl`, `tcltest`, `msgcat` und andere eingebaute `.tcl`-Dateien liegen. Anwendungsfall: programmatisches Finden Tcl-seitiger Ressourcen (z.B. eine Erweiterung, die geteilte Scripts sucht). Typischer Wert: `/usr/lib/tcl9.0` oder `C:\Tcl\lib\tcl9.0`.

---

### interp (Befehl)

**EN:** Tcl command for managing child interpreters. Each interpreter has its own command and variable namespaces — useful for sandboxing untrusted code, multi-tenant applications, or isolation of plug-ins. Main subcommands: `interp create ?-safe? name` (create child, optionally without I/O and dangerous commands), `interp eval name script` (run script in child), `interp alias name newcmd master oldcmd args` (expose a master command in the child under a new name), `interp delete name`, `interp hide`/`expose` (control which commands are visible), `interp limit` (CPU/command-count limits). The foundation of Safe Tcl.

**DE:** Tcl-Befehl zur Verwaltung von Kind-Interpretern. Jeder Interpreter hat seine eigenen Befehls- und Variablen-Namespaces — nuetzlich fuer Sandboxing nicht vertrauenswuerdigen Codes, Multi-Tenant-Anwendungen oder Isolation von Plug-Ins. Wichtige Unterbefehle: `interp create ?-safe? name` (Kind anlegen, optional ohne I/O und gefaehrliche Befehle), `interp eval name script` (Script im Kind ausfuehren), `interp alias name newcmd master oldcmd args` (Master-Befehl im Kind unter neuem Namen verfuegbar machen), `interp delete name`, `interp hide`/`expose` (Sichtbarkeit von Befehlen steuern), `interp limit` (CPU-/Befehls-Zaehler-Limits). Das Fundament von Safe Tcl.

---

### load

**EN:** Tcl command that loads a compiled extension (shared library) into the interpreter. `load /path/to/library.so packagename` opens the shared object and calls its init function (`Packagename_Init`) which registers new Tcl commands. The C side of the package-loading equation — pure-Tcl packages use `source`, compiled-C packages use `load`. Honours Tcl's stubs mechanism: a stubs-enabled extension works with multiple Tcl versions; a non-stubs extension is bound to one specific Tcl version. Companion to `unload`.

**DE:** Tcl-Befehl, der eine kompilierte Erweiterung (Shared Library) in den Interpreter laedt. `load /path/zur/library.so paketname` oeffnet das Shared Object und ruft seine Init-Funktion (`Paketname_Init`) auf, die neue Tcl-Befehle registriert. Die C-Seite der Paket-Lade-Gleichung — pure-Tcl-Pakete nutzen `source`, kompilierte-C-Pakete nutzen `load`. Befolgt Tcls Stubs-Mechanismus: eine Stubs-fähige Erweiterung funktioniert mit mehreren Tcl-Versionen; eine Non-Stubs-Erweiterung ist an eine spezifische Tcl-Version gebunden. Pendant zu `unload`.

---

### msgcat

**EN:** Tcl's standard internationalization module (message catalog). Stores per-locale translations in `.msg` files under a `msgs/` directory; `mc "Hello"` returns the translation for the active locale. Loaded by `package require msgcat`. The locale is set by `::msgcat::mclocale en` or auto-detected from environment (`$LANG`). Standard mechanism for multi-language Tcl applications; works without any external library.

**DE:** Tcls Standard-Internationalisierungs-Modul (Message Catalog). Speichert Pro-Locale-Uebersetzungen in `.msg`-Dateien unter einem `msgs/`-Verzeichnis; `mc "Hello"` liefert die Uebersetzung fuer die aktive Locale. Geladen via `package require msgcat`. Die Locale wird durch `::msgcat::mclocale en` gesetzt oder aus der Umgebung erkannt (`$LANG`). Standard-Mechanismus fuer mehrsprachige Tcl-Anwendungen; funktioniert ohne externe Bibliothek.

---

### namespace ensemble

**EN:** Tcl mechanism for creating a command that dispatches to multiple sub-commands based on the first argument. `namespace ensemble create -command myCmd -map {add ::ns::add_impl, sub ::ns::sub_impl}` makes `myCmd add 1 2` call `::ns::add_impl 1 2`. Supports prefix matching, `-unknown` callbacks for dynamic dispatch, nested ensembles. The same mechanism powers built-in `info`, `string`, `file`, `dict`, `chan`. Standard pattern for designing command sets that scale.

**DE:** Tcl-Mechanismus zum Erzeugen eines Befehls, der basierend auf dem ersten Argument an mehrere Unterbefehle dispatched. `namespace ensemble create -command myCmd -map {add ::ns::add_impl, sub ::ns::sub_impl}` macht, dass `myCmd add 1 2` `::ns::add_impl 1 2` aufruft. Unterstuetzt Prefix-Matching, `-unknown`-Callbacks fuer dynamischen Dispatch, verschachtelte Ensembles. Derselbe Mechanismus treibt die eingebauten `info`, `string`, `file`, `dict`, `chan`. Standard-Pattern fuer skalierende Befehls-Sets.

---

### package (Befehl)

**EN:** Tcl ensemble command for package management. Main subcommands: `package require name ?version?` (load a package; raises error if not available), `package provide name version` (declare that the current script provides a package), `package ifneeded name version script` (register a script that loads the package on demand — used in `pkgIndex.tcl`), `package versions name` (list installed versions), `package present name` (return loaded version, error if not loaded), `package forget name` (remove from registry), `package names` (list all known packages). The foundation of Tcl's library system alongside `tcl::tm` modules.

**DE:** Tcl-Ensemble-Befehl fuer Paket-Verwaltung. Wichtige Unterbefehle: `package require name ?version?` (Paket laden; Fehler wenn nicht verfuegbar), `package provide name version` (deklariert dass das aktuelle Script ein Paket bereitstellt), `package ifneeded name version script` (registriert ein Script, das das Paket on-demand laedt — wird in `pkgIndex.tcl` verwendet), `package versions name` (installierte Versionen auflisten), `package present name` (geladene Version liefern, Fehler wenn nicht geladen), `package forget name` (aus Registry entfernen), `package names` (alle bekannten Pakete auflisten). Das Fundament von Tcls Library-System neben den `tcl::tm`-Modulen.

---

### package present

**EN:** Tcl built-in command that returns the currently-loaded version of a package, or raises an error if the package is not loaded. Contrasted with `package require` which loads the package if not already loaded. Useful for: (a) verifying that a `package require` actually succeeded with the expected version; (b) inspection without side-effects ("is this loaded?"). Returns the version as a string. `package versions name` lists all installed versions; `package present name` returns just the active one.

**DE:** Tcl-Built-in-Befehl, der die aktuell geladene Version eines Pakets liefert, oder einen Fehler wirft, wenn das Paket nicht geladen ist. Im Gegensatz zu `package require`, das das Paket laedt, falls noch nicht geschehen. Nuetzlich fuer: (a) Verifikation, dass ein `package require` mit der erwarteten Version erfolgreich war; (b) seiteneffekt-freie Inspektion ("ist das geladen?"). Liefert die Version als String. `package versions name` listet alle installierten Versionen; `package present name` liefert nur die aktive.

---

### parray

**EN:** Tcl convenience command that prints the contents of an array to stdout in a readable form, one element per line. `parray myArr` displays all keys and values. Standard debugging aid for inspecting array state. Defined in `init.tcl` (the boot-up script), so available in every interactive Tcl session. Sister command to `puts` for arrays.

**DE:** Tcl-Komfort-Befehl, der den Inhalt eines Arrays in lesbarer Form auf stdout ausgibt, ein Element pro Zeile. `parray myArr` zeigt alle Schluessel und Werte. Standard-Debugging-Hilfe zur Inspektion von Array-Zustand. Definiert in `init.tcl` (dem Boot-Up-Script), daher in jeder interaktiven Tcl-Sitzung verfuegbar. Schwester-Befehl zu `puts` fuer Arrays.

---

### rethrow

**EN:** In Tcl `try`/`on error`/`trap` blocks: re-raising a caught exception to propagate it upward unchanged, after performing some local action (logging, cleanup). Idiom: `try { ... } on error {msg opts} { log $msg; return -options $opts $msg }`. The `-options $opts` preserves the original error code, error info, line number — so the outer handler sees the original error, not a freshly-built one.

**DE:** In Tcls `try`/`on error`/`trap`-Bloecken: das Wieder-Auswerfen einer gefangenen Exception, um sie unveraendert nach oben zu propagieren, nachdem eine lokale Aktion (Logging, Cleanup) erfolgt ist. Idiom: `try { ... } on error {msg opts} { log $msg; return -options $opts $msg }`. Das `-options $opts` erhaelt den originalen Error-Code, Error-Info, Zeilennummer — sodass der aeussere Handler den Original-Fehler sieht, nicht einen frisch gebauten.

---

### return -code

**EN:** Tcl mechanism to return from a procedure with a specific completion code: `return -code ok` (normal), `error` (exception), `return` (caller's caller returns too), `break`/`continue` (loop control), `5+` (custom codes). The basis for `try`/`catch` and Tcl's exception model. `error msg` is essentially `return -code error -errorinfo ... msg`. Custom codes (≥5) let users build their own control structures.

**DE:** Tcl-Mechanismus, um aus einer Prozedur mit einem bestimmten Vollendungs-Code zurueckzukehren: `return -code ok` (normal), `error` (Exception), `return` (auch der Aufrufer des Aufrufers kehrt zurueck), `break`/`continue` (Schleifensteuerung), `5+` (Custom-Codes). Die Grundlage fuer `try`/`catch` und Tcls Exception-Modell. `error msg` ist im Wesentlichen `return -code error -errorinfo ... msg`. Custom-Codes (≥5) erlauben das Bauen eigener Kontrollstrukturen.

---

### set

**EN:** The most fundamental Tcl command — assigns and retrieves variable values. Two forms: `set varname value` assigns the value and returns it; `set varname` returns the current value (error if unset). Tcl's variable system has no separate "declaration" — `set` both creates the variable and assigns it. Returns the assigned/retrieved value, so `set x [set y 42]` works and leaves both x and y as 42. The basis of every Tcl script.

**DE:** Der fundamentalste Tcl-Befehl — weist Variablenwerten zu und liest sie. Zwei Formen: `set varname value` weist den Wert zu und liefert ihn zurueck; `set varname` liefert den aktuellen Wert (Fehler bei nicht gesetzter Variable). Tcls Variablen-System hat keine separate "Deklaration" — `set` erzeugt die Variable und weist sie gleichzeitig zu. Liefert den zugewiesenen/gelesenen Wert zurueck, daher funktioniert `set x [set y 42]` und laesst beide x und y auf 42. Die Basis jedes Tcl-Scripts.

---

### source

**EN:** Tcl command that reads and evaluates a script file in the current interpreter and namespace. `source filename.tcl` runs the file's contents as if typed at that point. Used for: splitting an application into multiple files, loading configuration scripts, dynamic plug-in loading. Honours the current `encoding system` for reading the file. Variables, procs, and namespaces defined in the file become available in the caller's scope (the file does not have its own scope). Returns the result of the last command executed.

**DE:** Tcl-Befehl, der eine Script-Datei im aktuellen Interpreter und Namespace einliest und ausfuehrt. `source filename.tcl` fuehrt den Datei-Inhalt aus, als waere er an dieser Stelle getippt worden. Verwendet fuer: Aufteilen einer Anwendung in mehrere Dateien, Laden von Konfigurations-Scripts, dynamisches Plug-In-Laden. Befolgt das aktuelle `encoding system` beim Lesen der Datei. Im File definierte Variablen, Procs und Namespaces sind im Scope des Aufrufers verfuegbar (die Datei hat keinen eigenen Scope). Liefert das Ergebnis des letzten ausgefuehrten Befehls.

---

### tcl_interactive

**EN:** Built-in Tcl variable that is `1` when running in interactive mode (REPL prompt) and `0` otherwise. Used by code that should behave differently in scripts vs. an interactive session — e.g. only printing prompts or progress messages when the user is watching. Set by `tclsh` / `wish` at startup based on whether stdin is a terminal.

**DE:** Eingebaute Tcl-Variable, die `1` ist bei interaktivem Modus (REPL-Prompt) und sonst `0`. Verwendet von Code, der sich in Scripts anders verhalten soll als in einer interaktiven Sitzung — z.B. nur Prompts oder Fortschrittsmeldungen ausgeben, wenn der Nutzer zusieht. Wird von `tclsh` / `wish` beim Start gesetzt, basierend darauf, ob stdin ein Terminal ist.

---

### tcl_precision

**EN:** Built-in Tcl variable controlling the number of significant digits used when converting floating-point values to strings. Default: `0`, which means "enough digits to round-trip exactly". Old default was `12` digits. Setting it to other values affects every implicit float-to-string conversion in the interpreter. Most modern code should leave it at `0`; only set it for compatibility with old code or specific formatting needs.

**DE:** Eingebaute Tcl-Variable, die die Anzahl signifikanter Stellen bei Float-nach-String-Konversion steuert. Default: `0`, was "genug Stellen fuer exakten Round-Trip" bedeutet. Alter Default war `12` Stellen. Andere Werte beeinflussen jede implizite Float-nach-String-Konversion im Interpreter. Moderner Code laesst sie meist auf `0`; nur fuer Kompatibilitaet mit altem Code oder spezielle Formatierungs-Anforderungen aendern.

---

### tclshrc

**EN:** Tcl's per-user initialization file. When `tclsh` (or `wish`) starts in interactive mode, it sources `~/.tclshrc` (Unix) or `~/tclshrc.tcl` (Windows) if present. Use it for persistent shell customization: `auto_path` extensions, frequently-used `package require`s, custom prompts via `tcl_prompt1`. Analog to `.bashrc` for Tcl. Non-interactive runs (script execution) do not source it.

**DE:** Tcls benutzer-spezifische Initialisierungsdatei. Wenn `tclsh` (oder `wish`) interaktiv startet, sourct es `~/.tclshrc` (Unix) oder `~/tclshrc.tcl` (Windows), falls vorhanden. Nutzbar fuer persistente Shell-Anpassung: `auto_path`-Erweiterungen, haeufig verwendete `package require`s, eigene Prompts via `tcl_prompt1`. Pendant zu `.bashrc` fuer Tcl. Nicht-interaktive Laufe (Script-Ausfuehrung) sourcen es nicht.

---

### tls (Tcl-Paket)

**EN:** Tcl extension providing TLS/SSL support for sockets. Wraps OpenSSL (or compatible libraries). `package require tls` then `tls::socket -host www.example.com -port 443` creates an encrypted socket usable with all standard Tcl I/O commands. Required for any HTTPS work — the `http` package transparently uses `tls::socket` if `tls::register` was called. Supports certificate verification, client certificates, SNI, ALPN. The de-facto standard for secure-channel work in Tcl.

**DE:** Tcl-Erweiterung, die TLS-/SSL-Unterstuetzung fuer Sockets bietet. Verpackt OpenSSL (oder kompatible Bibliotheken). `package require tls` und dann `tls::socket -host www.example.com -port 443` erzeugt einen verschluesselten Socket, nutzbar mit allen Standard-Tcl-I/O-Befehlen. Erforderlich fuer jede HTTPS-Arbeit — das `http`-Paket nutzt transparent `tls::socket`, wenn `tls::register` aufgerufen wurde. Unterstuetzt Zertifikat-Verifikation, Client-Zertifikate, SNI, ALPN. Der De-facto-Standard fuer Secure-Channel-Arbeit in Tcl.

---

### trace (Befehl)

**EN:** Tcl ensemble command for monitoring variable, command, and execution events. Three subcommand families: `trace add variable name ops cmd` (callback on read/write/unset), `trace add command name ops cmd` (callback on rename/delete), `trace add execution name ops cmd` (callback when a command runs — enter/leave/enterstep/leavestep). Companion subcommands: `trace remove ...`, `trace info ...`. Used for: debugging (log every change to a variable), reactive programming (recompute derived values on change), data binding (sync widget to variable). The mechanism behind Tk's `-textvariable`.

**DE:** Tcl-Ensemble-Befehl zum Beobachten von Variablen-, Befehls- und Ausfuehrungs-Ereignissen. Drei Unterbefehl-Familien: `trace add variable name ops cmd` (Callback bei read/write/unset), `trace add command name ops cmd` (Callback bei rename/delete), `trace add execution name ops cmd` (Callback wenn ein Befehl laeuft — enter/leave/enterstep/leavestep). Begleitende Unterbefehle: `trace remove ...`, `trace info ...`. Verwendet fuer: Debugging (jede Aenderung einer Variable loggen), reaktive Programmierung (abgeleitete Werte bei Aenderung neu berechnen), Data-Binding (Widget mit Variable synchronisieren). Der Mechanismus hinter Tks `-textvariable`.

---

### unload

**EN:** Tcl command that unloads a previously `load`ed extension. Calls the extension's `Packagename_Unload` function (which must clean up registered commands and freed allocated memory) and removes the shared library from the interpreter. Less commonly used than `load`: most extensions don't bother implementing a clean `Unload` function, so unloading them can leak resources or leave the interpreter in an inconsistent state. Useful in long-running embedders that want to swap implementations at runtime.

**DE:** Tcl-Befehl, der eine zuvor mit `load` geladene Erweiterung entlaedt. Ruft die `Paketname_Unload`-Funktion der Erweiterung auf (die registrierte Befehle aufraeumen und allokierten Speicher freigeben muss) und entfernt die Shared Library aus dem Interpreter. Weniger haeufig verwendet als `load`: viele Erweiterungen implementieren kein sauberes `Unload`, sodass das Entladen Ressourcen leaken oder den Interpreter in inkonsistentem Zustand hinterlassen kann. Nuetzlich in lang-laufenden Embeddern, die Implementierungen zur Laufzeit wechseln wollen.

---


## Tcl-Patterns und Konzepte / Tcl Patterns and Concepts

### Action Pattern

**EN:** Architectural pattern for GUI applications: every user interaction is represented as a discrete "action" — a named, parameter-bundled command object that performs the work. Buttons, menu items, keyboard shortcuts, and toolbar entries all invoke the same action by name; the action itself encapsulates "what happens". Enables uniform enable/disable logic, consistent undo/redo (each action knows how to undo itself), and clean separation between UI bindings and behaviour. Standard in modern GUI toolkits (Qt's QAction, Swing's Action, Cocoa's first-responder chain).

**DE:** Architektur-Pattern fuer GUI-Anwendungen: jede Benutzerinteraktion wird als diskrete "Action" repraesentiert — ein benanntes, parameter-gebuendeltes Befehlsobjekt, das die Arbeit verrichtet. Buttons, Menue-Eintraege, Tastenkuerzel und Toolbar-Eintraege rufen alle dieselbe Action via Name auf; die Action selbst kapselt das "was passiert". Erlaubt einheitliche Enable/Disable-Logik, konsistente Undo/Redo (jede Action weiss wie sie sich rueckgaengig macht) und klare Trennung zwischen UI-Bindings und Verhalten. Standard in modernen GUI-Toolkits (Qts QAction, Swings Action, Cocoas First-Responder-Chain).

---

### Aspect-Ratio-Fit

**EN:** Image-and-layout pattern for scaling content into a target area while keeping its aspect ratio. Two variants: **Contain (Fit)** — scale by `min(targetW/imgW, targetH/imgH)` so the entire image fits, with letterbox bars on the unused dimension; **Cover (Fill)** — scale by `max(targetW/imgW, targetH/imgH)` so the image fills the whole area, cropping the overflow. Letterbox = horizontal bars (top/bottom); Pillarbox = vertical bars (left/right). The same formulas appear in HTML/CSS (`object-fit: contain` vs `object-fit: cover`), in PowerPoint's "Format Picture", in Tk's `photo copy -shrink`, and in pdf4tcl's image sizing.

**DE:** Bild- und Layout-Pattern zum Skalieren von Inhalt in einen Zielbereich unter Erhalt des Seitenverhaeltnisses. Zwei Varianten: **Contain (Fit)** — skalieren mit `min(targetW/imgW, targetH/imgH)`, sodass das ganze Bild reinpasst, mit Letterbox-Balken auf der unbenutzten Dimension; **Cover (Fill)** — skalieren mit `max(targetW/imgW, targetH/imgH)`, sodass das Bild den ganzen Bereich fuellt und der Ueberhang abgeschnitten wird. Letterbox = horizontale Balken (oben/unten); Pillarbox = vertikale Balken (links/rechts). Dieselben Formeln tauchen in HTML/CSS (`object-fit: contain` vs `object-fit: cover`), in PowerPoints "Bild formatieren", in Tks `photo copy -shrink` und in pdf4tcls Bildgroesse auf.

---

### Command Pattern

**EN:** Pattern encapsulating commands as objects; natural in Tcl where procedures are first-class commands.

**DE:** Muster zur Kapselung von Befehlen als Objekte; natürlich in Tcl, wo Prozeduren First-Class-Befehle sind.

---

### Debounce / Throttle

**EN:** Two event-rate-limiting techniques. **Debounce**: defer running a callback until the event-stream pauses — typical for "user finished typing in search field": `after cancel $::debounceId; set ::debounceId [after 300 doSearch]`. The cancel-and-reset pattern ensures only the last keystroke triggers a search. **Throttle**: run a callback at most every N milliseconds even during a continuous event stream — typical for "scroll position update": a flag prevents re-entry until the timer fires. Debounce trades responsiveness for fewer calls; throttle gives steady update frequency. Both implemented with `after` in pure Tcl.

**DE:** Zwei Techniken zur Begrenzung der Event-Rate. **Debounce**: einen Callback erst dann laufen lassen, wenn der Event-Strom pausiert — typisch fuer "Nutzer hat Tippen im Suchfeld beendet": `after cancel $::debounceId; set ::debounceId [after 300 doSearch]`. Das Cancel-und-Reset-Muster sorgt dafuer, dass nur der letzte Tastendruck eine Suche ausloest. **Throttle**: einen Callback hoechstens alle N Millisekunden laufen lassen, auch bei kontinuierlichem Event-Strom — typisch fuer "Scroll-Position-Update": ein Flag verhindert Wieder-Eintritt, bis der Timer feuert. Debounce tauscht Responsivitaet gegen weniger Aufrufe; Throttle liefert stetige Update-Frequenz. Beide in pure-Tcl mit `after` implementierbar.

---

### Drag-and-Drop (Tk)

**EN:** Mechanism for transferring data by clicking-and-dragging from one widget to another. Tk has no built-in cross-application drag-and-drop; the `tkdnd` extension provides it on Unix/Windows/macOS, supporting standard MIME types (`text/uri-list`, `text/plain`, files). Intra-application DnD can be built manually with `bind <ButtonPress-1>`/`<B1-Motion>`/`<ButtonRelease-1>` plus an "is over a valid drop target?" check using `winfo containing` or `find` (Canvas). Two distinct concepts: drag source (where data comes from) and drop target (where it goes).

**DE:** Mechanismus zur Daten-Uebertragung per Klicken-und-Ziehen von einem Widget zu einem anderen. Tk hat kein eingebautes anwendungsuebergreifendes Drag-and-Drop; die `tkdnd`-Erweiterung bietet es auf Unix/Windows/macOS und unterstuetzt Standard-MIME-Typen (`text/uri-list`, `text/plain`, Dateien). Intra-Anwendungs-DnD laesst sich manuell mit `bind <ButtonPress-1>`/`<B1-Motion>`/`<ButtonRelease-1>` plus einer "ist ueber gueltigem Drop-Target?"-Pruefung via `winfo containing` oder `find` (Canvas) bauen. Zwei eigene Konzepte: Drag-Source (woher die Daten kommen) und Drop-Target (wohin sie gehen).

---

### Factory Pattern

**EN:** Pattern creating objects/widgets with consistent initialization; commonly implemented with procedures returning widget pathnames or TclOO objects.

**DE:** Muster zum Erstellen von Objekten/Widgets mit konsistenter Initialisierung; häufig implementiert mit Prozeduren, die Widget-Pfadnamen oder TclOO-Objekte zurückgeben.

---

### Lazy Initialization

**EN:** Pattern of deferring expensive setup until the moment it's first needed, rather than at startup. Tcl/Tk idioms: a getter proc that builds-and-caches on first call (`if {![info exists ::cached]} { set ::cached [expensive] }; return $::cached`); a widget that creates its child widgets only when first shown; a database connection opened on first query. Trades start-up speed for first-use latency. Useful when most users won't trigger the expensive code path — e.g. a Preferences dialog that builds its complex layout only when the user opens it.

**DE:** Pattern, teures Setup erst zu betreiben, wenn es zum ersten Mal gebraucht wird, statt beim Start. Tcl/Tk-Idiome: eine Getter-Proc, die beim ersten Aufruf baut und cached (`if {![info exists ::cached]} { set ::cached [expensive] }; return $::cached`); ein Widget, das seine Kind-Widgets erst beim ersten Anzeigen erzeugt; eine Datenbank-Verbindung beim ersten Query geoeffnet. Tauscht Startup-Geschwindigkeit gegen First-Use-Latenz. Nuetzlich wenn die meisten Nutzer den teuren Pfad nicht ausloesen — z.B. ein Preferences-Dialog, der sein komplexes Layout nur beim Oeffnen baut.

---

### Observer Pattern

**EN:** Pattern implementing publish-subscribe mechanism; commonly using traces or TclOO filters/mixins for event notification.

**DE:** Muster zur Implementierung von Publish-Subscribe-Mechanismus; häufig mit Traces oder TclOO-Filtern/Mixins für Ereignis-Benachrichtigung.

---

### Private (Convention)

**EN:** Tcl naming convention for internal procedures/variables; typically prefixed with underscore (e.g., `_internal_proc`); not meant for external use; convention only, not enforced.

**DE:** Tcl-Namenskonvention für interne Prozeduren/Variablen; typischerweise mit Unterstrich präfigiert (z.B. `_internal_proc`); nicht für externe Verwendung; nur Konvention, nicht erzwungen.

---

### Public (Convention)

**EN:** Tcl naming convention for public procedures/variables; typically no leading underscore; meant for external use.

**DE:** Tcl-Namenskonvention für öffentliche Prozeduren/Variablen; typischerweise kein führender Unterstrich; für externe Verwendung gedacht.

---

### Upvar Pattern

**EN:** Common pattern using `upvar` to modify caller's variables from procedure; creates local reference to variable in different scope.

**DE:** Häufiges Muster mit `upvar` zum Ändern von Aufrufer-Variablen aus Prozedur; erstellt lokale Referenz auf Variable in anderem Gültigkeitsbereich.

---


## Tcl-Sprachkonzepte / Tcl Language Concepts

### Backslash Substitution

**EN:** Replacing backslash sequences (\n, \t, \\, etc.) with special characters.

**DE:** Ersetzen von Backslash-Sequenzen (\n, \t, \\, etc.) durch Sonderzeichen.

---

### Bytecode

**EN:** Compiled intermediate representation of Tcl scripts for faster execution.

**DE:** Kompilierte Zwischendarstellung von Tcl-Skripten für schnellere Ausführung.

---

### Canonical Form

**EN:** Standardized representation of lists where each element is properly quoted and separated.

**DE:** Standardisierte Darstellung von Listen, bei der jedes Element korrekt in Anführungszeichen steht und getrennt ist.

---

### Command Substitution

**EN:** Replacing `[command]` with the result of executing the command.

**DE:** Ersetzen von `[command]` durch das Ergebnis der Befehlsausführung.

---

### Continuation Line

**EN:** Backslash at end of line allows command to continue on next line (e.g., `puts "Hello \`).

**DE:** Backslash am Zeilenende erlaubt Fortsetzung des Befehls auf nächster Zeile (z.B. `puts "Hello \`).

---

### Expansion

**EN:** {*} prefix that expands list into individual arguments (e.g., `cmd {*}$list`).

**DE:** {*}-Präfix, das Liste in einzelne Argumente expandiert (z.B. `cmd {*}$list`).

---

### Literal

**EN:** Value taken exactly as written without substitution; achieved with braces {...}.

**DE:** Wert genau wie geschrieben ohne Substitution; erreicht mit geschweiften Klammern {...}.

---

### Quoting

**EN:** Using double quotes to group words while allowing substitution of variables and commands.

**DE:** Verwendung von doppelten Anführungszeichen zum Gruppieren von Wörtern unter Erlaubnis von Substitution von Variablen und Befehlen.

---

### Shimmering

**EN:** Internal conversion of Tcl_Obj between different representations (string, list, int) for performance.

**DE:** Interne Konvertierung von Tcl_Obj zwischen verschiedenen Darstellungen (String, Liste, Int) für Performance.

---

### Tcl_Obj

**EN:** Internal C data structure representing Tcl values with multiple type representations.

**DE:** Interne C-Datenstruktur, die Tcl-Werte mit mehreren Typ-Darstellungen repräsentiert.

---

### Variable Substitution

**EN:** Replacing `$varname` with the value stored in the variable.

**DE:** Ersetzen von `$varname` durch den in der Variable gespeicherten Wert.

---

### Word

**EN:** Basic unit of Tcl syntax; words are separated by whitespace and can be grouped with quotes or braces.

**DE:** Grundeinheit der Tcl-Syntax; Wörter werden durch Leerzeichen getrennt und können mit Anführungszeichen oder Klammern gruppiert werden.

---


## Tcl/Tk 9 - Neuerungen / Tcl/Tk 9 - New Features

### HiDPI

**EN:** High Dots-Per-Inch displays — screens with pixel densities above the historical 96 dpi norm (Retina, 4K). Tk 9 has improved HiDPI handling: automatic scaling of widgets and fonts based on system DPI settings, better font rendering at high resolutions, support for `tk scaling` to query/set the factor. Tk 8.6 needed manual scaling tweaks per platform; Tk 9 handles most cases automatically.

**DE:** High-Dots-Per-Inch-Bildschirme — Bildschirme mit Pixel-Dichten ueber der historischen 96-dpi-Norm (Retina, 4K). Tk 9 hat verbessertes HiDPI-Handling: automatische Skalierung von Widgets und Schriften basierend auf System-DPI-Einstellungen, besseres Font-Rendering bei hohen Aufloesungen, Support fuer `tk scaling` zum Abfragen/Setzen des Faktors. Tk 8.6 brauchte manuelle Skalierungs-Tricks pro Plattform; Tk 9 erledigt die meisten Faelle automatisch.

---

### SVG (Tk Image)

**EN:** Tk 9 supports SVG (Scalable Vector Graphics) as an image format — `image create photo myImg -file logo.svg` works natively. Internally uses NanoSVG (a small standalone SVG parser/rasterizer). Supports core SVG features: paths, basic shapes, transforms, gradients; not the full SVG spec (no animations, no scripting, limited filters). The first Tk version with built-in scalable graphics — a real change for cross-platform UI work where high-DPI displays expect vector assets.

**DE:** Tk 9 unterstuetzt SVG (Scalable Vector Graphics) als Bildformat — `image create photo myImg -file logo.svg` funktioniert nativ. Verwendet intern NanoSVG (einen kleinen standalone SVG-Parser/-Rasterizer). Unterstuetzt Kern-SVG-Features: Pfade, einfache Formen, Transformationen, Gradienten; nicht die volle SVG-Spec (keine Animationen, kein Scripting, limitierte Filter). Die erste Tk-Version mit eingebauter skalierbarer Grafik — eine echte Aenderung fuer plattformuebergreifende UI-Arbeit, wo High-DPI-Displays Vektor-Assets erwarten.

---

### Tcl_Size

**EN:** Tcl-9-standard type for size/length values in the C-API — replaces `int` in API signatures dealing with string lengths, list lengths, array sizes. Defined as `ptrdiff_t` (signed pointer-difference type), making it 64-bit on 64-bit platforms. Critical Tcl-9 migration: extensions written for Tcl 8.6 that use `int` for sizes in C-API calls need updates. Compile with `-DTCL_8_API` for compatibility-mode types or update to native `Tcl_Size` for cleanly 64-bit-clean Tcl-9 extensions.

**DE:** Tcl-9-Standard-Typ fuer Groessen-/Laengen-Werte in der C-API — ersetzt `int` in API-Signaturen fuer String-Laengen, Listen-Laengen, Array-Groessen. Definiert als `ptrdiff_t` (signierter Pointer-Differenz-Typ), wodurch er auf 64-bit-Plattformen 64-bit ist. Kritische Tcl-9-Migration: Erweiterungen fuer Tcl 8.6, die `int` fuer Groessen in C-API-Aufrufen nutzen, brauchen Updates. Mit `-DTCL_8_API` fuer Kompatibilitaets-Modus-Typen kompilieren oder auf nativen `Tcl_Size` fuer sauber 64-bit-clean Tcl-9-Erweiterungen wechseln.

---

### Tilde-Expansion

**EN:** Behaviour where a leading `~` in a file path is expanded to the user's home directory — e.g. `~/myfile` becomes `/home/user/myfile`. Removed from Tcl 9 (still works in 8.6). In Tcl 9, use `file home` explicitly: `file join [file home] myfile`. The removal is for security and consistency; tilde-expansion behaviour varied between platforms and could surprise. Migration step for any Tcl 8.6 code that used `~/path` in file operations.

**DE:** Verhalten, bei dem ein fuehrendes `~` in einem Datei-Pfad zum Home-Verzeichnis des Nutzers expandiert wird — z.B. `~/myfile` wird zu `/home/user/myfile`. In Tcl 9 entfernt (funktioniert weiter in 8.6). In Tcl 9 explizit `file home` verwenden: `file join [file home] myfile`. Die Entfernung dient der Sicherheit und Konsistenz; Tilde-Expansion verhielt sich plattform-abhaengig und konnte ueberraschen. Migrations-Schritt fuer Tcl-8.6-Code mit `~/pfad`-Mustern.

---

### const

**EN:** Tcl 9 command for defining constants — values that cannot be reassigned within their scope. `const PI 3.14159` makes `PI` read-only; subsequent `set PI ...` raises an error. Works at namespace level too: a constant defined in a namespace is shared and immutable. Solves the historic Tcl problem of accidentally mutating "constants" defined with `set`. Plain `set` still works for normal variables.

**DE:** Tcl-9-Befehl zur Definition von Konstanten — Werten, die innerhalb ihres Scopes nicht neu zugewiesen werden koennen. `const PI 3.14159` macht `PI` schreibgeschuetzt; ein nachfolgendes `set PI ...` wirft einen Fehler. Funktioniert auch auf Namespace-Ebene: eine in einem Namespace definierte Konstante ist geteilt und unveraenderlich. Loest das historische Tcl-Problem versehentlichen Mutierens von "Konstanten" mit `set`. `set` bleibt fuer normale Variablen.

---

### lseq

**EN:** Tcl 9 command that generates numeric sequences as lists — like Python's `range()`. Three forms: `lseq 10` (0..9), `lseq 1 10` (1..10), `lseq 1 10 2` (1, 3, 5, 7, 9). Supports floating-point: `lseq 0 1 0.1`. Also accepts a `count`-form syntax (`lseq 5 count 10` → 5,6,7,8,9,10,11,12,13,14). Replaces verbose `for {set i 0} {$i < 10} {incr i} {lappend ...}` patterns.

**DE:** Tcl-9-Befehl, der numerische Sequenzen als Listen erzeugt — wie Pythons `range()`. Drei Formen: `lseq 10` (0..9), `lseq 1 10` (1..10), `lseq 1 10 2` (1, 3, 5, 7, 9). Unterstuetzt Floating-Point: `lseq 0 1 0.1`. Akzeptiert auch `count`-Syntax (`lseq 5 count 10` → 5,6,7,8,9,10,11,12,13,14). Ersetzt langatmige `for`-Schleifen mit `lappend`.

---

### nsimage

**EN:** Tk 9 image type for native macOS system icons. `image create nsimage NSAlertCautionIcon` creates a Tk image referencing the OS-provided icon, which can then be used in buttons, labels, dialogs. Available icons include `NSAlertNoteIcon`, `NSStopProgressTemplate`, `NSAdvanced`, etc. macOS-only; on other platforms the call fails. Used in cross-platform code via a `tk windowingsystem` check.

**DE:** Tk-9-Bildtyp fuer native macOS-System-Icons. `image create nsimage NSAlertCautionIcon` erzeugt ein Tk-Bild, das auf das OS-bereitgestellte Icon referenziert; nutzbar in Buttons, Labels, Dialogen. Verfuegbare Icons umfassen `NSAlertNoteIcon`, `NSStopProgressTemplate`, `NSAdvanced` u.a. macOS-only; auf anderen Plattformen schlaegt der Aufruf fehl. In plattformuebergreifendem Code via `tk windowingsystem`-Check verwendet.

---

### process

**EN:** Tcl 9 command for subprocess introspection and management. Subcommands: `process list` (running subprocesses), `process status $pid` (state of a specific process), `process autopurge` (auto-collect zombies). Companion to `exec` which spawns processes — `process` lets you query and manage them after spawning. Available since Tcl 9.0.

**DE:** Tcl-9-Befehl fuer Subprozess-Introspection und -Management. Unterbefehle: `process list` (laufende Subprozesse), `process status $pid` (Status eines konkreten Prozesses), `process autopurge` (automatisches Einsammeln von Zombies). Pendant zu `exec`, das Prozesse startet — `process` erlaubt sie danach abzufragen und zu verwalten. Verfuegbar seit Tcl 9.0.

---

### tk print

**EN:** Tk 9 native printing command. Sends a Tk widget (typically a Text widget or Canvas) to the system print dialog: `tk print canvas .c` or `tk print text .t`. Platform-aware: uses GDI on Windows, CUPS on Linux, PrintCenter on macOS. Replaces the historic mess of widget-snapshot-to-PostScript-to-printer; first-class printing for Tcl/Tk 9.

**DE:** Tk-9-Befehl fuer natives Drucken. Sendet ein Tk-Widget (typischerweise Text-Widget oder Canvas) an den System-Druckdialog: `tk print canvas .c` oder `tk print text .t`. Plattform-aware: nutzt GDI auf Windows, CUPS auf Linux, PrintCenter auf macOS. Ersetzt das historische Gewurschtel von Widget-Snapshot-zu-PostScript-zu-Drucker; erstklassiges Drucken fuer Tcl/Tk 9.

---

### tk sysnotify

**EN:** Tk 9 command for system desktop notifications. Sends OS-native notification messages: `tk sysnotify "Title" "Body text"`. Uses Windows Toast on Windows, libnotify on Linux, NSUserNotification on macOS. Replaces external dependencies like `notify-send` that were the only option in Tk 8.6. Direct integration into the application's status reporting.

**DE:** Tk-9-Befehl fuer System-Desktop-Benachrichtigungen. Sendet OS-native Notification-Nachrichten: `tk sysnotify "Titel" "Body-Text"`. Nutzt Windows-Toast auf Windows, libnotify auf Linux, NSUserNotification auf macOS. Ersetzt externe Abhaengigkeiten wie `notify-send`, die in Tk 8.6 die einzige Option waren. Direkte Integration in das Status-Reporting der Anwendung.

---


## TclOO Introspection / TclOO-Introspektion

### mymethod

**EN:** Create callback bound to method of current object (e.g., `button -command [mymethod onClick]`).

**DE:** Callback erstellen, gebunden an Methode des aktuellen Objekts (z.B. `button -command [mymethod onClick]`).

---

### myvar

**EN:** Return fully-qualified name of object variable for use in upvar/global.

**DE:** Vollqualifizierten Namen der Objekt-Variable für Verwendung in upvar/global zurückgeben.

---

### oo::copy

**EN:** Create copy of object or class with new name.

**DE:** Kopie von Objekt oder Klasse mit neuem Namen erstellen.

---

### oo::define

**EN:** Modify class definition after creation (add methods, mixins, etc.).

**DE:** Klassendefinition nach Erstellung ändern (Methoden, Mixins, etc. hinzufügen).

---

### oo::objdefine

**EN:** Modify object instance after creation (add per-object methods, mixins).

**DE:** Objekt-Instanz nach Erstellung ändern (objektspezifische Methoden, Mixins hinzufügen).

---


## Tcllib struct Modules / Tcllib struct Module

### $map get

**EN:** Retrieve value for key from map.

**DE:** Wert für Schlüssel aus Map abrufen.

---

### $map keys

**EN:** Return list of all keys in map (in order).

**DE:** Liste aller Schlüssel in Map zurückgeben (in Reihenfolge).

---

### $map set

**EN:** Set key-value pair in map.

**DE:** Schlüssel-Wert-Paar in Map setzen.

---

### $map size

**EN:** Return number of key-value pairs in map.

**DE:** Anzahl der Schlüssel-Wert-Paare in Map zurückgeben.

---

### $map unset

**EN:** Remove key from map.

**DE:** Schlüssel aus Map entfernen.

---

### struct::dict

**EN:** Tcllib struct module providing dict utilities beyond core Tcl. Common procs: ::struct::dict equal, contains, intersect, difference, project, fold. Treat dictionaries as math sets/relations. Useful when comparing config snapshots or transforming data tables.

**DE:** Tcllib-struct-Modul mit Dict-Hilfsfunktionen ueber Core-Tcl hinaus. Wichtige Procs: ::struct::dict equal, contains, intersect, difference, project, fold. Behandelt Dictionaries als Mengen/Relationen. Nuetzlich beim Vergleich von Config-Snapshots oder Transformation von Datentabellen.

---

### struct::map

**EN:** Tcllib data structure implementing key-value mappings with ordering.

**DE:** Tcllib-Datenstruktur, die Schlüssel-Wert-Zuordnungen mit Ordnung implementiert.

---

### struct::map create

**EN:** Create new map instance (e.g., `struct::map create mymap`).

**DE:** Neue Map-Instanz erstellen (z.B. `struct::map create mymap`).

---

### struct::matrix

**EN:** Tcllib two-dimensional array implementation with rows and columns.

**DE:** Tcllib zweidimensionale Array-Implementierung mit Zeilen und Spalten.

---

### struct::prioqueue

**EN:** Tcllib priority queue implementation with ordered elements.

**DE:** Tcllib Priority-Queue-Implementierung mit geordneten Elementen.

---

### struct::record

**EN:** Tcllib module defining record types with named fields (struct-like).

**DE:** Tcllib-Modul zum Definieren von Record-Typen mit benannten Feldern (struct-ähnlich).

---

### struct::skiplist

**EN:** Tcllib skip list data structure for fast sorted data access.

**DE:** Tcllib Skip-List-Datenstruktur für schnellen sortierten Datenzugriff.

---


## Tcllib-Bibliotheken / Tcllib Libraries

### base64

**EN:** Tcllib module for base64 encoding/decoding (e.g., `base64::encode $data`).

**DE:** Tcllib-Modul für Base64-Kodierung/Dekodierung (z.B. `base64::encode $data`).

---

### cmdline

**EN:** Tcllib module for command-line argument parsing.

**DE:** Tcllib-Modul zum Parsen von Kommandozeilen-Argumenten.

---

### csv

**EN:** Tcllib module for parsing and generating CSV files (e.g., `package require csv`).

**DE:** Tcllib-Modul zum Parsen und Generieren von CSV-Dateien (z.B. `package require csv`).

---

### csv::join

**EN:** Join list of fields into CSV-formatted line (e.g., `csv::join $fields`).

**DE:** Liste von Feldern in CSV-formatierte Zeile zusammenfügen (z.B. `csv::join $fields`).

---

### csv::read

**EN:** Read CSV file into list of records (e.g., `csv::read $channel`).

**DE:** CSV-Datei in Liste von Datensätzen einlesen (z.B. `csv::read $channel`).

---

### csv::split

**EN:** Split CSV line into list of fields (e.g., `csv::split $line`).

**DE:** CSV-Zeile in Liste von Feldern aufteilen (z.B. `csv::split $line`).

---

### fileutil

**EN:** Tcllib module with file system utilities (cat, grep, find, etc.).

**DE:** Tcllib-Modul mit Dateisystem-Werkzeugen (cat, grep, find, etc.).

---

### htmlparse

**EN:** Tcllib module for parsing HTML documents.

**DE:** Tcllib-Modul zum Parsen von HTML-Dokumenten.

---

### http

**EN:** Tcl core package for HTTP client operations (e.g., `package require http`).

**DE:** Tcl-Core-Paket für HTTP-Client-Operationen (z.B. `package require http`).

---

### http::cleanup

**EN:** Release resources associated with HTTP token.

**DE:** Ressourcen freigeben, die mit HTTP-Token verbunden sind.

---

### http::code

**EN:** Get HTTP status code from token (e.g., `http::code $token` returns "HTTP/1.1 200 OK").

**DE:** HTTP-Statuscode aus Token abrufen (z.B. `http::code $token` gibt "HTTP/1.1 200 OK" zurück).

---

### http::config

**EN:** Configure HTTP package defaults (proxy, user-agent, etc.).

**DE:** HTTP-Paket-Standards konfigurieren (Proxy, User-Agent, etc.).

---

### http::data

**EN:** Extract response body from HTTP token (e.g., `http::data $token`).

**DE:** Antwort-Body aus HTTP-Token extrahieren (z.B. `http::data $token`).

---

### http::geturl

**EN:** Make HTTP request and return token for response (e.g., `http::geturl "http://example.com"`).

**DE:** HTTP-Anfrage stellen und Token für Antwort zurückgeben (z.B. `http::geturl "http://example.com"`).

---

### http::status

**EN:** Get request status: ok, error, timeout, reset.

**DE:** Anfrage-Status abrufen: ok, error, timeout, reset.

---

### json

**EN:** Tcllib module for parsing and generating JSON data (e.g., `package require json`).

**DE:** Tcllib-Modul zum Parsen und Generieren von JSON-Daten (z.B. `package require json`).

---

### json::dict2json

**EN:** Convert Tcl dictionary to JSON string (e.g., `json::dict2json $dict`).

**DE:** Tcl-Dictionary in JSON-String konvertieren (z.B. `json::dict2json $dict`).

---

### json::json2dict

**EN:** Parse JSON string into Tcl dictionary (e.g., `json::json2dict $jsonString`).

**DE:** JSON-String in Tcl-Dictionary parsen (z.B. `json::json2dict $jsonString`).

---

### json::write

**EN:** Create JSON structures programmatically (object, array, string, etc.).

**DE:** JSON-Strukturen programmatisch erstellen (object, array, string, etc.).

---

### logger

**EN:** Tcllib module for flexible logging system with severity levels.

**DE:** Tcllib-Modul für flexibles Logging-System mit Schweregrad-Stufen.

---

### math::geometry

**EN:** Tcllib 2D geometry package. Computations: distance between points, polygon area, line intersections, point-in-polygon, bounding box, convex hull. Targeted at canvas/visualization tasks rather than CAD-grade precision.

**DE:** Tcllib-2D-Geometrie-Paket. Berechnungen: Punktabstand, Polygonflaeche, Linien-Schnittpunkte, Punkt-in-Polygon, Bounding Box, konvexe Huelle. Auf Canvas-/Visualisierungs-Aufgaben ausgerichtet, nicht auf CAD-Praezision.

---

### math::linearalgebra

**EN:** Tcllib package for linear algebra operations: matrix/vector arithmetic, dot product, cross product, transpose, determinant, inverse, linear system solving (LU, Gauss-Jordan), least squares, eigenvalues. Pure-Tcl implementation; not optimised for large matrices.

**DE:** Tcllib-Paket fuer Operationen der linearen Algebra: Matrix/Vektor-Arithmetik, Skalarprodukt, Kreuzprodukt, Transponieren, Determinante, Inverse, Loesen linearer Gleichungssysteme (LU, Gauss-Jordan), Least Squares, Eigenwerte. Pure-Tcl-Implementierung; nicht fuer grosse Matrizen optimiert.

---

### math::statistics

**EN:** Tcllib statistics package. Provides: mean, median, variance, standard deviation, quartiles, histograms, t-test, chi-squared test, ANOVA, correlation, linear regression, distribution functions (normal, t, chi-squared, F, gamma, beta). Useful for in-process data analysis without external dependencies.

**DE:** Tcllib-Statistik-Paket. Bietet: Mittelwert, Median, Varianz, Standardabweichung, Quartile, Histogramme, t-Test, Chi-Quadrat-Test, ANOVA, Korrelation, lineare Regression, Verteilungsfunktionen (Normal, t, Chi-Quadrat, F, Gamma, Beta). Nuetzlich fuer In-Prozess-Datenanalyse ohne externe Abhaengigkeiten.

---

### md5 / sha1 / sha256

**EN:** Tcllib modules for cryptographic hash functions.

**DE:** Tcllib-Module für kryptographische Hash-Funktionen.

---

### snit

**EN:** Tcllib alternative to TclOO — "Snit's Not Incr Tcl". Syntax: snit::type Foo { variable x; method bar {} { ... } } then Foo create instance ?args?. Predates TclOO; uses delegation and method composition rather than classes/inheritance. Still in production use in many Tcllib widgets and BWidget; TclOO is the modern choice for new code.

**DE:** Tcllib-Alternative zu TclOO — "Snit's Not Incr Tcl". Syntax: snit::type Foo { variable x; method bar {} { ... } } dann Foo create instance ?args?. Vor TclOO entstanden; nutzt Delegation und Method-Komposition statt Klassen/Vererbung. Weiterhin in vielen Tcllib-Widgets und BWidget produktiv eingesetzt; TclOO ist die moderne Wahl fuer neuen Code.

---

### struct::graph

**EN:** Tcllib module for graph data structures (nodes, edges, algorithms).

**DE:** Tcllib-Modul für Graph-Datenstrukturen (Knoten, Kanten, Algorithmen).

---

### struct::list

**EN:** Tcllib module with list manipulation utilities.

**DE:** Tcllib-Modul mit Listen-Manipulations-Werkzeugen.

---

### struct::queue

**EN:** Tcllib module implementing queue data structure (put, get, peek).

**DE:** Tcllib-Modul, das Queue-Datenstruktur implementiert (put, get, peek).

---

### struct::set

**EN:** Tcllib module for set operations (union, intersection, difference).

**DE:** Tcllib-Modul für Mengen-Operationen (Union, Schnittmenge, Differenz).

---

### struct::stack

**EN:** Tcllib module implementing stack data structure (push, pop, peek).

**DE:** Tcllib-Modul, das Stack-Datenstruktur implementiert (push, pop, peek).

---

### struct::tree

**EN:** Tcllib module for hierarchical tree data structures.

**DE:** Tcllib-Modul für hierarchische Baum-Datenstrukturen.

---

### tdom

**EN:** Tcl XML/DOM library, written in C, very fast. Syntax: package require tdom; set doc [dom parse $xmlString]; set root [$doc documentElement]; $root selectNodes "//tag/@attr". Supports DOM, XPath, XSLT, HTML parsing (-html), HTML5 (-html5 in 0.9+), schema validation. Standard choice for XML in Tcl. Not part of Tcllib proper — separate distribution.

**DE:** Tcl-XML/DOM-Bibliothek, in C geschrieben, sehr schnell. Syntax: package require tdom; set doc [dom parse $xmlString]; set root [$doc documentElement]; $root selectNodes "//tag/@attr". Unterstuetzt DOM, XPath, XSLT, HTML-Parsing (-html), HTML5 (-html5 in 0.9+), Schema-Validierung. Standardwahl fuer XML in Tcl. Nicht Teil von Tcllib selbst — separate Distribution.

---

### textutil

**EN:** Tcllib module for text processing utilities (trim, indent, wrap).

**DE:** Tcllib-Modul für Textverarbeitungs-Werkzeuge (trim, indent, wrap).

---

### uri

**EN:** Tcllib module for parsing and building URIs/URLs.

**DE:** Tcllib-Modul zum Parsen und Erstellen von URIs/URLs.

---


## Ternärer Operator / Ternary Operator

### ? : (Conditional/Ternary)

**EN:** Conditional operator; returns one of two values based on condition (e.g., `$x > 0 ? "positive" : "negative"`).

**DE:** Bedingter Operator; gibt einen von zwei Werten basierend auf Bedingung zurück (z.B. `$x > 0 ? "positive" : "negative"`).

---


## Text-Formatierung / Text Formatting

### Hanging Indent

**EN:** Indentation where first line extends left of subsequent lines; opposite of normal indent; in text widget: `-lmargin1` less than `-lmargin2`; used for bullet lists.

**DE:** Einrückung, wo erste Zeile links von nachfolgenden Zeilen steht; Gegenteil von normaler Einrückung; in Text-Widget: `-lmargin1` kleiner als `-lmargin2`; verwendet für Aufzählungslisten.

---

### Hard Break

**EN:** Explicit line break inserted by user (Enter key); creates new paragraph or line; stored as \n in text; always breaks line.

**DE:** Expliziter Zeilenumbruch eingefügt vom Benutzer (Enter-Taste); erstellt neuen Absatz oder Zeile; gespeichert als \n im Text; bricht immer Zeile.

---

### Indent

**EN:** Horizontal spacing at line start; moves text right; in Tk text widget: configured with tag options `-lmargin1` (first line) and `-lmargin2` (continuation); measured in screen units.

**DE:** Horizontaler Abstand am Zeilenanfang; bewegt Text nach rechts; in Tk-Text-Widget: konfiguriert mit Tag-Optionen `-lmargin1` (erste Zeile) und `-lmargin2` (Fortsetzung); gemessen in Bildschirm-Einheiten.

---

### Justification

**EN:** Text alignment within line; options: left (default), right, center, both (full justification); in text widget: tag option `-justify`.

**DE:** Text-Ausrichtung innerhalb Zeile; Optionen: left (Standard), right, center, both (Blocksatz); in Text-Widget: Tag-Option `-justify`.

---

### Line Break

**EN:** End of line, new line starts; represented by newline character (\n in Unix, \r\n in Windows, \r in old Mac); Tcl normalizes to \n internally.

**DE:** Zeilenende, neue Zeile beginnt; repräsentiert durch Newline-Zeichen (\n in Unix, \r\n in Windows, \r in altem Mac); Tcl normalisiert intern zu \n.

---

### Page Break

**EN:** End of page, new page starts; in printing/documents: form feed (\f) character; in Tk text widget: no built-in page concept, but can be marked with tags.

**DE:** Seitenende, neue Seite beginnt; beim Drucken/Dokumenten: Form-Feed (\f)-Zeichen; in Tk-Text-Widget: kein eingebautes Seiten-Konzept, aber kann mit Tags markiert werden.

---

### Seitenumbruch (Page Break)

**EN:** German term for page break; forces new page in document; form feed character (\f); important for printing and PDF generation.

**DE:** Deutscher Begriff für Page Break; erzwingt neue Seite im Dokument; Form-Feed-Zeichen (\f); wichtig für Drucken und PDF-Generierung.

---

### Soft Break

**EN:** Automatic line break by word wrap; not stored in text; recalculated when window resized; disappears if text fits on one line.

**DE:** Automatischer Zeilenumbruch durch Wortumbruch; nicht im Text gespeichert; neu berechnet wenn Fenster Größe ändert; verschwindet wenn Text in eine Zeile passt.

---

### Tab Stop

**EN:** Position where tab character (\t) advances cursor; in text widget: configured with `-tabs` option as list of positions; default: every 8 characters.

**DE:** Position, wo Tab-Zeichen (\t) Cursor vorrückt; in Text-Widget: konfiguriert mit `-tabs`-Option als Liste von Positionen; Standard: alle 8 Zeichen.

---

### Word Wrap

**EN:** Automatic line breaking at word boundaries when text exceeds width; in Tk text widget: `-wrap word` option; breaks between words, not mid-word.

**DE:** Automatischer Zeilenumbruch an Wortgrenzen wenn Text Breite überschreitet; in Tk-Text-Widget: `-wrap word`-Option; bricht zwischen Wörtern, nicht mitten im Wort.

---

### Zeilenumbruch (Line Break)

**EN:** German term for line break; new line in text; automatic (word wrap) or manual (hard break with Enter/Return key).

**DE:** Deutscher Begriff für Line Break; neue Zeile im Text; automatisch (Wortumbruch) oder manuell (harter Umbruch mit Enter/Return-Taste).

---


## Text-Widget-Spezifische Begriffe / Text Widget-Specific Terms

### Dump

**EN:** Extract text widget contents including text, marks, tags, and embedded objects.

**DE:** Text-Widget-Inhalt extrahieren, einschließlich Text, Marks, Tags und eingebetteter Objekte.

---

### Embedded Image

**EN:** Image placed within text widget content at a specific position.

**DE:** Bild, das innerhalb des Text-Widget-Inhalts an einer bestimmten Position platziert ist.

---

### Embedded Window

**EN:** Widget embedded within text widget at a specific position.

**DE:** Widget, das innerhalb eines Text-Widgets an einer bestimmten Position eingebettet ist.

---

### End Mark

**EN:** Special mark always positioned after the last character in text widget.

**DE:** Spezielle Mark, die immer nach dem letzten Zeichen im Text-Widget positioniert ist.

---

### Insert Mark

**EN:** Special mark indicating the current text insertion cursor position.

**DE:** Spezielle Mark, die die aktuelle Texteinfügeposition des Cursors anzeigt.

---

### Line Number

**EN:** Text index format specifying line and character position (e.g., `1.0` = line 1, character 0).

**DE:** Text-Index-Format, das Zeilen- und Zeichenposition angibt (z.B. `1.0` = Zeile 1, Zeichen 0).

---

### Mark

**EN:** A named position in text widget that moves with text as it's edited; `insert` and `end` are predefined marks.

**DE:** Eine benannte Position im Text-Widget, die sich mit Text bewegt, während er bearbeitet wird; `insert` und `end` sind vordefinierte Marks.

---

### Modified Flag

**EN:** Boolean indicating whether text widget content has been changed since last reset.

**DE:** Boolescher Wert, der anzeigt, ob Text-Widget-Inhalt seit letztem Zurücksetzen geändert wurde.

---

### See

**EN:** Scroll text widget to make a specific position visible.

**DE:** Text-Widget scrollen, um eine bestimmte Position sichtbar zu machen.

---

### Spacing

**EN:** Vertical spacing options: `spacing1` (above line), `spacing2` (between wrapped lines), `spacing3` (below line).

**DE:** Vertikale Abstandsoptionen: `spacing1` (über Zeile), `spacing2` (zwischen umbrochenen Zeilen), `spacing3` (unter Zeile).

---

### Tabs

**EN:** Tab stop positions for text widget, specified as list of distances.

**DE:** Tabstopp-Positionen für Text-Widget, angegeben als Liste von Abständen.

---

### Tag

**EN:** Named region in text widget for applying formatting, bindings, or other properties to character ranges.

**DE:** Benannte Region im Text-Widget zum Anwenden von Formatierung, Bindings oder anderen Eigenschaften auf Zeichenbereiche.

---

### Tag Add

**EN:** Apply a tag to a range of text in a text widget.

**DE:** Ein Tag auf einen Textbereich in einem Text-Widget anwenden.

---

### Tag Bind

**EN:** Associate event bindings with tagged text regions.

**DE:** Ereignis-Bindings mit getaggten Textregionen verknüpfen.

---

### Tag Configure

**EN:** Set display properties (colors, fonts, relief) for text marked with a tag.

**DE:** Anzeigeeigenschaften (Farben, Schriften, Relief) für mit einem Tag markierten Text setzen.

---

### Tag Names

**EN:** Retrieve list of all tags defined in a text widget.

**DE:** Liste aller im Text-Widget definierten Tags abrufen.

---

### Tag Ranges

**EN:** Get start and end indices of all ranges with a specific tag.

**DE:** Start- und End-Indizes aller Bereiche mit einem bestimmten Tag abrufen.

---

### Tag Remove

**EN:** Remove a tag from a range of text in a text widget.

**DE:** Ein Tag aus einem Textbereich in einem Text-Widget entfernen.

---

### Undo / Redo

**EN:** Commands to reverse or reapply text editing operations in text widget.

**DE:** Befehle zum Rückgängigmachen oder Wiederherstellen von Textbearbeitungsoperationen im Text-Widget.

---

### Wrap

**EN:** Text wrapping mode: `none` (no wrap), `char` (wrap at character), `word` (wrap at word boundary).

**DE:** Textumbruchmodus: `none` (kein Umbruch), `char` (Umbruch bei Zeichen), `word` (Umbruch bei Wortgrenze).

---

### Yview / Xview

**EN:** Control vertical/horizontal scrolling position of text or canvas widgets.

**DE:** Vertikale/horizontale Scroll-Position von Text- oder Canvas-Widgets steuern.

---


## Threading und Parallelverarbeitung / Threading and Parallel Processing

### Asynchronous

**EN:** Operation that returns immediately; result available later via callback or polling.

**DE:** Operation, die sofort zurückkehrt; Ergebnis später verfügbar über Callback oder Polling.

---

### Atomic Operation

**EN:** Operation that completes without interruption; indivisible from other threads' perspective.

**DE:** Operation, die ohne Unterbrechung abgeschlossen wird; unteilbar aus Sicht anderer Threads.

---

### Concurrency

**EN:** Ability to handle multiple tasks that make progress without necessarily running simultaneously.

**DE:** Fähigkeit, mehrere Aufgaben zu handhaben, die Fortschritte machen, ohne notwendigerweise gleichzeitig zu laufen.

---

### Critical Section

**EN:** Code region accessing shared resources; must be protected by mutex in multithreaded programs.

**DE:** Codebereich, der auf gemeinsame Ressourcen zugreift; muss in Multithreaded-Programmen durch Mutex geschützt werden.

---

### Deadlock

**EN:** Situation where threads wait indefinitely for each other to release resources.

**DE:** Situation, in der Threads unendlich aufeinander warten, um Ressourcen freizugeben.

---

### Lock / Unlock

**EN:** Acquire/release mutex to protect critical section from concurrent access.

**DE:** Mutex erwerben/freigeben, um kritischen Abschnitt vor gleichzeitigem Zugriff zu schützen.

---

### Main Thread

**EN:** Primary thread where program execution begins; typically handles GUI in Tk applications.

**DE:** Primärer Thread, wo Programmausführung beginnt; behandelt typischerweise GUI in Tk-Anwendungen.

---

### Message Passing

**EN:** Thread communication method where threads exchange data through messages rather than shared memory.

**DE:** Thread-Kommunikationsmethode, bei der Threads Daten durch Nachrichten statt gemeinsamen Speicher austauschen.

---

### Mutex (Mutual Exclusion)

**EN:** Synchronization primitive preventing simultaneous access to shared resource by multiple threads.

**DE:** Synchronisationsprimitiv, das gleichzeitigen Zugriff mehrerer Threads auf gemeinsame Ressource verhindert.

---

### Parallel

**EN:** Execution of multiple operations simultaneously using threads or processes.

**DE:** Ausführung mehrerer Operationen gleichzeitig mit Threads oder Prozessen.

---

### Race Condition

**EN:** Bug where program behavior depends on timing of uncontrolled concurrent operations.

**DE:** Fehler, bei dem Programmverhalten vom Timing unkontrollierter gleichzeitiger Operationen abhängt.

---

### Shared Data

**EN:** Variables or resources accessible by multiple threads; requires synchronization.

**DE:** Variablen oder Ressourcen, auf die mehrere Threads zugreifen können; erfordert Synchronisation.

---

### Synchronous

**EN:** Operation that blocks until completion; caller waits for result.

**DE:** Operation, die bis zur Fertigstellung blockiert; Aufrufer wartet auf Ergebnis.

---

### Thread

**EN:** Independent execution path allowing concurrent operations; requires Thread package (e.g., `package require Thread`).

**DE:** Unabhängiger Ausführungspfad, der gleichzeitige Operationen ermöglicht; erfordert Thread-Paket (z.B. `package require Thread`).

---

### Thread Pool

**EN:** Collection of pre-created threads waiting for tasks; improves performance by reusing threads.

**DE:** Sammlung vorgefertigter Threads, die auf Aufgaben warten; verbessert Performance durch Thread-Wiederverwendung.

---

### Thread-safe

**EN:** Code that functions correctly when accessed by multiple threads simultaneously.

**DE:** Code, der korrekt funktioniert, wenn von mehreren Threads gleichzeitig darauf zugegriffen wird.

---

### Worker Thread

**EN:** Background thread performing tasks while main thread remains responsive.

**DE:** Hintergrund-Thread, der Aufgaben ausführt, während Haupt-Thread responsiv bleibt.

---

### thread::cond

**EN:** Condition variable for thread synchronization; allows threads to wait for specific conditions.

**DE:** Bedingungsvariable für Thread-Synchronisation; ermöglicht Threads, auf bestimmte Bedingungen zu warten.

---

### thread::create

**EN:** Create new thread with optional script to execute (e.g., `thread::create {script}`).

**DE:** Neuen Thread mit optionalem auszuführendem Skript erstellen (z.B. `thread::create {script}`).

---

### thread::exit

**EN:** Terminate current thread with optional return value.

**DE:** Aktuellen Thread mit optionalem Rückgabewert beenden.

---

### thread::id

**EN:** Return unique identifier of current or specified thread.

**DE:** Eindeutige Kennung des aktuellen oder angegebenen Threads zurückgeben.

---

### thread::join

**EN:** Wait for thread to terminate and retrieve its return value.

**DE:** Auf Thread-Terminierung warten und Rückgabewert abrufen.

---

### thread::mutex

**EN:** Create mutual exclusion lock for thread synchronization (e.g., `thread::mutex create`).

**DE:** Mutual-Exclusion-Sperre für Thread-Synchronisation erstellen (z.B. `thread::mutex create`).

---

### thread::send

**EN:** Send script to another thread for execution; can be synchronous or asynchronous.

**DE:** Skript an anderen Thread zur Ausführung senden; kann synchron oder asynchron sein.

---

### thread::wait

**EN:** Wait for thread to finish execution and return result.

**DE:** Auf Beendigung der Thread-Ausführung warten und Ergebnis zurückgeben.

---


## Timing und Scheduling / Timing and Scheduling

### Idle Handler

**EN:** Callback executed when event loop has no pending events to process.

**DE:** Callback, der ausgeführt wird, wenn Ereignis-Schleife keine ausstehenden Ereignisse hat.

---

### Milliseconds

**EN:** Time unit equal to 1/1000 of a second; commonly used in after commands.

**DE:** Zeiteinheit gleich 1/1000 einer Sekunde; häufig verwendet in after-Befehlen.

---

### Periodic Task

**EN:** Repeating timer that reschedules itself after each execution.

**DE:** Sich wiederholender Timer, der sich nach jeder Ausführung selbst neu einplant.

---

### Timer

**EN:** Scheduled callback that executes after specified time delay; created with `after`.

**DE:** Eingeplanter Callback, der nach angegebener Zeitverzögerung ausgeführt wird; erstellt mit `after`.

---

### Variable (General)

**EN:** Named storage location for data in Tcl; all values are strings internally, but context determines interpretation (number, list, etc.); accessed with `$varname` or `set` command.

**DE:** Benannter Speicherplatz für Daten in Tcl; alle Werte sind intern Strings, aber Kontext bestimmt Interpretation (Zahl, Liste, etc.); Zugriff mit `$varname` oder `set`-Befehl.

---

### after

**EN:** Schedule command execution after delay in milliseconds; subcommands: `after ms script` (delay), `after idle script` (when idle), `after cancel id` (cancel scheduled), `after info` (list pending) (e.g., `after 1000 {puts "Hello"}`).

**DE:** Befehlsausführung nach Verzögerung in Millisekunden einplanen; Unterbefehle: `after ms script` (Verzögerung), `after idle script` (wenn idle), `after cancel id` (geplantes abbrechen), `after info` (ausstehende auflisten) (z.B. `after 1000 {puts "Hello"}`).

---

### after cancel

**EN:** Cancel previously scheduled after command using its identifier.

**DE:** Zuvor eingeplanten after-Befehl mit seinem Identifikator abbrechen.

---

### after idle

**EN:** Schedule command to execute when event loop is idle (e.g., `after idle {update_display}`).

**DE:** Befehl für Ausführung einplanen, wenn Ereignis-Schleife idle ist (z.B. `after idle {update_display}`).

---

### after info

**EN:** Return list of pending after commands and their identifiers.

**DE:** Liste ausstehender after-Befehle und ihrer Identifikatoren zurückgeben.

---

### clock

**EN:** Time-related command with subcommands: `seconds` (current time), `format` (format timestamp), `scan` (parse time string).

**DE:** Zeitbezogener Befehl mit Unterbefehlen: `seconds` (aktuelle Zeit), `format` (Zeitstempel formatieren), `scan` (Zeitstring parsen).

---

### clock add

**EN:** Add an interval to a timestamp. Syntax: clock add timestamp count unit ?count unit ...? ?-timezone tz?. Units: seconds, minutes, hours, days, weeks, months, years. Example: `clock add [clock seconds] 7 days` adds a week. Handles month-end and DST correctly (unlike a naive add of seconds).

**DE:** Addiert ein Intervall zu einem Zeitstempel. Syntax: clock add timestamp count unit ?count unit ...? ?-timezone tz?. Einheiten: seconds, minutes, hours, days, weeks, months, years. Beispiel: `clock add [clock seconds] 7 days` addiert eine Woche. Behandelt Monatsenden und DST korrekt (im Gegensatz zu naiver Sekunden-Addition).

---

### clock clicks

**EN:** Return a high-resolution timestamp counter. Syntax: clock clicks ?-microseconds|-milliseconds?. Without options: implementation-defined ticks (system-dependent). With -microseconds: microsecond-resolution counter. Use for benchmarking small intervals; for absolute time use `clock seconds` or `clock microseconds`.

**DE:** Liefert einen hochaufloesenden Zeitstempel-Zaehler. Syntax: clock clicks ?-microseconds|-milliseconds?. Ohne Optionen: implementierungsabhaengige Ticks (system-spezifisch). Mit -microseconds: Mikrosekunden-Aufloesung. Fuer Benchmarking kleiner Intervalle verwenden; fuer Absolutzeit `clock seconds` oder `clock microseconds`.

---

### clock format

**EN:** Format time value into human-readable string (e.g., `clock format [clock seconds] -format "%Y-%m-%d %H:%M:%S"`).

**DE:** Zeitwert in menschenlesbaren String formatieren (z.B. `clock format [clock seconds] -format "%Y-%m-%d %H:%M:%S"`).

---

### clock microseconds

**EN:** Current time in microseconds since the Unix epoch. Syntax: clock microseconds. Returns an integer. Higher resolution than `clock seconds` and `clock milliseconds`. Tcl 8.5+. For wall-clock timestamps with sub-second precision (logs, performance traces).

**DE:** Aktuelle Zeit in Mikrosekunden seit der Unix-Epoche. Syntax: clock microseconds. Liefert eine Ganzzahl. Hoehere Aufloesung als `clock seconds` und `clock milliseconds`. Tcl 8.5+. Fuer Wallclock-Zeitstempel mit Sub-Sekunden-Genauigkeit (Logs, Performance-Traces).

---

### clock milliseconds

**EN:** Return current time in milliseconds since epoch with higher precision.

**DE:** Aktuelle Zeit in Millisekunden seit Epoche mit höherer Präzision zurückgeben.

---

### clock scan

**EN:** Parse time string and return seconds since epoch (e.g., `clock scan "2025-01-01"`).

**DE:** Zeitstring parsen und Sekunden seit Epoche zurückgeben (z.B. `clock scan "2025-01-01"`).

---

### clock seconds

**EN:** Return current time as seconds since Unix epoch (January 1, 1970).

**DE:** Aktuelle Zeit als Sekunden seit Unix-Epoche (1. Januar 1970) zurückgeben.

---

### time

**EN:** Measure execution time of script; returns microseconds per iteration (e.g., `time {expr 2+2} 1000`).

**DE:** Ausführungszeit von Skript messen; gibt Mikrosekunden pro Iteration zurück (z.B. `time {expr 2+2} 1000`).

---

### tkwait

**EN:** Wait for specific event to occur; variants: `tkwait variable` (wait for variable), `tkwait visibility` (wait for window visible), `tkwait window` (wait for window destroyed).

**DE:** Auf bestimmtes Ereignis warten; Varianten: `tkwait variable` (auf Variable warten), `tkwait visibility` (auf Fenster sichtbar warten), `tkwait window` (auf Fenster-Zerstörung warten).

---

### tkwait variable

**EN:** Wait for specified variable to be written; similar to vwait but Tk-specific (e.g., `tkwait variable myvar`).

**DE:** Auf Schreiben der angegebenen Variable warten; ähnlich wie vwait aber Tk-spezifisch (z.B. `tkwait variable myvar`).

---

### tkwait visibility

**EN:** Wait until specified window becomes visible on screen (e.g., `tkwait visibility .mywindow`).

**DE:** Warten, bis angegebenes Fenster auf Bildschirm sichtbar wird (z.B. `tkwait visibility .mywindow`).

---

### tkwait window

**EN:** Wait until specified window is destroyed; useful for modal dialogs (e.g., `tkwait window .dialog`).

**DE:** Warten, bis angegebenes Fenster zerstört wird; nützlich für modale Dialoge (z.B. `tkwait window .dialog`).

---

### update

**EN:** Process pending events and refresh display; allows GUI to remain responsive during long operations.

**DE:** Ausstehende Ereignisse verarbeiten und Anzeige aktualisieren; ermöglicht GUI, während langer Operationen responsiv zu bleiben.

---

### update idletasks

**EN:** Process only idle events like display updates without processing user input events.

**DE:** Nur Idle-Ereignisse wie Display-Updates verarbeiten ohne Benutzer-Eingabe-Ereignisse zu verarbeiten.

---

### vwait

**EN:** Enter event loop and wait for variable to be set; blocks until condition met (e.g., `vwait done`).

**DE:** Ereignis-Schleife betreten und auf Setzen einer Variable warten; blockiert bis Bedingung erfüllt (z.B. `vwait done`).

---


## Tk-Core-Befehle / Tk Core Commands

### bell

**EN:** Ring system bell/beep to alert user (e.g., `bell` or `bell -displayof .widget`).

**DE:** System-Glocke/Piep erklingen lassen, um Benutzer zu alarmieren (z.B. `bell` oder `bell -displayof .widget`).

---

### bind

**EN:** Associate a Tcl script with an event on a widget or class of widgets. Syntax: bind tag sequence script. Examples: bind .b <Button-1> {puts clicked}; bind Entry <Return> {%W validate}. Substitution variables in script: %W (widget), %x %y (coords), %K (keysym), %A (ASCII char). Central event mechanism in Tk; used for keyboard, mouse, focus, expose events.

**DE:** Verknuepft ein Tcl-Skript mit einem Event auf einem Widget oder einer Widget-Klasse. Syntax: bind tag sequence script. Beispiele: bind .b <Button-1> {puts geklickt}; bind Entry <Return> {%W validate}. Substitutions im Skript: %W (Widget), %x %y (Koordinaten), %K (Keysym), %A (ASCII-Zeichen). Zentraler Event-Mechanismus in Tk; benutzt fuer Tastatur, Maus, Fokus, Expose-Ereignisse.

---

### bindtags

**EN:** Get or set the list of binding tags for a widget. Syntax: bindtags .widget ?taglist?. Default tag chain for .b: {.b Button . all}. Tags are processed in order; bind events fire on each tag until break. Used to add custom binding contexts or change Tk's default event order.

**DE:** Liefert oder setzt die Liste der Binding-Tags fuer ein Widget. Syntax: bindtags .widget ?taglist?. Standard-Tag-Kette fuer .b: {.b Button . all}. Tags werden in Reihenfolge abgearbeitet; bind-Events feuern auf jedem Tag bis zu break. Verwendet fuer eigene Binding-Kontexte oder Aenderung der Standard-Event-Reihenfolge.

---

### clipboard

**EN:** Cross-platform clipboard wrapper around the CLIPBOARD selection. Syntax: clipboard clear; clipboard append "text"; clipboard get. Works identically on X11/Windows/macOS. Preferred over `selection` for copy/paste; common pattern: clipboard clear; clipboard append [.t get sel.first sel.last].

**DE:** Plattformuebergreifender Clipboard-Wrapper um die CLIPBOARD-Selection. Syntax: clipboard clear; clipboard append "text"; clipboard get. Funktioniert identisch auf X11/Windows/macOS. Gegenueber `selection` bevorzugt fuer Copy/Paste; uebliches Muster: clipboard clear; clipboard append [.t get sel.first sel.last].

---

### destroy

**EN:** Destroy a Tk widget and all its descendants. Frees resources. Syntax: destroy ?window window ...?

**DE:** Tk-Widget und alle Nachkommen zerstoeren. Gibt Ressourcen frei. Syntax: destroy ?window window ...?

**Related terms:** pack forget, grid forget, winfo exists

---

### event

**EN:** Generic command for virtual events and event generation. Syntax: event add <<VirtName>> <real-event>...; event generate .w <<VirtName>>; event delete <<VirtName>>. Virtual events allow decoupling user actions from concrete keys/clicks. Common: <<Copy>>, <<Paste>>, <<Cut>>, <<Modified>>, <<TreeviewSelect>>.

**DE:** Generisches Kommando fuer virtuelle Events und Event-Erzeugung. Syntax: event add <<VirtName>> <real-event>...; event generate .w <<VirtName>>; event delete <<VirtName>>. Virtuelle Events entkoppeln Benutzeraktionen von konkreten Tasten/Klicks. Gebraeuchlich: <<Copy>>, <<Paste>>, <<Cut>>, <<Modified>>, <<TreeviewSelect>>.

---

### font

**EN:** Tk command for managing named fonts. Syntax: font create name ?-family F? ?-size S? ?-weight normal|bold? ?-slant roman|italic?; font configure name -size 14; font names; font measure name "text"; font metrics name -linespace. Named fonts update all widgets using them when configured.

**DE:** Tk-Kommando zur Verwaltung benannter Schriftarten. Syntax: font create name ?-family F? ?-size S? ?-weight normal|bold? ?-slant roman|italic?; font configure name -size 14; font names; font measure name "text"; font metrics name -linespace. Benannte Fonts aktualisieren alle Widgets die sie verwenden bei configure.

---

### grab

**EN:** Restrict pointer/keyboard events to a window (modal behavior). Syntax: grab .w (local); grab -global .w; grab release .w; grab status .w. Local grab: events outside .w go to other apps. Global grab: events go nowhere else (rare). Auto-released when .w is destroyed.

**DE:** Beschraenkt Maus/Tastatur-Events auf ein Fenster (modales Verhalten). Syntax: grab .w (lokal); grab -global .w; grab release .w; grab status .w. Lokaler Grab: Events ausserhalb .w gehen zu anderen Apps. Globaler Grab: Events gehen nirgends sonst hin (selten). Wird automatisch freigegeben wenn .w zerstoert wird.

---

### image

**EN:** Tk command for managing image objects (photo, bitmap). Syntax: image create photo|bitmap ?name? ?options?; image delete name; image names; image type name. Photo supports PNG/GIF natively (Tk 8.6+) plus JPEG via Img package. Used as -image option for buttons, labels, canvas items.

**DE:** Tk-Kommando zur Verwaltung von Bild-Objekten (photo, bitmap). Syntax: image create photo|bitmap ?name? ?options?; image delete name; image names; image type name. Photo unterstuetzt PNG/GIF nativ (Tk 8.6+) plus JPEG via Img-Paket. Als -image Option bei Buttons, Labels, Canvas-Items.

---

### lower

**EN:** Lower a window or canvas item in the stacking order. Syntax: lower window ?belowThis?; for canvas: .c lower tagOrId ?belowTagOrId?. Counterpart to raise. Without second argument: drops to bottom.

**DE:** Senkt ein Fenster oder Canvas-Item in der Stack-Order. Syntax: lower window ?belowThis?; bei canvas: .c lower tagOrId ?belowTagOrId?. Gegenstueck zu raise. Ohne zweites Argument: nach ganz unten.

---

### option

**EN:** Tk option database — defaults for widget options based on a hierarchy. Syntax: option add pattern value ?priority?; option get window name class; option clear; option readfile filename. Pattern: *Button*foreground or .frame.button.foreground. Lower priority than explicit -option settings. Used for application-wide theming before ttk styles existed.

**DE:** Tk-Optionsdatenbank — Defaults fuer Widget-Optionen basierend auf einer Hierarchie. Syntax: option add pattern value ?priority?; option get window name class; option clear; option readfile filename. Pattern: *Button*foreground oder .frame.button.foreground. Niedrigere Prioritaet als explizite -option-Werte. Verwendet fuer App-weite Themes bevor ttk-Styles existierten.

---

### raise

**EN:** Raise a window or canvas item in the stacking order. Syntax: raise window ?aboveThis?; for canvas: .c raise tagOrId ?aboveTagOrId?. Without second argument: raises to top. Used to bring popups, tooltips, or canvas items to the front.

**DE:** Hebt ein Fenster oder Canvas-Item in der Stack-Order an. Syntax: raise window ?aboveThis?; bei canvas: .c raise tagOrId ?aboveTagOrId?. Ohne zweites Argument: nach ganz oben. Verwendet um Popups, Tooltips, Canvas-Items in den Vordergrund zu bringen.

---

### selection

**EN:** X11 selection (clipboard-like) management. Syntax: selection get ?-selection PRIMARY|CLIPBOARD?; selection clear; selection own .widget; selection handle .widget proc. PRIMARY is the X11 middle-click selection; CLIPBOARD is the explicit copy/paste buffer. On Windows/macOS only CLIPBOARD is meaningful.

**DE:** X11-Selection (clipboard-aehnlich) verwalten. Syntax: selection get ?-selection PRIMARY|CLIPBOARD?; selection clear; selection own .widget; selection handle .widget proc. PRIMARY ist die X11-Middle-Click-Selection; CLIPBOARD ist der explizite Copy/Paste-Puffer. Auf Windows/macOS nur CLIPBOARD relevant.

---

### send

**EN:** Send Tcl command to another Tk application by name (X11 only; e.g., `send appname {set x 5}`).

**DE:** Tcl-Befehl an andere Tk-Anwendung per Name senden (nur X11; z.B. `send appname {set x 5}`).

---

### tk appname

**EN:** Query or set application name for `send` command.

**DE:** Anwendungsnamen für `send`-Befehl abfragen oder setzen.

---

### tk busy

**EN:** Make window(s) busy/unbusy, preventing user interaction (e.g., `tk busy .window`).

**DE:** Fenster beschäftigt/unbeschäftigt machen, Benutzer-Interaktion verhindern (z.B. `tk busy .window`).

---

### tk caret

**EN:** Control position and visibility of text input caret.

**DE:** Position und Sichtbarkeit der Texteingabe-Einfügemarke steuern.

---

### tk fontchooser

**EN:** Display platform-native font selection dialog.

**DE:** Plattform-nativen Font-Auswahl-Dialog anzeigen.

---

### tk scaling

**EN:** Query or set scaling factor for converting between physical and logical units.

**DE:** Skalierungsfaktor zum Konvertieren zwischen physischen und logischen Einheiten abfragen oder setzen.

---

### tk useinputmethods

**EN:** Enable or disable input methods (IME) for international text input.

**DE:** Eingabemethoden (IME) für internationalen Text-Input aktivieren oder deaktivieren.

---

### tk windowingsystem

**EN:** Return windowing system type: x11, win32, or aqua (macOS).

**DE:** Fenstersystem-Typ zurückgeben: x11, win32 oder aqua (macOS).

---

### tkwait

**EN:** Block until a window is destroyed, becomes visible, or a variable changes. Syntax: tkwait window .w; tkwait visibility .w; tkwait variable ::done. Common pattern in modal dialogs: grab + tkwait window. Avoid in event handlers — blocks the entire event loop.

**DE:** Blockiert bis ein Fenster zerstoert wird, sichtbar wird oder eine Variable sich aendert. Syntax: tkwait window .w; tkwait visibility .w; tkwait variable ::done. Uebliches Muster bei modalen Dialogen: grab + tkwait window. In Event-Handlern vermeiden — blockiert die gesamte Event-Schleife.

---

### winfo

**EN:** Query information about windows and widgets; has many subcommands.

**DE:** Informationen über Fenster und Widgets abfragen; hat viele Unterbefehle.

---

### winfo atom / winfo atomname

**EN:** Convert between atom names and numeric IDs (X11).

**DE:** Zwischen Atom-Namen und numerischen IDs konvertieren (X11).

---

### winfo cells

**EN:** Return number of cells in widget's colormap.

**DE:** Anzahl der Zellen in Widget-Colormap zurückgeben.

---

### winfo children

**EN:** Return list of widget's child widgets (e.g., `winfo children .`).

**DE:** Liste der Kind-Widgets des Widgets zurückgeben (z.B. `winfo children .`).

---

### winfo class

**EN:** Return widget's class name (e.g., `winfo class .button` returns `Button`).

**DE:** Klassen-Namen des Widgets zurückgeben (z.B. `winfo class .button` gibt `Button` zurück).

---

### winfo colormapfull

**EN:** Check if widget's colormap is full.

**DE:** Prüfen, ob Widget-Colormap voll ist.

---

### winfo containing

**EN:** Return widget at specified screen coordinates (e.g., `winfo containing 100 200`).

**DE:** Widget an angegebenen Bildschirm-Koordinaten zurückgeben (z.B. `winfo containing 100 200`).

---

### winfo exists

**EN:** Check if widget exists (e.g., `winfo exists .mywindow` returns 1 if exists).

**DE:** Prüfen, ob Widget existiert (z.B. `winfo exists .mywindow` gibt 1 zurück wenn existiert).

---

### winfo fpixels

**EN:** Convert screen distance to pixels with floating-point result.

**DE:** Bildschirm-Distanz in Pixel mit Gleitkomma-Ergebnis konvertieren.

---

### winfo geometry

**EN:** Return widget geometry as `widthxheight+x+y` string.

**DE:** Widget-Geometrie als `widthxheight+x+y`-String zurückgeben.

---

### winfo id

**EN:** Return platform window identifier for widget (X11 window ID, HWND, etc.).

**DE:** Plattform-Fenster-Identifikator für Widget zurückgeben (X11-Fenster-ID, HWND, etc.).

---

### winfo ismapped

**EN:** Check if widget is currently mapped (visible on screen).

**DE:** Prüfen, ob Widget aktuell mapped ist (auf Bildschirm sichtbar).

---

### winfo manager

**EN:** Return name of geometry manager managing widget (pack, grid, place).

**DE:** Namen des Geometry-Managers zurückgeben, der Widget verwaltet (pack, grid, place).

---

### winfo name

**EN:** Return widget's name (last component of pathname).

**DE:** Namen des Widgets zurückgeben (letzte Komponente des Pfadnamens).

---

### winfo parent

**EN:** Return pathname of widget's parent (e.g., `winfo parent .frame.button` returns `.frame`).

**DE:** Pfadnamen des Eltern-Widgets zurückgeben (z.B. `winfo parent .frame.button` gibt `.frame` zurück).

---

### winfo pathname

**EN:** Return widget pathname from window ID.

**DE:** Widget-Pfadnamen aus Fenster-ID zurückgeben.

---

### winfo pixels

**EN:** Convert screen distance (with units like c, i, m, p) to pixels.

**DE:** Bildschirm-Distanz (mit Einheiten wie c, i, m, p) in Pixel konvertieren.

---

### winfo pointerx / winfo pointery

**EN:** Return x/y coordinate of mouse pointer relative to screen.

**DE:** X/Y-Koordinate des Mauszeigers relativ zum Bildschirm zurückgeben.

---

### winfo pointerxy

**EN:** Return mouse pointer coordinates as list `{x y}`.

**DE:** Mauszeiger-Koordinaten als Liste `{x y}` zurückgeben.

---

### winfo reqwidth / winfo reqheight

**EN:** Return requested width/height of widget (natural size).

**DE:** Angeforderte Breite/Höhe des Widgets zurückgeben (natürliche Größe).

---

### winfo rgb

**EN:** Return RGB values for color name (e.g., `winfo rgb . red` returns `65535 0 0`).

**DE:** RGB-Werte für Farbnamen zurückgeben (z.B. `winfo rgb . red` gibt `65535 0 0` zurück).

---

### winfo rootx / winfo rooty

**EN:** Return x/y coordinate of widget relative to screen.

**DE:** X/Y-Koordinate des Widgets relativ zum Bildschirm zurückgeben.

---

### winfo screendepth

**EN:** Return color depth of screen (bits per pixel).

**DE:** Farbtiefe des Bildschirms zurückgeben (Bits pro Pixel).

---

### winfo screenvisual

**EN:** Return visual type of screen (e.g., truecolor, pseudocolor).

**DE:** Visuellen Typ des Bildschirms zurückgeben (z.B. truecolor, pseudocolor).

---

### winfo screenwidth / winfo screenheight

**EN:** Return width/height of screen in pixels.

**DE:** Breite/Höhe des Bildschirms in Pixeln zurückgeben.

---

### winfo server

**EN:** Return string identifying display server.

**DE:** String zurückgeben, der Display-Server identifiziert.

---

### winfo toplevel

**EN:** Return pathname of top-level window containing widget.

**DE:** Pfadnamen des Top-Level-Fensters zurückgeben, das Widget enthält.

---

### winfo viewable

**EN:** Check if widget is viewable (mapped and all ancestors mapped).

**DE:** Prüfen, ob Widget sichtbar ist (mapped und alle Vorfahren mapped).

---

### winfo visual

**EN:** Return visual type used by widget (truecolor, pseudocolor, etc.).

**DE:** Visuellen Typ zurückgeben, der von Widget verwendet wird (truecolor, pseudocolor, etc.).

---

### winfo visualsavailable

**EN:** Return list of available visual types and depths for screen.

**DE:** Liste verfügbarer visueller Typen und Tiefen für Bildschirm zurückgeben.

---

### winfo width / winfo height

**EN:** Return current width/height of widget in pixels.

**DE:** Aktuelle Breite/Höhe des Widgets in Pixeln zurückgeben.

---

### winfo x / winfo y

**EN:** Return x/y coordinate of widget's upper-left corner relative to parent.

**DE:** X/Y-Koordinate der oberen linken Ecke des Widgets relativ zu Eltern zurückgeben.

---

### wm (Window Manager)

**EN:** Window manager command with many subcommands controlling top-level window properties.

**DE:** Window-Manager-Befehl mit vielen Unterbefehlen zur Steuerung von Top-Level-Fenster-Eigenschaften.

---


## Tk-Erweiterungen / Tk Extensions

### AndroWish

**EN:** Tcl/Tk distribution for Android and iOS, plus desktop platforms for development (Linux, Windows, macOS). By Christian Werner. Brings full Tcl 8.6/9.0 and Tk 8.6/9.0 to mobile devices, with bundled extensions (SQLite, TLS, Img, tdom, thread, vfs). On Android, runs directly on the framebuffer (no X11 or Wayland), using the Android SurfaceFlinger. The UNDROIDWISH variant is the desktop-simulation build. Distribution website: androwish.org.

**DE:** Tcl/Tk-Distribution fuer Android und iOS, plus Desktop-Plattformen zur Entwicklung (Linux, Windows, macOS). Von Christian Werner. Bringt das volle Tcl 8.6/9.0 und Tk 8.6/9.0 auf Mobile-Geraete, mit gebuendelten Erweiterungen (SQLite, TLS, Img, tdom, thread, vfs). Auf Android laeuft es direkt auf dem Framebuffer (kein X11 oder Wayland), ueber Androids SurfaceFlinger. Die UNDROIDWISH-Variante ist der Desktop-Simulations-Build. Website: androwish.org.

---

### Cairo (Tcl)

**EN:** Vector-graphics library (originally for GTK) with bindings for Tcl/Tk. Provides anti-aliased drawing, SVG-style paths, gradients, image surfaces, PDF/PostScript/SVG output backends. Two Tcl bindings exist: `tclmcairo` (Tcl-only) and `tkmcairo` (Tk-Canvas integration). Useful where Tk Canvas or `pdf4tcl` are insufficient for rendering quality or output flexibility.

**DE:** Vektorgrafik-Bibliothek (urspruenglich fuer GTK) mit Bindings fuer Tcl/Tk. Bietet Anti-Aliasing-Zeichnen, SVG-artige Pfade, Verlaeufe, Bild-Surfaces, PDF/PostScript/SVG-Ausgabe-Backends. Zwei Tcl-Bindings existieren: `tclmcairo` (nur Tcl) und `tkmcairo` (Tk-Canvas-Integration). Nuetzlich wo Tk-Canvas oder `pdf4tcl` fuer Rendering-Qualitaet oder Ausgabeflexibilitaet nicht ausreichen.

---

### Tcl 9 Migration

**EN:** Process of porting Tcl 8.6 code to Tcl 9.0 (released August 2024). Most code runs unchanged, but a few breaking changes need attention: `package require Tcl 8.6` must become `8.6-` to keep working under 9 (the trailing dash means "8.6 or higher"); string-to-integer conversion is stricter (octal literals require `0o` prefix); some deprecated commands were removed (e.g. `interp share`). The full migration guide lives at core.tcl-lang.org. For mid-size code bases the typical effort is hours, not days.

**DE:** Vorgang des Portierens von Tcl-8.6-Code auf Tcl 9.0 (veroeffentlicht August 2024). Das meiste laeuft unveraendert, aber ein paar Breaking-Changes brauchen Aufmerksamkeit: `package require Tcl 8.6` muss `8.6-` werden, damit es unter 9 weiter funktioniert (der nachgestellte Strich bedeutet "8.6 oder hoeher"); String-zu-Integer-Konvertierung ist strikter (Oktal-Literale brauchen `0o`-Praefix); einige veraltete Befehle wurden entfernt (z.B. `interp share`). Der vollstaendige Migrations-Leitfaden liegt auf core.tcl-lang.org. Fuer mittelgrosse Code-Bases ist der typische Aufwand Stunden, nicht Tage.

---

### tclcairo

**EN:** Tcl binding to the Cairo graphics library, by Dr. Detlef Groth. Generated via SWIG from a thin `cairo.i` interface file (20 lines), producing the full Cairo C API as `::cairo::cairo_*` Tcl commands. Supports image surfaces, PDF, PostScript, and SVG output backends, plus the `tee` surface for multi-output. Pure-Tcl from the caller's view; relies on a pre-built shared library (`libcairo.so` / `libcairo.dll`) shipped with the package. Used standalone, without Tk. Standard API style: `cairo_image_surface_create`, `cairo_create`, `cairo_rectangle`, `cairo_fill`, `cairo_surface_write_to_png`.

**DE:** Tcl-Bindings an die Cairo-Grafik-Bibliothek, von Dr. Detlef Groth. Erzeugt via SWIG aus einer schmalen `cairo.i`-Interface-Datei (20 Zeilen), produziert die volle Cairo-C-API als `::cairo::cairo_*`-Tcl-Befehle. Unterstuetzt Image-Surfaces, PDF-, PostScript- und SVG-Output-Backends, plus die `tee`-Surface fuer Multi-Output. Aus Sicht des Aufrufers reines Tcl; basiert auf einer vorgebauten Shared Library (`libcairo.so` / `libcairo.dll`) die mit dem Paket geliefert wird. Wird standalone, ohne Tk, verwendet. Standard-API-Stil: `cairo_image_surface_create`, `cairo_create`, `cairo_rectangle`, `cairo_fill`, `cairo_surface_write_to_png`.

---

### tclmcairo

**EN:** Tcl-only binding to the Cairo graphics library — provides Cairo's full drawing API as Tcl commands. Output goes to PDF, PostScript, SVG, or PNG surfaces. Use independently of Tk when generating vector graphics without a GUI (server-side image generation, batch PDF rendering).

**DE:** Reine Tcl-Bindings an die Cairo-Grafik-Bibliothek — stellt Cairos volle Zeichen-API als Tcl-Befehle bereit. Ausgabe geht an PDF-, PostScript-, SVG- oder PNG-Surfaces. Wird unabhaengig von Tk verwendet wenn Vektorgrafiken ohne GUI erzeugt werden (server-seitige Bildgenerierung, Batch-PDF-Rendering).

---

### tkinter

**EN:** Python's standard binding to the Tk toolkit — included in CPython's stdlib (`import tkinter`). For many developers, tkinter is the way they first meet Tk: the Tk window, geometry managers, widget set, and event model are all directly exposed. Internally tkinter embeds a Tcl interpreter and feeds Tk commands through it. The Python-side API mirrors Tk's structure with class-based widgets (`Button`, `Frame`, `Label`, ...). Differences from native Tcl/Tk: classes-and-attributes instead of commands-and-options, named methods instead of subcommands, but the underlying Tk objects are the same. The ttk widgets are in `tkinter.ttk`.

**DE:** Pythons Standard-Bindung an das Tk-Toolkit — in CPythons stdlib enthalten (`import tkinter`). Fuer viele Entwickler ist tkinter der erste Kontakt mit Tk: das Tk-Fenster, Geometry-Manager, Widget-Set und Event-Modell werden alle direkt zugaenglich. Intern bettet tkinter einen Tcl-Interpreter ein und schickt Tk-Befehle durch ihn. Die Python-API spiegelt Tks Struktur mit klassen-basierten Widgets (`Button`, `Frame`, `Label`, ...). Unterschiede zu nativem Tcl/Tk: Klassen-und-Attribute statt Befehle-und-Optionen, benannte Methoden statt Unterbefehle, aber die zugrunde liegenden Tk-Objekte sind die gleichen. Die ttk-Widgets liegen in `tkinter.ttk`.

---

### tkmcairo

**EN:** Tk-Canvas binding to Cairo — adds Cairo-rendered drawing items to Tk Canvas. The Canvas remains a Tk widget but rendering quality (anti-aliasing, gradients, complex paths) jumps to Cairo's level. Use when classic Canvas rendering is visually inadequate but staying in the Tk ecosystem is desired.

**DE:** Tk-Canvas-Bindings an Cairo — fuegt Cairo-gerenderte Zeichenelemente zum Tk-Canvas hinzu. Der Canvas bleibt ein Tk-Widget, aber die Rendering-Qualitaet (Anti-Aliasing, Verlaeufe, komplexe Pfade) springt auf Cairo-Niveau. Verwendet wenn klassisches Canvas-Rendering visuell nicht ausreicht, aber das Tk-Oekosystem beibehalten werden soll.

---

### tko

**EN:** Tk Object — modern object-oriented rewrite of Tk widgets based on TclOO. Aims at cleaner widget extension and class-based composition than the original `[incr Tk]` or Snit approaches. Co-exists with classic Tk widgets in the same application. Used where deeply customized widget hierarchies are needed without the boilerplate of plain Tk.

**DE:** Tk Object — moderner objektorientierter Rewrite der Tk-Widgets auf Basis von TclOO. Zielt auf sauberere Widget-Erweiterung und klassen-basierte Komposition als die urspruenglichen `[incr Tk]`- oder Snit-Ansaetze. Koexistiert mit klassischen Tk-Widgets in der gleichen Anwendung. Verwendet wo tief angepasste Widget-Hierarchien gebraucht werden, ohne den Boilerplate des reinen Tk.

---

### tkpath

**EN:** Tk extension that adds an SVG-like path-and-shape rendering layer to the Canvas. Supports paths with cubic/quadratic Béziers, fill rules, gradients, transformations, and anti-aliased rendering. Brings Canvas closer to what Cairo or SVG offers, without leaving the Tk world. Used when the standard Canvas is too limited (no curves, no fills with patterns).

**DE:** Tk-Erweiterung, die eine SVG-artige Pfad- und Shape-Rendering-Schicht zum Canvas hinzufuegt. Unterstuetzt Pfade mit kubischen/quadratischen Bezier-Kurven, Fuellregeln, Verlaeufe, Transformationen und Anti-Aliasing. Bringt Canvas naeher an das was Cairo oder SVG bieten, ohne die Tk-Welt zu verlassen. Verwendet wenn der Standard-Canvas zu limitiert ist (keine Kurven, keine Muster-Fuellungen).

---

### ttk (Themed Tk)

**EN:** The themed widget set added in Tk 8.5 — a separate widget family (`ttk::button`, `ttk::entry`, `ttk::treeview`, ...) that renders through a theme engine producing native look-and-feel per platform. Classic Tk widgets (`button`, `entry`) still exist and render with the old "motif-ish" look. Modern Tcl/Tk code uses ttk widgets unless there's a specific reason not to. Themes available: `clam`, `alt`, `default`, `classic`, plus platform-native (`aqua` on macOS, `vista` on Windows).

**DE:** Der themen-faehige Widget-Satz, der in Tk 8.5 hinzukam — eine separate Widget-Familie (`ttk::button`, `ttk::entry`, `ttk::treeview`, ...), die ueber eine Theme-Engine rendert und natives Look-and-Feel pro Plattform produziert. Klassische Tk-Widgets (`button`, `entry`) existieren weiter und rendern mit dem alten "Motif-artigen" Look. Moderner Tcl/Tk-Code nutzt ttk-Widgets, sofern kein spezifischer Grund dagegen spricht. Verfuegbare Themes: `clam`, `alt`, `default`, `classic`, plus plattform-nativ (`aqua` auf macOS, `vista` auf Windows).

---

### twapi

**EN:** Tcl Windows API — comprehensive Tcl extension exposing the Windows API to Tcl scripts: registry access, services, processes, COM, eventlog, networking, performance counters. Pure-Tcl wrappers over C bindings. The de-facto choice for serious Windows-system scripting in Tcl. Not relevant on Linux/macOS.

**DE:** Tcl Windows API — umfangreiche Tcl-Erweiterung, die die Windows-API fuer Tcl-Scripts zugaenglich macht: Registry-Zugriff, Services, Prozesse, COM, Eventlog, Networking, Performance-Counter. Pure-Tcl-Wrapper ueber C-Bindings. Die De-Facto-Wahl fuer ernsthaftes Windows-System-Scripting in Tcl. Auf Linux/macOS nicht relevant.

---


## Tk-Widget-Konzepte / Tk Widget Concepts

### #0-Spalte

**EN:** The first, special column of a `ttk::treeview` — also called the tree column. Always present; holds the hierarchical structure (open/close triangle, indentation, item text). Can be configured separately from data columns via `$tv heading #0 -text "..."` and `$tv column #0 -width N`. Can be hidden in pure-table mode via `$tv configure -show headings` (no tree column visible).

**DE:** Die erste, spezielle Spalte eines `ttk::treeview` — auch Tree-Spalte genannt. Immer vorhanden; haelt die hierarchische Struktur (Auf-/Zuklapp-Dreieck, Einrueckung, Item-Text). Wird separat von Datenspalten konfiguriert ueber `$tv heading #0 -text "..."` und `$tv column #0 -width N`. Kann im reinen Tabellen-Modus ausgeblendet werden ueber `$tv configure -show headings` (keine Tree-Spalte sichtbar).

---

### BTree (Tk Text)

**EN:** The internal data structure of the Tk Text widget — a B-tree of segments holding lines, tags, marks, embedded windows, and images. Implemented in `tkTextBTree.c`. Lets the widget handle very large documents (hundreds of megabytes of text) with logarithmic lookup time for `index`, `insert`, `delete`. Every text-widget operation that takes an index (`.t index "1.0"`) walks the BTree. Understanding the BTree explains why Text scales when a simple line-array implementation would not.

**DE:** Die interne Datenstruktur des Tk-Text-Widgets — ein B-Baum aus Segmenten, der Zeilen, Tags, Marks, eingebettete Fenster und Bilder haelt. Implementiert in `tkTextBTree.c`. Erlaubt dem Widget, sehr grosse Dokumente (hunderte Megabytes Text) mit logarithmischer Lookup-Zeit fuer `index`, `insert`, `delete` zu handhaben. Jede Text-Widget-Operation mit einem Index (`.t index "1.0"`) laeuft durch den BTree. Das Verstaendnis des BTree erklaert, warum Text skaliert, wo eine simple Zeilen-Array-Implementierung scheitern wuerde.

---

### Canvas-Tag

**EN:** Symbolic name attached to one or more Canvas items, used to address them collectively. Different from a Text-Widget tag: a Canvas tag does not carry formatting; it is purely a label for `find`, `move`, `itemconfigure`, `bind`, `delete` operations. Multiple tags per item are allowed; the special tag `all` matches every item. Standard pattern: tag items by role (`grid`, `data`, `overlay`) and operate on them in groups.

**DE:** Symbolischer Name, der einem oder mehreren Canvas-Items angehaengt wird, um sie gemeinsam ansprechen zu koennen. Anders als ein Text-Widget-Tag: ein Canvas-Tag traegt keine Formatierung; er ist rein ein Label fuer `find`, `move`, `itemconfigure`, `bind`, `delete`. Mehrere Tags pro Item sind erlaubt; der Spezial-Tag `all` matcht jedes Item. Standard-Pattern: Items nach Rolle taggen (`grid`, `data`, `overlay`) und gruppenweise operieren.

---

### Display-Chunk (Tk Text)

**EN:** Internal unit of Tk Text's display engine. The Text widget breaks visible text into chunks (typically per font/tag run), each rendered separately. Chunks are managed in `tkTextDisp.c`. The chunk system lets Text apply tag-specific fonts, colours, and styles efficiently — only chunks where styles change need separate rendering. Explains why complex tag-heavy text renders almost as fast as plain text in Tk.

**DE:** Interne Einheit der Display-Engine des Tk-Text. Das Text-Widget zerlegt sichtbaren Text in Chunks (typisch pro Font-/Tag-Lauf), die einzeln gerendert werden. Chunks werden in `tkTextDisp.c` verwaltet. Das Chunk-System erlaubt dem Text, Tag-spezifische Schriften, Farben und Stile effizient anzuwenden — nur Chunks, in denen sich Stile aendern, brauchen separates Rendern. Erklaert warum komplex getaggter Text in Tk fast so schnell rendert wie reiner Text.

---

### Hit-Test

**EN:** The Canvas operation that determines which item is under a given coordinate — used internally to dispatch mouse events to the right item, and exposed via the `find` subcommand (`find closest x y`, `find overlapping x1 y1 x2 y2`). Implemented in `tkCanvas.c` / `tkCanvUtil.c` using a halo for closeness and Z-Order for tie-breaking. Why `find closest` may return an item that's not actually under the cursor: the halo is a tolerance ring around the click point.

**DE:** Die Canvas-Operation, die ermittelt, welches Item unter einer gegebenen Koordinate liegt — intern verwendet, um Maus-Events ans richtige Item zu dispatchen, und ueber den `find`-Unterbefehl exponiert (`find closest x y`, `find overlapping x1 y1 x2 y2`). Implementiert in `tkCanvas.c` / `tkCanvUtil.c` unter Verwendung eines Halos fuer Naehe und der Z-Order bei Gleichstand. Warum `find closest` ein Item zurueckliefern kann, das gar nicht unter dem Cursor ist: der Halo ist ein Toleranzring um den Klickpunkt.

---

### Hull (Megawidget)

**EN:** The outermost actual Tk widget inside a megawidget — typically a `frame` or `toplevel` — onto which the composite identity is bound. The hull's Tk path becomes the megawidget's path: when a script writes `.myMega`, the hull is `.myMega`, and inner widgets live as `.myMega.inner`. Achieved via `rename .myMega .myMega_orig` followed by `interp alias {} .myMega {} ::mywidget::dispatch .myMega`, so the path-command dispatches to the megawidget's handler while the actual Tk widget continues to exist. Standard term in Snit, BWidget, and TclOO-megawidget conventions.

**DE:** Das aeusserste echte Tk-Widget innerhalb eines Megawidgets — typisch ein `frame` oder `toplevel` — an das die Composite-Identitaet gebunden wird. Der Tk-Pfad der Hull wird zum Pfad des Megawidgets: schreibt ein Script `.myMega`, ist die Hull `.myMega`, und innere Widgets leben als `.myMega.inner`. Erreicht via `rename .myMega .myMega_orig` gefolgt von `interp alias {} .myMega {} ::mywidget::dispatch .myMega`, sodass der Pfad-Befehl an den Megawidget-Handler dispatched, waehrend das echte Tk-Widget weiter existiert. Standard-Begriff in Snit-, BWidget- und TclOO-Megawidget-Konventionen.

---

### Insert-Mark

**EN:** The named mark `insert` in a Text widget — represents the current text cursor position. Moved automatically by user input (typing, arrow keys, mouse click). Can be moved programmatically with `$w mark set insert {1.0}`. The cursor is rendered at this position. Counterpart: the `current` mark (mouse-pointer position over text).

**DE:** Der benannte Mark `insert` im Text-Widget — repraesentiert die aktuelle Text-Cursor-Position. Wird automatisch durch Benutzer-Eingabe verschoben (Tippen, Pfeiltasten, Mausklick). Kann programmatisch mit `$w mark set insert {1.0}` verschoben werden. Der Cursor wird an dieser Position gerendert. Pendant: der `current`-Mark (Maus-Position ueber Text).

---

### Megawidget

**EN:** A composite widget — one Tk command that internally manages multiple subwidgets behind a single interface. Examples from the Tcl/Tk ecosystem: `Tablelist` (combines Treeview + scrollbars + cell editors), `scrollutil`'s `scrollarea` (frame + scrollbars + content), `bwidget`'s `LabelEntry` (label + entry pair). Implemented either with Snit, TclOO, or the classic `rename + interp alias` idiom. The defining quality: from a script's perspective, it behaves like a single widget — same `configure`/`cget`/`destroy` interface, same path-name model.

**DE:** Ein zusammengesetztes Widget — ein Tk-Befehl, der intern mehrere Sub-Widgets hinter einer einzigen Schnittstelle verwaltet. Beispiele aus dem Tcl/Tk-Oekosystem: `Tablelist` (Treeview + Scrollbars + Zell-Editoren), `scrollutil`s `scrollarea` (Frame + Scrollbars + Inhalt), `bwidget`s `LabelEntry` (Label-Entry-Paar). Implementiert entweder mit Snit, TclOO oder dem klassischen `rename + interp alias`-Idiom. Definierende Eigenschaft: aus Script-Sicht verhaelt es sich wie ein einzelnes Widget — gleiche `configure`/`cget`/`destroy`-Schnittstelle, gleiches Pfadnamen-Modell.

---

### Text-Widget-Index

**EN:** A position in a Text widget, written as line-and-character (`1.0`, `5.12`, `end`), as a named mark (`insert`, `current`, custom marks), or as a relative expression (`insert + 5 chars`, `end - 1 line`, `1.0 lineend`). Indices are evaluated lazily: when text changes, `"1.0"` always means the start, never sticks to original content. For stable references to content positions, use marks instead.

**DE:** Eine Position im Text-Widget, geschrieben als Zeile-und-Zeichen (`1.0`, `5.12`, `end`), als benannter Mark (`insert`, `current`, eigene Marks), oder als relativer Ausdruck (`insert + 5 chars`, `end - 1 line`, `1.0 lineend`). Indizes werden lazy ausgewertet: aendert sich Text, bedeutet `"1.0"` immer den Anfang, klebt nie am urspruenglichen Inhalt. Fuer stabile Bezuege auf Inhalts-Positionen Marks verwenden.

---

### Text-Widget-Tag

**EN:** Symbolic name attached to a range in a Text widget that carries display formatting (font, colour, background, justification, spacing) plus optional event bindings. Different from a Canvas tag: a Text-Widget tag does carry formatting — applying it to a range visibly changes that range's appearance. Common pattern: define a tag once with `tag configure`, then apply it to many ranges with `tag add`. Underpins highlighting, syntax colouring, markdown rendering, hyperlinks.

**DE:** Symbolischer Name, der einem Bereich im Text-Widget angehaengt wird und Anzeige-Formatierung (Font, Farbe, Hintergrund, Ausrichtung, Abstaende) plus optionale Event-Bindings traegt. Anders als ein Canvas-Tag: ein Text-Widget-Tag traegt Formatierung — Anwendung auf einen Bereich aendert dessen Aussehen sichtbar. Uebliches Pattern: Tag einmal mit `tag configure` definieren, dann auf viele Bereiche mit `tag add` anwenden. Grundlage fuer Highlighting, Syntax-Faerbung, Markdown-Rendering, Hyperlinks.

---

### Z-Order

**EN:** Drawing and hit-test order of items in a Tk Canvas. Items higher in the Z-Order draw on top and receive clicks first; lower items are obscured by higher ones. Controlled via `raise` (move to top) and `lower` (move to bottom) commands, or relative to other items. The Z-Order is the third dimension implicit in a 2D Canvas — items have x, y, and a Z position determined by creation/raise/lower sequence.

**DE:** Zeichnungs- und Hit-Test-Reihenfolge der Items in einem Tk-Canvas. Items hoeher in der Z-Order werden ueber anderen gezeichnet und bekommen Klicks zuerst; niedrigere Items werden von hoeheren verdeckt. Gesteuert via `raise` (nach oben) und `lower` (nach unten), oder relativ zu anderen Items. Die Z-Order ist die in einem 2D-Canvas implizite dritte Dimension — Items haben x, y und eine Z-Position, bestimmt durch Erzeugungs-/Raise-/Lower-Reihenfolge.

---

### canvasx / canvasy

**EN:** Canvas commands that translate window coordinates (e.g. mouse `%x`/`%y` from a bind) to Canvas coordinates, accounting for the current scroll offset. Critical for any code that creates or finds items at the mouse position in a scrollable Canvas: without translation, hits land at the wrong place once the user has scrolled. Usage: `$c canvasx %x` and `$c canvasy %y` in a bind script.

**DE:** Canvas-Befehle, die Fenster-Koordinaten (z.B. Maus-`%x`/`%y` aus einem Bind) in Canvas-Koordinaten uebersetzen unter Beachtung des aktuellen Scroll-Offsets. Kritisch fuer Code, der Items an Maus-Positionen in einem scrollbaren Canvas anlegt oder findet: ohne Uebersetzung landen Treffer am falschen Ort, sobald der Nutzer gescrollt hat. Verwendung: `$c canvasx %x` und `$c canvasy %y` im Bind-Skript.

---

### displaycolumns

**EN:** Treeview option that controls which data columns are visible and in what order. Distinct from the `-columns` option (which declares which columns exist). Pattern: define ten columns once with `-columns`, then switch between view modes by changing `-displaycolumns` to show subsets. Setting `-displaycolumns "#all"` shows all defined columns in the original order.

**DE:** Treeview-Option, die steuert welche Datenspalten sichtbar sind und in welcher Reihenfolge. Verschieden von `-columns` (das deklariert welche Spalten existieren). Pattern: zehn Spalten einmal mit `-columns` definieren, dann zwischen Ansichten umschalten indem `-displaycolumns` auf Teilmengen gesetzt wird. `-displaycolumns "#all"` zeigt alle definierten Spalten in der Originalreihenfolge.

---

### elide

**EN:** Text-Widget tag option that hides the tagged text from display without removing it from the buffer. The text still exists for `index`, `search` and `get` operations but does not occupy display space. Useful for collapsible sections (code folding), spoiler text, secret reveal patterns. Toggle via `$w tag configure name -elide 1` / `0`.

**DE:** Text-Widget-Tag-Option, die den getaggten Text vom Display ausblendet, ohne ihn aus dem Buffer zu entfernen. Der Text existiert weiter fuer `index`-, `search`- und `get`-Operationen, beansprucht aber keinen Anzeige-Platz. Nuetzlich fuer einklappbare Abschnitte (Code-Folding), Spoiler-Text, Reveal-Patterns. Umschalten ueber `$w tag configure name -elide 1` / `0`.

---

### scrollregion

**EN:** Canvas option defining the virtual area scrollable by the user. Set as `{x1 y1 x2 y2}` — typically larger than the visible widget. The widget shows a window onto this region; scrollbars move that window. Without a `scrollregion`, the Canvas is not scrollable regardless of attached scrollbars. After adding many items, often automatically derived: `$c configure -scrollregion [$c bbox all]`.

**DE:** Canvas-Option, die den virtuell scrollbaren Bereich definiert. Gesetzt als `{x1 y1 x2 y2}` — typischerweise groesser als das sichtbare Widget. Das Widget zeigt ein Fenster auf diese Region; Scrollbars bewegen dieses Fenster. Ohne `scrollregion` ist der Canvas nicht scrollbar, egal welche Scrollbars angehaengt sind. Nach dem Hinzufuegen vieler Items oft automatisch abgeleitet: `$c configure -scrollregion [$c bbox all]`.

---

### selectmode

**EN:** Listbox and Treeview option that controls how the user selects items. Values: `single` (one item, click to select), `browse` (one item, mouse drag selects too), `multiple` (multi-select via click), `extended` (multi-select with Shift/Ctrl modifiers — the most common modern default). Driver of UX expectations: `extended` matches what users know from file managers.

**DE:** Listbox- und Treeview-Option, die steuert wie der Nutzer Items auswaehlt. Werte: `single` (ein Item, Klick zur Auswahl), `browse` (ein Item, Maus-Drag waehlt auch), `multiple` (Mehrfachauswahl per Klick), `extended` (Mehrfachauswahl mit Shift/Ctrl — der haeufigste moderne Default). Treiber der UX-Erwartungen: `extended` entspricht dem was Nutzer aus Dateimanagern kennen.

---

### xview / yview

**EN:** Widget commands for horizontal/vertical viewport control. Three forms: `xview` returns the visible fraction `{first last}` (0.0..1.0 each); `xview moveto fraction` jumps to an absolute position; `xview scroll number what` (where `what` is `units` or `pages`) moves relatively. Used by scrollbars via `-xscrollcommand` / `-yscrollcommand`. Almost every scrollable Tk widget (Text, Canvas, Listbox, Treeview, Entry) exposes the same `xview`/`yview` protocol.

**DE:** Widget-Befehle fuer horizontale/vertikale Viewport-Steuerung. Drei Formen: `xview` liefert den sichtbaren Bruchteil `{first last}` (jeweils 0.0..1.0); `xview moveto fraction` springt an eine absolute Position; `xview scroll number what` (wobei `what` `units` oder `pages` ist) bewegt relativ. Wird von Scrollbars ueber `-xscrollcommand` / `-yscrollcommand` genutzt. Fast jedes scrollbare Tk-Widget (Text, Canvas, Listbox, Treeview, Entry) implementiert dasselbe `xview`/`yview`-Protokoll.

---


## Tklib-Bibliotheken / Tklib Libraries

### autoscroll

**EN:** Tklib module for automatic scrollbar visibility management.

**DE:** Tklib-Modul für automatische Scrollbar-Sichtbarkeits-Verwaltung.

---

### ctext

**EN:** Tklib enhanced text widget with syntax highlighting support.

**DE:** Tklib erweitertes Text-Widget mit Syntax-Highlighting-Unterstützung.

---

### img::png / img::jpeg / img::gif

**EN:** Tklib image format handlers for PNG, JPEG, and GIF files.

**DE:** Tklib Bildformat-Handler für PNG-, JPEG- und GIF-Dateien.

---

### mclistbox

**EN:** Tklib multi-column listbox widget with column headers and resizing.

**DE:** Tklib mehrspaltige Listbox-Widget mit Spalten-Überschriften und Größenänderung.

---

### plotchart

**EN:** Tklib module for creating charts and plots on canvas (line, bar, pie, etc.).

**DE:** Tklib-Modul zum Erstellen von Diagrammen und Plots auf Canvas (Linien, Balken, Torte, etc.).

---

### scrollutil

**EN:** Tklib module providing scrolled widget utilities and enhanced scrolling.

**DE:** Tklib-Modul mit gescrollten Widget-Werkzeugen und verbessertem Scrollen.

---

### scrollutil::scrollableframe

**EN:** Frame widget that can be scrolled when content exceeds visible area.

**DE:** Frame-Widget, das gescrollt werden kann, wenn Inhalt sichtbaren Bereich überschreitet.

---

### scrollutil::scrollarea

**EN:** Create scrolled area for any widget with automatic scrollbar management.

**DE:** Gescrollten Bereich für beliebiges Widget mit automatischer Scrollbar-Verwaltung erstellen.

---

### tablelist

**EN:** Tklib widget for multi-column table display with sorting and editing (e.g., `package require tablelist`).

**DE:** Tklib-Widget für mehrspaltige Tabellen-Anzeige mit Sortierung und Bearbeitung (z.B. `package require tablelist`).

---

### tablelist delete

**EN:** Delete rows from tablelist by index range.

**DE:** Zeilen aus Tablelist nach Index-Bereich löschen.

---

### tablelist insert

**EN:** Insert row into tablelist at specified index.

**DE:** Zeile in Tablelist an angegebenem Index einfügen.

---

### tablelist sort

**EN:** Sort tablelist by column with optional comparison command.

**DE:** Tablelist nach Spalte sortieren mit optionalem Vergleichsbefehl.

---

### tablelist::tablelist

**EN:** Create tablelist widget (e.g., `tablelist::tablelist .tbl -columns {0 "Name" 0 "Age"}`).

**DE:** Tablelist-Widget erstellen (z.B. `tablelist::tablelist .tbl -columns {0 "Name" 0 "Age"}`).

---

### tooltip

**EN:** Tklib module for adding tooltips to widgets (e.g., `package require tooltip`).

**DE:** Tklib-Modul zum Hinzufügen von Tooltips zu Widgets (z.B. `package require tooltip`).

---

### tooltip::tooltip

**EN:** Register tooltip for widget (e.g., `tooltip::tooltip .button "This is a button"`).

**DE:** Tooltip für Widget registrieren (z.B. `tooltip::tooltip .button "This is a button"`).

---

### widget::dialog

**EN:** Tklib module for creating standard dialog windows.

**DE:** Tklib-Modul zum Erstellen von Standard-Dialog-Fenstern.

---

### widget::scrolledwindow

**EN:** Tklib container with automatic scrollbar management.

**DE:** Tklib-Container mit automatischer Scrollbar-Verwaltung.

---


## Unix-Datei-Befehle / Unix File Commands

### head

**EN:** Unix command displaying first lines of file; default 10 lines; `head -n 20 file.txt` shows 20 lines; Tcl alternative: read file, `lrange [split $text "\n"] 0 9`; Tcl call: `exec head -n 10 file.txt`; useful for previewing large files.

**DE:** Unix-Befehl zeigend erste Zeilen von Datei; Standard 10 Zeilen; `head -n 20 file.txt` zeigt 20 Zeilen; Tcl-Alternative: Datei lesen, `lrange [split $text "\n"] 0 9`; Tcl-Aufruf: `exec head -n 10 file.txt`; nützlich für Vorschau großer Dateien.

---

### tail

**EN:** Unix command displaying last lines of file; default 10 lines; `tail -n 20 file.txt` shows last 20; `tail -f file.txt` follows file (live updates); Tcl: `exec tail -f logfile.txt`; essential for log monitoring.

**DE:** Unix-Befehl zeigend letzte Zeilen von Datei; Standard 10 Zeilen; `tail -n 20 file.txt` zeigt letzte 20; `tail -f file.txt` folgt Datei (Live-Updates); Tcl: `exec tail -f logfile.txt`; essentiell für Log-Überwachung.

---

### tail -f (Follow)

**EN:** Monitor file for new content; continuously displays appended lines; essential for real-time log monitoring; Ctrl+C to stop; Tcl implementation: read file periodically with after; common for watching server logs.

**DE:** Datei auf neuen Inhalt überwachen; zeigt kontinuierlich angehängte Zeilen; essentiell für Echtzeit-Log-Überwachung; Strg+C zum Stoppen; Tcl-Implementierung: Datei periodisch lesen mit after; üblich für Server-Log-Beobachtung.

---


## Unix/Linux-Tools und Tcl-Integration / Unix/Linux Tools and Tcl Integration

### awk

**EN:** Text processing language and Unix tool; pattern scanning and processing; excellent for column-based data; Tcl can call via `exec awk 'program' file`; Tcl provides similar functionality with string/list commands; example: `exec awk '{print $1}' data.txt`.

**DE:** Text-Verarbeitungs-Sprache und Unix-Tool; Mustersuche und -verarbeitung; exzellent für spaltenbasierte Daten; Tcl kann aufrufen via `exec awk 'program' file`; Tcl bietet ähnliche Funktionalität mit string/list-Befehlen; Beispiel: `exec awk '{print $1}' data.txt`.

---

### dir (Windows)

**EN:** Windows command listing directory contents; DOS/CMD equivalent of Unix `ls`; Tcl works cross-platform with `glob`, `file`; call from Tcl on Windows: `exec cmd /c dir`; output format differs from Unix ls.

**DE:** Windows-Befehl zum Auflisten von Verzeichnis-Inhalten; DOS/CMD-Äquivalent von Unix `ls`; Tcl funktioniert plattformübergreifend mit `glob`, `file`; Aufruf von Tcl auf Windows: `exec cmd /c dir`; Ausgabeformat unterscheidet sich von Unix ls.

---

### grep

**EN:** Unix tool searching text for patterns; global regular expression print; filters lines matching pattern; Tcl alternatives: `regexp`, `string match`, `lsearch`; call from Tcl: `exec grep pattern file`; example: `exec grep "ERROR" logfile.txt`.

**DE:** Unix-Tool zum Durchsuchen von Text nach Mustern; global regular expression print; filtert Zeilen mit Muster; Tcl-Alternativen: `regexp`, `string match`, `lsearch`; Aufruf von Tcl: `exec grep pattern file`; Beispiel: `exec grep "ERROR" logfile.txt`.

---

### ls

**EN:** Unix command listing directory contents; `ls -l` for detailed listing; Tcl equivalent: `glob *` for filenames, `file attributes` for details; call from Tcl: `exec ls -la`; cross-platform alternative: use Tcl `glob` and `file` commands.

**DE:** Unix-Befehl zum Auflisten von Verzeichnis-Inhalten; `ls -l` für detaillierte Auflistung; Tcl-Äquivalent: `glob *` für Dateinamen, `file attributes` für Details; Aufruf von Tcl: `exec ls -la`; plattformübergreifende Alternative: Tcl `glob`- und `file`-Befehle verwenden.

---

### sed (Stream Editor)

**EN:** Unix stream editor for text transformation; search and replace, line filtering; often used in pipelines; Tcl alternative: `regsub`, `string map`; call from Tcl: `exec sed 's/old/new/g' file`; powerful for batch text processing.

**DE:** Unix-Stream-Editor für Text-Transformation; Suchen und Ersetzen, Zeilen-Filterung; oft in Pipelines verwendet; Tcl-Alternative: `regsub`, `string map`; Aufruf von Tcl: `exec sed 's/old/new/g' file`; mächtig für Batch-Text-Verarbeitung.

---

### wc (Word Count)

**EN:** Unix tool counting lines, words, characters; `wc -l` counts lines; Tcl alternative: `llength [split $text "\n"]` for lines, `string length` for characters; call from Tcl: `exec wc -l file.txt`; useful for file statistics.

**DE:** Unix-Tool zum Zählen von Zeilen, Wörtern, Zeichen; `wc -l` zählt Zeilen; Tcl-Alternative: `llength [split $text "\n"]` für Zeilen, `string length` für Zeichen; Aufruf von Tcl: `exec wc -l file.txt`; nützlich für Datei-Statistiken.

---


## Validation-Begriffe / Validation Terms

### Invalidcommand (invcmd)

**EN:** Script called when validation fails.

**DE:** Skript, das aufgerufen wird, wenn Validierung fehlschlägt.

---

### Validate

**EN:** Mechanism for restricting or checking entry widget input.

**DE:** Mechanismus zum Einschränken oder Überprüfen von Entry-Widget-Eingaben.

---

### Validatecommand (vcmd)

**EN:** Script called to validate entry input; returns 1 (accept) or 0 (reject).

**DE:** Skript, das zur Validierung von Entry-Eingaben aufgerufen wird; gibt 1 (akzeptieren) oder 0 (ablehnen) zurück.

---

### Validation Mode

**EN:** When validation occurs: `none`, `focus`, `focusin`, `focusout`, `key`, `all`.

**DE:** Wann Validierung erfolgt: `none`, `focus`, `focusin`, `focusout`, `key`, `all`.

---

### Validation Substitutions

**EN:** Special characters in validation commands: `%d` (action), `%P` (new value), `%s` (old value), `%S` (inserted text), `%v` (validation type).

**DE:** Spezielle Zeichen in Validierungsbefehlen: `%d` (Aktion), `%P` (neuer Wert), `%s` (alter Wert), `%S` (eingefügter Text), `%v` (Validierungstyp).

---


## Variable-Typen / Variable Types

### BooleanVar

**EN:** Variable holding boolean (true/false) value.

**DE:** Variable, die booleschen (wahr/falsch) Wert hält.

---

### DoubleVar

**EN:** Variable holding floating-point value.

**DE:** Variable, die Gleitkommawert hält.

---

### IntVar

**EN:** Variable holding integer value (though Tcl doesn't strictly type variables).

**DE:** Variable, die Ganzzahlwert hält (obwohl Tcl Variablen nicht strikt typisiert).

---

### Listvariable

**EN:** Widget option linking listbox contents to a Tcl list variable.

**DE:** Widget-Option, die Listbox-Inhalt mit einer Tcl-Listen-Variablen verknüpft.

---

### StringVar

**EN:** Variable holding string value, often linked to widget with `-textvariable`.

**DE:** Variable, die String-Wert hält, oft mit Widget über `-textvariable` verbunden.

---

### Textvariable

**EN:** Widget option linking widget's displayed text to a Tcl variable.

**DE:** Widget-Option, die angezeigten Text des Widgets mit einer Tcl-Variablen verknüpft.

---


## Vergleichsoperatoren / Comparison Operators

### != (Not Equal)

**EN:** Inequality comparison; returns true if operands are different (e.g., `$x != 0`).

**DE:** Ungleichheitsvergleich; gibt wahr zurück, wenn Operanden unterschiedlich sind (z.B. `$x != 0`).

---

### < (Less Than)

**EN:** Returns true if left operand is less than right operand.

**DE:** Gibt wahr zurück, wenn linker Operand kleiner als rechter Operand ist.

---

### < > <= >= (String Comparison)

**EN:** String comparison operators for lexicographic ordering when used with strings.

**DE:** String-Vergleichsoperatoren für lexikographische Ordnung bei Verwendung mit Strings.

---

### <= (Less Than or Equal)

**EN:** Returns true if left operand is less than or equal to right operand.

**DE:** Gibt wahr zurück, wenn linker Operand kleiner oder gleich rechtem Operand ist.

---

### == (Equal)

**EN:** Equality comparison; returns true if operands are equal (e.g., `$x == 5`).

**DE:** Gleichheitsvergleich; gibt wahr zurück, wenn Operanden gleich sind (z.B. `$x == 5`).

---

### > (Greater Than)

**EN:** Returns true if left operand is greater than right operand.

**DE:** Gibt wahr zurück, wenn linker Operand größer als rechter Operand ist.

---

### >= (Greater Than or Equal)

**EN:** Returns true if left operand is greater than or equal to right operand.

**DE:** Gibt wahr zurück, wenn linker Operand größer oder gleich rechtem Operand ist.

---

### eq (String Equal)

**EN:** String equality comparison; compares strings lexicographically (e.g., `$name eq "John"`).

**DE:** String-Gleichheitsvergleich; vergleicht Strings lexikographisch (z.B. `$name eq "John"`).

---

### ne (String Not Equal)

**EN:** String inequality comparison; returns true if strings differ.

**DE:** String-Ungleichheitsvergleich; gibt wahr zurück, wenn Strings unterschiedlich sind.

---


## Versionskontrolle erweitert / Version Control Extended

### Clone

**EN:** Create copy of repository; includes full history; Git: `git clone url`; Fossil: `fossil clone url file.fossil`; first step in working with remote repository; creates local working copy.

**DE:** Kopie von Repository erstellen; enthält volle Historie; Git: `git clone url`; Fossil: `fossil clone url file.fossil`; erster Schritt beim Arbeiten mit Remote-Repository; erstellt lokale Arbeitskopie.

---

### Fossil

**EN:** Distributed version control system with built-in wiki, bug tracker, web interface; single executable; written in C; alternative to Git; simpler than Git for small projects; Tcl-friendly (used by Tcl/Tk project itself); commands: `fossil init`, `fossil clone`, `fossil commit`; file extension: .fossil.

**DE:** Verteiltes Versionskontroll-System mit eingebautem Wiki, Bug-Tracker, Web-Interface; einzelne ausführbare Datei; geschrieben in C; Alternative zu Git; einfacher als Git für kleine Projekte; Tcl-freundlich (verwendet vom Tcl/Tk-Projekt selbst); Befehle: `fossil init`, `fossil clone`, `fossil commit`; Dateiendung: .fossil.

---

### Git (Extended)

**EN:** Distributed VCS; most popular version control; branching/merging focused; Tcl integration: `exec git ...` or tcllib git package; essential commands: init, clone, add, commit, push, pull, branch, merge, log; GitHub, GitLab use Git; learning curve but industry standard.

**DE:** Verteiltes VCS; beliebteste Versionskontrolle; Branching/Merging-fokussiert; Tcl-Integration: `exec git ...` oder tcllib-Git-Paket; essentielle Befehle: init, clone, add, commit, push, pull, branch, merge, log; GitHub, GitLab verwenden Git; Lernkurve aber Industrie-Standard.

---

### Merge

**EN:** Combine changes from different branches; integrates parallel development; may cause conflicts requiring manual resolution; Git: `git merge branch`; Fossil: `fossil merge branch`; critical for team development.

**DE:** Änderungen von verschiedenen Branches kombinieren; integriert parallele Entwicklung; kann Konflikte verursachen die manuelle Auflösung erfordern; Git: `git merge branch`; Fossil: `fossil merge branch`; kritisch für Team-Entwicklung.

---

### Repository

**EN:** Storage location for version-controlled files; contains all history, branches, tags; can be local or remote; Git: .git directory; Fossil: single .fossil file; central to version control.

**DE:** Speicher-Ort für versionskontrollierte Dateien; enthält alle Historie, Branches, Tags; kann lokal oder remote sein; Git: .git-Verzeichnis; Fossil: einzelne .fossil-Datei; zentral für Versionskontrolle.

---

### commit

**EN:** Save changes to version control repository; creates snapshot of current state; requires commit message; in Git: `git commit -m "message"`; in Fossil: `fossil commit -m "message"`; Tcl from script: `exec git commit -m $message`; fundamental VCS operation.

**DE:** Änderungen in Versionskontroll-Repository speichern; erstellt Snapshot des aktuellen Zustands; erfordert Commit-Nachricht; in Git: `git commit -m "message"`; in Fossil: `fossil commit -m "message"`; Tcl aus Skript: `exec git commit -m $message`; fundamentale VCS-Operation.

---

### diff

**EN:** Show differences between files or versions; Unix tool and VCS feature; line-by-line comparison; Git: `git diff`; Unix: `diff file1 file2`; Tcl can call: `exec diff file1 file2`; output shows additions (+), deletions (-), context.

**DE:** Unterschiede zwischen Dateien oder Versionen zeigen; Unix-Tool und VCS-Feature; zeilenweiser Vergleich; Git: `git diff`; Unix: `diff file1 file2`; Tcl kann aufrufen: `exec diff file1 file2`; Ausgabe zeigt Hinzufügungen (+), Löschungen (-), Kontext.

---

### patch

**EN:** File containing differences between versions; textual representation of changes; create with diff; apply with patch command; Git: `git format-patch` creates, `git apply` applies; portable way to share changes; format: unified diff.

**DE:** Datei mit Unterschieden zwischen Versionen; textuelle Darstellung von Änderungen; erstellen mit diff; anwenden mit patch-Befehl; Git: `git format-patch` erstellt, `git apply` wendet an; portabler Weg Änderungen zu teilen; Format: unified diff.

---

### pull

**EN:** Download changes from remote repository; updates local copy with remote changes; Git: `git pull origin main`; Fossil: `fossil pull`; may cause merge conflicts; opposite of push; keeps local repository synchronized.

**DE:** Änderungen von Remote-Repository herunterladen; aktualisiert lokale Kopie mit Remote-Änderungen; Git: `git pull origin main`; Fossil: `fossil pull`; kann Merge-Konflikte verursachen; Gegenteil von push; hält lokales Repository synchronisiert.

---

### push

**EN:** Upload local commits to remote repository; synchronizes local changes to server; Git: `git push origin main`; Fossil: `fossil push`; requires network connection and permissions; essential for collaboration.

**DE:** Lokale Commits zu Remote-Repository hochladen; synchronisiert lokale Änderungen zu Server; Git: `git push origin main`; Fossil: `fossil push`; erfordert Netzwerk-Verbindung und Berechtigungen; essentiell für Kollaboration.

---

### rollback

**EN:** Revert to previous state; undo changes; in Git: `git reset` or `git revert`; in Fossil: `fossil undo`; in databases (TDBC): `$db rollback` cancels transaction; opposite of commit; use carefully as may lose work.

**DE:** Zu vorherigem Zustand zurückkehren; Änderungen rückgängig machen; in Git: `git reset` oder `git revert`; in Fossil: `fossil undo`; in Datenbanken (TDBC): `$db rollback` bricht Transaktion ab; Gegenteil von commit; vorsichtig verwenden da Arbeit verloren gehen kann.

---


## Weitere Frame-Begriffe / Additional Frame Terms

### Borderwidth

**EN:** Width of frame's decorative border in pixels.

**DE:** Breite des dekorativen Rahmens des Frames in Pixeln.

---

### Container Frame

**EN:** Frame specifically used to hold and organize multiple child widgets.

**DE:** Frame speziell verwendet, um mehrere Kind-Widgets zu halten und zu organisieren.

---

### Frame (Widget)

**EN:** Container widget used to group and organize other widgets within a window.

**DE:** Container-Widget zum Gruppieren und Organisieren anderer Widgets innerhalb eines Fensters.

---

### Parent Frame

**EN:** Frame containing other widgets or subframes in hierarchy.

**DE:** Frame, das andere Widgets oder Subframes in Hierarchie enthält.

---

### Subframe

**EN:** Frame nested within another frame for hierarchical layout organization.

**DE:** Frame, das in anderem Frame verschachtelt ist für hierarchische Layout-Organisation.

---

### Toplevel Frame

**EN:** Independent window frame separate from main application window.

**DE:** Unabhängiges Fenster-Frame getrennt vom Hauptanwendungsfenster.

---


## Weitere Widget-Typen / Additional Widget Types

### Checkbutton

**EN:** Widget with checkbox for binary on/off selection.

**DE:** Widget mit Checkbox für binäre Ein/Aus-Auswahl.

---

### Combobox (ttk::combobox)

**EN:** Combined entry and dropdown list widget from themed widget set.

**DE:** Kombiniertes Entry- und Dropdown-Listen-Widget aus dem thematischen Widget-Set.

---

### Labelframe

**EN:** Frame widget with decorative border and label.

**DE:** Frame-Widget mit dekorativem Rand und Label.

---

### Message

**EN:** Widget displaying multi-line text with automatic line wrapping.

**DE:** Widget, das mehrzeiligen Text mit automatischem Zeilenumbruch anzeigt.

---

### Notebook (ttk::notebook)

**EN:** Multi-page container with tabs for switching between pages.

**DE:** Mehrseitiger Container mit Tabs zum Wechseln zwischen Seiten.

---

### PanedWindow

**EN:** Container widget with resizable panes separated by movable sashes.

**DE:** Container-Widget mit größenänderbaren Bereichen, getrennt durch bewegliche Trennbalken.

---

### Progressbar (ttk::progressbar)

**EN:** Widget showing progress of lengthy operation.

**DE:** Widget, das Fortschritt einer langwierigen Operation anzeigt.

---

### Radiobutton

**EN:** Widget for mutually exclusive selection within a group.

**DE:** Widget für sich gegenseitig ausschließende Auswahl innerhalb einer Gruppe.

---

### Separator (ttk::separator)

**EN:** Visual dividing line between interface sections.

**DE:** Visuelle Trennlinie zwischen Interface-Abschnitten.

---

### Spinbox

**EN:** Entry widget with up/down arrows for selecting from range or list of values.

**DE:** Entry-Widget mit Auf/Ab-Pfeilen zur Auswahl aus Bereich oder Liste von Werten.

---

### Treeview (ttk::treeview)

**EN:** Widget displaying hierarchical data in tree or table format.

**DE:** Widget, das hierarchische Daten in Baum- oder Tabellenformat anzeigt.

---


## Weitere wichtige Tcl-Konzepte / Additional Important Tcl Concepts

### Interp Alias

**EN:** Create command alias in interpreter (e.g., `interp alias {} ll {} ls -la`).

**DE:** Befehlsalias im Interpreter erstellen (z.B. `interp alias {} ll {} ls -la`).

---

### Master Interpreter

**EN:** Interpreter that created slave interpreters; controls slave access.

**DE:** Interpreter, der Slave-Interpreter erstellt hat; kontrolliert Slave-Zugriff.

---

### Safe Interpreter

**EN:** Restricted interpreter with limited commands for security (no file I/O, exec, etc.).

**DE:** Eingeschränkter Interpreter mit limitierten Befehlen für Sicherheit (kein File-I/O, exec, etc.).

---

### Slave Interpreter

**EN:** Child interpreter created by another interpreter; can be safe or trusted.

**DE:** Kind-Interpreter erstellt von anderem Interpreter; kann safe oder trusted sein.

---

### Stubs

**EN:** Tcl extension mechanism for binary compatibility across versions without recompilation.

**DE:** Tcl-Extension-Mechanismus für Binär-Kompatibilität über Versionen ohne Neukompilierung.

---

### Tcl_Alloc / Tcl_Free

**EN:** C API functions for memory allocation in Tcl extensions.

**DE:** C-API-Funktionen für Speicher-Allokation in Tcl-Extensions.

---

### Tcl_CreateCommand

**EN:** C API function to register new command in interpreter.

**DE:** C-API-Funktion zum Registrieren eines neuen Befehls im Interpreter.

---

### Tcl_GetInt / Tcl_GetDouble

**EN:** C API functions for converting Tcl objects to C types.

**DE:** C-API-Funktionen zum Konvertieren von Tcl-Objekten zu C-Typen.

---

### Tcl_InitStubs

**EN:** C API function initializing stubs for extension (e.g., `Tcl_InitStubs(interp, "8.6", 0)`).

**DE:** C-API-Funktion zum Initialisieren von Stubs für Extension (z.B. `Tcl_InitStubs(interp, "8.6", 0)`).

---

### Tcl_SetResult

**EN:** C API function to set interpreter result from extension.

**DE:** C-API-Funktion zum Setzen des Interpreter-Ergebnisses aus Extension.

---

### Trace Variable

**EN:** Monitor variable access/modification with callback (e.g., `trace add variable x write callback`).

**DE:** Variablen-Zugriff/-Änderung mit Callback überwachen (z.B. `trace add variable x write callback`).

---

### USE_TCL_STUBS

**EN:** Preprocessor define enabling stubs mechanism in Tcl extension.

**DE:** Präprozessor-Define zum Aktivieren des Stubs-Mechanismus in Tcl-Extension.

---

### bgerror

**EN:** Handler procedure called for background errors (e.g., after callbacks, fileevent handlers).

**DE:** Handler-Prozedur, die für Hintergrund-Fehler aufgerufen wird (z.B. after-Callbacks, fileevent-Handler).

---

### interp create

**EN:** Create new slave interpreter for sandboxing or isolation.

**DE:** Neuen Slave-Interpreter für Sandboxing oder Isolation erstellen.

---

### interp delete

**EN:** Delete interpreter and free its resources.

**DE:** Interpreter löschen und seine Ressourcen freigeben.

---

### interp eval

**EN:** Evaluate script in different interpreter.

**DE:** Skript in anderem Interpreter auswerten.

---

### interp share / interp transfer

**EN:** Share or transfer channel between interpreters.

**DE:** Kanal zwischen Interpretern teilen oder übertragen.

---

### interp slaves

**EN:** Return list of slave interpreters.

**DE:** Liste der Slave-Interpreter zurückgeben.

---

### rename

**EN:** Rename or hide command (e.g., `rename puts ""`  hides puts command).

**DE:** Befehl umbenennen oder verstecken (z.B. `rename puts ""` versteckt puts-Befehl).

---

### safe::interpCreate

**EN:** Create safe (restricted) interpreter.

**DE:** Sicheren (eingeschränkten) Interpreter erstellen.

---

### safe::interpInit

**EN:** Initialize safe interpreter with standard safe commands.

**DE:** Sicheren Interpreter mit Standard-Safe-Befehlen initialisieren.

---

### trace add command

**EN:** Add trace callback on command operations (rename, delete).

**DE:** Trace-Callback auf Befehls-Operationen hinzufügen (rename, delete).

---

### trace add execution

**EN:** Add trace callback executed before/after command execution.

**DE:** Trace-Callback hinzufügen, der vor/nach Befehlsausführung ausgeführt wird.

---

### trace add variable

**EN:** Add trace callback on variable operations (read, write, unset).

**DE:** Trace-Callback auf Variablen-Operationen hinzufügen (read, write, unset).

---

### trace remove variable

**EN:** Remove trace callback from variable.

**DE:** Trace-Callback von Variable entfernen.

---


## Widget-Subbefehle / Widget Subcommands

### configure (widget)

**EN:** Widget subcommand to set or query options. Syntax: .widget configure ?-option value? ... or .widget configure -option (query single). With no arguments: returns full option list. With -option: returns spec list {name dbName dbClass default current}. Used for dynamic style/state changes after widget creation.

**DE:** Widget-Subkommando zum Setzen oder Abfragen von Optionen. Syntax: .widget configure ?-option value? ... oder .widget configure -option (Einzel-Abfrage). Ohne Argumente: liefert komplette Optionsliste. Mit -option: liefert Spec-Liste {name dbName dbClass default current}. Verwendet fuer dynamische Style/State-Aenderungen nach Widget-Erzeugung.

---

### insert (widget)

**EN:** Widget subcommand to insert content. Behavior is widget-specific. Text widget: .t insert index "string" ?tagList?. Listbox: .lb insert index ?element...?. Entry: .e insert index "string". Spinbox: same as Entry. Treeview: .tv insert parent index -text ... -values .... Index syntax depends on widget (see Index-Spezifikationen).

**DE:** Widget-Subkommando zum Einfuegen von Inhalt. Verhalten ist Widget-spezifisch. Text-Widget: .t insert index "string" ?tagList?. Listbox: .lb insert index ?element...?. Entry: .e insert index "string". Spinbox: wie Entry. Treeview: .tv insert parent index -text ... -values .... Index-Syntax haengt vom Widget ab (siehe Index-Spezifikationen).

---


## Widget-Zustände / Widget States

### Disabled

**EN:** Widget state where interaction is prevented; typically appears grayed out.

**DE:** Widget-Zustand, in dem Interaktion verhindert wird; erscheint typischerweise ausgegraut.

---

### Hidden

**EN:** Widget state where the widget is not visible but still exists.

**DE:** Widget-Zustand, in dem das Widget nicht sichtbar ist, aber noch existiert.

---

### Normal

**EN:** Default widget state; fully functional and interactive.

**DE:** Standard-Widget-Zustand; voll funktionsfähig und interaktiv.

---

### Readonly

**EN:** Widget state allowing viewing but not editing (e.g., for entry widgets).

**DE:** Widget-Zustand, der Ansehen aber nicht Bearbeiten erlaubt (z.B. für Entry-Widgets).

---

### Selected

**EN:** State indicating an item or text is currently selected.

**DE:** Zustand, der anzeigt, dass ein Element oder Text aktuell ausgewählt ist.

---

### State

**EN:** The current condition of a widget (normal, active, disabled, etc.).

**DE:** Der aktuelle Zustand eines Widgets (normal, active, disabled, etc.).

---


## Window Manager Befehle / Window Manager Commands

### WM_DELETE_WINDOW

**EN:** Window manager protocol triggered when user clicks window close button.

**DE:** Window-Manager-Protokoll, ausgelöst wenn Benutzer Fenster-Schließen-Button klickt.

---

### wm

**EN:** Window manager command — controls toplevel window properties. Common subcommands: wm title .w "..."; wm geometry .w 800x600+100+50; wm minsize .w W H; wm maxsize .w W H; wm iconify .w; wm deiconify .w; wm withdraw .w; wm protocol .w WM_DELETE_WINDOW {...}; wm transient .w .parent; wm attributes .w -fullscreen 1; wm state .w. Only meaningful for toplevel windows (. or .top).

**DE:** Window-Manager-Kommando — kontrolliert Toplevel-Fenster-Eigenschaften. Wichtige Subkommandos: wm title .w "..."; wm geometry .w 800x600+100+50; wm minsize .w W H; wm maxsize .w W H; wm iconify .w; wm deiconify .w; wm withdraw .w; wm protocol .w WM_DELETE_WINDOW {...}; wm transient .w .parent; wm attributes .w -fullscreen 1; wm state .w. Nur sinnvoll fuer Toplevel-Fenster (. oder .top).

---

### wm aspect

**EN:** Set min/max aspect ratio constraints for window resizing.

**DE:** Min/Max-Seitenverhältnis-Beschränkungen für Fenster-Größenänderung setzen.

---

### wm attributes

**EN:** Set platform-specific window attributes (-alpha, -fullscreen, -topmost, -toolwindow, etc.).

**DE:** Plattformspezifische Fenster-Attribute setzen (-alpha, -fullscreen, -topmost, -toolwindow, etc.).

---

### wm client

**EN:** Set WM_CLIENT_MACHINE property for window.

**DE:** WM_CLIENT_MACHINE-Eigenschaft für Fenster setzen.

---

### wm colormapwindows

**EN:** Specify list of windows with separate colormaps.

**DE:** Liste von Fenstern mit separaten Colormaps angeben.

---

### wm command

**EN:** Set WM_COMMAND property containing command to recreate window.

**DE:** WM_COMMAND-Eigenschaft setzen, die Befehl zum Neuerstellen des Fensters enthält.

---

### wm focusmodel

**EN:** Set focus model: active (click to focus) or passive (pointer focus).

**DE:** Fokus-Modell setzen: active (Klick für Fokus) oder passive (Zeiger-Fokus).

---

### wm frame

**EN:** Return platform window identifier for window's decorative frame.

**DE:** Plattform-Fenster-Identifikator für dekorativen Fensterrahmen zurückgeben.

---

### wm grid

**EN:** Set grid-based geometry management for window (for text editors).

**DE:** Gitterbasiertes Geometrie-Management für Fenster setzen (für Texteditoren).

---

### wm group

**EN:** Set window group leader for related windows.

**DE:** Fenstergruppen-Leader für verwandte Fenster setzen.

---

### wm maxsize / wm minsize

**EN:** Set maximum/minimum window size in pixels.

**DE:** Maximale/minimale Fenstergröße in Pixeln setzen.

---

### wm overrideredirect

**EN:** Bypass window manager decorations; create borderless window (e.g., `wm overrideredirect .win 1`).

**DE:** Window-Manager-Dekorationen umgehen; rahmenloses Fenster erstellen (z.B. `wm overrideredirect .win 1`).

---

### wm positionfrom

**EN:** Specify source of window position: user or program.

**DE:** Quelle der Fensterposition angeben: user oder program.

---

### wm protocol

**EN:** Set handler for window manager protocol events (e.g., `wm protocol . WM_DELETE_WINDOW {exit}`).

**DE:** Handler für Window-Manager-Protokoll-Ereignisse setzen (z.B. `wm protocol . WM_DELETE_WINDOW {exit}`).

---

### wm sizefrom

**EN:** Specify source of window size: user or program.

**DE:** Quelle der Fenstergröße angeben: user oder program.

---

### wm stackorder

**EN:** Query or modify window stacking order (which windows are on top).

**DE:** Fenster-Stapelreihenfolge abfragen oder ändern (welche Fenster oben sind).

---

### wm state

**EN:** Query or set window state: normal, iconic, withdrawn, zoomed (maximized).

**DE:** Fensterzustand abfragen oder setzen: normal, iconic, withdrawn, zoomed (maximiert).

---


## Windows Code Pages / Windows Code Pages

### ANSI Code Page

**EN:** Windows GUI code page; used by Windows applications (not console); cp1252 is common ANSI code page; different from OEM/DOS code pages; affects file encoding, GUI text.

**DE:** Windows-GUI-Code-Page; verwendet von Windows-Anwendungen (nicht Konsole); cp1252 ist übliche ANSI-Code-Page; anders als OEM/DOS-Code-Pages; beeinflusst Datei-Kodierung, GUI-Text.

---

### Code Page

**EN:** Character encoding table mapping byte values to characters; Windows uses code pages for different languages/regions; numbered (e.g., 1252, 850, 437); in Tcl: specify with `fconfigure -encoding cpXXXX`.

**DE:** Zeichenkodierungs-Tabelle, die Byte-Werte auf Zeichen abbildet; Windows verwendet Code Pages für verschiedene Sprachen/Regionen; nummeriert (z.B. 1252, 850, 437); in Tcl: spezifizieren mit `fconfigure -encoding cpXXXX`.

---

### Console Encoding

**EN:** Character encoding used by console/terminal; Windows: typically cp850 or cp437 (OEM); Unix/Linux: typically UTF-8; affects `puts` output and `gets` input; configure with `fconfigure stdout -encoding cpXXX`.

**DE:** Zeichenkodierung verwendet von Konsole/Terminal; Windows: typischerweise cp850 oder cp437 (OEM); Unix/Linux: typischerweise UTF-8; beeinflusst `puts`-Ausgabe und `gets`-Eingabe; konfigurieren mit `fconfigure stdout -encoding cpXXX`.

---

### Encoding Mismatch

**EN:** Error when reading/writing text with wrong encoding; causes garbled characters; common between UTF-8 and code pages; fix: set correct encoding with `fconfigure -encoding`; test with known text.

**DE:** Fehler beim Lesen/Schreiben von Text mit falscher Kodierung; verursacht verstümmelte Zeichen; häufig zwischen UTF-8 und Code Pages; Lösung: korrekte Kodierung setzen mit `fconfigure -encoding`; testen mit bekanntem Text.

---

### OEM Code Page

**EN:** Original Equipment Manufacturer code page; used by DOS and Windows console; different from Windows ANSI code pages; cp437, cp850 are OEM code pages; affects console output encoding.

**DE:** Original Equipment Manufacturer Code Page; verwendet von DOS und Windows-Konsole; anders als Windows-ANSI-Code-Pages; cp437, cp850 sind OEM-Code-Pages; beeinflusst Konsolen-Ausgabe-Kodierung.

---

### cp1252 (Windows-1252)

**EN:** Windows Western European code page; superset of ISO 8859-1 (Latin-1); includes additional characters in 0x80-0x9F range (€, smart quotes, etc.); default for Western Windows systems; Tcl: `fconfigure $chan -encoding cp1252`.

**DE:** Windows westeuropäische Code Page; Übermenge von ISO 8859-1 (Latin-1); enthält zusätzliche Zeichen im 0x80-0x9F-Bereich (€, typografische Anführungszeichen, etc.); Standard für westliche Windows-Systeme; Tcl: `fconfigure $chan -encoding cp1252`.

---

### cp437 (DOS US)

**EN:** Original IBM PC code page; DOS US English; includes box-drawing, card suits, Greek letters in upper half; historical importance; still used in some DOS/console applications; Tcl: `fconfigure $chan -encoding cp437`.

**DE:** Ursprüngliche IBM-PC-Code-Page; DOS US-Englisch; enthält Box-Drawing, Kartenfarben, griechische Buchstaben in oberer Hälfte; historische Bedeutung; noch in einigen DOS/Konsolen-Anwendungen verwendet; Tcl: `fconfigure $chan -encoding cp437`.

---

### cp850 (DOS Latin-1)

**EN:** DOS/OEM Western European code page; used in Windows command prompt; includes box-drawing characters; different from Windows-1252; common in legacy systems; Tcl: `fconfigure $chan -encoding cp850`.

**DE:** DOS/OEM westeuropäische Code Page; verwendet in Windows-Eingabeaufforderung; enthält Box-Drawing-Zeichen; anders als Windows-1252; üblich in Legacy-Systemen; Tcl: `fconfigure $chan -encoding cp850`.

---

### system encoding

**EN:** Command returning platform's default encoding; `encoding system` returns system encoding (e.g., cp1252 on Windows, utf-8 on modern Unix); used as default for external interfaces; can be changed but not recommended.

**DE:** Befehl, der Standard-Kodierung der Plattform zurückgibt; `encoding system` gibt System-Kodierung zurück (z.B. cp1252 auf Windows, utf-8 auf modernem Unix); verwendet als Standard für externe Schnittstellen; kann geändert werden aber nicht empfohlen.

---


## Wrapper und Prozess-Kommunikation / Wrappers and Process Communication

### Bidirectional Pipe

**EN:** Pipe allowing both reading and writing; created with `open "|command" r+`; enables interactive communication with external process; use `fconfigure -buffering line` for line-based interaction; careful with deadlocks.

**DE:** Pipe, die sowohl Lesen als auch Schreiben erlaubt; erstellt mit `open "|command" r+`; ermöglicht interaktive Kommunikation mit externem Prozess; verwenden Sie `fconfigure -buffering line` für zeilenbasierte Interaktion; Vorsicht vor Deadlocks.

---

### IPC (Inter-Process Communication)

**EN:** General term for process communication; Tcl mechanisms: pipes, sockets, shared memory (via extensions), files, message queues (via extensions); choose based on performance, synchronization needs.

**DE:** Allgemeiner Begriff für Prozess-Kommunikation; Tcl-Mechanismen: Pipes, Sockets, Shared Memory (über Extensions), Dateien, Message Queues (über Extensions); wählen basierend auf Performance, Synchronisations-Bedürfnissen.

---

### Process Communication

**EN:** Data exchange between processes; methods in Tcl: pipes (`open "|..."`), sockets, files, environment variables; asynchronous with fileevent; synchronous with exec; choose method based on requirements.

**DE:** Datenaustausch zwischen Prozessen; Methoden in Tcl: Pipes (`open "|..."`), Sockets, Dateien, Umgebungsvariablen; asynchron mit fileevent; synchron mit exec; Methode wählen basierend auf Anforderungen.

---

### Wrapper

**EN:** Code layer providing interface to another system; wrapper script/procedure simplifies complex operations; common patterns: command wrappers (simplified `exec`), widget wrappers (custom widgets), API wrappers (REST, database); encapsulates complexity.

**DE:** Code-Schicht, die Schnittstelle zu anderem System bietet; Wrapper-Skript/-Prozedur vereinfacht komplexe Operationen; häufige Muster: Befehls-Wrapper (vereinfachtes `exec`), Widget-Wrapper (eigene Widgets), API-Wrapper (REST, Datenbank); kapselt Komplexität.

---

### Wrapper Script

**EN:** Script wrapping application for easier execution; sets environment, processes arguments, launches program; common for deployment; example: shell script calling tclsh with script and arguments.

**DE:** Skript, das Anwendung für einfachere Ausführung umhüllt; setzt Umgebung, verarbeitet Argumente, startet Programm; üblich für Deployment; Beispiel: Shell-Skript, das tclsh mit Skript und Argumenten aufruft.

---

### exec (Extended)

**EN:** Execute external command; syntax: `exec ?switches? command ?arg ...?`; switches: `-keepnewline`, `-ignorestderr`, `--`; returns command output; use `&` for background; redirect with `>`, `<`, `|`, `2>`; cross-platform but behavior varies; ⚠️ blocks until command completes.

**DE:** Externen Befehl ausführen; Syntax: `exec ?switches? command ?arg ...?`; Switches: `-keepnewline`, `-ignorestderr`, `--`; gibt Befehls-Ausgabe zurück; verwenden Sie `&` für Hintergrund; umleiten mit `>`, `<`, `|`, `2>`; plattformübergreifend aber Verhalten variiert; ⚠️ blockiert bis Befehl abgeschlossen.

---

### exec Pipeline

**EN:** Chain of commands with output of one feeding into next; syntax: `exec cmd1 | cmd2 | cmd3`; Unix-style pipeline in Tcl; works cross-platform; each command runs concurrently; example: `exec cat file.txt | grep pattern | wc -l`.

**DE:** Kette von Befehlen mit Ausgabe von einem in nächsten; Syntax: `exec cmd1 | cmd2 | cmd3`; Unix-Stil-Pipeline in Tcl; funktioniert plattformübergreifend; jeder Befehl läuft gleichzeitig; Beispiel: `exec cat file.txt | grep pattern | wc -l`.

---

### open (Extended)

**EN:** Open file or pipe; syntax: `open name ?access? ?permissions?`; access modes: `r`, `w`, `a`, `r+`, `w+`, `a+`; for pipes: `open "|command ?args?"` opens bidirectional pipe; returns channel handle; must close with `close`.

**DE:** Datei oder Pipe öffnen; Syntax: `open name ?access? ?permissions?`; Zugriffsmodi: `r`, `w`, `a`, `r+`, `w+`, `a+`; für Pipes: `open "|command ?args?"` öffnet bidirektionale Pipe; gibt Kanal-Handle zurück; muss mit `close` geschlossen werden.

---


## Zeichenkodierung und Standards / Character Encoding and Standards

### ASCII (American Standard Code for Information Interchange)

**EN:** 7-bit character encoding (0-127); includes English letters, digits, punctuation, control characters; foundation for many encodings; Tcl command: `scan "A" %c` returns 65.

**DE:** 7-Bit-Zeichenkodierung (0-127); umfasst englische Buchstaben, Ziffern, Interpunktion, Steuerzeichen; Grundlage vieler Kodierungen; Tcl-Befehl: `scan "A" %c` gibt 65 zurück.

---

### BOM (Byte Order Mark)

**EN:** Special Unicode character (U+FEFF) at file start indicating byte order and encoding; UTF-8 BOM: EF BB BF; Tcl can handle BOM in file reading.

**DE:** Spezielles Unicode-Zeichen (U+FEFF) am Dateianfang, das Byte-Reihenfolge und Kodierung anzeigt; UTF-8-BOM: EF BB BF; Tcl kann BOM beim Datei-Lesen handhaben.

---

### Bidi (Bidirectional Text)

**EN:** Algorithm for laying out text that mixes left-to-right (Latin, Cyrillic, Greek) and right-to-left (Arabic, Hebrew) scripts in one paragraph. Defined by the Unicode Bidirectional Algorithm (UAX #9). Produces a sequence of "runs" — contiguous segments of one direction — from a logical (storage-order) character stream. Tk 9 gained Bidi support via the `--enable-bidi` build option, which links SheenBidi + HarfBuzz into the Unix Tk binary (`tkUnixBidiFont.c`).

**DE:** Algorithmus fuer das Layouten von Text, der Links-nach-Rechts-Schriften (Lateinisch, Kyrillisch, Griechisch) und Rechts-nach-Links-Schriften (Arabisch, Hebraeisch) in einem Absatz mischt. Definiert durch den Unicode Bidirectional Algorithm (UAX #9). Erzeugt aus einem logischen (Speicherreihenfolge-) Zeichenstrom eine Folge von "Runs" — zusammenhaengende Segmente einer Richtung. Tk 9 erhielt Bidi-Unterstuetzung ueber die `--enable-bidi`-Build-Option, die SheenBidi + HarfBuzz in die Unix-Tk-Binary linkt (`tkUnixBidiFont.c`).

---

### Character Set

**EN:** Collection of characters available in encoding; ASCII has 128 characters, Unicode has 100,000+; defines which characters can be represented.

**DE:** Sammlung von Zeichen verfügbar in Kodierung; ASCII hat 128 Zeichen, Unicode hat 100.000+; definiert welche Zeichen dargestellt werden können.

---

### Code Point

**EN:** Numerical value assigned to character in Unicode (e.g., U+0041 = 'A'); Tcl: `scan "A" %c` returns decimal code point; `format %c 65` returns 'A'.

**DE:** Numerischer Wert zugewiesen zu Zeichen in Unicode (z.B. U+0041 = 'A'); Tcl: `scan "A" %c` gibt dezimalen Code-Point zurück; `format %c 65` gibt 'A' zurück.

---

### Grapheme

**EN:** A "user-perceived character" — what a reader perceives as a single unit even if Unicode encodes it as multiple codepoints. Examples: `é` written as `e` + combining acute (two codepoints, one grapheme); a flag emoji (two regional-indicator codepoints, one grapheme); a family emoji with skin-tone modifiers (4-6 codepoints, one grapheme). The right unit for cursor movement, selection, line breaking, character counting — but NOT for storage or sorting. Defined by UAX #29 (Unicode Text Segmentation).

**DE:** Ein "Benutzer-wahrgenommenes Zeichen" — was ein Leser als eine Einheit wahrnimmt, auch wenn Unicode es als mehrere Codepunkte kodiert. Beispiele: `é` als `e` + kombinierender Akut (zwei Codepunkte, ein Graphem); ein Flaggen-Emoji (zwei Regional-Indikator-Codepunkte, ein Graphem); ein Familien-Emoji mit Hautton-Modifizierern (4-6 Codepunkte, ein Graphem). Die richtige Einheit fuer Cursor-Bewegung, Auswahl, Zeilenumbruch, Zeichen-Zaehlung — aber NICHT fuer Speicherung oder Sortierung. Definiert durch UAX #29 (Unicode Text Segmentation).

---

### Multibyte Character

**EN:** Character requiring multiple bytes in encoding (e.g., UTF-8 uses 1-4 bytes); Tcl handles multibyte transparently in string operations; `string length` counts characters, not bytes.

**DE:** Zeichen, das mehrere Bytes in Kodierung benötigt (z.B. UTF-8 verwendet 1-4 Bytes); Tcl behandelt Multibyte transparent in String-Operationen; `string length` zählt Zeichen, nicht Bytes.

---

### RTL / LTR

**EN:** Right-to-left and Left-to-right — the two writing directions in human scripts. LTR: Latin, Cyrillic, Greek, CJK (top-to-bottom traditionally but left-to-right in modern usage). RTL: Arabic, Hebrew, Syriac, N'Ko. The Unicode Bidirectional Algorithm produces RTL/LTR run sequences from logical-order text. In code, often abbreviated as constants (`SBLevelDefaultLTR`, `HB_DIRECTION_RTL`, etc.).

**DE:** Right-to-left und Left-to-right — die zwei Schreibrichtungen in menschlichen Schriften. LTR: Lateinisch, Kyrillisch, Griechisch, CJK (traditionell oben-nach-unten, aber in moderner Verwendung links-nach-rechts). RTL: Arabisch, Hebraeisch, Syrisch, N'Ko. Der Unicode Bidirectional Algorithm produziert RTL/LTR-Run-Sequenzen aus Text in logischer Reihenfolge. Im Code oft als Konstanten abgekuerzt (`SBLevelDefaultLTR`, `HB_DIRECTION_RTL` usw.).

---

### Shaping (Text-Shaping)

**EN:** The process of converting a sequence of Unicode codepoints to a sequence of positioned glyphs from a specific font. Handles ligatures (`fi` → single glyph), contextual forms (Arabic letters change shape by position in word), combining marks (diacritics positioned over the base glyph), kerning. Done by a shaper library — in Tk's case HarfBuzz. Distinct from Bidi (which determines run order); shaping happens within each run after Bidi.

**DE:** Der Vorgang, eine Sequenz von Unicode-Codepunkten in eine Sequenz positionierter Glyphen aus einem bestimmten Font zu konvertieren. Behandelt Ligaturen (`fi` → ein Glyph), kontextuelle Formen (arabische Buchstaben aendern sich je nach Wortposition), kombinierende Zeichen (Diakritika ueber dem Basis-Glyph platziert), Kerning. Erledigt durch eine Shaper-Bibliothek — in Tks Fall HarfBuzz. Verschieden von Bidi (das die Run-Reihenfolge bestimmt); Shaping passiert innerhalb jedes Runs nach Bidi.

---

### UTF-16

**EN:** Variable-length Unicode encoding using 2 or 4 bytes; used internally by Windows, Java; available in Tcl via `-encoding unicode` (little-endian) or `-encoding unicodeBigEndian`.

**DE:** Variable-Längen-Unicode-Kodierung mit 2 oder 4 Bytes; intern verwendet von Windows, Java; verfügbar in Tcl über `-encoding unicode` (Little-Endian) oder `-encoding unicodeBigEndian`.

---

### UTF-8

**EN:** Variable-length Unicode encoding (1-4 bytes per character); backward compatible with ASCII; default encoding in modern Tcl/Tk; `fconfigure $chan -encoding utf-8`.

**DE:** Variable-Längen-Unicode-Kodierung (1-4 Bytes pro Zeichen); rückwärtskompatibel mit ASCII; Standard-Kodierung in modernem Tcl/Tk; `fconfigure $chan -encoding utf-8`.

---

### Unicode

**EN:** Universal character encoding standard supporting all world writing systems; assigns unique code point to each character; Tcl 8.1+ has full Unicode support internally; U+0000 to U+10FFFF range.

**DE:** Universeller Zeichenkodierungs-Standard, der alle Weltschriftsysteme unterstützt; weist jedem Zeichen eindeutigen Code-Punkt zu; Tcl 8.1+ hat volle interne Unicode-Unterstützung; U+0000 bis U+10FFFF Bereich.

---

### encoding convertfrom

**EN:** Convert a byte sequence in a given encoding to a Tcl Unicode string. Syntax: encoding convertfrom ?encoding? data. Without encoding: uses the system encoding. Common encodings: utf-8, iso8859-1, cp1252, gb2312. In Tcl 9, the default changed to utf-8; pre-9 used the system encoding.

**DE:** Konvertiert eine Bytesequenz in einer gegebenen Kodierung in einen Tcl-Unicode-String. Syntax: encoding convertfrom ?encoding? data. Ohne Kodierung: nutzt die System-Kodierung. Gebraeuchliche Kodierungen: utf-8, iso8859-1, cp1252, gb2312. In Tcl 9 ist die Default auf utf-8 geaendert; vor 9 die System-Kodierung.

---

### encoding convertto

**EN:** Convert a Tcl Unicode string to a byte sequence in a given encoding. Syntax: encoding convertto ?encoding? string. Inverse of encoding convertfrom. Used when writing to a channel that has a different encoding, or for binary protocols expecting specific byte sequences.

**DE:** Konvertiert einen Tcl-Unicode-String in eine Bytesequenz in einer gegebenen Kodierung. Syntax: encoding convertto ?encoding? string. Umkehrung von encoding convertfrom. Verwendet beim Schreiben in einen Kanal mit anderer Kodierung oder fuer Binaerprotokolle die bestimmte Bytesequenzen erwarten.

---

### encoding names

**EN:** List all available encoding names. Syntax: encoding names. Returns a list like {utf-8 utf-16 iso8859-1 ascii cp1252 ...}. Used to validate user-supplied encoding names or to discover what is supported in this Tcl build.

**DE:** Listet alle verfuegbaren Kodierungsnamen auf. Syntax: encoding names. Liefert eine Liste wie {utf-8 utf-16 iso8859-1 ascii cp1252 ...}. Zur Validierung benutzergegebener Kodierungsnamen oder zur Entdeckung was im aktuellen Tcl-Build unterstuetzt ist.

---

### encoding system

**EN:** Get or set the system encoding (the default for converting between filesystem/process boundaries and Tcl strings). Syntax: encoding system ?encoding?. Tcl 9 default: utf-8. Tcl 8.x default: platform-dependent (cp1252 on Windows, utf-8 on modern Linux). Changing it affects how the system reads filenames, environment variables, and standard channels.

**DE:** Liefert oder setzt die System-Kodierung (Default fuer Konvertierungen an Dateisystem-/Prozess-Grenzen und Tcl-Strings). Syntax: encoding system ?encoding?. Tcl-9-Default: utf-8. Tcl-8.x-Default: plattformabhaengig (cp1252 auf Windows, utf-8 auf modernem Linux). Aenderung beeinflusst wie das System Dateinamen, Umgebungsvariablen und Standard-Kanaele liest.

---


## Zusätzliche Tcl-Core-Befehle / Additional Tcl Core Commands

### auto_load

**EN:** Automatically load procedure definition from library when first called.

**DE:** Prozedur-Definition automatisch aus Bibliothek laden, wenn erstmals aufgerufen.

---

### auto_mkindex

**EN:** Generate tclIndex file for auto-loading procedures in directory.

**DE:** tclIndex-Datei für Auto-Loading von Prozeduren im Verzeichnis generieren.

---

### ensemble

**EN:** Command with subcommands (e.g., `string`, `dict`, `file`); created with `namespace ensemble create`.

**DE:** Befehl mit Unterbefehlen (z.B. `string`, `dict`, `file`); erstellt mit `namespace ensemble create`.

---

### fblocked

**EN:** Check if channel has buffered input waiting to be read; returns 1 if blocked, 0 otherwise.

**DE:** Prüfen, ob Kanal gepufferte Eingabe zum Lesen hat; gibt 1 zurück wenn blockiert, 0 sonst.

---

### fcopy

**EN:** Copy data from one channel to another efficiently (e.g., `fcopy $in $out -size 1024`).

**DE:** Daten effizient von einem Kanal zu anderem kopieren (z.B. `fcopy $in $out -size 1024`).

---

### history

**EN:** Interactive command history manipulation (add, change, clear, event, info, keep, nextid, redo).

**DE:** Interaktive Befehlshistorie-Manipulation (add, change, clear, event, info, keep, nextid, redo).

---

### history add

**EN:** Add command to history list (e.g., `history add "set x 5"`).

**DE:** Befehl zur Historie-Liste hinzufügen (z.B. `history add "set x 5"`).

---

### history clear

**EN:** Clear all entries from command history.

**DE:** Alle Einträge aus Befehlshistorie löschen.

---

### history event

**EN:** Retrieve command from history by event number or pattern.

**DE:** Befehl aus Historie nach Event-Nummer oder Muster abrufen.

---

### history redo

**EN:** Re-execute command from history (e.g., `history redo -2` executes 2nd-to-last command).

**DE:** Befehl aus Historie erneut ausführen (z.B. `history redo -2` führt vorletzten Befehl aus).

---

### namespace ensemble configure

**EN:** Query or modify ensemble command configuration (subcommands, namespace, unknown handler).

**DE:** Ensemble-Befehl-Konfiguration abfragen oder ändern (Unterbefehle, Namespace, Unknown-Handler).

---

### namespace ensemble create

**EN:** Create ensemble command with subcommands mapped to procedures (e.g., `namespace ensemble create -command myapi -map {...}`).

**DE:** Ensemble-Befehl mit Unterbefehlen erstellen, die auf Prozeduren abgebildet werden (z.B. `namespace ensemble create -command myapi -map {...}`).

---

### tclIndex

**EN:** Index file mapping procedure names to source files for auto-loading.

**DE:** Index-Datei, die Prozedurnamen auf Quell-Dateien für Auto-Loading abbildet.

---

### unknown

**EN:** Handler procedure called when command not found; can implement auto-loading or custom behavior.

**DE:** Handler-Prozedur, die aufgerufen wird, wenn Befehl nicht gefunden wird; kann Auto-Loading oder eigenes Verhalten implementieren.

---


## Zusätzliche wichtige Begriffe / Additional Important Terms

### append

**EN:** Append values to variable (e.g., `append result "text"`).

**DE:** Werte an Variable anhängen (z.B. `append result "text"`).

---

### apply

**EN:** Anonymous function execution; apply lambda to arguments (e.g., `apply {{x} {expr {$x * 2}}} 5`).

**DE:** Anonyme Funktionsausführung; Lambda auf Argumente anwenden (z.B. `apply {{x} {expr {$x * 2}}} 5`).

---

### chan

**EN:** Modern channel command replacing open/close/read (Tcl 8.6+; e.g., `chan create`).

**DE:** Moderner Kanal-Befehl, der open/close/read ersetzt (Tcl 8.6+; z.B. `chan create`).

---

### coroutine

**EN:** Cooperative multitasking; create coroutine that can yield control (Tcl 8.6+).

**DE:** Kooperatives Multitasking; Coroutine erstellen, die Kontrolle abgeben kann (Tcl 8.6+).

---

### eval

**EN:** Concatenate arguments and execute as Tcl script (e.g., `eval {set x 5}`).

**DE:** Argumente verketten und als Tcl-Skript ausführen (z.B. `eval {set x 5}`).

---

### expr

**EN:** Evaluate mathematical expression (e.g., `expr {2 + 2}`); uses braces to avoid double substitution.

**DE:** Mathematischen Ausdruck auswerten (z.B. `expr {2 + 2}`); verwendet geschweifte Klammern um doppelte Substitution zu vermeiden.

---

### incr

**EN:** Increment variable by value (default 1; e.g., `incr counter` or `incr x 5`).

**DE:** Variable um Wert erhöhen (Standard 1; z.B. `incr counter` oder `incr x 5`).

---

### lremove

**EN:** Remove elements from list by indices (Tcl 8.7+; e.g., `lremove $list 2 5`).

**DE:** Elemente aus Liste nach Indizes entfernen (Tcl 8.7+; z.B. `lremove $list 2 5`).

---

### string is dict

**EN:** Test if string is valid dictionary (even number of elements).

**DE:** Testen, ob String gültiges Dictionary ist (gerade Anzahl von Elementen).

---

### string is list

**EN:** Test if string is valid list (can be parsed without error).

**DE:** Testen, ob String gültige Liste ist (kann ohne Fehler geparst werden).

---

### subst

**EN:** Perform substitutions on string without executing as command (e.g., `subst "Value: $x"`).

**DE:** Substitutionen auf String durchführen ohne als Befehl auszuführen (z.B. `subst "Value: $x"`).

---

### tailcall

**EN:** Tail-call optimization; replace current procedure with call to another (saves stack space).

**DE:** Tail-Call-Optimierung; aktuelle Prozedur durch Aufruf einer anderen ersetzen (spart Stack-Platz).

---

### throw

**EN:** Throw exception with error code (Tcl 8.6+; e.g., `throw {CUSTOM ERROR} "message"`).

**DE:** Ausnahme mit Fehler-Code werfen (Tcl 8.6+; z.B. `throw {CUSTOM ERROR} "message"`).

---

### unset

**EN:** Delete variable(s) from memory (e.g., `unset myvar`).

**DE:** Variable(n) aus Speicher löschen (z.B. `unset myvar`).

---

### yield

**EN:** Suspend coroutine execution and return value to caller.

**DE:** Coroutine-Ausführung unterbrechen und Wert an Aufrufer zurückgeben.

---

### yieldto

**EN:** Transfer control to another coroutine or command.

**DE:** Kontrolle an andere Coroutine oder Befehl übertragen.

---

### zlib

**EN:** Compression/decompression command (Tcl 8.6+; e.g., `zlib compress $data`).

**DE:** Komprimierungs-/Dekomprimierungs-Befehl (Tcl 8.6+; z.B. `zlib compress $data`).

---


## Zuweisungsoperatoren / Assignment Operators

### %= (Modulo and Assign)

**EN:** Assigns remainder of division to variable.

**DE:** Weist Rest der Division der Variable zu.

---

### *= (Multiply and Assign)

**EN:** Multiplies variable by right operand.

**DE:** Multipliziert Variable mit rechtem Operanden.

---

### += (Add and Assign)

**EN:** Adds right operand to variable (e.g., `set x [expr {$x + 5}]` or in expr context).

**DE:** Addiert rechten Operanden zur Variable (z.B. `set x [expr {$x + 5}]` oder in expr-Kontext).

---

### -= (Subtract and Assign)

**EN:** Subtracts right operand from variable.

**DE:** Subtrahiert rechten Operanden von Variable.

---

### /= (Divide and Assign)

**EN:** Divides variable by right operand.

**DE:** Dividiert Variable durch rechten Operanden.

---

### = (Assignment)

**EN:** Assignment operator; assigns value to variable (e.g., `set x 5`).

**DE:** Zuweisungs-Operator; weist Variable einen Wert zu (z.B. `set x 5`).

---


## pkg-config und Dependencies / pkg-config and Dependencies

### .pc file

**EN:** pkg-config metadata file describing library (version, cflags, libs, dependencies).

**DE:** pkg-config-Metadaten-Datei, die Bibliothek beschreibt (Version, cflags, libs, Abhängigkeiten).

---

### PKG_CONFIG_PATH

**EN:** Environment variable specifying directories to search for .pc files.

**DE:** Umgebungsvariable zum Spezifizieren von Verzeichnissen für .pc-Datei-Suche.

---

### pkg-config

**EN:** Tool providing compiler and linker flags for installed libraries.

**DE:** Tool zum Bereitstellen von Compiler- und Linker-Flags für installierte Bibliotheken.

---

### pkg-config --cflags

**EN:** Query compiler flags needed for library (e.g., `pkg-config --cflags tcl`).

**DE:** Compiler-Flags abfragen, die für Bibliothek benötigt werden (z.B. `pkg-config --cflags tcl`).

---

### pkg-config --libs

**EN:** Query linker flags needed for library (e.g., `pkg-config --libs tcl`).

**DE:** Linker-Flags abfragen, die für Bibliothek benötigt werden (z.B. `pkg-config --libs tcl`).

---


## struct:: Module - Erweiterte Begriffe / struct:: Modules - Extended Terms

### AST (Abstract Syntax Tree)

**EN:** Tree representation of source code structure; commonly implemented using `struct::tree` for parsing and code analysis.

**DE:** Baum-Darstellung von Quellcode-Struktur; häufig implementiert mit `struct::tree` für Parsing und Code-Analyse.

---

### Branch

**EN:** Path from root to leaf in tree; or node with children (non-leaf node).

**DE:** Pfad von Wurzel zu Blatt im Baum; oder Knoten mit Kindern (Nicht-Blatt-Knoten).

---

### Edge

**EN:** Connection between two nodes in graph data structure; can be directed or undirected, weighted or unweighted.

**DE:** Verbindung zwischen zwei Knoten in Graph-Datenstruktur; kann gerichtet oder ungerichtet, gewichtet oder ungewichtet sein.

---

### FIFO (First-In-First-Out)

**EN:** Queue ordering principle; first element added is first element removed; implemented by `struct::queue` package.

**DE:** Queue-Ordnungsprinzip; erstes hinzugefügtes Element ist erstes entferntes Element; implementiert durch `struct::queue`-Paket.

---

### Graph Algorithm

**EN:** Computational procedure on graph data structure; examples: shortest path (Dijkstra), traversal (BFS, DFS), cycle detection; available in `struct::graph`.

**DE:** Rechnerisches Verfahren auf Graph-Datenstruktur; Beispiele: kürzester Pfad (Dijkstra), Durchlauf (BFS, DFS), Zyklen-Erkennung; verfügbar in `struct::graph`.

---

### LIFO (Last-In-First-Out)

**EN:** Stack ordering principle; last element added is first element removed; implemented by `struct::stack` package.

**DE:** Stack-Ordnungsprinzip; letztes hinzugefügtes Element ist erstes entferntes Element; implementiert durch `struct::stack`-Paket.

---

### Leaf

**EN:** Tree node with no children; terminal node at end of tree branch.

**DE:** Baum-Knoten ohne Kinder; terminaler Knoten am Ende eines Baum-Zweigs.

---

### Node

**EN:** Element in tree or graph data structure; has value and connections to other nodes (parent, children, siblings).

**DE:** Element in Baum- oder Graph-Datenstruktur; hat Wert und Verbindungen zu anderen Knoten (Eltern, Kinder, Geschwister).

---

### Root

**EN:** Top node of tree structure; has no parent; starting point for tree traversal.

**DE:** Oberster Knoten der Baum-Struktur; hat kein Eltern; Startpunkt für Baum-Durchlauf.

---

### Tree (Data Structure)

**EN:** Hierarchical data structure with parent-child relationships; nodes form tree with root at top; available via `struct::tree` package.

**DE:** Hierarchische Datenstruktur mit Eltern-Kind-Beziehungen; Knoten bilden Baum mit Wurzel oben; verfügbar über `struct::tree`-Paket.

---

### Vertex

**EN:** Synonym for node in graph theory; point where edges meet.

**DE:** Synonym für Knoten in Graphentheorie; Punkt wo Kanten sich treffen.

---


---

## License

This glossary content is licensed under
[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
unless noted otherwise.

(c) 2025-2026 Gregor Ebbing

Tcl code snippets shown as examples are released to the
public domain (CC0 1.0) and may be used freely.

## Acknowledgments

Some definitions in this glossary draw on terminology and
wording from the official Tcl/Tk documentation, distributed
under the Tcl License (a BSD-style permissive license).
The following copyright notices apply to that material:

- Copyright (c) Regents of the University of California
- Copyright (c) Sun Microsystems, Inc.
- Copyright (c) Scriptics Corporation
- Copyright (c) ActiveState Corporation
- Copyright (c) and other parties

Full Tcl License text:
<https://www.tcl-lang.org/software/tcltk/license.html>

