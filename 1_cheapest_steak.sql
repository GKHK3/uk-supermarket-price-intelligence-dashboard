/*
Where can I get the cheapest Sirloin steak?
*/

SELECT 
 supermarket,
 product,
 prices_unit
 FROM aldi
 WHERE product LIKE '%Sirloin%' 

 UNION 

 SELECT
  supermarket,
  product,
  prices_unit
 FROM asda
 WHERE product LIKE '%Sirloin%' 

  UNION

 SELECT
  supermarket,
  product,
  prices_unit
 FROM morrisons
 WHERE product LIKE '%Sirloin%' 

 UNION

  SELECT
  supermarket,
  product,
  prices_unit
 FROM sainsbury
 WHERE product LIKE '%Sirloin%' 

 UNION

  SELECT
  supermarket,
  product,
  prices_unit
 FROM tesco
 WHERE product LIKE '%Sirloin%' 

 ORDER BY prices_unit ASC

 LIMIT 500;




