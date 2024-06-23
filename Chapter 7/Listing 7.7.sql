ALTER PROCEDURE dbo.InsertSalesOrder
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
    RETRY:
    BEGIN TRY
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
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() = 2627
        BEGIN
          ROLLBACK ;
              THROW 50001, 'A duplicate sales order has been entered.', 1 ;
        END
        IF ERROR_NUMBER() = 1205
        BEGIN
            ROLLBACK ;
             GOTO RETRY ;
        END
        IF ERROR_NUMBER() <> 2627
            AND ERROR_NUMBER() <> 1205
        BEGIN
        ROLLBACK ;
            THROW ;
        END
    END CATCH
END
