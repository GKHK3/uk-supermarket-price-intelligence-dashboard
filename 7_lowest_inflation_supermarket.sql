--Which supermarket has the lowest inflation rate?
--How much did products increase in price in each supermarket

--Same query from query #6
WITH all_supermarkets AS (
    SELECT 'Aldi' AS supermarket, product, date::date AS date, prices
    FROM aldi
    UNION ALL
    SELECT 'ASDA', product, date::date, prices
    FROM asda
    UNION ALL
    SELECT 'Morrisons', product, date::date, prices
    FROM morrisons
    UNION ALL
    SELECT 'Sainsbury', product, date::date, prices
    FROM sainsbury
    UNION ALL
    SELECT 'Tesco', product, date::date, prices
    FROM tesco
),

-- Average price of each product per day
date_averages AS (
    SELECT
        supermarket,
        product,
        date,
        AVG(prices) AS avg_price
    FROM all_supermarkets

    GROUP BY
        supermarket,
        product,
        date
),

-- Get the first and last recorded average price for each product
first_last AS (
    SELECT DISTINCT
        supermarket,
        product,

        FIRST_VALUE(avg_price) OVER (
            PARTITION BY supermarket, product
            ORDER BY date
        ) AS first_avg_price,

        LAST_VALUE(avg_price) OVER (
            PARTITION BY supermarket, product
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
                 AND UNBOUNDED FOLLOWING
        ) AS last_avg_price

    FROM date_averages
),

-- Calculate inflation rate for each product
inflation AS (
    SELECT
        supermarket,
        product,
        first_avg_price,
        last_avg_price,
        ROUND(
            ((last_avg_price - first_avg_price)
            / first_avg_price) * 100,
            2
        ) AS inflation_rate_pct
    FROM first_last
)

-- Final results (grouped each supermarket to find average of inflation rate)
SELECT
    supermarket,
    ROUND(AVG(inflation_rate_pct), 2) AS avg_inflation_rate
FROM inflation
WHERE inflation_rate_pct > -0.5
  AND inflation_rate_pct <= 100
GROUP BY supermarket
ORDER BY avg_inflation_rate DESC;