SET STATISTICS IO ON ;
GO

SELECT *
FROM dbo.ImpressionsArchive
WHERE EventTime >= '20210101' AND EventTime <= '20211231' ;
