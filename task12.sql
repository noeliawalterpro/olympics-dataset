-- Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).

SELECT DISTINCT `name`,`team`, COUNT(medal) AS TotalMedals
FROM athlete_events
WHERE NOT medal='NA'
GROUP BY `name`
ORDER BY TotalMedals DESC,`name`  
LIMIT 7;
-- NOT ONLY 5 BECAUSE THERE IS TIE
