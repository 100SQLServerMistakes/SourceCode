SELECT 
      [Raw Ingredients]
    , [Machine Parts]
    , [Misc]
    , [Confectionary Products]
    , [Non-confectionary Products] 
FROM (
    SELECT
          pc.ProductCategoryName
        , ISNULL(p.ProductStockLevel,0) Stock
    FROM dbo.ProductCategories pc
    INNER JOIN dbo.ProductSubcategories ps
        ON pc.ProductCategoryID = ps.ProductCategoryID
    LEFT JOIN dbo.Products p
        ON ps.ProductSubcategoryID = p.ProductSubcategoryID
) AS WorkingTable
PIVOT
(
    SUM(Stock)
    FOR ProductCategoryName IN ([Raw Ingredients], [Machine Parts], [Misc], [Confectionary Products], [Non-confectionary Products] )
) AS PivotTable ;
