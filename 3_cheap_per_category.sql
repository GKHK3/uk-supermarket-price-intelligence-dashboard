/* 
 Which supermarket is the cheapest per category?
 (bakery, drinks, food_cupboard, fresh_food, frozen, health_products)
 -To remove anomalies filter by prices unit < 100
 */


SELECT AVG(prices_unit) AS avg_bakery_price
FROM asda
WHERE category = 'bakery'
  AND prices_unit < 100;