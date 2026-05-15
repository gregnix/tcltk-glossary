## Zeichenkodierung und Standards / Character Encoding and Standards

**Codepoint**
- EN: A numeric value in the Unicode codespace (U+0000 to U+10FFFF) assigned to a character or special meaning. In Tcl a codepoint is obtained via `scan $char %c` and converted back to a character via `format %c $cp`.
- DE: Ein numerischer Wert im Unicode-Codespace (U+0000 bis U+10FFFF), der einem Zeichen oder einer besonderen Bedeutung zugeordnet ist. In Tcl wird ein Codepoint mit `scan $char %c` ermittelt und mit `format %c $cp` zurück in ein Zeichen umgewandelt.
- EN-EX:
```tcl
scan A %c cp        ;# cp = 65
format %c 65        ;# "A"
scan ä %c cp        ;# cp = 228
format %c 0x1F600   ;# grinning face emoji (Tcl 9)
```
- RELATED: BMP, Supplementary Plane, format %c, scan %c
- SEE: Tcl_UniChar(3), encoding(n)

**BMP (Basic Multilingual Plane)**
- EN: The first plane of Unicode (U+0000..U+FFFF) — 65 536 codepoints covering most living scripts. In Tcl the 4-digit `\uHHHH` escape addresses only the BMP; codepoints beyond require `\UHHHHHHHH` or surrogate pairs.
- DE: Die erste Ebene von Unicode (U+0000..U+FFFF) — 65 536 Codepoints, die die meisten lebenden Schriften abdecken. In Tcl spricht die 4-stellige `\uHHHH`-Escape-Sequenz nur die BMP an; höhere Codepoints brauchen `\UHHHHHHHH` oder Surrogate Pairs.
- EN-EX:
```tcl
set bmpChar \u00E4     ;# ä (U+00E4, in BMP)
set bmpChar \u20AC     ;# € (U+20AC, in BMP)
set nonBmp  \U1F600    ;# emoji (U+1F600, NOT in BMP)
```
- RELATED: Codepoint, Supplementary Plane, Surrogate Pair
- SEE: Tcl_UniChar(3)

**Supplementary Plane**
- EN: A Unicode plane outside the BMP — codepoints U+10000 to U+10FFFF, covering emoji, CJK extensions, ancient scripts and more. In Tcl 9 these are addressed directly via `\UHHHHHHHH`; in Tcl 8.6 only via surrogate pairs or the `\U` escape.
- DE: Eine Unicode-Ebene jenseits der BMP — Codepoints U+10000 bis U+10FFFF, mit Emojis, CJK-Erweiterungen, historischen Schriften usw. In Tcl 9 direkt via `\UHHHHHHHH` adressierbar; in Tcl 8.6 nur über Surrogate Pairs oder die `\U`-Escape.
- EN-EX:
```tcl
set smiley \U1F600   ;# grinning face emoji
set music  \U1D11E   ;# musical symbol G clef
set flag   \U1F1FA\U1F1F8  ;# US regional indicator pair
```
- RELATED: BMP, Codepoint, Surrogate Pair, Tcl/Tk 9
- SEE: Tcl_UniChar(3)

**Surrogate Pair**
- EN: A pair of UTF-16 code units (a high surrogate U+D800..U+DBFF followed by a low surrogate U+DC00..U+DFFF) that together encode one supplementary-plane codepoint. Needed in Tcl 8.6 to address codepoints above U+FFFF when `\U` is not used.
- DE: Ein Paar von UTF-16-Code-Units (high surrogate U+D800..U+DBFF gefolgt von low surrogate U+DC00..U+DFFF), das gemeinsam einen Codepoint aus der Supplementary Plane kodiert. In Tcl 8.6 nötig, um Codepoints über U+FFFF ohne `\U` zu adressieren.
- EN-EX:
```tcl
# Tcl 8.6 workaround for U+1F600:
set emoji "\uD83D\uDE00"
# Tcl 9 equivalent:
set emoji \U1F600
```
- RELATED: BMP, Supplementary Plane, UTF-16
- SEE: Tcl_UniChar(3), encoding(n)

