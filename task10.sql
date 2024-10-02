-- 10. Find the Ratio of male and female athletes 
-- participated in all olympic games.
 WITH t1 AS (SELECT `sex`, COUNT(DISTINCT `name`) AS SumAthletes 
FROM athlete_events 
GROUP BY `sex`),
t2 AS (SELECT `sex`, COUNT(DISTINCT `name`) AS Athletes 
FROM athlete_events
WHERE sex='F'
GROUP BY `sex`
)
-- MALE/FEMALE
 SELECT DISTINCT t1.sex , CONCAT('1:',t1.SumAthletes/t2.Athletes) AS Ratio
FROM t1,t2
WHERE t1.sex='M'
GROUP BY `sex`
ORDER BY `sex`; 

