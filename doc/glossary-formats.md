# Glossary Import/Export Formats

The `tcltk-glossary` database can be imported from and exported to three
formats, each chosen for a different use case.

| Format | Use case | Tool |
|--------|----------|------|
| **Markdown** (`.md`) | Documentation, GitHub rendering, viewing in `mdhelp`. | `tools/import_md.tcl`, `tools/export_md.tcl` |
| **CSV** (`.csv`) | Spreadsheet editing (LibreOffice, Excel), bulk data fixes. | `tools/import_csv.tcl`, `tools/export_csv.tcl` |
| **JSON** (`.json`) | Round-trip backup, scripted processing, cross-tool exchange. | `tools/import_json.tcl`, `tools/export_json.tcl` |

JSON is the **primary** round-trip format — only it preserves all eight
schema fields without loss. Markdown and CSV are lossless in practice but
require careful escaping for newlines inside example fields.

## Schema fields

All formats represent the same eight columns of the `terms` table:

| Column | Type | Description |
|--------|------|-------------|
| `term` | TEXT | Term identifier. UNIQUE per category. |
| `category` | TEXT | Category name (bilingual, e.g. `Tcl-Konzepte / Tcl Concepts`). |
| `en_definition` | TEXT | English definition. |
| `de_definition` | TEXT | German definition. |
| `en_example` | TEXT | English code example (may be empty, may be multi-line). |
| `de_example` | TEXT | German code example. |
| `related_terms` | TEXT | Comma-separated list of related terms. |
| `see_also` | TEXT | Comma-separated list of manpage references. |

---

## 1. Markdown format

Backward-compatible with the original 4-field import: existing files
without `EN-EX` / `DE-EX` / `RELATED` / `SEE` lines still import correctly,
with empty values for the new fields.

### Syntax

```markdown
## <Category name>

**<term>**
- EN: <english definition, single line>
- DE: <german definition, single line>
- EN-EX:
` ` `tcl
<multi-line example>
` ` `
- DE-EX:
` ` `tcl
<multi-line example>
` ` `
- RELATED: <term1>, <term2>, <term3>
- SEE: <ref1>, <ref2>
```

(Backticks shown spaced for clarity — write them tight: ` ``` `.)

### Rules

- **Category header**: line starting with `## ` introduces a category.
  Special headings `## License` and `## Acknowledgments` are skipped
  (used as footer in full exports).
- **Term header**: a line `**<term>**` introduces a new term in the
  current category.
- **Definitions**: lines starting with `- EN: ` or `- DE: ` give
  single-line definitions.
- **Examples**: lines starting with `- EN-EX:` or `- DE-EX:` start an
  example block. The example body is the content of the next fenced
  code block (` ``` ` or `~~~`). The optional language tag (e.g. `tcl`)
  is preserved on export but ignored on import.
- **Cross-references**: `- RELATED: a, b, c` and `- SEE: x, y` give
  comma-separated lists.

### Minimal example (single term, single-line example inline)

```markdown
## Kontrollstrukturen / Control Structures

**foreach**
- EN: Iterates over one or more lists.
- DE: Iteriert über eine oder mehrere Listen.
- EN-EX:
` ` `tcl
foreach x {a b c} { puts $x }
` ` `
- RELATED: for, while, lmap
- SEE: foreach(n)
```

---

## 2. CSV format

RFC 4180-compliant CSV with header row. Multi-line example fields are
quoted with double-quotes; embedded double-quotes are doubled.

### Columns (in order)

```
term,category,en_definition,de_definition,en_example,de_example,related_terms,see_also
```

### Example

```csv
term,category,en_definition,de_definition,en_example,de_example,related_terms,see_also
foreach,"Kontrollstrukturen / Control Structures","Iterates over one or more lists.","Iteriert über eine oder mehrere Listen.","foreach x {a b c} { puts $x }",,"for, while, lmap","foreach(n)"
```

Multi-line cells use real newlines inside the quoted field, per
RFC 4180. LibreOffice, Excel, Pandas, `csvkit`, `tcllib::csv` all
handle this correctly.

---

## 3. JSON format

The **primary round-trip format**. Versioned via the `schema` field.

### Top-level structure

```json
{
  "schema": "tcltk-glossary/1.5",
  "exported": "2026-05-15T03:42:00Z",
  "stats": {
    "terms": 1681,
    "categories": 137
  },
  "terms": [
    {
      "term": "foreach",
      "category": "Kontrollstrukturen / Control Structures",
      "en_definition": "Iterates over one or more lists.",
      "de_definition": "Iteriert über eine oder mehrere Listen.",
      "en_example": "foreach x {a b c} { puts $x }",
      "de_example": "",
      "related_terms": ["for", "while", "lmap"],
      "see_also": ["foreach(n)"]
    }
  ]
}
```

### Field notes

- `schema` is checked by the importer. Currently accepted:
  `tcltk-glossary/1.5`. Future versions add new fields; the importer
  will accept newer minor versions and ignore unknown fields.
- `related_terms` and `see_also` are **arrays of strings** in JSON,
  but stored as comma-separated strings in the database (consistent
  with the current schema). The importer joins; the exporter splits
  on commas (whitespace-trimmed).
- Multi-line examples use real `\n` characters (JSON escapes).
- `stats` is informational — not enforced by the importer.

### Why rl_json

The `rl_json` extension is used for both reading and writing. It is
significantly faster than scripted parsing, handles Unicode and
multi-line strings correctly, and is already part of the
documentation suite.

---

## Comparison: which format when?

| Need | Use |
|------|-----|
| "Quick look at the glossary on GitHub" | Markdown |
| "Edit 50 terms in a spreadsheet" | CSV |
| "Backup the entire DB and restore later" | JSON |
| "Diff two snapshots" | JSON (with `jq`) or CSV |
| "Pipeline to another language (Python, JS)" | JSON |
| "Generate documentation from the glossary" | Markdown |
| "Migrate to a different DB engine" | JSON or CSV |

---

## Round-trip guarantee

Exporting a database to JSON and re-importing into a fresh database
must produce a database with the same term and category counts and
identical field contents. This is tested by `tests/test-roundtrip-json.tcl`.

Markdown and CSV are also round-trip stable for normal data, but
edge cases (terms containing the exact string ` ``` ` in markdown,
or terms with embedded NUL bytes in CSV) may need format-specific
escaping. Use JSON when in doubt.
