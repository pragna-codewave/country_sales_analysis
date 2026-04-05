-- =========================================
-- GLOBAL SALES DATA ANALYSIS PROJECT
-- =========================================
-- This project performs end-to-end SQL analysis on multi-country sales data
-- including data integration, cleaning, transformation, and business insights
-- =========================================


-- =========================================
-- 1. CREATE DATABASE
-- =========================================
-- Creating a fresh database ensures a clean environment.
-- If database already exists, it is deleted to avoid conflicts.

USE MASTER
GO

IF EXISTS(SELECT 1 FROM sys.databases WHERE name = 'country_data')
BEGIN
    ALTER DATABASE country_data 
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE country_data
END

CREATE DATABASE country_data
GO

USE country_data
GO


-- =========================================
-- 2. CREATE TABLES (MULTI-COUNTRY DATA)
-- =========================================
-- Creating separate tables for each country dataset.
-- Each table stores transactional sales data.

-- Example: Canada Table (same structure used for all countries)

IF OBJECT_ID('sales_Cannada','U') IS NOT NULL
    DROP TABLE sales_Cannada

CREATE TABLE sales_Cannada(
    Transaction_ID NVARCHAR(100) PRIMARY KEY,
    Transaction_Date DATE,
    Country NVARCHAR(50),
    Product_ID NVARCHAR(100),
    Product_Name NVARCHAR(100),
    Category NVARCHAR(100),
    Price_per_Unit DECIMAL(10,2),
    Quantity_Purchased INT,
    Cost_Price DECIMAL(10,2),
    Discount_Applied DECIMAL(10,2),
    Payment_Method NVARCHAR(50),
    Customer_Age_Group NVARCHAR(50),
    Customer_Gender NVARCHAR(50),
    Store_Location NVARCHAR(50),
    Sales_Rep NVARCHAR(50)
)

-- =========================================
-- 3. IMPORT DATA
-- =========================================
-- Loading CSV data using BULK INSERT for efficient data import.

BULK INSERT sales_Cannada
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_Canada.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

-- (Repeating same process for China, India, Nigeria, UK, US)
--Create Table for China
IF OBJECT_ID('sales_China','U') IS NOT NULL
   DROP TABLE sales_China

CREATE TABLE sales_China(
Transaction_ID NVARCHAR(100) PRIMARY KEY,
Transaction_Date DATE,
Country NVARCHAR(50),
Product_ID NVARCHAR(100),
Product_Name NVARCHAR(100),
Category NVARCHAR(100),
Price_per_Unit DECIMAL(10,2),
Quantity_Purchased INT,
Cost_Price DECIMAL(10,2),
Discount_Applied DECIMAL(10,2),
Payment_Method NVARCHAR(50),
Customer_Age_Group NVARCHAR(50),
Customer_Gender NVARCHAR(50),
Store_Location NVARCHAR(50),
Sales_Rep NVARCHAR(50)
)

--Insert data into Table
TRUNCATE TABLE sales_China

BULK INSERT sales_China
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_China.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

--Create Table for India
IF OBJECT_ID('sales_India','U') IS NOT NULL
   DROP TABLE sales_India

CREATE TABLE sales_India(
Transaction_ID NVARCHAR(100) PRIMARY KEY,
Transaction_Date DATE,
Country NVARCHAR(50),
Product_ID NVARCHAR(100),
Product_Name NVARCHAR(100),
Category NVARCHAR(100),
Price_per_Unit DECIMAL(10,2),
Quantity_Purchased INT,
Cost_Price DECIMAL(10,2),
Discount_Applied DECIMAL(10,2),
Payment_Method NVARCHAR(50),
Customer_Age_Group NVARCHAR(50),
Customer_Gender NVARCHAR(50),
Store_Location NVARCHAR(50),
Sales_Rep NVARCHAR(50)
)

--Insert data into Table
TRUNCATE TABLE sales_India

BULK INSERT sales_India
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_India.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

--Create Table for Nigeria
IF OBJECT_ID('sales_Nigeria','U') IS NOT NULL
   DROP TABLE sales_Nigeria

