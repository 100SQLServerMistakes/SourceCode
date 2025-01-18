SET DATEFORMAT DMY
INSERT INTO marketing.Impressions (
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
    , CASE
        WHEN CountryCode = 'NULL' THEN NULL
        ELSE CountryCode
      END CountryCode
    , CASE
        WHEN StateID = 'NULL' THEN NULL
        ELSE StateID
      END StateID
    , BrowserVersion
    , OperatingSystemID
    , CAST(BidPrice AS MONEY)
    , CAST(CostPerMille AS MONEY)
    , EventTime
FROM staging.ImpressionsStage ;
