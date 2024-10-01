-- Which year saw the highest and 
-- lowest no of countries participating in olympics?
WITH t1 AS (SELECT games, COUNT( DISTINCT team) AS teamsCount 
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
 
