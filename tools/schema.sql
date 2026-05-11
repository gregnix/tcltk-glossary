-- Tcl/Tk Glossary Database Schema
-- Version: 1.5
-- Encoding: UTF-8
--
-- Change in 1.5: UNIQUE constraint moved from (term) to (term, category)
-- so the same term name can exist in multiple categories (e.g.
-- destroy/TclOO and destroy/Tk-Core).

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS terms (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    term TEXT NOT NULL,
    category TEXT NOT NULL,
    en_definition TEXT,
    de_definition TEXT,
    en_example TEXT,
    de_example TEXT,
    tcl_version TEXT,
    related_terms TEXT,
    see_also TEXT,
    notes TEXT,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP,
    updated_at TEXT DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(term, category)
);

CREATE INDEX IF NOT EXISTS idx_term       ON terms(term);
CREATE INDEX IF NOT EXISTS idx_category   ON terms(category);
CREATE INDEX IF NOT EXISTS idx_term_lower ON terms(LOWER(term));
CREATE INDEX IF NOT EXISTS idx_term_cat   ON terms(term, category);

CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    parent_category TEXT,
    sort_order INTEGER DEFAULT 0
);

CREATE VIRTUAL TABLE IF NOT EXISTS terms_fts USING fts5(
    term,
    en_definition,
    de_definition,
    content='terms',
    content_rowid='id'
);

CREATE TRIGGER IF NOT EXISTS terms_ai AFTER INSERT ON terms BEGIN
    INSERT INTO terms_fts(rowid, term, en_definition, de_definition)
    VALUES (new.id, new.term, new.en_definition, new.de_definition);
END;

CREATE TRIGGER IF NOT EXISTS terms_ad AFTER DELETE ON terms BEGIN
    DELETE FROM terms_fts WHERE rowid = old.id;
END;

CREATE TRIGGER IF NOT EXISTS terms_au AFTER UPDATE ON terms BEGIN
    UPDATE terms_fts SET
        term = new.term,
        en_definition = new.en_definition,
        de_definition = new.de_definition
    WHERE rowid = new.id;
END;

CREATE TRIGGER IF NOT EXISTS terms_update AFTER UPDATE ON terms BEGIN
    UPDATE terms SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

CREATE VIEW IF NOT EXISTS stats AS
SELECT
    COUNT(*) AS total_terms,
    COUNT(DISTINCT category) AS total_categories,
    COUNT(CASE WHEN en_definition IS NOT NULL AND de_definition IS NOT NULL THEN 1 END) AS bilingual_terms,
    COUNT(CASE WHEN en_example IS NOT NULL OR de_example IS NOT NULL THEN 1 END) AS terms_with_examples
FROM terms;
