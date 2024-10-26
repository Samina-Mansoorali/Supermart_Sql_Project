
SELECT *
FROM supermart_sales;



-- 1. Total Sales and Profit by QUARTER
SELECT
year,
QUARTER(OrderDate) AS Quarter,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    Year, Quarter
ORDER BY Year, Quarter;

-- 1. Total Sales and Profit by month-Year
SELECT year,
MONTH(OrderDate) AS Month,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    Year, Month
ORDER BY Year, Month;


-- Top selling categories --

SELECT Category,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    Category
ORDER BY Total_Sales desc;

-- Top selling subcategory --

SELECT SubCategory,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    SubCategory
ORDER BY Total_Sales desc;

-- Top selling city --

SELECT city,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    city
ORDER BY Total_Sales desc;

-- Top selling region --

SELECT region,
SUM(sales) AS Total_Sales,
round(SUM(profit),2) AS Total_Profit
FROM
   supermart_sales 
GROUP BY
    region
ORDER BY Total_Sales desc;

-- Percentage Sales and Profit
WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    year, 
    SUM(sales) AS total_sales,
    ROUND(SUM(profit),2) AS total_profit,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM
    supermart_sales
JOIN  tsp ON 1=1
GROUP BY
    year, tsp.grand_total_sales
ORDER BY
    year;  
-- Profit percentage each year --
SELECT year, 
ROUND((SUM(profit)/SUM(Sales)) * 100,2) AS profit_percentage
FROM supermart_sales
WHERE year IN (2015, 2016, 2017, 2018)
GROUP BY year;

-- Profit percentage for category --

SELECT category, 
ROUND((SUM(profit)/SUM(Sales)) * 100,2) AS profit_percentage
FROM supermart_sales
WHERE Category IN ('Bakery', 'Beverages' , 'Eggs, Meat & Fish', 
'Food Grains', 'Fruits & Veggies', 'Oil & Masala', 'Snacks')
GROUP BY Category;

-- SALES PERCENTAGE BY CATEGORY BY YEAR--

WITH SalesbyYear AS(
SELECT
YEAR(OrderDate) AS year,
SUM(sales) AS Total_sales
FROM supermart_sales
GROUP BY YEAR(OrderDate)
)
SELECT YEAR(OrderDate) AS year,
category,
SUM(sales) AS CategorySales,
(SUM(sales) / s.Total_sales) * 100 AS CategoryPercentage
FROM supermart_sales
JOIN SalesbyYear s ON YEAR(OrderDate) = s.Year
GROUP BY 
YEAR(OrderDate), Category, s.Total_sales;

-- sales percentage by category --
    
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `Category`,
    SUM(sales) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM
    supermart_sales
JOIN tsp ON 1=1
GROUP BY
    `Category`, tsp.grand_total_sales
ORDER BY
    `Category`;

--  Sales Percentage by Subcategory
    
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `SubCategory`,
    SUM(sales) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM
    supermart_sales
JOIN tsp ON 1=1
GROUP BY
    `SubCategory`, tsp.grand_total_sales
ORDER BY
    `SubCategory`;
    
 -- Sales percentage by city --   
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `city`,
    SUM(sales) AS total_sales,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM supermart_sales
JOIN tsp ON 1=1
GROUP BY `city`, tsp.grand_total_sales
ORDER BY `city`;
    
-- Sales percentage by region --   
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `region`,
    SUM(sales) AS total_sales,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM supermart_sales
JOIN tsp ON 1=1
GROUP BY `region`, tsp.grand_total_sales
ORDER BY `region`;
    
-- Sales percentage by state --   
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `state`,
    SUM(sales) AS total_sales,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage
FROM supermart_sales
JOIN tsp ON 1=1
GROUP BY `state`, tsp.grand_total_sales
ORDER BY `state`;


--  Sales & profit Percentage by customername
    
    WITH tsp AS (
    SELECT 
        SUM(sales) AS grand_total_sales
    FROM
        supermart_sales
)
SELECT
    `customername`,
    SUM(sales) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(sales) / tsp.grand_total_sales) * 100, 2) AS sales_percentage,
    ROUND((SUM(profit) / tsp.grand_total_sales) * 100, 2) AS profit_percentage
FROM
    supermart_sales
JOIN tsp ON 1=1
GROUP BY
    `customername`, tsp.grand_total_sales
ORDER BY
    `customername`;