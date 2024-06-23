BEGIN TRANSACTION

SELECT SUM(BidPrice)
FROM dbo.ImpressionsArchive
WHERE OperatingSystemID = (
    SELECT OperatingSystemID
    FROM dbo.ImpressionsArchive
    WHERE ImpressionID = 100
) ;
