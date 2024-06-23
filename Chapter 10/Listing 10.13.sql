SELECT *
FROM dbo.ImpressionsArchivePartitioned
WHERE EventTime >= '20210101' AND EventTime <= '20211231' ;