**UTF-16LE**
- EN: UTF-16 in little-endian byte order — each 16-bit code unit is stored as low byte first, then high byte. Available as an encoding name in Tcl's `encoding convertfrom/convertto`. Used by Windows file APIs.
- DE: UTF-16 mit Little-Endian-Byte-Reihenfolge — jede 16-Bit-Code-Unit wird mit niederwertigem Byte zuerst, dann höherwertigem Byte gespeichert. In Tcl als Encoding-Name in `encoding convertfrom/convertto` verfügbar. Wird von Windows-Datei-APIs genutzt.
- EN-EX:
```tcl
set bytes [encoding convertto utf-16le "Hallo"]
binary scan $bytes H* hex
# hex = "480061006c006c006f00"
set back [encoding convertfrom utf-16le $bytes]
```
- RELATED: UTF-16, UTF-16BE, encoding convertfrom, encoding convertto
- SEE: encoding(n)

**UTF-16BE**
- EN: UTF-16 in big-endian byte order — each 16-bit code unit is stored as high byte first, then low byte. The Unicode standard considers UTF-16BE without BOM the canonical wire format. Available in Tcl via `encoding convertfrom/convertto utf-16be`.
- DE: UTF-16 mit Big-Endian-Byte-Reihenfolge — jede 16-Bit-Code-Unit wird mit höherwertigem Byte zuerst, dann niederwertigem Byte gespeichert. Der Unicode-Standard sieht UTF-16BE ohne BOM als kanonisches Wire-Format. In Tcl via `encoding convertfrom/convertto utf-16be` verfügbar.
- EN-EX:
```tcl
set bytes [encoding convertto utf-16be "Hallo"]
binary scan $bytes H* hex
# hex = "00480061006c006c006f"
```
- RELATED: UTF-16, UTF-16LE, encoding convertfrom, encoding convertto
- SEE: encoding(n)

**encoding dirs**
- EN: Returns or sets the list of directories searched for `.enc` encoding files. Without arguments it returns the current search path; with an argument it replaces the search path. Useful when bundling custom encodings with an application.
- DE: Liefert oder setzt die Liste der Verzeichnisse, in denen nach `.enc`-Encoding-Dateien gesucht wird. Ohne Argumente gibt es den aktuellen Suchpfad zurück; mit Argument ersetzt es den Suchpfad. Nützlich beim Bündeln eigener Encodings mit einer Anwendung.
- EN-EX:
```tcl
encoding dirs                            ;# show current paths
encoding dirs [list $appDir/encodings]   ;# set search path
encoding names                           ;# list all encodings
```
- RELATED: encoding names, encoding system, encoding convertfrom
- SEE: encoding(n)

## String-Subcommands / String Subcommands

**format %c**
- EN: Converts a numeric codepoint into a one-character string. `format %c $cp` returns the character whose Unicode codepoint is `$cp`. The most direct way to build a character from its codepoint at runtime — distinct from building a literal escape like `"\u1F600"`.
- DE: Wandelt einen numerischen Codepoint in einen Ein-Zeichen-String um. `format %c $cp` liefert das Zeichen, dessen Unicode-Codepoint `$cp` ist. Der direkteste Weg, ein Zeichen zur Laufzeit aus seinem Codepoint zu erzeugen — nicht zu verwechseln mit einem literalen Escape-String wie `"\u1F600"`.
- EN-EX:
```tcl
format %c 65         ;# "A"
format %c 0x20AC     ;# "€"
format %c 0x1F600    ;# grinning face emoji (Tcl 9)
# Build hex-escape literal as a string (NOT a real char):
format "\\u%04X" 0x20AC   ;# literal "\u20AC", not €
```
- RELATED: Codepoint, scan %c, format
- SEE: format(n)

**scan %c**
- EN: Reads a single character from the input string and stores its Unicode codepoint as an integer. The inverse of `format %c`. With a width modifier (`%Nc`) reads N characters as a list of codepoints.
- DE: Liest ein einzelnes Zeichen aus dem Eingabe-String und speichert dessen Unicode-Codepoint als Ganzzahl. Umkehrung von `format %c`. Mit Breiten-Modifier (`%Nc`) liest es N Zeichen als Liste von Codepoints.
- EN-EX:
```tcl
scan A %c cp                ;# cp = 65
scan ä %c cp                ;# cp = 228
scan "ABC" "%c%c%c" a b c   ;# a=65, b=66, c=67
scan "Hello" "%5c" cps      ;# cps = list of 5 codepoints
```
- RELATED: Codepoint, format %c, scan
- SEE: scan(n)

