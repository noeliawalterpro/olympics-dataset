-- Which nation has participated
-- in all of the olympic games?
WITH t1 AS (SELECT noc, COUNT(DISTINCT games) AS CountColum
FROM athlete_events
GROUP BY noc),
t2 AS (SELECT COUNT(DISTINCT games) AS Games_Held 
FROM athlete_events),
t3 AS (SELECT t1.noc, t1.CountColum
FROM t1, t2
WHERE t1.CountColum = t2.Games_Held)
SELECT region, CountColum FROM t3
JOIN noc_regions 
ON t3.noc = noc_regions.noc;
