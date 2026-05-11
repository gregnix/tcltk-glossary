# Edit dialog guide

## Overview

The edit dialog handles both new term creation and editing of
existing terms. Single dialog, two modes.

## Features

### New term

- Opens via `Edit → New Term` (`Ctrl+N`)
- Empty form; `Save` button creates a new row
- Unique check on `term` field (rejects duplicates)
- Category combobox populated with existing categories;
  free-text entry of new category names is allowed

### Edit existing term

- Opens via `Edit → Edit Term` (`Ctrl+E`) or by double-clicking
  a term in the tree
- Pre-filled with the term's current values
- `Save` updates the existing row
- `Term` field stays editable; renaming is allowed (the unique
  check kicks in if you rename to an existing term name)

## Form fields

### Required

| Field           | Widget       | Notes                                |
|-----------------|--------------|--------------------------------------|
| Term            | Entry        | Unique. The natural key.             |
| Category        | Combobox     | Pick existing or type a new name.    |
| EN Definition   | Text         | Multi-line, plain.                   |
| DE Definition   | Text         | Multi-line, plain.                   |

### Optional

| Field           | Widget       | Notes                                |
|-----------------|--------------|--------------------------------------|
| EN Example      | Text         | Multi-line; rendered with code tag.  |
| DE Example      | Text         | Multi-line; rendered with code tag.  |
| Tcl version     | Entry        | Free-form (`8.6+`, `9.0`, `>=8.5`).  |
| Related terms   | Entry        | Comma-separated list of term names.  |
| See also        | Entry        | Free-form; supports `(n)` suffixes.  |
| Notes           | Text         | Multi-line; not rendered specially.  |

## Validation

### Required-field check

Save is rejected with a per-field error message if any required
field is empty.

### Uniqueness check

For new terms: the `term` value is checked against the database
before insert. Duplicate triggers an error dialog.

For edit: the unique check is skipped if the value is unchanged.
If the user renames to an existing term, the same duplicate check
applies.

## Workflow

### Create a new term

1. `Ctrl+N` opens the empty dialog.
2. Type the term name.
3. Pick a category from the combobox, or type a new one.
4. Fill EN and DE definitions.
5. Optional: examples, related terms, see-also, notes.
6. `Save`. Dialog closes; treeview refreshes; new term is
   selected.

### Edit an existing term

1. Select the term in the tree (or double-click).
2. `Ctrl+E` opens the dialog with values pre-filled.
3. Edit any field.
4. `Save`. Dialog closes; treeview refreshes; the term stays
   selected and the right pane re-renders.

## Category handling

### Existing category

Pick from the combobox dropdown. The list is the current set of
distinct categories in the database.

### New category

Type the name in the combobox. The combobox is editable. The
new category is created on save (no separate "create category"
step; categories are implicit, derived from the rows).

The category list in the tree refreshes after save.

## Keyboard shortcuts

| Shortcut       | Action                                |
|----------------|---------------------------------------|
| `Ctrl+S`       | Save and close                        |
| `Esc`          | Cancel (closes without save)          |
| `Tab`          | Move to next field                    |
| `Shift+Tab`    | Move to previous field                |
| `Ctrl+Enter`   | Insert newline in text widgets        |

## Tips

### Category consistency

Use `View → Categories` (or browse the combobox) before creating
a new category. Plural forms ("Widgets" vs "Widget"), case
("TclOO" vs "Tcloo"), and translation drift ("Befehle" vs
"Commands") are easy mistakes. The export tools sort by category
name — inconsistencies become visible there.

### Formatting definitions

Backticks render `inline code` in the display. Use them around
command names, option flags, file paths, anything you want to
visually distinguish.

```
Tcl mechanism for grouping commands and variables.
The `namespace eval` form ...
```

### Related terms

Comma-separated list. Do not include qualifying parentheses; the
display will prefix the names with the category. So:

```
related_terms: namespace eval, namespace which, variable
```

not

```
related_terms: namespace eval (Stack), variable (Scope)
```

The `(n)` suffix is reserved for "see also" cross-refs to
specific man-page sections (e.g. `proc(n)`).

### Examples

Both EN and DE examples are optional. If you only have one (e.g.
a code snippet that doesn't need translation), the other can stay
empty. The display omits empty fields.

## Error handling

### Dialog won't open

If `Ctrl+E` does nothing, no term is selected. Click a term in
the tree first.

### "Term already exists"

The unique check rejected the save. Either pick a different name,
or load the existing term and edit it instead.

### Old values still showing

After a save, the right pane re-renders from the database.
If you see stale values, the issue is in the refresh logic —
report a bug.

## Technical details

### TDBC SQL

Both insert and update go through TDBC parameter binding:

```tcl
set stmt [::glossdb prepare \
    "INSERT INTO terms (term, category, en_definition, ...)
     VALUES (:term, :category, :en_definition, ...)"]
$stmt execute
```

No string concatenation; injection-safe.

### Refresh

After save, the dialog calls back into the main window:

1. Refresh categories combobox (in case a new category was added).
2. Re-build the treeview (preserving expansion state).
3. Re-display the saved term in the right pane.

## FAQ

**Can I delete a term from the dialog?**
No. Use `Ctrl+D` from the main window.

**Can I move a term to a different category?**
Yes. Edit the term, change the Category field, save.

**What about bulk operations (batch import, mass edit)?**
Use `tools/import_md.tcl` for batch import. Mass edit isn't
supported in the GUI; use SQL on the database directly, or
edit a Markdown export and re-import.

## See also

- [Architecture](ARCHITECTURE.md) — overall system layout
- [Export guide](EXPORT_GUIDE.md) — how to export/re-import for
  bulk edits
- `glossary-gui(1)` manpage — full GUI reference
