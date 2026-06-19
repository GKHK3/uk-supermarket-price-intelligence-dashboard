COPY aldi (supermarket,prices,prices_unit,unit,product,date,category,own_brand)
FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Aldi.csv'
DELIMITER ',' CSV HEADER;

COPY asda (supermarket,prices,prices_unit,unit,product,date,category,own_brand)
FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_ASDA.csv'
DELIMITER ',' CSV HEADER;

COPY morrisons (supermarket,prices,prices_unit,unit,product,date,category,own_brand)
FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Morrisons.csv'
DELIMITER ',' CSV HEADER;

COPY sainsbury (supermarket,prices,prices_unit,unit,product,date,category,own_brand)
FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Sains.csv'
DELIMITER ',' CSV HEADER;

COPY tesco (supermarket,prices,prices_unit,unit,product,date,category,own_brand)
FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Tesco.csv'
DELIMITER ',' CSV HEADER;

/*   post into postgres code 

\copy aldi (supermarket,prices,prices_unit,unit,product,date,category,own_brand) FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Aldi.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy asda (supermarket,prices,prices_unit,unit,product,date,category,own_brand) FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_ASDA.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy morrisons (supermarket,prices,prices_unit,unit,product,date,category,own_brand) FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Morrisons.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy sainsbury (supermarket,prices,prices_unit,unit,product,date,category,own_brand) FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Sains.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy tesco (supermarket,prices,prices_unit,unit,product,date,category,own_brand) FROM 'C:\Users\garet\Documents\data_analysis\supermarket_project\supermarket_project\csv_files\All_Data_Tesco.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

*/