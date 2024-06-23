DECLARE @SQL NVARCHAR(MAX) ;

SET @SQL = (
    SELECT 'ALTER INDEX ALL ON ' + QUOTENAME(name) + ' REBUILD ; '
    FROM sys.tables
    FOR XML PATH('')
) ;

EXEC(@SQL) ;
