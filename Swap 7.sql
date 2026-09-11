-- ============================================================
-- EXTRACT FIRST NAME, MIDDLE NAME, LAST NAME AND DOMAIN NAME
-- FROM EMAIL ID
-- ============================================================

SELECT
    SUBSTR(
        MAIL_ID,
        1,
        INSTR(MAIL_ID, '.') - 1
    ) AS FIRST_NAME,

    SUBSTR(
        MAIL_ID,
        INSTR(MAIL_ID, '.') + 1,
        INSTR(MAIL_ID, '.', 1, 2) - INSTR(MAIL_ID, '.') - 1
    ) AS MIDDLE_NAME,

    SUBSTR(
        MAIL_ID,
        INSTR(MAIL_ID, '.', 1, 2) + 1,
        INSTR(MAIL_ID, '@') - INSTR(MAIL_ID, '.', 1, 2) - 1
    ) AS LAST_NAME,

    SUBSTR(
        MAIL_ID,
        INSTR(MAIL_ID, '@') + 1
    ) AS DOMAIN_NAME

FROM MAIL;
