# export-tools — Markdown / PDF export utilities

## NAME

`export_index.tcl`, `export_category.tcl`, `export_full.tcl`,
`glossary_to_pdf.tcl`, `import_md.tcl` — command-line tools for
working with the Tcl/Tk glossary database.

## SYNOPSIS

```
tclsh tools/export_index.tcl     <database.db>
tclsh tools/export_category.tcl  <database.db> <category>
tclsh tools/export_full.tcl      <database.db> [--for-docir]
tclsh tools/glossary_to_pdf.tcl  <input.md> <output.pdf>
tclsh tools/import_md.tcl        <input.md> <database.db>
```

## DESCRIPTION

This page covers the five command-line tools shipped under `tools/`.
They use the same SQLite/FTS5 database as the GUI and TUI.

The Markdown produced by the export tools and the Markdown consumed
by `import_md.tcl` use the same canonical format — the round-trip
is intentional. `--for-docir` produces a variant tuned for the docir
documentation pipeline (heading levels and code-fence languages).

## TOOLS

### `export_index.tcl`

#### Description

Produces a Markdown overview document: per category, three sample
terms with EN definitions. Roughly the "table of contents" view of
the glossary.

#### Usage

```bash
tclsh tools/export_index.tcl glossary.db > index.md
```

#### Output format

```markdown
# Glossary Index

## Statistics

- Total terms: 1324
- Categories: 122

## Core Tcl Commands (85 terms)

### namespace
EN: Tcl mechanism for grouping commands and variables ...

### proc
EN: Defines a new Tcl procedure ...

### set
EN: Assigns a value to a variable ...

[123 more terms]

## Object-Oriented Tcl (TclOO) (23 terms)

...
```

#### Use case

Quick overview when scoping work, picking categories to revise, or
sharing the glossary structure.

### `export_category.tcl`

#### Description

Exports all terms of a single category as Markdown. Wildcards in
the category name supported.

#### Usage

```bash
tclsh tools/export_category.tcl glossary.db "Core Tcl Commands"

tclsh tools/export_category.tcl glossary.db "Widget*"     # all matching
```

#### Wildcard syntax

Standard SQL `LIKE` semantics:

| Pattern    | Matches                                       |
|------------|-----------------------------------------------|
| `Widget*`  | "Widget Properties", "Widgets in TclOO", ...  |
| `*Tcl*`    | every category containing "Tcl"               |
| `Core ?cl` | "Core Tcl"                                    |

#### Output format

```markdown
## Core Tcl Commands

### namespace

EN: Tcl mechanism for grouping commands and variables ...
DE: Tcl-Mechanismus zum Gruppieren von Befehlen ...

Example (EN):
    namespace eval mySpace {
        variable counter 0
    }

Example (DE):
    namespace eval meinSpace {
        variable zaehler 0
    }

Related: namespace eval, namespace which, ...
See also: ...
```

#### Use case

Working on one category at a time — review, edit in Markdown,
re-import.

### `export_full.tcl`

#### Description

Exports the complete glossary as Markdown, structured by category.
Two modes:

- without flag — human-readable, with all fields (EN, DE,
  examples, related, notes)
- `--for-docir` — docir-compatible structure (heading levels and
  code-fence languages chosen for the documentation pipeline)

#### Usage

```bash
tclsh tools/export_full.tcl glossary.db > all.md
tclsh tools/export_full.tcl glossary.db --for-docir > all-docir.md
```

#### Use case

Round-trip editing of the full glossary, or feeding into the PDF
pipeline (`--for-docir` mode followed by `glossary_to_pdf.tcl`).

### `glossary_to_pdf.tcl`

#### Description

Renders a Markdown file (typically the output of
`export_full.tcl --for-docir`) to a PDF, with table of contents,
alphabetical index, and PDF bookmarks.

Pipeline: Markdown → mdstack → DocIR → docir::pdf → PDF.

#### Usage

```bash
tclsh tools/export_full.tcl glossary.db --for-docir > all.md
tclsh tools/glossary_to_pdf.tcl all.md glossary.pdf
```

#### Output features

- A4, two-column-friendly fonts
- TOC with category entries and page numbers
- Alphabetical term index at the end
- PDF bookmarks for navigation
- Internal hyperlinks for "see also" cross-refs

