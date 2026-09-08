-- ============================================================
-- CRICKET TEAM STATISTICS
-- Find:
-- 1. Number of matches played by each team
-- 2. Number of matches won by each team
-- 3. Number of matches lost by each team
-- ============================================================

SELECT
    TEAM_NAME,
    COUNT(*) AS MATCHES_PLAYED,

    SUM(
        CASE
            WHEN WINNER = TEAM_NAME THEN 1
            ELSE 0
        END
    ) AS MATCHES_WON,

    SUM(
        CASE
            WHEN WINNER <> TEAM_NAME THEN 1
            ELSE 0
        END
    ) AS MATCHES_LOST

FROM
(
    -- TEAM_A matches
    SELECT
        TEAM_A AS TEAM_NAME,
        WINNER
    FROM CRICKET

    UNION ALL

    -- TEAM_B matches
    SELECT
        TEAM_B AS TEAM_NAME,
        WINNER
    FROM CRICKET
)

GROUP BY TEAM_NAME
ORDER BY TEAM_NAME;
