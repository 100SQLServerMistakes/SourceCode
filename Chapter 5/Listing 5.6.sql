CREATE NONCLUSTERED INDEX [OrderDate-Including-DueDate-ActualDate] 
    ON dbo.SalesOrderHeaders (SalesOrderDate)
INCLUDE(SalesOrderDeliveryDueDate,SalesOrderDeliveryActualDate) ;
