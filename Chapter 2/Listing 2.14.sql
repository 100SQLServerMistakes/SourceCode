SELECT 
      c.FirstName 
    , c.LastName
    , o.LineItems
FROM dbo.customers c 
LEFT JOIN dbo.orders o 
    ON c.CustomerID = o.CustomerID 
WHERE c.CustomerID >= 2 AND c.CustomerID <= 3 
    AND c.CustomerID <> 2 ;
SELECT 
    cust.FirstName,
    cust.LastName,
    ord.LineItems
FROM dbo.customers cust
LEFT JOIN (SELECT CustomerID, LineItems FROM dbo.Orders) ord ON cust.CustomerID = ord.CustomerID
WHERE cust.CustomerID BETWEEN 2 AND 3 AND cust.CustomerID != 2 ;
