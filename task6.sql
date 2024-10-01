-- Identify the sport which was played in all summer olympics.
WITH t1 AS (SELECT  sport, COUNT( distinct  games) AS totalOfGames 
FROM athlete_events
GROUP BY  sport
ORDER BY totalOfGames DESC
LIMIT 1),
t2 AS (
SELECT DISTINCT sport, COUNT(DISTINCT  games) AS CountGames
FROM athlete_events 
GROUP BY  sport)
SELECT t2.sport, t2.CountGames FROM t1,t2
WHERE t2.CountGames=(t1.totalOfGames);
