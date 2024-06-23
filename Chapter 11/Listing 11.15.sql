DECLARE @SQL NVARCHAR(MAX) ;

SET @SQL = (
    SELECT
     ' UPDATE STATISTICS ' + s.name + '.' + t.name + ' WITH FULLSCAN, COLUMNS ; '
    FROM sys.tables t
    INNER JOIN sys.schemas s
        ON t.schema_id = s.schema_id
    FOR XML PATH('')
) ;

EXEC(@SQL) ;
