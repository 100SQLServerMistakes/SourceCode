SELECT COUNT(*) 
FROM dbo.ProductSubcategories
WHERE ProductSubcategoryDescription IS NULL ;

SELECT COUNT(*) 
FROM dbo.ProductSubcategories
WHERE ProductSubcategoryDescription IS NOT NULL ;
