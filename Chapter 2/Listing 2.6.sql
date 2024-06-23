CREATE PROCEDURE sp_updateProductStockLevel
    @OrderQty INT,
    @ProductID INT
AS
BEGIN
    UPDATE tbl_products
    SET StockQty = StockQty - @OrderQty
    WHERE ProductID = @ProductID ;

    UPDATE [DCSVR01\Inventory].InventoryDB.dbo.productStock
    SET StockQty = StockQty - @OrderQty
    WHERE ProductID = @ProductID ;
END
