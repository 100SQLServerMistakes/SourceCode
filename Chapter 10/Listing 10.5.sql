SELECT 
    i.ImpressionUID
FROM Marketing.marketing.Impressions i 
INNER HASH JOIN MarketingArchive.dbo.ImpressionsArchive ia 
    ON i.ImpressionUID = ia.ImpressionUID ;
