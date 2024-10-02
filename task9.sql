-- Fetch details of the oldest athletes to win a gold medal.

SELECT  DISTINCT `name`,`age`, sex ,team, medal, games, sport,event FROM athlete_events
WHERE NOT age='NA' AND medal ='gold'
ORDER BY age DESC
LIMIT 10;