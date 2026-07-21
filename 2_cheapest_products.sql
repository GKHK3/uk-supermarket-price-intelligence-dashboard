/*
For the same proudcts, which supermarket is the cheapest? (top 3)
*/

--Tesco avg
WITH tesco_avg AS (
    SELECT
        product,
        ROUND(AVG(prices), 2) AS avg_tesco_price
    FROM tesco
    GROUP BY product
),
--ASDA avg
asda_avg AS (
    SELECT
        product,
        ROUND(AVG(prices), 2) AS avg_asda_price
    FROM asda
    GROUP BY product
),
--Sainsbury avg
sainsbury_avg AS (
    SELECT
        product,
        ROUND(AVG(prices), 2) AS avg_sainsburys_price
    FROM sainsbury
    GROUP BY product
)

SELECT
    t.product,
    t.avg_tesco_price,
    a.avg_asda_price,
    s.avg_sainsburys_price,
    ROUND((t.avg_tesco_price + a.avg_asda_price + s.avg_sainsburys_price) / 3, 2) AS overall_avg_price
FROM tesco_avg t
INNER JOIN asda_avg a
    ON t.product = a.product
INNER JOIN sainsbury_avg s
    ON t.product = s.product
ORDER BY overall_avg_price DESC;