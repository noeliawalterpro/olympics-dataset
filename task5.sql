-- Which nation has participated
-- in all of the olympic games?
WITH t1 AS (SELECT `team`, COUNT(DISTINCT `games`) AS CountColum
FROM athlete_events
GROUP BY `team`)

SELECT * FROM t1
WHERE CountColum = 51;
