-- Break down all olympic games where india won 
-- medal for Hockey and how many medals in each olympic games.


WITH t1 AS (
    SELECT 
         games,sport,`NOC`,
        COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
    WHERE sport = 'Hockey'
    GROUP BY games,sport, NOC
)
SELECT region, sport ,games, total FROM t1
JOIN noc_regions
ON noc_regions.noc= t1.noc
WHERE region= 'India' AND total > 0
ORDER BY total DESC ;