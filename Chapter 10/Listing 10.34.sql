DECLARE @ImpressionID BIGINT

DECLARE Impressions CURSOR FAST_FORWARD FOR
SELECT ImpressionID
FROM dbo.ImpressionsArchive ;

OPEN Impressions ;

FETCH NEXT FROM Impressions INTO @ImpressionID
WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE dbo.ImpressionsArchive
    SET BidPrice = BidPrice + 0.1
    WHERE ImpressionID = @ImpressionID ;

    FETCH NEXT FROM Impressions INTO @ImpressionID ;
END

CLOSE Impressions ;
DEALLOCATE Impressions ;