#### Use case

Printable glossary (~150 pages for the bundled 1324 terms), or PDF
for distribution.

### `import_md.tcl`

#### Description

Imports terms from a Markdown file into the glossary database.
Additive: terms whose `term` column already exists in the database
are skipped (no overwrites).

#### Usage

```bash
tclsh tools/import_md.tcl input.md glossary.db
```

#### Expected input format

```markdown
## Category Name

**term**
- EN: English definition
- DE: German definition

**another_term**
- EN: ...
- DE: ...
```

`sample/sample-import.md` shows a complete minimal example.

#### Output

Per-line progress messages for added terms, `SKIP (duplicate)` for
existing terms, and a final summary:

```
==========================================
Import complete!
==========================================
Terms imported:      6
Categories found:    2
Total terms in DB:   1324
Total categories:    122
```

#### Use case

Adding new terms in bulk, re-importing after editing in Markdown.

## COMPLETE WORKFLOW

A typical "edit a category" cycle:

1. Export the category:
   ```bash
   tclsh tools/export_category.tcl glossary.db "TclOO" > tcloo.md
   ```
2. Edit `tcloo.md` in your editor.
3. Re-import:
   ```bash
   tclsh tools/import_md.tcl tcloo.md glossary.db
   ```
4. Verify in the GUI:
   ```bash
   wish glossary_gui.tcl glossary.db
   ```

For PDF distribution:

```bash
tclsh tools/export_full.tcl glossary.db --for-docir > all.md
tclsh tools/glossary_to_pdf.tcl all.md glossary.pdf
```

## FILES

- `tools/schema.sql` — database schema, used by `import_md.tcl`
  when creating a new database.
- `glossary.db` — the database itself.

## USEFUL SQL QUERIES

Run via `sqlite3 glossary.db`.

### Find incomplete entries

```sql
SELECT term, category FROM terms
WHERE en_definition = '' OR de_definition = ''
ORDER BY category, term;
```

### Terms without examples

```sql
SELECT term FROM terms
WHERE (en_example IS NULL OR en_example = '')
  AND (de_example IS NULL OR de_example = '');
```

### Top-10 largest categories

```sql
SELECT category, COUNT(*) AS n
FROM terms GROUP BY category
ORDER BY n DESC LIMIT 10;
```

### Smallest categories (review candidates)

```sql
SELECT category, COUNT(*) AS n
FROM terms GROUP BY category
ORDER BY n ASC LIMIT 10;
```

### Terms with TODO/FIXME

```sql
SELECT term, category FROM terms
WHERE notes LIKE '%TODO%' OR notes LIKE '%FIXME%';
```

## DEPENDENCIES

### Required

- Tcl 8.6 or 9.x
- `tdbc::sqlite3`
- SQLite3 with FTS5

### Optional (for `glossary_to_pdf.tcl` only)

- [pdf4tcl](https://github.com/gregnix/pdf4tcl)
- [pdf4tcllib](https://github.com/gregnix/pdf4tcllib)
- [mdstack](https://github.com/gregnix/mdstack)
- [docir](https://github.com/gregnix/docir)

The Markdown import / export tools work without these.

## INSTALLATION

No build step. Each tool is a standalone Tcl script.

## LIMITATIONS

- The Markdown import parser handles only the canonical
  `## Category` / `**Term**` / `- EN:` / `- DE:` format.
- Importing a term that already exists is a no-op (additive only);
  there is no "upsert" mode.
- Wildcards in `export_category.tcl` use SQL `LIKE` semantics, not
  shell globs.

## BEST PRACTICES

- Treat Markdown as the source of truth and the database as a
  derived view. Edit in MD, re-import.
- For larger edits, work category by category — easier to review
  diffs and easier to bisect mistakes.
- Commit after every category. Git diffs on the database itself are
  unhelpful (binary), but Markdown diffs are clear.

## SEE ALSO

- `glossary-gui(1)` — graphical interface
- `glossary-tui(1)` — terminal interface

## BUGS

Report issues at the project's GitHub tracker.

## AUTHOR

Gregor Ebbing.

## COPYRIGHT

Copyright (c) 2025-2026 Gregor Ebbing.
Licensed under the MIT License (code) and CC BY 4.0 (content).

## VERSION

1.4 (2026-05-10).