CREATE TABLE sales_Nigeria(
Transaction_ID NVARCHAR(100) PRIMARY KEY,
Transaction_Date DATE,
Country NVARCHAR(50),
Product_ID NVARCHAR(100),
Product_Name NVARCHAR(100),
Category NVARCHAR(100),
Price_per_Unit DECIMAL(10,2),
Quantity_Purchased INT,
Cost_Price DECIMAL(10,2),
Discount_Applied DECIMAL(10,2),
Payment_Method NVARCHAR(50),
Customer_Age_Group NVARCHAR(50),
Customer_Gender NVARCHAR(50),
Store_Location NVARCHAR(50),
Sales_Rep NVARCHAR(50)
)

--Insert data into Table
TRUNCATE TABLE sales_Nigeria

BULK INSERT sales_Nigeria
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_Nigeria.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

--Create Table for UK
IF OBJECT_ID('sales_UK','U') IS NOT NULL
   DROP TABLE sales_UK

CREATE TABLE sales_UK(
Transaction_ID NVARCHAR(100) PRIMARY KEY,
Transaction_Date DATE,
Country NVARCHAR(50),
Product_ID NVARCHAR(100),
Product_Name NVARCHAR(100),
Category NVARCHAR(100),
Price_per_Unit DECIMAL(10,2),
Quantity_Purchased INT,
Cost_Price DECIMAL(10,2),
Discount_Applied DECIMAL(10,2),
Payment_Method NVARCHAR(50),
Customer_Age_Group NVARCHAR(50),
Customer_Gender NVARCHAR(50),
Store_Location NVARCHAR(50),
Sales_Rep NVARCHAR(50)
)

--Insert data into Table
TRUNCATE TABLE sales_UK

BULK INSERT sales_UK
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_UK.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)

--Create Table for US
IF OBJECT_ID('sales_US','U') IS NOT NULL
   DROP TABLE sales_US

CREATE TABLE sales_US(
Transaction_ID NVARCHAR(100) PRIMARY KEY,
Transaction_Date DATE,
Country NVARCHAR(50),
Product_ID NVARCHAR(100),
Product_Name NVARCHAR(100),
Category NVARCHAR(100),
Price_per_Unit DECIMAL(10,2),
Quantity_Purchased INT,
Cost_Price DECIMAL(10,2),
Discount_Applied DECIMAL(10,2),
Payment_Method NVARCHAR(50),
Customer_Age_Group NVARCHAR(50),
Customer_Gender NVARCHAR(50),
Store_Location NVARCHAR(50),
Sales_Rep NVARCHAR(50)
)

--Insert data into Table
TRUNCATE TABLE sales_US

BULK INSERT sales_US
FROM 'C:\Users\ASUS\Desktop\Sql\Country\sales_US.csv'
WITH(
FIRSTROW = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
TABLOCK
)


-- =========================================
-- 4. DATA INTEGRATION
-- =========================================
-- Combining all country tables into a single unified dataset.

SELECT *
INTO all_country_sales
FROM sales_Cannada
UNION ALL
SELECT * FROM sales_China
UNION ALL
SELECT * FROM sales_India
UNION ALL
SELECT * FROM sales_Nigeria
UNION ALL
SELECT * FROM sales_UK
UNION ALL
SELECT * FROM sales_US

-- View combined dataset
SELECT * FROM all_country_sales


-- =========================================
-- 5. DATA CLEANING
-- =========================================

-- Checking for missing values
SELECT *
FROM all_country_sales
WHERE 
    Transaction_ID IS NULL OR
    Country IS NULL OR
    Price_per_Unit IS NULL OR
    Quantity_Purchased IS NULL OR
    Discount_Applied IS NULL

-- Updating missing values (example fixes)
UPDATE all_country_sales
SET Price_per_Unit = (
    SELECT AVG(Price_per_Unit) FROM all_country_sales WHERE Price_per_Unit IS NOT NULL
)
WHERE Price_per_Unit IS NULL

UPDATE all_country_sales
SET Quantity_Purchased = 3
WHERE Quantity_Purchased IS NULL

-- Checking for duplicate records
SELECT 
    Transaction_ID,
    COUNT(*) AS total
FROM all_country_sales
GROUP BY Transaction_ID
HAVING COUNT(*) > 1


-- =========================================
-- 6. DATA TRANSFORMATION
-- =========================================

