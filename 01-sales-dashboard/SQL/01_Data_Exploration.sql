USE AdventureWorks2025;
GO

-- =============================================
-- AdventureWorks BI Portfolio
-- Sales Dashboard
-- 01 - Data Exploration
-- =============================================

-- Check current database
SELECT
    DB_NAME() AS DatabaseName;


-- Explore Sales Order Header
SELECT TOP 10 *
FROM Sales.SalesOrderHeader;


-- Explore Sales Order Detail
SELECT TOP 10 *
FROM Sales.SalesOrderDetail;


-- Explore Products
SELECT TOP 10 *
FROM Production.Product;


-- Explore Customers
SELECT TOP 10 *
FROM Sales.Customer;


-- Explore Employees
SELECT TOP 10 *
FROM HumanResources.Employee;
