-- Which nation has participated
-- in all of the olympic games?
WITH t1 AS (SELECT team, COUNT(DISTINCT games) AS CountColum
FROM athlete_events
GROUP BY team),
t2 AS (SELECT COUNT(DISTINCT games) AS Games_Held FROM athlete_events)
SELECT t1.team, t1.CountColum
FROM t1, t2
WHERE t1.CountColum = t2.Games_Held;
