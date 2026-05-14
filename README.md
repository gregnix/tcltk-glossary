# tcltk-glossary

Tcl/Tk glossary database with GUI, TUI, search, and Markdown/PDF export.

**Version:** 1.4
**License:** MIT (code) + CC BY 4.0 (content)
**Tcl/Tk:** 8.6+ / 9.x

## Overview

A bilingual (English/German) glossary of Tcl/Tk terminology with:

- **SQLite + FTS5** full-text search
- **GUI** (Tk text widget, manpage-style formatting)
- **TUI** (terminal-only, SSH-friendly)
- **Markdown import/export** (round-trip safe)
- **Pure-Tcl PDF generation** (with TOC, index, bookmarks)
- **Categories** with tree navigation
- 1681 terms in 137 categories shipped

The database (`glossary.db`) is included — you can open it directly,
no import step needed.

## Quick start

```bash
sudo apt-get install tcl tk sqlite3 tcl-sqlite3 tcl-tdbc-sqlite3   # Debian/Ubuntu
# or
sudo dnf install tcl tk sqlite tcl-sqlite tcl-tdbc-sqlite3         # Fedora

# GUI
wish glossary_gui.tcl glossary.db

# TUI
tclsh glossary_tui.tcl glossary.db
```

## Interfaces

### GUI (`glossary_gui.tcl`)

```
+- Tcl/Tk Glossary Manager ------------------------+
| File  Edit  View  Help                           |
+--------------------------------------------------+
| Search: [namespace          ] [Search]           |
+--------------+-----------------------------------+
| Terms:       |  namespace                        |
|              |  ===================              |
| > Stack...   |                                   |
|   namespace  |  EN: Tcl mechanism for ...        |
|   global     |  DE: Tcl-Mechanismus zum ...      |
|   upvar      |                                   |
|   uplevel    |  Related: namespace eval, ...     |
|              |                                   |
| > TclOO      |  [Back] [Forward] [Edit]          |
|   ...        |                                   |
+--------------+-----------------------------------+
```

Features:
- Treeview with categories (expand / collapse)
- Combobox for quick category selection
- Text-widget rendering with manpage-like tags
- FTS5 search with `AND`, `OR`, `NOT`, wildcards
- Edit dialog (new entry, edit, delete)
- Clickable related terms (hyperlink navigation)
- Markdown export (two profiles: standard, importable)
- Backtick highlighting in definitions
- Search-hit highlighting in the displayed entry
- Persistent window geometry (`~/.glossary_manager.rc`)
- Keyboard shortcuts (Ctrl+O, Ctrl+F, Ctrl+N, Ctrl+E, Ctrl+D, Alt+Left/Right)

### TUI (`glossary_tui.tcl`)

```
$ tclsh glossary_tui.tcl glossary.db

===================================
  Tcl/Tk Glossary Manager (TUI)
===================================

[MENU]
  s) Search
  c) Categories
  a) All terms
  i) Statistics
  q) Quit

Choice: _
```

Pure terminal output, no Tk widgets, SSH-friendly. ANSI colours,
FTS5 search, category browsing, statistics.

## Keyboard shortcuts (GUI)

| Shortcut             | Action                          |
|----------------------|---------------------------------|
| `Ctrl+O`             | Open database                   |
| `Ctrl+F`             | Activate search                 |
| `Ctrl+N`             | New entry                       |
| `Ctrl+E`             | Edit entry                      |
| `Ctrl+D`             | Delete entry                    |
| `Alt+Left/Right`     | Navigate back/forward           |
| `F1`                 | FTS5 search-syntax help         |
| `Ctrl+Q`             | Quit                            |

## Database schema

Single table `terms`:

| Column          | Type    | Description                |
|-----------------|---------|----------------------------|
| `id`            | INTEGER | Primary key                |
| `term`          | TEXT    | Term (unique)              |
| `category`      | TEXT    | Category                   |
| `en_definition` | TEXT    | English definition         |
| `de_definition` | TEXT    | German definition          |
| `en_example`    | TEXT    | English example            |
| `de_example`    | TEXT    | German example             |
| `tcl_version`   | TEXT    | Tcl version where relevant |
| `related_terms` | TEXT    | Comma-separated related    |
| `see_also`      | TEXT    | "See also" cross-refs      |
| `notes`         | TEXT    | Free-form notes            |
| `created_at`    | TEXT    | Creation timestamp         |
| `updated_at`    | TEXT    | Last update timestamp      |

A virtual `terms_fts` table (FTS5) provides full-text search across
all text columns. FTS5 syntax in the GUI search field:

- `namespace AND command` — boolean AND
- `tcl OR tk` — boolean OR
- `"event loop"` — phrase
- `name*` — prefix match

## Import / export

### Importing your own data

Format expected by `tools/import_md.tcl`:

```markdown
## Category Name

**term**
- EN: English definition
- DE: German definition

**another_term**
- EN: ...
- DE: ...
```