-- Adding Total Revenue column
ALTER TABLE all_country_sales
ADD Total_amount NUMERIC(10,2)

-- Calculating total revenue per transaction
UPDATE all_country_sales
SET Total_amount = (Price_per_Unit * Quantity_Purchased) - Discount_Applied

-- Adding Profit column
ALTER TABLE all_country_sales
ADD Profit NUMERIC(10,2)

-- Calculating profit
UPDATE all_country_sales
SET Profit = Total_amount - (Cost_Price * Quantity_Purchased)


-- =========================================
-- 7. BUSINESS ANALYSIS
-- =========================================

-- Q1: Sales Revenue & Profit by Country
-- Identifies top performing countries based on revenue and profit
SELECT 
    Country,
    SUM(Total_amount) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM all_country_sales
GROUP BY Country
ORDER BY Total_Revenue DESC

--Sales Revenue & Profit by Country in a week
SELECT 
country,
SUM(Total_amount) as Total_Revenue,
SUM(Profit) as Total_Profit
FROM all_country_sales
WHERE Transaction_Date between '2025-02-10' and '2025-02-14' 
GROUP BY country
ORDER BY SUM(Total_amount) DESC

-- Q2: Weekly Performance Analysis
-- Evaluates revenue and profit for a specific time period
SELECT 
    Country,
    SUM(Total_amount) AS Total_Revenue,
    SUM(Profit) AS Total_Profit
FROM all_country_sales
WHERE Transaction_Date BETWEEN '2025-02-10' AND '2025-02-14'
GROUP BY Country
ORDER BY Total_Revenue DESC


-- Q3: Top 5 Best-Selling Products
-- Identifies products with highest sales volume
SELECT TOP 5
    Product_Name,
    SUM(Quantity_Purchased) AS Total_Units_Sold
FROM all_country_sales
GROUP BY Product_Name
ORDER BY Total_Units_Sold DESC


-- Q4: Best Sales Representatives
-- Finds top-performing sales representatives
SELECT TOP 5
    Sales_Rep,
    SUM(Total_amount) AS Total_Sales
FROM all_country_sales
GROUP BY Sales_Rep
ORDER BY Total_Sales DESC


-- Q5: Store Location Performance
-- Identifies stores generating highest revenue and profit
SELECT 
    Store_Location,
    SUM(Total_amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM all_country_sales
GROUP BY Store_Location
ORDER BY Total_Sales DESC


-- Q6: Sales & Profit Summary Statistics
-- Provides min, max, average, and total metrics
SELECT 
    MIN(Total_amount) AS Min_Sales,
    MAX(Total_amount) AS Max_Sales,
    AVG(Total_amount) AS Avg_Sales,
    SUM(Total_amount) AS Total_Sales,
    MIN(Profit) AS Min_Profit,
    MAX(Profit) AS Max_Profit,
    AVG(Profit) AS Avg_Profit,
    SUM(Profit) AS Total_Profit
FROM all_country_sales


-- =========================================
-- 8. ADVANCED ANALYSIS
-- =========================================

-- Profit Margin by Country
SELECT 
    Country,
    SUM(Profit) * 100.0 / SUM(Total_amount) AS Profit_Margin
FROM all_country_sales
GROUP BY Country
ORDER BY Profit_Margin DESC


-- Customer Behavior Analysis
SELECT 
    Customer_Age_Group,
    SUM(Total_amount) AS Revenue
FROM all_country_sales
GROUP BY Customer_Age_Group
ORDER BY Revenue DESC


-- Payment Method Analysis
SELECT 
    Payment_Method,
    COUNT(*) AS Transactions,
    SUM(Total_amount) AS Revenue
FROM all_country_sales
GROUP BY Payment_Method
ORDER BY Revenue DESC


-- Monthly Sales Trend
SELECT 
    FORMAT(Transaction_Date,'yyyy-MM') AS Month,
    SUM(Total_amount) AS Revenue
FROM all_country_sales
GROUP BY FORMAT(Transaction_Date,'yyyy-MM')
ORDER BY Month


-- Top Categories by Profit
SELECT TOP 5
    Category,
    SUM(Profit) AS Total_Profit
FROM all_country_sales
GROUP BY Category
ORDER BY Total_Profit DESC
