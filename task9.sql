-- Fetch details of the oldest athletes to win a gold medal.

SELECT  DISTINCT `name`,`age`, sex , medal, games, sport FROM athlete_events
WHERE NOT age='NA' AND medal ='gold'
ORDER BY age DESC
LIMIT 10;