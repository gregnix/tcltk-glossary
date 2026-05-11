# glossary-tui — Terminal interface for the Tcl/Tk glossary

## NAME

`glossary_tui.tcl` — terminal-only interface to the Tcl/Tk glossary
database. SSH-friendly.

## SYNOPSIS

```
tclsh glossary_tui.tcl [database.db]
```

## DESCRIPTION

`glossary_tui` is a pure-tclsh interface to the same SQLite/FTS5
database that the GUI uses. Read-only (no editing). Designed for use
over SSH or in environments without Tk.

Features:

- ANSI-coloured output
- FTS5 full-text search
- Category browsing
- Per-category and global statistics
- No Tk widgets — runs anywhere `tclsh` runs

## OPTIONS

### Positional arguments

- `database.db` — path to the SQLite3 database. Optional; defaults
  to `glossary.db` in the current directory.

## USAGE

### Start

```bash
tclsh glossary_tui.tcl glossary.db
```

You see the main menu and a prompt.

### Workflow

1. Pick a menu option by its key letter.
2. Enter additional input (search query, category number) when asked.
3. After each action the menu reappears.
4. `q` to quit.

## MENU OPTIONS

### `s` — search

Enter a search term. FTS5 syntax accepted (see SEARCH SYNTAX). The
hits are listed; pick a number to view the entry, or press Enter to
return to the menu.

### `c` — categories

Lists categories with their term counts. Pick a number to view the
terms in that category, then a number again to view a specific
entry.

### `a` — all terms

Lists the first 100 terms alphabetically. Pick a number to view an
entry. (Pagination beyond 100 is not implemented; use search or
category browse for the full set.)

### `i` — statistics

Shows totals: number of terms, number of categories, top-10 largest
categories, smallest categories.

### `q` — quit

Exit the application. `Ctrl+D` (EOF on stdin) also works.

## ANSI COLOURS

| Style    | Used for                                          |
|----------|---------------------------------------------------|
| Bold     | Term names, menu headers                          |
| Cyan     | Category names                                    |
| Yellow   | Field labels (EN:, DE:, Example:)                 |
| Green    | Statistics figures                                |
| Gray     | Separators, hints                                 |
| Red      | Errors, "no results found"                        |

Colours can be disabled by setting `NO_COLOR=1` in the environment.

## SEARCH SYNTAX

Same as in the GUI:

```
namespace            simple word
name*                prefix
"event loop"         phrase
namespace AND eval   boolean AND
tcl OR tk            boolean OR
namespace NOT eval   boolean NOT
```

Errors fall back to a LIKE query.

## FILES

- `~/.glossary_tui_history` — command history (if implemented; not
  used in the current version, reserved for future).

## EXAMPLES

### Find a term

```
Choice: s
Search term: namespace eval
```

→ list of hits, pick one.

### Browse a category

```
Choice: c
Categories:
  1) Core Tcl Commands (85)
  2) Object-Oriented Tcl (TclOO) (23)
  ...
Pick a number: 2
```

→ list of TclOO terms.

### Show statistics

```
Choice: i

Statistics
==========
  Total terms:      1324
  Total categories: 122
  Bilingual terms:  1324
  Terms with examples: ~1300
  ...
```

### SSH usage

```
ssh user@host tclsh /path/to/glossary_tui.tcl /path/to/glossary.db
```

The TUI has no terminal-feature requirements beyond ANSI colour
codes — works in `tmux`, `screen`, plain SSH, GNU Screen, mosh.

## DEPENDENCIES

### Required

- Tcl 8.6 or 9.x
- `tdbc::sqlite3`
- SQLite3 with FTS5

Debian/Ubuntu:
```bash
sudo apt-get install tcl sqlite3 tcl-sqlite3 tcl-tdbc-sqlite3
```

(Note: no `tk` package needed for the TUI.)

### Optional

None.

## INSTALLATION

No build step. Make the script executable and call it directly, or
invoke `tclsh glossary_tui.tcl <db>`.

## TERMINAL COMPATIBILITY

### Tested

- `xterm`, `gnome-terminal`, `konsole`, `terminator`
- `tmux`, GNU `screen`
- `mosh`
- macOS Terminal, iTerm2

### Not tested

- Windows native `cmd.exe`, PowerShell — ANSI colours may need
  enabling (`NO_COLOR=1` for safe plain output).

## LIMITATIONS

- Read-only — no editing, no inserts, no deletes (use the GUI).
- "All terms" mode shows only the first 100 (browse by category for
  the full set).
- Unicode renders correctly only on UTF-8-capable terminals.

## KNOWN ISSUES

### ANSI colours on Windows

Native Windows terminals (cmd, PowerShell) may not honour ANSI escape
sequences. Workaround: `set NO_COLOR=1` in the environment, or use
Windows Terminal / WSL.

## PERFORMANCE

- Cold start: ~ 50 ms
- FTS5 search: < 10 ms
- Category list with 122 entries: instant

## TUI vs GUI

| Feature                  | TUI       | GUI       |
|--------------------------|-----------|-----------|
| Search                   | yes       | yes       |
| Categories               | yes       | yes       |
| New / edit / delete      | no        | yes       |
| Hyperlink navigation     | no        | yes       |
| Markdown export          | no        | yes       |
| Persistent geometry      | n/a       | yes       |
| SSH                      | yes       | no        |
| Terminal-only            | yes       | no        |
| Memory footprint         | tiny      | small     |

## SEE ALSO

- `glossary-gui(1)` — graphical interface
- `export-tools(1)` — Markdown / PDF export tools

## BUGS

Report issues at the project's GitHub tracker.

## AUTHOR

Gregor Ebbing.

## COPYRIGHT

Copyright (c) 2025-2026 Gregor Ebbing.
Licensed under the MIT License (code) and CC BY 4.0 (content).

## VERSION

1.4 (2026-05-10).
