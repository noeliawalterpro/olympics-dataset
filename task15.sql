-- List down total gold, silver and broze medals won 
-- by each country corresponding to each olympic games.                    

-- List down total gold, silver
-- and broze medals won by each country.

SELECT 
    `games`,`NOC`,
   COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
   COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
   COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze
FROM athlete_events
GROUP BY games, NOC
ORDER BY games DESC, gold DESC, silver DESC, bronze DESC;

