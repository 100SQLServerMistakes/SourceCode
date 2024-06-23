/* tsqllint-disable error schema-qualify */
EXEC sp_rename 'tbl_addresses', 'addresses' ;

EXEC sp_rename 'tbl_orders', 'orders' ;

EXEC sp_rename 'tbl_customers', 'customers' ; 

DROP VIEW dbo.v_customers ;
GO

CREATE VIEW dbo.customerOrders 
AS    
SELECT    
      c.FirstName    
    , c.LastName    
    , c.email
    , o.LineItems.value('(/Product/@ProductName)[1]', 'int') AS ProductName
    , o.LineItems.value('(/Product/@OrderQty)[1]', 'int') AS OrderQty
    , o.OrderDate
FROM dbo.customers c
INNER JOIN dbo.orders o
    ON c.CustomerID = o.CustomerID ;
GO

DROP PROCEDURE dbo.sp_orders ; 
GO

CREATE PROCEDURE dbo.sp_addOrder
    @CustomerID INT,
    @LineItems XML,
    @BillingAddressID INT,    
    @DeliveryAddressID INT,    
    @OrderDate DATETIME    
AS
BEGIN
    DECLARE @OrderQty INT = 0 ;    
    DECLARE @ProductID INT = 0 ;    
    
    INSERT INTO orders (CustomerID, LineItems, BillingAddressID, DeliveryAddressID, OrderDate)
    VALUES (@CustomerID, @LineItems, @BillingAddressID, @DeliveryAddressID, @OrderDate) ;    

    SET @OrderQty = @LineItems.value('(/Product/@OrderQty)[1]', 'int') ;    
    SET @ProductID = @LineItems.value('(/Product/@ProductID)[1]', 'int') ;

    EXEC sp_updateProductStockLevel @OrderQty, @ProductID ;    
END
GO

DROP PROCEDURE dbo.sp_updateProductStockLevel ;
GO

CREATE PROCEDURE dbo.sp_updateProductStockLevel
    @OrderQty INT,    
    @ProductID INT    
AS
BEGIN
    UPDATE products
    SET StockQty = StockQty - @OrderQty
    WHERE ProductID = @ProductID ;

    UPDATE [DCSVR01\Inventory].InventoryDB.dbo.productStock
    SET StockQty = StockQty - @OrderQty
    WHERE ProductID = @ProductID ;
END
