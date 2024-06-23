SET XACT_ABORT ON ;

BEGIN TRANSACTION
    SELECT @@TRANCOUNT ;
        INSERT INTO dbo.PurchaseOrderHeaders  (PurchaseOrderNumber, SupplierID, PurchaseOrderDate)
        VALUES 
            (6826, 2, '20230601'),
            (6827, 2, '20230617') ;

    INSERT INTO dbo.PurchaseOrderDetails (ProductID, Quantity, PurchaseOrderNumber)
    VALUES
        (4, 3, 6826),
        (5, 4, 6827),
        (4, 1, 6827) ;
COMMIT
