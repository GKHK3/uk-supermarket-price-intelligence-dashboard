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



--Aldi

WITH date_averages AS (
    SELECT
        date,
        AVG(prices) AS avg_price
    FROM aldi
    GROUP BY date
),

first_last AS (
    SELECT
        FIRST_VALUE(avg_price) OVER (ORDER BY date) AS first_avg_price,
        LAST_VALUE(avg_price) OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
        ) AS last_avg_price
    FROM date_averages
)

SELECT DISTINCT
    ROUND(
        (last_avg_price - first_avg_price)
        / first_avg_price * 100,
        2
    ) AS aldi_inflation_rate_pct
FROM first_last

UNION ALL

--Sainbuy's
WITH date_averages AS (
    SELECT
        date,
        AVG(prices) AS avg_price
    FROM sainsbury
    GROUP BY date
),

first_last AS (
    SELECT
        FIRST_VALUE(avg_price) OVER (ORDER BY date) AS first_avg_price,
        LAST_VALUE(avg_price) OVER (
            ORDER BY date
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND UNBOUNDED FOLLOWING
        ) AS last_avg_price
    FROM date_averages
)

SELECT DISTINCT
    ROUND(
        (last_avg_price - first_avg_price)
        / first_avg_price * 100,
        2
    ) AS Sainburys_inflation_rate_pct
FROM first_last;

--test 2

WITH all_supermarkets AS (
    SELECT
        'Aldi' AS supermarket,
        product,
        category,
        date::date AS date,
        prices
    FROM aldi

    UNION ALL

    SELECT
        'Tesco' AS supermarket,
        product,
        category,
        date::date AS date,
        prices
    FROM asda

    UNION ALL

    SELECT
        'Lidl' AS supermarket,
        product,
        category,
        date::date AS date,
        prices
    FROM morrisons

    UNION ALL

    SELECT
        'Asda' AS supermarket,
        product,
        category,
        date::date AS date,
        prices
    FROM sainsbury
),

inflation AS (
    SELECT
        supermarket,
        product,
        category,
        date,
        prices,

        LAG(prices) OVER (
            PARTITION BY supermarket, product
            ORDER BY date
        ) AS previous_price,

        ROUND(
            (prices - LAG(prices) OVER (
                PARTITION BY supermarket, product
                ORDER BY date
            ))
            / LAG(prices) OVER (
                PARTITION BY supermarket, product
                ORDER BY date
            ) * 100,
            2
        ) AS inflation_rate_pct

    FROM all_supermarkets
)

SELECT *
FROM inflation
WHERE previous_price IS NOT NULL
ORDER BY supermarket, product, date;