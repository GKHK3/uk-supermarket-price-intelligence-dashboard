--Which supermarket has the highest inflation rate per category?

/*test (top inflation rates, everything 100% and below)
WITH inflation AS (
    SELECT
        product,
        category,
        date,
        prices,

        LAG(prices) OVER (
            PARTITION BY product
            ORDER BY date
        ) AS previous_price,

        ROUND(
            (prices - LAG(prices) OVER (
                PARTITION BY product
                ORDER BY date
            ))
            / LAG(prices) OVER (
                PARTITION BY product
                ORDER BY date
            ) * 100,
            2
        ) AS inflation_rate_pct

    FROM asda
)

SELECT *
FROM inflation
WHERE inflation_rate_pct <= 100
ORDER BY inflation_rate_pct ASC;
*/

/** Inflation rate as a whole per supermarket
--CTE, putting all supermarkets into one table
WITH all_supermarkets AS (
    SELECT 'Aldi' AS supermarket, date::date AS date, prices FROM aldi
    UNION ALL
    SELECT 'ASDA', date::date, prices FROM asda
    UNION ALL
    SELECT 'Morrisons', date::date, prices FROM morrisons
    UNION ALL
    SELECT 'Sainsbury', date::date, prices FROM sainsbury
    UNION ALL
    SELECT 'Tesco', date::date, prices FROM tesco
),

--average price of all supermarkets 
date_averages AS (
    SELECT
        supermarket,
        date,
        AVG(prices) AS avg_price
    FROM all_supermarkets
    WHERE prices > 0.2
    GROUP BY supermarket, date
),

--Getting first and last price by date
first_last AS (
--first date
    SELECT DISTINCT
        supermarket,
        FIRST_VALUE(avg_price) OVER (
            PARTITION BY supermarket
            ORDER BY date
        ) AS first_avg_price,
--last date
        LAST_VALUE(avg_price) OVER (
            PARTITION BY supermarket
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS last_avg_price
    FROM date_averages
)

SELECT
    supermarket,
    ROUND(
        (last_avg_price - first_avg_price)
        / first_avg_price * 100,
        2
    ) AS inflation_rate_pct
FROM first_last
ORDER BY inflation_rate_pct ASC;
*/

--TEST

-- Combine all supermarkets into one table
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

-- Final results
SELECT
    supermarket,
    product,
    first_avg_price,
    last_avg_price,
    inflation_rate_pct
FROM inflation
WHERE inflation_rate_pct > -0.5 AND
inflation_rate_pct <= 100      -- Change this value to filter products
ORDER BY inflation_rate_pct DESC;

