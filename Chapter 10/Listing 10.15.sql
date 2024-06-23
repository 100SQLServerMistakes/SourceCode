DECLARE @StartDate DATE ;
SET @StartDate = '20210101' ;

DECLARE @EndDate DATE ;
SET @Enddate = '20211231' ;

SELECT *
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= @StartDate AND EventTime <= @EndDate ;
GO


DECLARE @StartDate DATETIME ;
SET @StartDate = '20210101' ;

DECLARE @EndDate DATETIME ;
SET @Enddate = '20211231' ;

SELECT *
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= @StartDate AND EventTime <= @EndDate ;
