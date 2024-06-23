SELECT s.definition
FROM sys.objects o 
INNER JOIN sys.sql_modules s
    ON o.object_id = s.object_id
WHERE o.name = 'sp_orders' ;
