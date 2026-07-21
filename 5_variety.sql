--Which supermarket has the most product variety?
--fresh_food, baby_products,bakery, drinks, food_cupboard, free_from, frozen, health_products, household, pets

--Aldi
SELECT 
--count of category
    'Aldi' AS supermarket,
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) AS fresh_food,
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) AS bakery,
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) AS drinks,
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) AS food_cupboard,
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) AS frozen,
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) AS health_products,
    COUNT(CASE WHEN category = 'household' THEN 1 END) AS household,
    COUNT(CASE WHEN category = 'pets' THEN 1 END) AS pets,

--count of all 
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) +
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) +
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) +
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) +
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) +
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) +
    COUNT(CASE WHEN category = 'household' THEN 1 END) +
    COUNT(CASE WHEN category = 'pets' THEN 1 END)
     AS total_products

FROM aldi
GROUP BY supermarket

UNION ALL

--ASDA
SELECT 
--count of category
    'ASDA' AS supermarket,
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) AS fresh_food,
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) AS bakery,
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) AS drinks,
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) AS food_cupboard,
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) AS frozen,
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) AS health_products,
    COUNT(CASE WHEN category = 'household' THEN 1 END) AS household,
    COUNT(CASE WHEN category = 'pets' THEN 1 END) AS pets,

--count of all 
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) +
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) +
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) +
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) +
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) +
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) +
    COUNT(CASE WHEN category = 'household' THEN 1 END) +
    COUNT(CASE WHEN category = 'pets' THEN 1 END)
     AS total_products

FROM asda
GROUP BY supermarket

UNION ALL

--Morrisons
SELECT 
--count of category
    'Morrisons' AS supermarket,
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) AS fresh_food,
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) AS bakery,
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) AS drinks,
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) AS food_cupboard,
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) AS frozen,
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) AS health_products,
    COUNT(CASE WHEN category = 'household' THEN 1 END) AS household,
    COUNT(CASE WHEN category = 'pets' THEN 1 END) AS pets,

--count of all 
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) +
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) +
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) +
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) +
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) +
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) +
    COUNT(CASE WHEN category = 'household' THEN 1 END) +
    COUNT(CASE WHEN category = 'pets' THEN 1 END)
     AS total_products

FROM morrisons
GROUP BY supermarket

UNION ALL

--Sainsbury's
SELECT 
--count of category
    'Sainsbury''s' AS supermarket,
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) AS fresh_food,
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) AS bakery,
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) AS drinks,
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) AS food_cupboard,
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) AS frozen,
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) AS health_products,
    COUNT(CASE WHEN category = 'household' THEN 1 END) AS household,
    COUNT(CASE WHEN category = 'pets' THEN 1 END) AS pets,

--count of all 
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) +
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) +
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) +
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) +
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) +
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) +
    COUNT(CASE WHEN category = 'household' THEN 1 END) +
    COUNT(CASE WHEN category = 'pets' THEN 1 END)
     AS total_products

FROM sainsbury
GROUP BY supermarket

UNION ALL

--Tesco
SELECT 
--count of category
    'Tesco' AS supermarket,
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) AS fresh_food,
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) AS bakery,
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) AS drinks,
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) AS food_cupboard,
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) AS frozen,
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) AS health_products,
    COUNT(CASE WHEN category = 'household' THEN 1 END) AS household,
    COUNT(CASE WHEN category = 'pets' THEN 1 END) AS pets,

--count of all 
    COUNT(CASE WHEN category = 'bakery' THEN 1 END) +
    COUNT(CASE WHEN category = 'drinks' THEN 1 END) +
    COUNT(CASE WHEN category = 'food_cupboard' THEN 1 END) +
    COUNT(CASE WHEN category = 'fresh_food' THEN 1 END) +
    COUNT(CASE WHEN category = 'frozen' THEN 1 END) +
    COUNT(CASE WHEN category = 'health_products' THEN 1 END) +
    COUNT(CASE WHEN category = 'household' THEN 1 END) +
    COUNT(CASE WHEN category = 'pets' THEN 1 END)
     AS total_products

FROM tesco
GROUP BY supermarket

ORDER BY total_products DESC;
