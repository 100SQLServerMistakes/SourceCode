BEGIN TRANSACTION

    UPDATE dbo.ImpressionsArchive
    SET BidPrice = 1.5
    WHERE ImpressionID = 100 ;

COMMIT
