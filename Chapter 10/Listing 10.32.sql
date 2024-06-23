BEGIN TRANSACTION

    UPDATE dbo.ImpressionsArchive
    SET BidPrice = BidPrice + 0.1
    WHERE ImpressionID = 100 ;

    UPDATE dbo.ImpressionsArchive
    SET CostPerMille = CostPerMille + 0.1
    WHERE ImpressionID = 100 ;
