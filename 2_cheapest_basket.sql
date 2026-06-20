--Which Supermarket has the cheapest complete basket(Milk, Bread(medium or white), Eggs, Chicken Breast, White Rice, Apples,Penne Pasta) by prices per unit?
--Note: Bread: Loaf of bread. Above < 700g


/* query to search for products
SELECT*
FROM asda --change supermarket
WHERE product LIKE '%Penne%'                             --add( AND category = '' )if needed
ORDER BY prices_unit ASC; 
*/

/* query to find cheapest product
SELECT 
    product, 
    AVG(prices_unit) AS average_value
FROM tesco --change supermarket
WHERE product LIKE ('%Apple%')                --add( AND category = '' )if needed
GROUP BY product
ORDER BY average_value
*/

--ALDI average results
WITH aldi_results AS(
SELECT 
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Cowbelle British Semi-skimmed Milk 1.7% Fat 6 Pints') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Everyday Essentials Medium Sliced Wholemeal Bread 800g') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Everyday Essentials Mixed Weight Scottish Eggs From Bar') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Everyday Essentials Chicken Breast Fillets 1kg') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Worldwide Long Grain White Rice 1kg') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Nature''s Pick Mini Apples 6 Pack') +
    (SELECT AVG(prices_unit) FROM aldi WHERE product = 'Everyday Essentials Penne Pasta 500g')
    AS aldi_average,
    supermarket AS Aldi
FROM aldi
GROUP BY supermarket
),

--ASDA average results
asda_results AS(
SELECT 
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'ASDA British Milk Filtered Semi Skimmed 2 Litres') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'JUST ESSENTIALS by ASDA White Bread') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'JUST ESSENTIALS by ASDA 15 Eggs') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'JUST ESSENTIALS by ASDA Chicken Breast Fillet Portions (Typically 1.05kg)') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'JUST ESSENTIALS by ASDA Long Grain Rice 1kg') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'ASDA Crisp & Fragrant Russet 6 Apples') +
    (SELECT AVG(prices_unit) FROM asda WHERE product = 'ASDA Penne')
    AS asda_average,
    supermarket AS Asda
FROM asda
GROUP BY supermarket
),

--Morrisons average results
morrisons_results AS(
SELECT 
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Cravendale Filtered Fresh Skimmed Milk Fresher for Longer') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Morrisons Toastie White Bread') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Morrisons Savers Small Free Range Eggs') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Morrisons British Chicken Breast Fillets') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Island Sun Long Grain Rice') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Morrisons Small Sweet Apples') +
    (SELECT AVG(prices_unit) FROM morrisons WHERE product = 'Napolina Penne Pasta')
    AS morrisons_average,
    supermarket AS Morrisons
FROM morrisons
GROUP BY supermarket
),

--Sainsbury's average results
sainsbury_results AS(
SELECT 
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Sainsbury''s British Semi Skimmed Milk 3.4L (6 pint)') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Stamford Street Co. Medium White Bread 800g') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Sainsbury''s Free Range British Eggs Medium x15') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Azeem Halal Chicken Breast Fillets 1kg') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Stamford Street Co. White Rice 1kg') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Stamford Street Co. Mini Apples x6') +
    (SELECT AVG(prices_unit) FROM sainsbury WHERE product = 'Sainsbury''s Penne 3kg')
    AS sainsbury_average,
    supermarket AS Sainsburys
FROM sainsbury
GROUP BY supermarket
),

--Tesco average results
tesco_results AS(
SELECT 
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Tesco British Whole Milk 2.272L, 4 Pints') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'H W Nevill''s White Bread 800G') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Tesco 15 Eggs') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Tesco Chicken Breast Fillet 1Kg') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Grower Harvest Long Grain Rice 1Kg') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Rosedene Farms Small Apple 6 Pack') +
    (SELECT AVG(prices_unit) FROM tesco WHERE product = 'Hearty Food Co. Penne Pasta 500G')
    AS tesco_average,
    supermarket AS Tesco
FROM tesco
GROUP BY supermarket
)

SELECT
    aldi_average AS average_price,
    aldi AS supermarket
   FROM(
--union
SELECT* FROM  aldi_results
UNION ALL
SELECT* FROM asda_results
UNION ALL
SELECT* FROM morrisons_results
UNION ALL
SELECT* FROM sainsbury_results
UNION ALL
SELECT* FROM tesco_results) AS results

 ORDER BY average_price ASC;

