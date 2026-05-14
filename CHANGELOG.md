# tcltk-glossary — Changelog

The format is loosely based on
[Keep a Changelog](https://keepachangelog.com/).

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
