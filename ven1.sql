WITH t1 AS (
    SELECT 
         `NOC`,`sport`,
          COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
   COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
   COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze,
   COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
   
    GROUP BY sport, NOC
	HAVING total > 0
)
SELECT region, t1.* FROM t1
JOIN noc_regions
ON noc_regions.noc= t1.noc
WHERE region= 'Venezuela'
ORDER BY total DESC ;