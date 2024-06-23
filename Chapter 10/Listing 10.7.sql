SELECT 
    i.ImpressionUID
FROM Marketing.marketing.Impressions i 
INNER JOIN MarketingArchive.dbo.ImpressionsArchive ia 
    ON i.ImpressionUID = ia.ImpressionUID OPTION (MERGE JOIN, HASH JOIN) ;
