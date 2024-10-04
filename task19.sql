-- In which Sport/event, India has won highest medals.

WITH t1 AS (
    SELECT 
         `NOC`,`sport`, event,
        COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
    GROUP BY sport, event, NOC
)
SELECT region,t1.* FROM t1
JOIN noc_regions
ON noc_regions.noc= t1.noc
WHERE region= 'India'
ORDER BY total DESC 
LIMIT 1;