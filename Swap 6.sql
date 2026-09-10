-- ============================================================
-- PRINT THE STRING "WELCOME" IN 6 DIFFERENT FORMATS
-- Oracle SQL
-- ============================================================

SELECT
    -- OUTPUT 1: Print each character from left to right
    SUBSTR('WELCOME', LEVEL, 1) AS OUTPUT1,

    -- OUTPUT 2: Print each character from right to left
    SUBSTR('WELCOME', 8 - LEVEL, 1) AS OUTPUT2,

    -- OUTPUT 3: Print characters increasing from the left
    SUBSTR('WELCOME', 1, LEVEL) AS OUTPUT3,

    -- OUTPUT 4: Print characters decreasing from the left
    SUBSTR('WELCOME', LEVEL) AS OUTPUT4,

    -- OUTPUT 5: Print decreasing string with right alignment
    LPAD(SUBSTR('WELCOME', LEVEL), 7) AS OUTPUT5,

    -- OUTPUT 6: Print increasing string with right alignment
    LPAD(SUBSTR('WELCOME', 1, LEVEL), 7) AS OUTPUT6

FROM DUAL
CONNECT BY LEVEL <= LENGTH('WELCOME');
