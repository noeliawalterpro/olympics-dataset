-- List down all Olympics games held so far
-- with columns year, season, city.

SELECT  year, season, city 
FROM athlete_events
GROUP BY games
ORDER BY year;