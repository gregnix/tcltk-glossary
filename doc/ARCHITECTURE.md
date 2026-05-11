# Architecture

## Design philosophy

- **Markdown is the source of truth.** The database is a derived
  view, optimised for full-text search and GUI display.
- **Single-file SQLite.** Portable, no server, fast for the size of
  the dataset (~1300 terms).
- **Two interfaces (GUI + TUI).** Same data, different rendering.
  TUI is read-only, GUI is full-featured.
- **Pure Tcl.** No external compiled dependencies for the core
  application; the PDF pipeline depends on docir / mdstack /
  pdf4tcl, all pure-Tcl too.
- **Bilingual.** EN + DE in the same row, no translation files
  to manage.

## System architecture

### Component overview

```
                         +----------------+
                         |  Markdown      |
                         |  (master MD)   |
                         +-------+--------+
                                 |
                                 | tools/import_md.tcl
                                 v
            +----------------+   +----------------+
            |  glossary.db   <---+  schema.sql    |
            |  (SQLite/FTS5) |   +----------------+
            +-------+--------+
                    |
        +-----------+-------------+----------------+
        |           |             |                |
        v           v             v                v
   glossary_  glossary_   tools/export_*.tcl   docir / mdstack
   gui.tcl    tui.tcl     (Markdown export)    (PDF pipeline)
```

### Data flow

```
Master MD --[import_md.tcl]--> glossary.db
                                    |
                                    +--> GUI / TUI display
                                    +--> export_full.tcl --> Markdown
                                    +--> export_index.tcl --> Markdown
                                    +--> export_category.tcl --> Markdown
                                                |
                                                v
                                       glossary_to_pdf.tcl
                                                |
                                                v
                                              PDF
```

## Database schema

### Table `terms`

| Column          | Type    | Constraint   |
|-----------------|---------|--------------|
| `id`            | INTEGER | PK, autoincr |
| `term`          | TEXT    | UNIQUE       |
| `category`      | TEXT    |              |
| `en_definition` | TEXT    |              |
| `de_definition` | TEXT    |              |
| `en_example`    | TEXT    |              |
| `de_example`    | TEXT    |              |
| `tcl_version`   | TEXT    |              |
| `related_terms` | TEXT    |              |
| `see_also`      | TEXT    |              |
| `notes`         | TEXT    |              |
| `created_at`    | TEXT    | DEFAULT now  |
| `updated_at`    | TEXT    | DEFAULT now  |

`term` is the natural key. The `term` column is `UNIQUE` so that
imports can detect duplicates cheaply.

### FTS5 full-text search

A virtual `terms_fts` table mirrors the textual columns:

```sql
CREATE VIRTUAL TABLE terms_fts USING fts5(
    term, en_definition, de_definition,
    en_example, de_example, related_terms,
    content='terms', content_rowid='id'
);
```

Triggers keep `terms_fts` in sync with `terms` on
INSERT / UPDATE / DELETE.

### Indexes

- `terms.term` — unique constraint creates an implicit index
- `terms.category` — for category list queries
- `terms.created_at` and `terms.updated_at` — for chronological
  views

## Import / export

### Import (Markdown → SQLite)

`tools/import_md.tcl` parses the canonical Markdown format:

```markdown
## Category

**term**
- EN: definition
- DE: definition
```

Parsing is line-based. Categories are detected by `^## ` headers,
terms by `^\*\*(.+?)\*\*` patterns, EN/DE definitions by `^- EN: `
and `^- DE: ` prefixes. Optional fields (`tcl_version`,
`related_terms`, `see_also`, `notes`) follow the same `- KEY: `
pattern.

Existing terms are skipped (additive import; no overwrite).

### Export (SQLite → Markdown)

Three export tools, all writing to stdout:

#### `export_index.tcl`

Per category, a header and three sample terms. Use case: overview,
TOC, sharing the structure.

#### `export_category.tcl`

A single category with all its terms, full content. Wildcards
supported (SQL LIKE).

#### `export_full.tcl`

Everything. Two modes:

- default — human-readable, with examples and metadata
- `--for-docir` — adjusted heading levels and code-fence languages
  for the docir documentation pipeline

## GUI architecture (`glossary_gui.tcl`)

### Widget hierarchy

```
. (toplevel)
+- .menubar
|  +- File, Edit, View, Help
+- .toolbar (frame)
|  +- search entry, search button
+- .pw (panedwindow)
|  +- .left (frame)
|  |  +- combobox (category quick pick)
|  |  +- treeview (categories with terms)
|  +- .right (frame)
|     +- text widget (entry display, with tags)
+- .status (label)
```

### Text-widget tags

| Tag         | Style                                    |
|-------------|------------------------------------------|
| `term`      | Bold, larger font                        |
| `category`  | Italic, gray                             |
| `field`     | Bold (EN:, DE:, …)                       |
| `code`      | Monospace, light gray background         |
| `example`   | Monospace, indented, code background     |
| `link`      | Blue, underlined, mouse-cursor `hand2`   |
| `match`     | Yellow background (search hit)           |

Bindings on `link` tags trigger navigation to the related term.

### Event bindings

