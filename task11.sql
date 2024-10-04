-- Fetch the top 5 athletes who have won the most gold medals.

WITH t2 AS (SELECT DISTINCT `name`,noc, COUNT(medal) AS TotalGoldMedals
FROM athlete_events
WHERE medal= 'gold'
GROUP BY `name`
)
SELECT t2.*, region FROM t2 JOIN noc_regions
ON t2.noc =noc_regions.noc
ORDER BY TotalGoldMedals DESC
LIMIT 12;
-- NOT ONLY 5 BECAUSE THERE IS TIE