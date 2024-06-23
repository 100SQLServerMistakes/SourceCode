BEGIN TRANSACTION

SELECT COUNT(*)
FROM dbo.ImpressionsArchive
WHERE OperatingSystemID = (
    SELECT OperatingSystemID
    FROM dbo.ImpressionsArchive
    WHERE ImpressionID = 100
) ;