| Event             | Handler                       |
|-------------------|-------------------------------|
| `<Control-o>`     | Open database file            |
| `<Control-f>`     | Focus search entry            |
| `<Control-n>`     | New term dialog               |
| `<Control-e>`     | Edit selected term            |
| `<Control-d>`     | Delete selected term          |
| `<Alt-Left>`      | Navigate back in history      |
| `<Alt-Right>`     | Navigate forward              |
| `<F1>`            | Show FTS5 syntax help         |
| `<Control-q>`     | Quit                          |
| Treeview selection | Display chosen term          |
| Combobox change    | Filter tree, jump            |
| `<Configure>`      | Persist window geometry      |

## TUI architecture (`glossary_tui.tcl`)

### Design principles

- Single `tclsh` invocation
- No external dependencies beyond `tdbc::sqlite3`
- ANSI colour codes (disabled by `NO_COLOR=1`)
- Read-only (no edit / new / delete; use the GUI for those)
- Robust against EOF on stdin (`Ctrl+D` quits cleanly)

### ANSI colours

| Style    | Used for                          |
|----------|-----------------------------------|
| Bold     | Term names, menu headers          |
| Cyan     | Category names                    |
| Yellow   | Field labels                      |
| Green    | Statistics figures                |
| Gray     | Separators                        |
| Red      | Errors                            |

### Menu structure

```
[MENU]
  s) Search           ─> input search query, list hits, pick number
  c) Categories       ─> list categories, pick number, list terms
  a) All terms        ─> first 100 alphabetical, pick number
  i) Statistics       ─> totals + top/bottom categories
  q) Quit
```

### Interaction flow

```
loop
    show menu
    read key
    case:
        s -> search_loop
        c -> category_loop
        a -> all_loop
        i -> show_stats
        q | EOF -> exit
end loop
```

Each sub-loop reads numerical input to pick from a list, displays
the chosen entry, then returns to the menu.

## Performance considerations

### Full-text search (FTS5)

- 1324 terms: < 10 ms per query (warm cache)
- 10000 terms (extrapolated): < 50 ms
- Cold cache: roughly 2× warm

The `terms_fts` virtual table is the bottleneck for searches; a
plain SQL `LIKE` fallback handles syntax errors and typos.

### GUI startup

- Cold: ~ 200 ms
- Warm: ~ 50 ms

Cold startup is dominated by Tk widget creation and TDBC
initialisation; warm startup re-uses cached compilation.

### TUI startup

- Cold: ~ 50 ms
- Warm: ~ 20 ms

No Tk overhead.

## Extensibility

### New columns

`tools/schema.sql` is the source of truth. Add the column there,
update the trigger that maintains `terms_fts` if the column is
text-searchable, then run a one-off `ALTER TABLE` against the
existing database.

GUI display routines need updating in `glossary_gui.tcl`
(the `display_term` proc) and in the Edit dialog (the field list).

### TDBC migration to PostgreSQL

The current backend is `tdbc::sqlite3`. Switching to
`tdbc::postgres` would require:

- Database creation through `psql` instead of the sqlite3 CLI
- Replacing FTS5 with PostgreSQL's `tsvector` /
  `to_tsquery` / GIN-index machinery
- Connection string handling (host, port, credentials) instead of
  a file path

The TDBC abstraction handles the SQL execution layer; the rewrites
are concentrated in schema and search.

### New export formats

Add a new `tools/export_<format>.tcl`. Existing tools are good
templates: open the DB, walk the rows, format. Suggested formats
for future work: HTML, ePub, JSON.

#### HTML export

A small HTML emitter built on the same row walk would mirror the
existing Markdown export. Templates per category, anchors per term,
in-document search via JavaScript.

#### PDF export via Pandoc

Alternative path: `export_full.tcl` → Markdown → `pandoc -o
glossary.pdf`. Less control over layout than the docir pipeline,
but useful when the docir stack isn't available.

## Security

### SQL injection

All queries use TDBC parameter binding. No string concatenation
of user input into SQL.

### File access

The database file path comes from the command line or the
`Open` dialog. No automatic loading from
network or environment variables. Markdown imports read only the
file passed as an argument.

## Testing strategy

### Unit tests

Not implemented for the GUI/TUI layers. The export tools and the
import tool can be tested by round-trip: export, then re-import
into a fresh database, then `diff` the two databases (or their
exports).

### Integration tests

`test_tui.sh` runs `glossary_tui.tcl` non-interactively against the
shipped database and checks the basic menu paths complete without
error.

## Known limitations

- Single-user (SQLite is file-based)
- Bilingual EN/DE only (schema is hard-coded for two languages;
  see "Multi-language support" below for what a generic schema
  would look like)
- No HTML / ePub / JSON export (only Markdown and PDF)
- Markdown import parser handles only the canonical format

## Future directions

### Multi-language support

The current schema has fixed `en_*` and `de_*` columns. For more
languages, two approaches are conceivable:

- **Add columns** (`fr_definition`, `fr_example`, …) — simple,
  works for a handful of additional languages, breaks every export
  tool.
- **Normalise** with a `translations(term_id, lang, definition,
  example)` table — clean, scales to any number of languages, but
  every query needs a JOIN and the GUI layout becomes more
  complex.

Not implemented.

### Versioned terms

Currently each term has one definition pair. To track changes
across Tcl versions (e.g. `puts` semantics differing between 8.6
and 9.0), a `term_versions(term_id, tcl_version, definition)`
table would be needed. Not implemented.
