-- Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
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
t AS (
    SELECT games, MAX(total) AS max_t
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
ORDER BY t1.games DESC),
max_total AS (SELECT 
    t1.games, 
    CONCAT(t1.NOC, '-', t.max_t) AS max_TT
FROM t1,t
WHERE  t1.total= t.max_t 
AND t1.games = t.games
ORDER BY t1.games DESC)


SELECT max_gold.games, max_GT, max_ST, max_BT, max_TT
FROM max_gold 
JOIN max_silver
ON max_gold.games = max_silver.games
JOIN max_bronze
ON max_gold.games = max_bronze.games
JOIN max_total
ON max_gold.games = max_total.games
;
