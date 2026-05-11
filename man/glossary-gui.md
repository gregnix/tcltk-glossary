# glossary-gui — GUI for the Tcl/Tk glossary database

## NAME

`glossary_gui.tcl` — graphical interface to the Tcl/Tk glossary database.

## SYNOPSIS

```
wish glossary_gui.tcl [database.db]
```

## DESCRIPTION

`glossary_gui` is a Tk application for browsing and editing the
Tcl/Tk glossary. It uses a SQLite3 backend (via TDBC) and FTS5 for
full-text search.

The application provides:

- Full-text search across all term fields
- Category navigation (treeview, expand/collapse, plus combobox)
- Manpage-style formatted display with syntax highlighting for code
- Edit dialog (new entry, edit existing, delete)
- Keyboard shortcuts
- Two-pane layout (term list on the left, content on the right)

## OPTIONS

### Positional arguments

- `database.db` — path to the SQLite3 database file. Optional; if
  omitted, the application starts with no database open and the user
  is expected to use `File → Open` (`Ctrl+O`) to pick one.

## USAGE

### Start

```bash
wish glossary_gui.tcl glossary.db
```

The window opens and shows the categories tree on the left. The
first category is expanded by default.

### Workflow

1. Pick a category in the tree, or use the combobox.
2. Pick a term in the list.
3. The right pane shows the formatted entry: term name, EN and DE
   definition, examples, related terms, see-also, notes.
4. Click a related term to navigate to it (the category will expand
   automatically).
5. Use the search field at the top to find terms by full text.

## KEYBOARD SHORTCUTS

| Shortcut       | Action                       |
|----------------|------------------------------|
| `Ctrl+O`       | Open database                |
| `Ctrl+F`       | Focus search field           |
| `Ctrl+N`       | New term (edit dialog)       |
| `Ctrl+E`       | Edit selected term           |
| `Ctrl+D`       | Delete selected term         |
| `Alt+Left`     | Navigate back in history     |
| `Alt+Right`    | Navigate forward             |
| `F1`           | Show FTS5 search-syntax help |
| `Ctrl+Q`       | Quit                         |

## LAYOUT

```
+- Tcl/Tk Glossary Manager ---------------------+
| File  Edit  View  Help                        |
+-----------------------------------------------+
| Search: [ ...                ] [Search]       |
+--------------+--------------------------------+
| Terms:       |  term_name                     |
|              |  ===================           |
| > Category1  |                                |
|   term_a     |  EN: English definition ...    |
|   term_b     |  DE: German definition ...     |
|   term_c     |                                |
|              |  Example (EN):                 |
| > Category2  |    code example ...            |
|   ...        |                                |
|              |  Related: term_x, term_y       |
|              |                                |
+--------------+--------------------------------+
| Status: 1324 terms in 122 categories          |
+-----------------------------------------------+
```

## TEXT-WIDGET FORMATTING

The right pane uses Tcl/Tk text-widget tags for formatting:

| Tag        | Style                                |
|------------|--------------------------------------|
| `term`     | Bold, larger                         |
| `category` | Italic, gray                         |
| `field`    | Bold (EN:, DE:, Example:, …)         |
| `code`     | Monospace, light gray background     |
| `example`  | Monospace, indented, code background |
| `link`     | Blue, underlined, clickable          |
| `match`    | Yellow background (search hit)       |

## DATABASE SCHEMA

### Table `terms`

| Column          | Type    |
|-----------------|---------|
| `id`            | INTEGER |
| `term`          | TEXT    |
| `category`      | TEXT    |
| `en_definition` | TEXT    |
| `de_definition` | TEXT    |
| `en_example`    | TEXT    |
| `de_example`    | TEXT    |
| `tcl_version`   | TEXT    |
| `related_terms` | TEXT    |
| `see_also`      | TEXT    |
| `notes`         | TEXT    |
| `created_at`    | TEXT    |
| `updated_at`    | TEXT    |

### FTS5 full-text search

A virtual `terms_fts` table indexes the textual columns. The GUI
search uses FTS5 first and falls back to LIKE on syntax errors.

## SEARCH SYNTAX

### Simple search

`namespace` — finds all terms containing "namespace".

### Prefix matching

`name*` — matches "namespace", "named", "name_value", …

### Phrase matching

`"event loop"` — matches the exact phrase.

### Boolean (FTS5)

```
namespace AND command
tcl OR tk
namespace NOT eval
```

## EXAMPLES

### Find a term

1. `Ctrl+F`, type `namespace`, press Enter.
2. Pick a hit from the dropdown.
3. The right pane shows the entry.

### Browse a category

1. Click the chevron beside "Stack-Level and Scope" in the tree.
2. Click any term — display updates.

### Navigation history

After visiting several terms via clicks or related-term links,
`Alt+Left` and `Alt+Right` walk the history.

## DEPENDENCIES

### Required

- Tcl 8.6 or 9.x
- Tk 8.6 or 9.x
- `tdbc::sqlite3`
- SQLite3 with FTS5 (default in modern distributions)

Debian/Ubuntu:
```bash
sudo apt-get install tcl tk sqlite3 tcl-sqlite3 tcl-tdbc-sqlite3
```

Fedora:
```bash
sudo dnf install tcl tk sqlite tcl-sqlite tcl-tdbc-sqlite3
```

### Optional

- `pdf4tcl`, `pdf4tcllib`, `mdstack`, `docir` — for PDF export
  (the GUI itself works without them; only `tools/glossary_to_pdf.tcl`
  needs them).

## INSTALLATION

No build step. Make the script executable and call it directly, or
invoke `wish glossary_gui.tcl <db>`.

## LIMITATIONS

- Single-user (SQLite is file-based; concurrent edits not supported).
- Bilingual EN/DE only (schema is hard-coded for two languages).
- Markdown export is the only export format other than PDF.

## KNOWN ISSUES

- The Markdown import parser handles only the canonical
  `## Category` / `**Term**` / `- EN:` / `- DE:` format. Other formats
  need pre-conversion.

## PERFORMANCE

- Cold start: ~ 200 ms
- Warm start: ~ 50 ms
- FTS5 search across 1324 terms: < 10 ms
- Tree render of 122 categories: < 100 ms

## SEE ALSO

- `glossary-tui(1)` — terminal interface
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
