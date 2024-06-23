SELECT
      poh.PurchaseOrderNumber
    , poh.PurchaseOrderDate
    , pod.ProductID
    , pod.Quantity
FROM dbo.PurchaseOrderHeaders poh
INNER JOIN dbo.PurchaseOrderDetails pod
    ON poh.PurchaseOrderNumber = pod.PurchaseOrderNumber ;
