USE master ;
GO

BACKUP DATABASE MarketingArchive
TO  DISK = 'D:\Backups\MarketingArchive.bak' ;
GO

ALTER DATABASE MarketingArchive SET SINGLE_USER WITH NO_WAIT ;
GO

DECLARE @SQL NVARCHAR(MAX)

SELECT @SQL = 'DBCC WRITEPAGE(' +
(
       SELECT CAST(DB_ID('MarketingArchive') AS NVARCHAR)
) +
', ' +
(
       SELECT TOP 1 CAST(file_id AS NVARCHAR)
       FROM MarketingArchive.dbo.ImpressionsArchive
       CROSS APPLY sys.fn_PhysLocCracker(%%physloc%%)
) +
 ', ' +
(
       SELECT TOP 1 CAST(page_id AS NVARCHAR)
       FROM MarketingArchive.dbo.ImpressionsArchive
       CROSS APPLY sys.fn_PhysLocCracker(%%physloc%%)
) +
', 2000, 1, 0x61, 1)' ;

EXEC(@SQL) ;

ALTER DATABASE MarketingArchive SET MULTI_USER ;
GO
