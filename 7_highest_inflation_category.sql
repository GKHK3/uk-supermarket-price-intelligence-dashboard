--which category has the highest inflation rate?

WITH all_prices AS (
--combining all supermarkets together
    SELECT supermarket, product, category, date, prices_unit AS price FROM aldi
    UNION ALL
    SELECT supermarket, product, category, date, prices_unit AS price FROM tesco
    UNION ALL
    SELECT supermarket, product, category, date, prices_unit AS price FROM asda
    UNION ALL
    SELECT supermarket, product, category, date, prices_unit AS price FROM morrisons
    UNION ALL
    SELECT supermarket, product, category, date, prices_unit AS price FROM sainsbury
),

--getting prices of products
price_changes AS (
    SELECT
        supermarket,
        product,
        category,
        date,
        price,
        LAG(price) OVER (
            PARTITION BY supermarket, product
            ORDER BY date
        ) AS previous_price
    FROM all_prices
),

--calculating inflation rate percentage
inflation_rates AS (
    SELECT
        supermarket,
        product,
        category,
        date,
        ROUND(
            ((price - previous_price) / previous_price) * 100,
            2
        ) AS inflation_rate_pct
    FROM price_changes
    WHERE previous_price IS NOT NULL
        AND previous_price <> 0
)

SELECT
    category,
    ROUND(AVG(inflation_rate_pct), 2) AS avg_inflation_rate_pct,
    COUNT(*) AS price_changes_count
FROM inflation_rates
GROUP BY category
ORDER BY avg_inflation_rate_pct DESC;