BEGIN TRANSACTION

    DELETE 
    FROM dbo.ImpressionsArchive
    WHERE ImpressionID IN (
        SELECT TOP 3 ImpressionID
        FROM dbo.ImpressionsArchive
        WHERE OperatingSystemID = (
            SELECT OperatingSystemID
            FROM dbo.ImpressionsArchive
            WHERE ImpressionID = 100
        )
        AND ImpressionID <> 100
    ) ;
    
COMMIT
