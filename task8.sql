-- Fetch the total no of sports played in each olympic games.

SELECT games, COUNT(DISTINCT sport) AS TotalSports
FROM athlete_events
GROUP BY games
ORDER BY TotalSports DESC , games ;