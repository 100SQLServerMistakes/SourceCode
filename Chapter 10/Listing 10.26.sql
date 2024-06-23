SELECT SUM(BidPrice)
FROM dbo.ImpressionsArchive
WHERE CountryCode = (
    SELECT CountryCode
    FROM dbo.ImpressionsArchive
    WHERE ImpressionID = 100
) ;

COMMIT
