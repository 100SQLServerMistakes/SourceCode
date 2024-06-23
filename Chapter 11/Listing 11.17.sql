DECLARE @SQL NVARCHAR(MAX) ;

SET @SQL = (
    SELECT
        ' ALTER INDEX ' + name + ' ON ImpressionsArchive DISABLE ; '
    FROM sys.indexes
    WHERE object_id = OBJECT_ID('ImpressionsArchive')
        AND type > 1
    FOR XML PATH ('')
) ;

EXEC(@SQL) ;
GO

INSERT INTO MarketingArchive.dbo.ImpressionsArchive (
    ImpressionUID, 
    ReferralURL, 
    CookieID, 
    CampaignID, 
    RenderingID, 
    CountryCode, 
    StateID, 
    BrowserVersion, 
    OperatingSystemID, 
    BidPrice, 
    CostPerMille, 
    EventTime
)
SELECT 
      ImpressionUID
    , ReferralURL
    , CookieID
    , CampaignID
    , RenderingID
    , CountryCode
    , StateID
    , BrowserVersion
    , OperatingSystemID
    , BidPrice
    , CostPerMille
    , EventTime
FROM Marketing.marketing.Impressions ;
GO

ALTER INDEX ALL ON dbo.ImpressionsArchive REBUILD ;
GO
