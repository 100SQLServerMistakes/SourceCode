SELECT COUNT(*)
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= '20210101' AND EventTime <= '20211231' ;
GO


SELECT COUNT(*)
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= '20210101' AND EventTime <= '20211231'
OPTION(RECOMPILE) ;
GO


SELECT COUNT(*)
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= '20210101' AND EventTime <= '20211231'
AND 1<>2 ;
GO
