CREATE TABLE #Categories (
    [Raw Ingredients]               INT,
    [Machine Parts]                 INT,
    [Misc]                          INT,
    [Confectionary Products]        INT,
    [Non-confectionary Products]    INT
  ) ;

INSERT INTO #Categories
VALUES (0,0,0,0,0) ;

DECLARE @Category as varchar(32) ;
DECLARE @Stock as varchar(32) ;
    
DECLARE product_cursor CURSOR FOR 
SELECT 
      pc.ProductCategoryName
    , SUM(ISNULL(p.ProductStockLevel,0)) Stock
FROM dbo.ProductCategories pc
INNER JOIN dbo.ProductSubcategories ps
    ON pc.ProductCategoryID = ps.ProductCategoryID
LEFT JOIN dbo.Products p
    ON ps.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY ProductCategoryName ;

OPEN product_cursor  ;

FETCH NEXT FROM product_cursor INTO @Category, @Stock  ;

WHILE @@FETCH_STATUS = 0  
BEGIN  
    IF @Category = 'Raw Ingredients'
        UPDATE #Categories
        SET [Raw Ingredients] = [Raw Ingredients] + @Stock
    ELSE IF @Category = 'Machine Parts'
        UPDATE #Categories
        SET [Machine Parts] = [Machine Parts] + @Stock
    ELSE IF @Category = 'Misc'
        UPDATE #Categories
        SET [Misc] = [Misc] + @Stock
    ELSE IF @Category = 'Confectionary Products'
        UPDATE #Categories
        SET [Confectionary Products] = [Confectionary Products] + @Stock
    ELSE IF @Category = 'Non-confectionary Products'
        UPDATE #Categories
        SET [Non-confectionary Products] = [Non-confectionary Products] + @Stock ;

    FETCH NEXT FROM product_cursor INTO @Category, @Stock  ;
END

SELECT 
      [Raw Ingredients]
    , [Machine Parts], [Misc]
    , [Confectionary Products]
    , [Non-confectionary Products]
FROM #Categories ;

CLOSE product_cursor ;

DEALLOCATE product_cursor ;

DROP TABLE #Categories ;
