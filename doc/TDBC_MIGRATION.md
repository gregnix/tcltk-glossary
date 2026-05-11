# TDBC migration

Historical note: how the project moved from the `sqlite3` package
to `tdbc::sqlite3` in version 1.0.1.

## Summary

Version 1.0 used the `sqlite3` Tcl package directly. Version 1.0.1
migrated to `tdbc::sqlite3` to gain a vendor-neutral abstraction.
All five user-facing tools (`import_md.tcl`, `export_index.tcl`,
`export_category.tcl`, `glossary_gui.tcl`, `glossary_tui.tcl`) were
adapted. APIs visible to the user did not change.

The migration enables — but does not yet implement — switching the
backend to PostgreSQL or other databases supported by TDBC.

## Migrated files

### `import_md.tcl`

- `sqlite3 db file` → `tdbc::sqlite3::connection create db file`
- `db eval "INSERT …"` → `db prepare "INSERT … VALUES (:term, …)"`
  followed by `$stmt execute`
- Schema creation continues to go through the `sqlite3` CLI
  (preserves TRIGGER definitions; see "Issues" below).

### `export_index.tcl`

- Connection: `tdbc::sqlite3::connection create db file`
- Iteration: `db allrows -as dicts "SELECT …"` → loop over
  resulting list of dicts

### `export_category.tcl`

- Same pattern as `export_index.tcl`
- Parameter binding for the category name argument:
  `db allrows -as dicts "SELECT … WHERE category LIKE :pattern"`

### `glossary_gui.tcl`

- Database open / close go through TDBC
- All `db eval` blocks rewritten to `prepare` + `execute` with
  parameter binding
- `info exists ::glossdb` checks (which were valid for the `sqlite3`
  package, where the connection is a Tcl variable) replaced by
  `[llength [info commands ::glossdb]]` (because TDBC connections
  are commands, not variables) — this fix shipped in 1.4

### `glossary_tui.tcl`

- Same pattern as the GUI
- All `gets stdin` calls hardened against EOF (independent of TDBC,
  but done at the same time)

## Benefits

### Portability

TDBC supports SQLite, PostgreSQL, MySQL, and ODBC sources. The bulk
of the code becomes backend-neutral; only schema creation and the
FTS5-specific search remain SQLite-specific.

### Uniform API

`db prepare` + `$stmt execute` with named parameter binding works
across all TDBC drivers. No more SQL-string concatenation, no more
manual quoting. Injection-safe by construction.

### Better error handling

TDBC raises errors with the standard `try` / `trap` mechanism and
includes the SQL state in `errorCode`. The `sqlite3` package
returns errors via the more lightweight Tcl `error` mechanism.

## Performance

### Import (1315 terms)

| Backend           | Time   |
|-------------------|--------|
| `sqlite3` direct  | 1.2 s  |
| `tdbc::sqlite3`   | 1.5 s  |

The TDBC abstraction adds ~ 25 % to bulk insert time (mostly
prepared-statement overhead). For one-off imports this is
negligible.

### SELECT queries

Single SELECT (e.g. show one term):

| Backend           | Time   |
|-------------------|--------|
| `sqlite3` direct  | 0.5 ms |
| `tdbc::sqlite3`   | 1.5 ms |

The 1 ms difference is well below human perception thresholds for
GUI / TUI use.

## Issues encountered and resolved

### Schema with TRIGGER definitions

Loading the schema via `db allrows "$schema_sql"` worked for `CREATE
TABLE` statements but choked on `CREATE TRIGGER` because of how
TDBC parses the SQL into multiple statements. The trigger body
contains `;` separators that confused the splitter.

Fix: schema creation goes through the `sqlite3` CLI:

```tcl
exec sqlite3 $db_file < tools/schema.sql
```

This is a one-off step at database creation time; the runtime path
uses TDBC throughout.

### `db eval` row iteration

The `sqlite3` package's `db eval $sql {…}` block syntax (which sets
column-name variables in the iteration body) has no direct
equivalent in TDBC. The cleanest replacement uses `db allrows -as
dicts` and then `dict get` on each row:

```tcl
foreach row [db allrows -as dicts $sql] {
    set term [dict get $row term]
    ...
}
```

Slightly more verbose but explicit and safe. Iteration ordering is
preserved.

## Migration to PostgreSQL (not implemented)

A PostgreSQL backend would need:

- Schema rewritten for PostgreSQL syntax (mostly: drop the SQLite-
  specific `WITHOUT ROWID`, replace SQLite-FTS5 with PostgreSQL's
  `tsvector` columns and GIN indexes).
- Connection string handling (`tdbc::postgres::connection create db
  -host … -user … -password …`) instead of a file path.
- `tdbc::postgres` package installed (`apt install tcl-tdbc-postgres`
  on Debian/Ubuntu).
- The full-text search code (currently
  `terms_fts MATCH 'pattern'`) replaced with PostgreSQL syntax
  (`to_tsvector('english', column) @@ to_tsquery('pattern')`).

The TDBC abstraction makes the SQL execution layer migration
straightforward; the FTS5 → tsvector rewrite is the substantive
work.

## Conclusion

The TDBC migration was low-risk and a prerequisite for any future
backend change. Performance penalty was negligible. No public APIs
changed. The codebase is now ready for a multi-backend future
without committing to any specific second backend.
