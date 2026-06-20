/* 
 Which supermarket is the cheapest per category?
 (bakery, drinks, food_cupboard, fresh_food, frozen, health_products)
 -To remove anomalies filter by prices unit < 100
 */

SELECT*
FROM aldi
WHERE 
    category = 'bakery'
    AND prices_unit < 100
ORDER BY prices_unit DESC
LIMIT 500;

SELECT
 (SELECT AVG(prices_unit) FROM asda WHERE category = 'bakery' AND prices_unit < 100)
FROM aldi