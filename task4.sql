-- Which year saw the highest and 
-- lowest no of countries participating in olympics?
WITH t1 AS (SELECT games, COUNT( DISTINCT NOC) AS teamsCount 
FROM athlete_events
GROUP BY games
)
 (SELECT * FROM t1
 ORDER BY teamsCount 
 LIMIT 1)
 UNION
  ( SELECT * FROM t1
 ORDER BY teamsCount  DESC
 LIMIT 1 );
 
SELECT games, NOC
FROM athlete_events
WHERE games LIKE '1896%'
GROUP BY NOC;

SELECT games, NOC 
FROM athlete_events
WHERE games LIKE '2016%'
GROUP BY NOC;