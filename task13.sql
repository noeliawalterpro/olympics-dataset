-- Fetch the top 5 most successful countries in olympics. 
-- Success is defined by no of medals won.

WITH t1 AS (SELECT DISTINCT noc, COUNT(medal) AS TotalMedals
FROM athlete_events
WHERE NOT medal='NA'
GROUP BY noc
)
SELECT region, t1.* FROM t1
JOIN noc_regions 
ON noc_regions.noc = t1.noc
ORDER BY TotalMedals DESC
LIMIT 5;
