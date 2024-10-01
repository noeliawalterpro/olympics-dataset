-- Mention the total no of nations who participated in 
-- each olympics game?;

SELECT 
    Games , COUNT( DISTINCT team) AS 'Participated Nations'
FROM
    athlete_events
GROUP BY games
ORDER BY COUNT( DISTINCT team) DESC ;


