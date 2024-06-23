SELECT COUNT(DISTINCT ImpressionID)
FROM dbo.ImpressionsArchive
WHERE OperatingSystemID = (
    SELECT OperatingSystemID
    FROM dbo.ImpressionsArchive
    WHERE ImpressionID = 100
) ;

COMMIT
