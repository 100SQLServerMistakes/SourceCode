EXEC sp_rename 'dbo.SalesOrderDetails', 'SalesOrderLines' ;
GO

EXEC dbo.InsertSalesOrder
      '1637D-U06'
    , '2023-08-19'
    , 1
    , 1
    , 2
    , '2023-09-01'
    , NULL
    , 'Get Me There!'
    , 5
    , 1 ;
