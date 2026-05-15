## 2026-05-15 — Fix: export tools crash on NULL fields (proper SQL fix)

### Fixed

- **`tools/export_md.tcl`**, **`tools/export_csv.tcl`**,
  **`tools/export_json.tcl`** — earlier attempt to use TDBC's
  `-nullvalue ""` option failed because that flag is not supported
  on all TDBC builds (`bad option "-nullvalue": must be -as or
  -columnsvariable`).

  Replaced with SQL-level `COALESCE(col, '')` for the six
  nullable text columns (en_definition, de_definition,
  en_example, de_example, related_terms, see_also). Works with
  any TDBC version and any TDBC driver — the database returns
  empty strings, so every row dict always has all eight keys.
