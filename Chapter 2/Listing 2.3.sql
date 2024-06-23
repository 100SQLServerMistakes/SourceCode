CREATE PROCEDURE sp_orders
    @CustomerID INT,
    @LineItems XML,
    @AddressID INT,
    @Address INT,
    @date DATETIME
AS
BEGIN
    DECLARE @Stock INT = 0 ;
    DECLARE @Product INT = 0 ;
    
    INSERT INTO tbl_orders (CustomerID, LineItems, BillingAddressID, DeliveryAddressID, Date)
    VALUES (@CustomerID, @LineItems, @AddressID, @Address, @date) ;

    SET @Stock = @LineItems.value('(/Product/@qty)[1]', 'int') ;
    SET @Product = @LineItems.value('(/Product/@ProductID)[1]', 'int') ;

    EXEC sp_stockUpdate @product, @stock ;
END