**scan %x**
- EN: Parses a hexadecimal number from the input string into an integer. Accepts a leading `0x` or plain hex digits. Frequently used to convert hex strings (e.g. codepoint notations like "1F600") into numeric values that can then be passed to `format %c`.
- DE: Parst eine hexadezimale Zahl aus dem Eingabe-String in eine Ganzzahl. Akzeptiert führendes `0x` oder reine Hex-Ziffern. Häufig genutzt, um Hex-Strings (z.B. Codepoint-Notationen wie "1F600") in numerische Werte umzuwandeln, die dann an `format %c` weitergegeben werden.
- EN-EX:
```tcl
scan "1F600" %x cp     ;# cp = 128512
scan "0xFF"  %x n      ;# n = 255
scan "ff80"  %x n      ;# n = 65408
# Pipeline: hex string -> codepoint -> character:
scan "1F600" %x cp
format %c $cp          ;# grinning face emoji (Tcl 9)
```
- RELATED: scan, format %c, Codepoint
- SEE: scan(n)

## File I/O-Begriffe / File I/O Terms

**fconfigure -encoding**
- EN: Sets or queries the character encoding used to translate bytes from a channel into Tcl strings and vice versa. Common values: `utf-8`, `iso8859-1`, `cp1252`, `binary` (no translation). Without this setting, the system encoding is used — a frequent source of cross-platform bugs.
- DE: Setzt oder liest die Zeichenkodierung, mit der Bytes eines Channels in Tcl-Strings (und umgekehrt) übersetzt werden. Übliche Werte: `utf-8`, `iso8859-1`, `cp1252`, `binary` (keine Übersetzung). Ohne diese Einstellung wird das System-Encoding verwendet — eine häufige Fehlerquelle quer über Plattformen.
- EN-EX:
```tcl
set fd [open data.txt r]
fconfigure $fd -encoding utf-8
set content [read $fd]
close $fd

# Binary mode (no encoding translation):
set fd [open file.bin rb]
fconfigure $fd -encoding binary -translation binary
```
- RELATED: fconfigure, fconfigure -translation, encoding system, encoding convertfrom
- SEE: fconfigure(n), open(n)

**fconfigure -translation**
- EN: Controls newline translation on a channel. Values: `auto` (default for read), `lf` (Unix), `cr` (classic Mac), `crlf` (Windows), `binary` (no translation, also forces encoding to binary). Use `binary` for non-text data; otherwise newlines and end-of-file markers may be silently changed.
- DE: Steuert die Newline-Übersetzung eines Channels. Werte: `auto` (Default beim Lesen), `lf` (Unix), `cr` (klassisches Mac), `crlf` (Windows), `binary` (keine Übersetzung, erzwingt zugleich Encoding `binary`). Für Nicht-Textdaten `binary` verwenden, sonst können Zeilenenden und EOF-Marker stillschweigend verändert werden.
- EN-EX:
```tcl
set fd [open out.txt w]
fconfigure $fd -translation crlf       ;# force Windows line endings
puts $fd "Line 1"
close $fd

set fd [open image.png rb]
fconfigure $fd -translation binary     ;# raw bytes, no translation
set data [read $fd]
close $fd
```
- RELATED: fconfigure, fconfigure -encoding, open, gets, puts
- SEE: fconfigure(n), open(n)

## Regular Expressions / Reguläre Ausdrücke

**regsub -command**
- EN: A `regsub` option (Tcl 8.6+) that runs a Tcl command for each match instead of using a static replacement template. The command receives the matched string and any submatches as arguments; its result becomes the replacement text. Enables transformations not expressible with `\1`..`\9` backreferences.
- DE: Eine `regsub`-Option (Tcl 8.6+), die für jeden Treffer ein Tcl-Kommando ausführt statt einer statischen Ersatzvorlage. Das Kommando bekommt den Treffer-String und alle Untertreffer als Argumente; sein Ergebnis ist der Ersatztext. Erlaubt Transformationen, die mit `\1`..`\9`-Backreferences nicht ausdrückbar sind.
- EN-EX:
```tcl
# Uppercase every word
regsub -all -command {\w+} "hello world" {apply {{s} {string toupper $s}}}
# => HELLO WORLD

# Hex-encode each codepoint > 127
regsub -all -command {[^\x00-\x7f]} "Café" {apply {{c} {
    format "\\u%04X" [scan $c %c]
}}}
# => Caf\u00E9
```
- RELATED: regsub, regexp, apply, lambda
- SEE: regsub(n)
