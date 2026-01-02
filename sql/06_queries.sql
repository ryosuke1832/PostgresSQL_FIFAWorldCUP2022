-- FIFA World Cup 2022 Database - Query Examples
-- Course: 5 Assessment, 2025
-- Author: Ryosuke Yamamoto
-- Student ID: 25115611
-- Data source: FIFA World Cup 2022 (fifa.com)
--
-- Note:
-- - Some queries include NATURAL JOIN as a coursework example.
-- - In production, explicit JOIN conditions are generally preferred for safety and readability.

-- =========================================
-- 1) Simple query: list teams ordered by FIFA rank
-- =========================================
SELECT
    FIFA_rank,
    nationality
FROM NationalTeam
ORDER BY FIFA_rank;

-- =========================================
-- 2) NATURAL JOIN example (coursework)
-- Warning: NATURAL JOIN can be risky in production because join keys depend on column names.
-- =========================================
SELECT
    Player.lastname,
    Player.surname,
    Player.position,
    Player.height
FROM Player
NATURAL JOIN NationalTeam
WHERE NationalTeam.nationality = 'Australia';

-- =========================================
-- 3) Explicit join version of (2) (recommended style)
-- =========================================
SELECT
    p.lastname,
    p.surname,
    p.position,
    p.height
FROM Player p
JOIN NationalTeam nt
    ON p.nationality = nt.nationality
WHERE nt.nationality = 'Australia';

-- =========================================
-- 4) Group By: count goals per team (excluding penalty shootout 'PK')
-- =========================================
SELECT
    p.nationality,
    COUNT(*) AS total_goals
FROM Goal g
JOIN Player p
    ON g.player_lastname = p.lastname
   AND g.player_surname  = p.surname
WHERE g.goalTime <> 'PK'
GROUP BY p.nationality
ORDER BY total_goals DESC, p.nationality;

-- =========================================
-- 5) Subquery: players with goals above the average (excluding penalty shootout 'PK')
-- =========================================
SELECT
    p.lastname,
    p.surname,
    p.nationality,
    COUNT(*) AS goal_count
FROM Goal g
JOIN Player p
    ON g.player_lastname = p.lastname
   AND g.player_surname  = p.surname
WHERE g.goalTime <> 'PK'
GROUP BY p.lastname, p.surname, p.nationality
HAVING COUNT(*) > (
    SELECT AVG(player_goals.goal_count)
    FROM (
        SELECT COUNT(*) AS goal_count
        FROM Goal g2
        JOIN Player p2
            ON g2.player_lastname = p2.lastname
           AND g2.player_surname  = p2.surname
        WHERE g2.goalTime <> 'PK'
        GROUP BY p2.lastname, p2.surname
    ) AS player_goals
)
ORDER BY goal_count DESC, p.nationality, p.lastname, p.surname;

-- =========================================
-- 6) Self/Cross join: all unique team combinations within each group
-- (Not easily expressed via NATURAL JOIN; explicit logic is clearer)
-- =========================================
SELECT
    team1.nationality AS team1,
    team2.nationality AS team2,
    team1.group_name  AS group_name
FROM NationalTeam team1
CROSS JOIN NationalTeam team2
WHERE team1.group_name = team2.group_name
  AND team1.nationality < team2.nationality
ORDER BY team1.group_name, team1.nationality, team2.nationality;
