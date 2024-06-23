DECLARE @SQL NVARCHAR(MAX) ;

SET @SQL = (
    SELECT ' ALTER INDEX ' + i.name + ' ON ' + s.name + '.' + o.name + ' REBUILD ;'
    FROM sys.indexes i
    INNER JOIN sys.objects o
        ON i.object_id = o.object_id
    INNER JOIN sys.schemas s
        ON s.schema_id = o.schema_id
    WHERE i.type_desc <> 'HEAP'
        AND o.type_desc = 'USER_TABLE'
    FOR XML PATH('')
) ;

EXEC(@SQL) ;
