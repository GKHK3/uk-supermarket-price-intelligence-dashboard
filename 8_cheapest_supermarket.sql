--Cheapest supermarket based on average price

WITH all_supermarkets AS (
    SELECT supermarket, product, prices AS price FROM aldi
    UNION ALL
    SELECT supermarket, product, prices AS price FROM asda
    UNION ALL
    SELECT supermarket, product, prices AS price FROM morrisons
    UNION ALL
    SELECT supermarket, product, prices AS price FROM sainsbury
    UNION ALL
    SELECT supermarket, product, prices AS price FROM tesco
)

SELECT
    supermarket,
    ROUND(AVG(price), 2) AS average_price
FROM all_supermarkets
GROUP BY supermarket
ORDER BY average_price ASC;