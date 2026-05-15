# tcltk-glossary — Changelog

The format is loosely based on
[Keep a Changelog](https://keepachangelog.com/).

## 2026-05-15 — Multi-format import/export (MD / CSV / JSON)

### Added

- **`docs/glossary-formats.md`** — specification for the three
  supported import/export formats with examples, comparison matrix
  and round-trip guarantees.
- **`tools/import_md.tcl`** — extended with `EN-EX` / `DE-EX` /
  `RELATED` / `SEE` parsing. Backward compatible: existing 4-field
  Markdown files still import unchanged (new fields stay empty).
- **`tools/import_csv.tcl`** — RFC 4180 CSV import via `tcllib::csv`,
  with multi-line quoted fields support (`::csv::iscomplete`).
- **`tools/import_json.tcl`** — JSON import via `rl_json`. Validates
  the `schema` tag (currently `tcltk-glossary/1.5`); warns and
  continues for unknown future versions.
- **`tools/export_md.tcl`** — Markdown export in the extended format
  with `--category=NAME` and `--bilingual-only` filters.
- **`tools/export_csv.tcl`** — CSV export via `tcllib::csv`.
- **`tools/export_json.tcl`** — JSON export via `rl_json::json template`
  with `--pretty` (default) and `--compact`. Schema `tcltk-glossary/1.5`.

### Changed

- **`glossary_gui.tcl` File menu** — replaced single `Export...` entry
  with `Import...` and `Export...` items. Each opens a unified dialog
  with a format combobox (Markdown extended / Markdown legacy / CSV /
  JSON) and an optional category filter for export.
- The new dialogs delegate the actual work to the CLI tools under
  `tools/`, so the GUI and CLI share one implementation.

### Format details

- **Markdown (extended)** — adds `EN-EX:` / `DE-EX:` (with code-fence
  body), `RELATED:` and `SEE:` lines per term.
- **CSV** — RFC 4180 with header row, eight columns in the order
  `term, category, en_definition, de_definition, en_example,
  de_example, related_terms, see_also`. Multi-line cells via quoted
  fields with embedded newlines.
- **JSON** — top-level `{schema, exported, stats, terms[]}`. Within
  each term, `related_terms` and `see_also` are arrays of strings
  (joined to comma-separated TEXT for DB storage on import). Schema
  version: `tcltk-glossary/1.5`.

### Examples

- **`examples/welle-1-unicode.md`** / `.csv` / `.json` — 13 Unicode /
  encoding terms in all three formats, ready to import.

## 2026-05-14 — Analytics menu: per-category overview and export

### Added

- **`Analytics` menu** in the menu bar with three items:
    - **Categories overview…** — opens a window with a treeview
      listing all categories with their term count, bilingual-term
      count, and example-terms count, ordered by size. Multi-select
      (Ctrl / Shift-click) plus a double-click shortcut for export.
    - **Export selected category…** — combobox dialog to pick a
      single category, then standard format chooser and file dialog.
    - **Export multiple categories…** — listbox with multi-select,
      "Select all" / "Clear selection" helpers, then format chooser
      and file dialog.
- **Smart default filenames**: single category exports use the
  category name (sanitized); multi-category exports use
  `glossary-N-cats.md`.
- Reuses the existing `_export_md_standard` and
  `_export_md_importable` writers — output format is identical to
  full-database exports.

### Implementation

- New procs in `glossary_gui.tcl`:
  `show_analytics_categories`, `_ana_refresh_categories`,
  `_ana_export_categories_from_tv`, `export_one_category_dialog`,
  `export_multi_categories_dialog`, `_ana_all_categories`,
  `_ana_export_categories`.
- All counts computed via a single `GROUP BY category` query with
  `SUM(CASE WHEN …)` aggregates; one DB round-trip per refresh.
- Per-category filter is applied in Tcl after a single ordered
  fetch — keeps the query simple and avoids parameterized
  `IN (…)` lists in TDBC.

## 2026-05-14 — CLI: `--search TERM` for cross-app integration

### Added

- **`glossary_gui.tcl`** — new CLI option `--search TERM`. After app
  startup, fills the search field with TERM and triggers the FTS5
  search. Useful for cross-app calls via `tcldocs::launcher` from
  mdhelp or man-viewer ("Look up in glossary" context menu).
- **`--help`** / **`-h`** on the CLI — shows brief help and exits.

### Changed

- **argv parsing extended**: the positional argument (`<db-file>`)
  is still supported; in addition, proper option parsing with error
  messages on unknown options.

### Examples

```bash
wish glossary_gui.tcl                              # as before
wish glossary_gui.tcl glossary.db                  # explicit DB
wish glossary_gui.tcl --search foreach             # with pre-fill
wish glossary_gui.tcl glossary.db --search foreach # both
wish glossary_gui.tcl --help                       # help
```

## 2026-05-13 — Repo hygiene + roundtrip test

**Affected:** no code changes to GUI/TUI/tools. Documentation sync
and test infrastructure only.

### Added

- **`tests/test-roundtrip.tcl`** — verifies the export-import
  pipeline: exports `glossary.db` via `tools/export_full.tcl`,
  imports it through `tools/import_md.tcl` into a temporary DB, and
  compares term and category counts. Self-skipping when
  `tdbc::sqlite3` or the `sqlite3` CLI is missing (exit code 2).
  Background: review recommendation 2026-05-13 (Section 3.6:
  "verify the export pipeline in CI").

### Fixed

- **`.gitignore`** — absolute path `/home/greg/Project/...` as last
  line removed (had no effect anyway; gitignore patterns are always
  relative). Negation `*!doc/*.pdf` corrected to clean
  `!doc/*.pdf` and `!export/*.pdf` (previously `*!...` matched files
  with `!` in their name instead of negating).
- **`README.md`** term counts synchronized with the DB:
  `1324 terms / 122 categories` replaced throughout with
  `1681 terms / 137 categories` (DB state on 2026-05-13).
- **`README.md`** tools listing — `tools/migrate-1.5.sql` added
  (migration `UNIQUE(term)` → `UNIQUE(term, category)` from 1.4 to 1.5).

### Documentation

- **`README.md`** new **Tests** section with `test_tui.sh` and the
  new roundtrip test; file layout extended by `tests/`.

## 1.4 (2026-05-10)

### Added

- Backtick highlighting for `inline code` in displayed entries.
- Search-hit highlighting in the entry display when a term is opened
  via the search field.
- Persistent window geometry (window size + sash position), stored
  in `~/.glossary_manager.rc`.
- Two export profiles: standard human-readable Markdown, and an
  importable variant that round-trips through `tools/import_md.tcl`.
- Watch-cursor and status feedback during long export operations.
- About dialog updated with version, copyright, and license info.
- License footer in every Markdown export
  (CC BY 4.0 + Tcl License acknowledgments).
- Editable category combo box in the new/edit dialog (allows free-text
  entry of a new category alongside picking an existing one).
- Clickable "see also" entries (with `(n)` suffix filtered out for
  matching).
- New PDF tool `tools/glossary_to_pdf.tcl` — pure-Tcl pipeline
  Markdown → mdstack → DocIR → docir::pdf → PDF.
- `tools/export_full.tcl --for-docir` for docir-compatible Markdown.

### Changed

- All scripts moved to `tools/` for a cleaner repository layout.
- `test_tui.sh` made portable with `cd "$(dirname "$0")"`.
- TUI `gets stdin` calls hardened against EOF (Ctrl+D on stdin no
  longer raises an error).

### Fixed

- GUI database check used `info exists ::glossdb` which returned
  false because `::glossdb` is a TDBC command, not a variable. Open,
  Export, and Quit paths now use
  `[llength [info commands ::glossdb]]`.

### Data

- Database now contains 1324 terms in 122 categories.

## 1.3 (2025-10-12)

### Added

- Delete entries from the GUI (`Ctrl+D`) with confirmation dialog
  and treeview refresh.
- Clickable "related terms" hyperlinks. Clicking expands the
  category, selects the term, and updates the status bar.
- Markdown export of the complete glossary, structured by category,
  with code-fenced examples.

## 1.2 (2025-10-11)

### Added

- Edit dialog for new and existing terms.
- New term creation in the GUI (`Ctrl+N`).
- Edit term in the GUI (`Ctrl+E`, double-click).
- Field validation: required fields, unique check, error messages.
- Existing-categories dropdown.

### Fixed

- NULL-safe dictionary access in display routines.

## 1.1 (2025-10-11)

### Added

- Treeview with collapsible categories, replacing the flat listbox.
- Combobox for quick category selection.
- FTS5 full-text search with `AND`, `OR`, `NOT`, wildcards.
- Search-syntax help dialog (`F1`).
- Improved navigation (`Alt+Left` / `Alt+Right`).

### Fixed

- Prev/next navigation now compatible with the treeview model.

## 1.0.1 (2025-10-11)

### Changed

- Migration from `sqlite3` to `tdbc::sqlite3` across all five tools
  (import, two exports, GUI, TUI). API-compatible from the user's
  perspective; query latency increases by approximately 1 ms (TDBC
  abstraction overhead, negligible).
- Schema import now goes through the sqlite3 CLI to preserve TRIGGER
  definitions during creation.

See `doc/TDBC_MIGRATION.md` for details.

## 1.0 (2025-10-11) — Initial release

### Added

- SQLite3 database with structured term storage.
- GUI (Wish) with text-widget rendering for formatted display.
- TUI (Tclsh) for terminal / SSH use.
- Full-text search via FTS5.
- Category-based navigation.
- Markdown import.
- Two export modes: index (overview with three sample terms per
  category), and single-category export.
- Bilingual content model (English / German).
- 1315 terms across 121 categories at initial release.

## Version overview

| Version | Date       | Terms | Categories | Highlights                              |
|---------|------------|-------|------------|-----------------------------------------|
| 1.0     | 2025-10-11 | 1315  | 121        | GUI, TUI, import                        |
| 1.0.1   | 2025-10-11 | 1315  | 121        | TDBC migration                          |
| 1.1     | 2025-10-11 | 1315  | 121        | Treeview, combobox, FTS5                |
| 1.2     | 2025-10-11 | 1315  | 121        | Edit dialog                             |
| 1.3     | 2025-10-12 | 1315  | 121        | Delete, hyperlinks, MD export           |
| 1.4     | 2026-05-10 | 1324  | 122        | tools/, PDF pipeline, license footer    |
