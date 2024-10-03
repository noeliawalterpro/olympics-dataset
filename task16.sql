
-- List down total gold, silver and broze medals won 
-- by each country corresponding to each olympic games.                    
/*

WITH t1 AS (SELECT 
    `games`,`NOC`,
   COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
   COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
   COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze
FROM athlete_events
GROUP BY games, NOC
ORDER BY games DESC),
g AS (
    SELECT t1.games, t1.NOC, t1.gold
    FROM t1
    WHERE t1.gold = (
        SELECT MAX(gold)
        FROM t1 t2
        WHERE t2.games = t1.games
    )
),
s AS (
    SELECT t1.games, t1.NOC, t1.silver
    FROM t1
    WHERE t1.silver = (
        SELECT MAX(silver)
        FROM t1 t2
        WHERE t2.games = t1.games
    )
),
b AS (
    SELECT t1.games, t1.NOC, t1.bronze
    FROM t1
    WHERE t1.bronze = (
        SELECT MAX(bronze)
        FROM t1 t2
        WHERE t2.games = t1.games
    )
),
total AS (
    SELECT 
        g.games, 
        CONCAT(g.NOC, '-', g.gold) AS g, 
        CONCAT(s.NOC, '-', s.silver) AS s, 
        CONCAT(b.NOC, '-', b.bronze) AS b
    FROM g
    JOIN s ON g.games = s.games
    JOIN b ON g.games = b.games
)

SELECT * FROM total;

*/

WITH t1 AS (
    SELECT 
        `games`, `NOC`,
        COUNT(CASE WHEN medal = 'gold' THEN 1 END) AS gold,
        COUNT(CASE WHEN medal = 'silver' THEN 1 END) AS silver,
        COUNT(CASE WHEN medal = 'bronze' THEN 1 END) AS bronze,
        COUNT(CASE WHEN medal != 'NA' THEN 1 END) AS total
    FROM athlete_events
    GROUP BY games, NOC
),
g AS (
    SELECT games, MAX(gold) AS max_g
    FROM t1
    GROUP BY games
),
s AS (
    SELECT games, MAX(silver) AS max_s
    FROM t1
    GROUP BY games
),
b AS (
    SELECT games, MAX(bronze) AS max_b
    FROM t1
    GROUP BY games
),

max_gold AS (SELECT 
    t1.games, 
    CONCAT(t1.NOC, '-', g.max_g) AS max_GT
FROM t1,g
WHERE  t1.gold = g.max_g 
AND t1.games = g.games
ORDER BY t1.games DESC),
max_silver AS (SELECT 
    t1.games, 
    CONCAT(t1.NOC, '-', s.max_s)  AS max_ST
FROM t1,s
WHERE  t1.silver = s.max_s 
AND t1.games =s.games
ORDER BY t1.games DESC),
max_bronze AS (SELECT 
    t1.games, 
    CONCAT(t1.NOC, '-', b.max_b) AS max_BT
FROM t1,b
WHERE  t1.bronze= b.max_b 
AND t1.games = b.games
ORDER BY t1.games DESC)


SELECT max_gold.games, max_GT, max_ST, max_BT
FROM max_gold 
JOIN max_silver
ON max_gold.games = max_silver.games
JOIN max_bronze
ON max_gold.games = max_bronze.games;

