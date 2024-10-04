-- List down total gold, silver
-- and broze medals won by each country.

with t1 AS (SELECT 
  `NOC`,
   COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
   COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
   COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze
FROM athlete_events
GROUP BY `NOC`
)
SELECT region, t1.* FROM t1 
JOIN noc_regions 
ON t1.noc = noc_regions.noc
ORDER BY gold DESC, silver DESC, bronze DESC;

