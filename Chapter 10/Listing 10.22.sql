SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

    SELECT SUM(BidPrice)
    FROM dbo.ImpressionsArchive
    WHERE CampaignID = (
        SELECT
            CampaignID
        FROM dbo.ImpressionsArchive
        WHERE ImpressionID = 100 
) ;

COMMIT
