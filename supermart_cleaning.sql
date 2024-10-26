-- Data Cleaning 
SELECT *
FROM supermart_sales;

ALTER TABLE supermart_sales RENAME COLUMN ï»¿OrderID TO OrderID;


ALTER TABLE supermart_sales
MODIFY COLUMN OrderDate DATE;

UPDATE supermart_sales
SET OrderDate = CASE
WHEN OrderDate LIKE '%-%-%' THEN DATE_FORMAT(STR_TO_DATE(OrderDate, '%d-%m-%Y'), '%m/%d/%Y')
WHEN OrderDate LIKE '%/%/%' THEN DATE_FORMAT(STR_TO_DATE(OrderDate, '%m/%d/%Y'), '%m/%d/%Y')
ELSE NULL 
END;

ALTER TABLE supermart_sales ADD COLUMN OrderDate_temp DATE;

UPDATE supermart_sales
SET OrderDate_temp = CASE
    WHEN OrderDate LIKE '%-%-%' THEN STR_TO_DATE(OrderDate, '%d-%m-%Y')
    WHEN OrderDate LIKE '%/%/%' THEN STR_TO_DATE(OrderDate, '%m/%d/%Y')
    ELSE NULL 
END;

SELECT OrderDate, OrderDate_temp FROM supermart_sales WHERE OrderDate_temp IS NOT NULL;

ALTER TABLE supermart_sales DROP COLUMN OrderDate;

ALTER TABLE supermart_sales CHANGE COLUMN OrderDate_temp OrderDate DATE;

DESCRIBE supermart_sales;


ALTER TABLE supermart_sales
MODIFY COLUMN `OrderDate` DATE;

DESCRIBE supermart_sales;

ALTER TABLE supermart_sales
ADD Cost DECIMAL(10,2);

UPDATE supermart_sales
SET Cost = sales - profit;

ALTER TABLE supermart_sales
ADD COLUMN `year` INT;

UPDATE supermart_sales
SET `year` = YEAR(STR_TO_DATE(`OrderDate`, '%m/%d/%Y'));