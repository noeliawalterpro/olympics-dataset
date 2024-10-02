-- Fetch the top 5 athletes who have won the most gold medals.

SELECT DISTINCT `name`,`team`, COUNT(medal) AS TotalGoldMedals
FROM athlete_events
WHERE medal= 'gold'
GROUP BY `name`
ORDER BY TotalGoldMedals DESC
LIMIT 12;
-- NOT ONLY 5 BECAUSE THERE IS TIE