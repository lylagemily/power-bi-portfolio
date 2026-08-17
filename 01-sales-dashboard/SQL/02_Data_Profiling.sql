USE AdventureWorks2025;
GO

-- =============================================
-- AdventureWorks BI Portfolio
-- Sales Dashboard
-- 02 - Data Profiling
-- =============================================


-- Total sales order details
SELECT
    COUNT(*) AS TotalSalesOrderDetails
FROM Sales.SalesOrderDetail;


-- Total orders
SELECT
    COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader;


-- Total customers
SELECT
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM Sales.SalesOrderHeader;


-- Sales date range
SELECT
    MIN(OrderDate) AS FirstOrderDate,
    MAX(OrderDate) AS LastOrderDate
FROM Sales.SalesOrderHeader;


-- Orders by year
SELECT
    YEAR(OrderDate) AS SalesYear,
    COUNT(*) AS NumberOfOrders
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY SalesYear;


-- Check NULL values
SELECT
    COUNT(*) AS TotalRows,
    COUNT(ProductID) AS ProductID_NotNull,
    COUNT(OrderQty) AS OrderQty_NotNull,
    COUNT(UnitPrice) AS UnitPrice_NotNull,
    COUNT(UnitPriceDiscount) AS Discount_NotNull
FROM Sales.SalesOrderDetail;


-- Check duplicate order details
SELECT
    SalesOrderID,
    SalesOrderDetailID,
    COUNT(*) AS DuplicateCount
FROM Sales.SalesOrderDetail
GROUP BY
    SalesOrderID,
    SalesOrderDetailID
HAVING COUNT(*) > 1;


-- Quantity validation
SELECT
    MIN(OrderQty) AS MinQuantity,
    MAX(OrderQty) AS MaxQuantity,
    AVG(OrderQty) AS AverageQuantity
FROM Sales.SalesOrderDetail;


-- Price validation
SELECT
    MIN(UnitPrice) AS MinUnitPrice,
    MAX(UnitPrice) AS MaxUnitPrice,
    AVG(UnitPrice) AS AverageUnitPrice
FROM Sales.SalesOrderDetail;


-- Discount validation
SELECT
    MIN(UnitPriceDiscount) AS MinDiscount,
    MAX(UnitPriceDiscount) AS MaxDiscount,
    AVG(UnitPriceDiscount) AS AverageDiscount
FROM Sales.SalesOrderDetail;
