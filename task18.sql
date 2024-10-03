-- Which countries have never won gold medal but have won silver/bronze medals?


WITH t1 AS (
    SELECT 
        `NOC`,
        COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
        COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
        COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze,
        COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
    GROUP BY  NOC
),
t2 AS (SELECT * FROM t1
WHERE gold =0 AND (silver > 0  OR bronze > 0)
ORDER BY total DESC )
SELECT Region, gold, silver, bronze, total FROM t2
JOIN noc_regions
ON noc_regions.noc= t2.noc
ORDER BY total DESC ;

