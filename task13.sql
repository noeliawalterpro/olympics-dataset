-- Fetch the top 5 most successful countries in olympics. 
-- Success is defined by no of medals won.

SELECT DISTINCT `team`, COUNT(medal) AS TotalMedals
FROM athlete_events
WHERE NOT medal='NA'
GROUP BY `team`
ORDER BY TotalMedals DESC,`name`  
LIMIT 5;
-- NOT ONLY 5 BECAUSE THERE IS TIE