-- In which Sport/event, India has won highest medals.

WITH t1 AS (
    SELECT 
         `NOC`,`sport`,
        COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
    GROUP BY sport, NOC
)
SELECT region, sport, total FROM t1
JOIN noc_regions
ON noc_regions.noc= t1.noc
WHERE region= 'India'
ORDER BY total DESC 
LIMIT 1;