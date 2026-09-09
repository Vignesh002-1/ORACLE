-- ============================================================
-- PRINT NUMBERS FROM 1 TO N
-- Oracle SQL
-- ============================================================

SELECT LEVEL AS NUMBER_VALUE
FROM DUAL
CONNECT BY LEVEL <= &N;