See `sample/sample-import.md` for a complete minimal example.

```bash
tclsh tools/import_md.tcl your_glossary.md glossary.db
```

The import is **additive**: existing terms (matched by the `term`
column) are skipped with a `SKIP (duplicate)` message — no data
loss.

### Export

| Tool                                             | Output                                  |
|--------------------------------------------------|-----------------------------------------|
| `tools/export_full.tcl glossary.db`              | Full glossary as Markdown               |
| `tools/export_full.tcl glossary.db --for-docir`  | docir-compatible Markdown               |
| `tools/export_index.tcl glossary.db`             | Index with categories + 3 sample terms  |
| `tools/export_category.tcl glossary.db <cat>`    | Single category                         |
| `tools/glossary_to_pdf.tcl input.md output.pdf`  | PDF with TOC, index, bookmarks          |
| GUI `File → Export to Markdown…`                 | Same as `export_full.tcl`               |

The PDF pipeline depends on `pdf4tcl`, `pdf4tcllib`, `mdstack`, and
`docir` — see [Optional dependencies](#optional-dependencies) below.
Markdown import / export and the GUI / TUI work without them.

See [`doc/EXPORT_GUIDE.md`](doc/EXPORT_GUIDE.md) for details.

## Optional dependencies

For the PDF pipeline:

- [pdf4tcl](https://github.com/gregnix/pdf4tcl)
- [pdf4tcllib](https://github.com/gregnix/pdf4tcllib)
- [mdstack](https://github.com/gregnix/mdstack)
- [docir](https://github.com/gregnix/docir)

Install each with `sudo make install` (writes to
`/usr/local/lib/tcltk/<repo>/`). Without them, the GUI and TUI work
fine; only the PDF tool requires them.

## File layout

```
tcltk-glossary/
├── README.md
├── CHANGELOG.md
├── LICENSE                 MIT (code)
├── LICENSE-CONTENT.txt     CC BY 4.0 (glossary content) + acknowledgments
├── glossary_gui.tcl        GUI application
├── glossary_tui.tcl        TUI application
├── glossary.db             SQLite DB with 1681 terms
├── test_tui.sh             TUI smoke test
├── tools/
│   ├── import_md.tcl       Markdown -> SQLite
│   ├── export_full.tcl     Complete export
│   ├── export_index.tcl    Index / overview
│   ├── export_category.tcl Single category
│   ├── glossary_to_pdf.tcl Markdown -> PDF (Tcl pipeline)
│   ├── schema.sql          Database schema (DDL)
│   └── migrate-1.5.sql     Migration 1.4 -> 1.5 (UNIQUE term -> term+category)
├── doc/
│   ├── ARCHITECTURE.md
│   ├── EDIT_DIALOG_GUIDE.md
│   ├── EXPORT_GUIDE.md
│   └── TDBC_MIGRATION.md
├── man/
│   ├── glossary-gui.md
│   ├── glossary-tui.md
│   └── export-tools.md
├── sample/
│   └── sample-import.md
└── tests/
    └── test-roundtrip.tcl  Export -> Import roundtrip verifier
```

## Tests

```bash
# TUI smoke test (Statistik, Suche, Kategorien)
bash test_tui.sh

# Export/Import roundtrip:
# Exportiert die DB als Markdown, importiert sie in eine temporaere
# DB, vergleicht Term- und Kategorie-Counts.
tclsh tests/test-roundtrip.tcl
```

Beide Tests sind self-skipping wenn die benoetigten Dependencies
(`tdbc::sqlite3`, `sqlite3` CLI) fehlen -- Exit-Code 2.

## Performance

- FTS5 search across 1681 terms: < 10 ms
- GUI cold start: ~ 200 ms
- TUI cold start: ~ 50 ms
- PDF render of full glossary: ~ 6 s (~150 pages)

## Limitations

- TUI is read-only — edit / new / delete only in the GUI
- HTML / ePub / JSON export not implemented (Markdown and PDF only)
- The Markdown import parser handles the basic format
  (`## Category` / `**Term**` / `- EN:` / `- DE:`); other formats
  need pre-conversion

## License

Code is MIT-licensed (see `LICENSE`). Glossary content is licensed
under CC BY 4.0; see `LICENSE-CONTENT.txt` for details and
acknowledgments to the Tcl/Tk documentation team.

## See also

- [SQLite FTS5](https://www.sqlite.org/fts5.html)
- [Tcl/Tk Text Widget](https://www.tcl-lang.org/man/tcl8.6/TkCmd/text.htm)
- [TDBC](https://www.tcl-lang.org/man/tcl/TdbcCmd/contents.htm)
- The [docir](https://github.com/gregnix/docir) /
  [mdstack](https://github.com/gregnix/mdstack) /
  [mdhelp](https://github.com/gregnix/mdhelp4) documentation suite
  (the PDF pipeline integrates with these)
