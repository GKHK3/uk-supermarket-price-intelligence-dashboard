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

    FROM aldi
)

SELECT *
FROM inflation
WHERE inflation_rate_pct <= 100
ORDER BY inflation_rate_pct DESC;
*/

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

