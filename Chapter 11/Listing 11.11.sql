DECLARE @SQL NVARCHAR(MAX) ;

SET @SQL = (
    SELECT 
        ' ALTER INDEX ' + i.name + ' ON ' + s.name + '.' + o.name + ' REBUILD ; '
    FROM sys.dm_db_index_physical_stats(DB_ID(),NULL,NULL,NULL,'DETAILED') ips
    INNER JOIN sys.indexes i
        ON i.object_id = ips.object_id
        AND i.index_id = ips.index_id
    INNER JOIN sys.objects o
        ON i.object_id = o.object_id
    INNER JOIN sys.schemas s
        ON s.schema_id = o.schema_id
    WHERE i.type_desc <> 'HEAP'
        AND o.type_desc = 'USER_TABLE'
        AND (
            ips.avg_fragmentation_in_percent > 20 OR
            ips.avg_page_space_used_in_percent > CASE WHEN i.fill_factor = 0 THEN 100 ELSE i.fill_factor END
        )
        AND ips.page_count > 1000
        AND ips.index_level = 0
    FOR XML PATH('')
) ;

EXEC(@SQL) ;
