USE AdventureWorks2025;
GO

-- =============================================
-- AdventureWorks BI Portfolio
-- Sales Dashboard
-- 05 - Reporting Views
-- =============================================

CREATE OR ALTER VIEW dbo.vw_SalesDetail
AS

SELECT
    h.SalesOrderID,
    h.OrderDate,
    h.CustomerID,
    h.SalesPersonID,
    h.TerritoryID,

    d.SalesOrderDetailID,
    d.ProductID,
    d.OrderQty,
    d.UnitPrice,
    d.UnitPriceDiscount,

    p.Name AS ProductName,
    p.ProductNumber,
    p.Color,
    p.Size,
    p.ProductLine,

    d.OrderQty * d.UnitPrice AS GrossSales,

    d.OrderQty *
    d.UnitPrice *
    d.UnitPriceDiscount AS DiscountAmount,

    d.OrderQty *
    d.UnitPrice *
    (1 - d.UnitPriceDiscount) AS NetSales

FROM Sales.SalesOrderHeader AS h

INNER JOIN Sales.SalesOrderDetail AS d
    ON h.SalesOrderID = d.SalesOrderID

INNER JOIN Production.Product AS p
    ON d.ProductID = p.ProductID;
GO
