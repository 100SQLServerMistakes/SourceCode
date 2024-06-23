DECLARE @CustomerID INT ;
SET @CustomerID = 2 ;

SELECT 
      Street
    , Area
    , City
    , ZipCode
FROM dbo.Addresses a WITH(NOLOCK)
INNER JOIN dbo.Customers c
    ON a.AddressID = c.DeliveryAddressID
WHERE CustomerID = @CustomerID ;
