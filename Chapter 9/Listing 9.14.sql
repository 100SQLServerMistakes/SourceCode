DECLARE @Command NVARCHAR(MAX) ;
DECLARE @Table NVARCHAR(256) ;

DECLARE Tables CURSOR READ_ONLY FOR
SELECT name
FROM sys.tables ;

OPEN Tables ;

FETCH NEXT FROM Tables INTO @Table
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Command = 'ALTER INDEX ALL ON ' + QUOTENAME(@Table) + ' REBUILD ; ' ;
	EXEC(@Command) ;

	FETCH NEXT FROM Tables INTO @Table ;
END

CLOSE Tables ;
DEALLOCATE Tables ;
