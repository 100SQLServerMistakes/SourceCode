SELECT
    name
  , index_id
  , type_desc
FROM sys.indexes
WHERE name = 'NI_SalesOrderHeaders_OrderDate' ;
