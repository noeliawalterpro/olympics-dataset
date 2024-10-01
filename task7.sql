-- Which Sports were just played only once in the olympics?


WITH t1 AS (SELECT  sport, games, COUNT(DISTINCT  games) AS CountGames
FROM athlete_events
GROUP BY  sport)
SELECT t1.sport,t1.games FROM t1 
WHERE t1.CountGames=1;