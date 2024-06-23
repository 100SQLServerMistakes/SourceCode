SELECT 
    c.name
FROM SYS.all_columns c
INNER JOIN SYS.all_objects o
    ON o.object_id = c.object_id
WHERE o.name = 'databases'
    AND c.column_id = 54 ;
