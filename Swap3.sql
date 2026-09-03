
Question:
Given TAB1 and TAB2, write an SQL query to select
the data from TAB1 that does not exist in TAB2.

Requirement:
- Do NOT use the "NOT" keyword.
- Expected result: B, D

========================================================
*/


-- ======================================================
-- 1. DROP TABLES IF THEY ALREADY EXIST
-- ======================================================

DROP TABLE IF EXISTS TAB1;
DROP TABLE IF EXISTS TAB2;


-- ======================================================
-- 2. CREATE TAB1
-- ======================================================

CREATE TABLE TAB1 (
    C1 VARCHAR(10)
);


-- ======================================================
-- 3. INSERT DATA INTO TAB1
-- ======================================================

INSERT INTO TAB1 (C1)
VALUES
    ('A'),
    ('B'),
    ('C'),
    ('D'),
    ('E');


-- ======================================================
-- 4. CREATE TAB2
-- ======================================================

CREATE TABLE TAB2 (
    C1 VARCHAR(10)
);


-- ======================================================
-- 5. INSERT DATA INTO TAB2
-- ======================================================

INSERT INTO TAB2 (C1)
VALUES
    ('A'),
    ('C'),
    ('E'),
    ('G');


-- ======================================================
-- 6. CHECK TAB1
-- ======================================================

SELECT *
FROM TAB1;


-- ======================================================
-- 7. CHECK TAB2
-- ======================================================

SELECT *
FROM TAB2;


-- ======================================================
-- 8. SOLUTION
-- ======================================================
-- Find values that exist in TAB1 but don't exist in TAB2.
--
-- We are NOT using the NOT keyword.
--
-- LEFT JOIN keeps all records from TAB1.
-- If there is no matching record in TAB2,
-- TAB2.C1 will be NULL.
-- Therefore, we filter using IS NULL.

SELECT t1.C1
FROM TAB1 AS t1
LEFT JOIN TAB2 AS t2
    ON t1.C1 = t2.C1
WHERE t2.C1 IS NULL;


-- ======================================================
-- EXPECTED OUTPUT
-- ======================================================
--
-- C1
-- ---
-- B
-- D
--
-- ======================================================
