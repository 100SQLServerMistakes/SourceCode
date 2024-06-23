UPDATE dbo.PurchaseOrderDetails
SET PurchaseOrderNumber = 6827
WHERE PurchaseOrderNumber = 6828 ;

ALTER TABLE dbo.PurchaseOrderDetails ADD CONSTRAINT
    FK_PurchaseOrderDetails_PurchaseOrderHeaders FOREIGN KEY (PurchaseOrderNumber) REFERENCES dbo.PurchaseOrderHeaders(PurchaseOrderNumber) ;
