ALTER PROCEDURE sp_orders
    @CustomerID INT,
    @LineItems XML,
    @BillingAddressID INT,
    @DeliveryAddressID INT,
    @OrderDate DATETIME
AS
BEGIN
    DECLARE @OrderQty INT = 0 ;
    DECLARE @ProductID INT = 0 ;
    
    INSERT INTO tbl_orders (CustomerID, LineItems, BillingAddressID, DeliveryAddressID, OrderDate)
    VALUES (@CustomerID, @LineItems, @BillingAddressID, @DeliveryAddressID, @OrderDate) ; 

    SET @OrderQty = @LineItems.value('(/Product/@OrderQty)[1]', 'int') ; 
    SET @ProductID = @LineItems.value('(/Product/@ProductID)[1]', 'int') ;

    EXEC sp_updateProductStockLevel @OrderQty, @ProductID ; 
END
