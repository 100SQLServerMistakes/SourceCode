USE master ;
GO

ALTER DATABASE MarketingArchive SET SINGLE_USER ;
GO

DBCC CHECKDB (MarketingArchive, REPAIR_ALLOW_DATA_LOSS) ;
GO

ALTER DATABASE MarketingArchive SET MULTI_USER ;
GO
