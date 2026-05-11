-- Migration: change terms.UNIQUE(term) to UNIQUE(term, category)

PRAGMA foreign_keys = OFF;

BEGIN TRANSACTION;

-- 1. Drop all dependents of 'terms'
DROP VIEW    IF EXISTS stats;
DROP TRIGGER IF EXISTS terms_ai;
DROP TRIGGER IF EXISTS terms_ad;
DROP TRIGGER IF EXISTS terms_au;
DROP TRIGGER IF EXISTS terms_update;
DROP TABLE   IF EXISTS terms_fts;

-- 2. Build new table with compound UNIQUE
CREATE TABLE terms_new (
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

INSERT INTO terms_new
    (id, term, category, en_definition, de_definition,
     en_example, de_example, tcl_version, related_terms, see_also, notes,
     created_at, updated_at)
SELECT id, term, category, en_definition, de_definition,
       en_example, de_example, tcl_version, related_terms, see_also, notes,
       created_at, updated_at
FROM terms;

DROP TABLE terms;
ALTER TABLE terms_new RENAME TO terms;

-- 3. Indexes
CREATE INDEX IF NOT EXISTS idx_term       ON terms(term);
CREATE INDEX IF NOT EXISTS idx_category   ON terms(category);
CREATE INDEX IF NOT EXISTS idx_term_lower ON terms(LOWER(term));
CREATE INDEX IF NOT EXISTS idx_term_cat   ON terms(term, category);

-- 4. FTS5 + triggers
CREATE VIRTUAL TABLE terms_fts USING fts5(
    term, en_definition, de_definition,
    content='terms', content_rowid='id'
);

INSERT INTO terms_fts(rowid, term, en_definition, de_definition)
SELECT id, term, en_definition, de_definition FROM terms;

CREATE TRIGGER terms_ai AFTER INSERT ON terms BEGIN
    INSERT INTO terms_fts(rowid, term, en_definition, de_definition)
    VALUES (new.id, new.term, new.en_definition, new.de_definition);
END;

CREATE TRIGGER terms_ad AFTER DELETE ON terms BEGIN
    DELETE FROM terms_fts WHERE rowid = old.id;
END;

CREATE TRIGGER terms_au AFTER UPDATE ON terms BEGIN
    UPDATE terms_fts SET
        term = new.term,
        en_definition = new.en_definition,
        de_definition = new.de_definition
    WHERE rowid = new.id;
END;

CREATE TRIGGER terms_update AFTER UPDATE ON terms BEGIN
    UPDATE terms SET updated_at = CURRENT_TIMESTAMP WHERE id = NEW.id;
END;

-- 5. Re-create stats view
CREATE VIEW stats AS
SELECT
    COUNT(*) AS total_terms,
    COUNT(DISTINCT category) AS total_categories,
    COUNT(CASE WHEN en_definition IS NOT NULL AND de_definition IS NOT NULL THEN 1 END) AS bilingual_terms,
    COUNT(CASE WHEN en_example IS NOT NULL OR de_example IS NOT NULL THEN 1 END) AS terms_with_examples
FROM terms;

COMMIT;

PRAGMA foreign_keys = ON;
