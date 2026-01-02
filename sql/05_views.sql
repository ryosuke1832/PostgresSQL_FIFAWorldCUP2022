-- FIFA World Cup 2022 Database - Views
-- View: match_results_with_pk
--
-- Purpose:
-- - Aggregate match results per team, including penalty shootout goals ('PK') as separate counts.
-- - Provide a single view to query match results consistently.
--
-- Assumptions:
-- - PostgreSQL
-- - Goal table has: goal_id (PK), match_id, goalTime, player_lastname, player_surname
-- - Player table has: lastname, surname, nationality
-- - MatchParticipant has: match_id, nationality (team)
-- - Goal rows represent one scoring event (including PK shootout attempts that were scored)
-- 05_views.sql


DROP VIEW IF EXISTS match_results_with_pk;

CREATE VIEW match_results_with_pk AS
WITH team_goals AS (
    SELECT
        mp.match_id,
        mp.nationality,

        COUNT(g.goal_id) FILTER (
            WHERE p.lastname IS NOT NULL
              AND g.is_penalty_shootout = FALSE
        ) AS regular_goals,

        COUNT(g.goal_id) FILTER (
            WHERE p.lastname IS NOT NULL
              AND g.is_penalty_shootout = TRUE
        ) AS pk_goals

    FROM MatchParticipant mp
    LEFT JOIN Goal g
        ON g.match_id = mp.match_id
    LEFT JOIN Player p
        ON p.lastname = g.player_lastname
       AND p.surname  = g.player_surname
       AND p.nationality = mp.nationality   
    GROUP BY mp.match_id, mp.nationality
),
ranked AS (
    SELECT
        tg.*,
        ROW_NUMBER() OVER (PARTITION BY tg.match_id ORDER BY tg.nationality) AS rn
    FROM team_goals tg
)
SELECT
    m.match_id,
    m.round,
    m.date,

    t1.nationality AS team1,
    t1.regular_goals AS team1_goals,
    t1.pk_goals AS team1_pk,

    t2.pk_goals AS team2_pk,
    t2.regular_goals AS team2_goals,
    t2.nationality AS team2,

    CASE
        WHEN (t1.regular_goals + t1.pk_goals) > (t2.regular_goals + t2.pk_goals) THEN t1.nationality
        WHEN (t2.regular_goals + t2.pk_goals) > (t1.regular_goals + t1.pk_goals) THEN t2.nationality
        ELSE 'Draw'
    END AS winner

FROM Match m
JOIN ranked t1 ON t1.match_id = m.match_id AND t1.rn = 1
JOIN ranked t2 ON t2.match_id = m.match_id AND t2.rn = 2
ORDER BY m.date, m.match_id;
