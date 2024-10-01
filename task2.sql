-- List down all Olympics games held so far
-- with columns year, season, city.

SELECT  year,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(  
games,'0',''),'1',''),'2',''),'3',''),'4',''),'5',''),'6',''),'7',''),'8',''),'9','')
       AS Season, city 
FROM athlete_events
GROUP BY games
ORDER BY year;