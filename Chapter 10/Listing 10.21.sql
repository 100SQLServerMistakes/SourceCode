BEGIN TRANSACTION

    UPDATE dbo.ImpressionsArchive
    SET BidPrice = 1.812
    WHERE ImpressionID = 100 ;
