SELECT
    CampaignID, 
    CountryCode, 
    BidPrice, 
    CostPerMille, 
    EventTime
FROM marketing.Impressions
WHERE (EventTime >= GETDATE() - 30) ;
