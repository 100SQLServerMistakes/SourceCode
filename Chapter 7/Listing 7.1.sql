CREATE PROCEDURE dbo.InsertSalesOrder
    @SalesOrderNumber NVARCHAR(12),
    @SalesOrderDate DATE,
    @SalesPersonID INT,
    @SalesAreaID INT,
    @CustomerID INT,
    @SalesOrderDeliveryDueDate DATE,
    @SalesOrderDeliveryActualDate DATE,
    @CurrierUsedForDelivery NVARCHAR(32),
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    BEGIN TRANSACTION

        DECLARE @CustomerPrefix NVARCHAR(12) ;
        SET @CustomerPrefix = (
            SELECT SUBSTRING(CustomerCompanyName,1,3)
            FROM dbo.Customers
            WHERE CustomerID = @CustomerID
        ) ;
        
        INSERT INTO dbo.SalesOrderHeaders
        VALUES (
              @CustomerPrefix + @SalesOrderNumber
            , @SalesOrderDate
            , @SalesPersonID
            , @SalesAreaID
            , @CustomerID
            , @SalesOrderDeliveryDueDate
            , @SalesOrderDeliveryActualDate
            , @CurrierUsedForDelivery
        ) ;

        INSERT INTO dbo.SalesOrderDetails (
              ProductID
            , Quantity
            , SalesOrderNumber
        )
        VALUES (
              @ProductID
            , @Quantity
            , @CustomerPrefix + @SalesOrderNumber
        ) ;

    COMMIT
END
