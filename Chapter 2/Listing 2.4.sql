CREATE PROCEDURE sp_stockUpdate
    @ProductStockLevel INT,
    @StockID INT
AS
BEGIN
    UPDATE tbl_products
    SET StockQty = StockQty - @productStockLevel
    WHERE ProductID = @StockID ;

    UPDATE [DCSVR01\Inventory].InventoryDB.dbo.productStock
    SET StockQty = StockQty - @productStockLevel
    WHERE ProductID = @StockID ;
END
