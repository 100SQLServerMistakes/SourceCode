MERGE INTO reporting.ImpressionAggregates AS Target
USING (
    SELECT
          CampaignID
        , CountryCode
        , AVG(BidPrice) AS AvgBidPrice
        , AVG(CostPerMille) AS AvgCostPerMille
        , CAST(EventTime as DATE) AS EventDate
    FROM marketing.Impressions
    GROUP BY 
          CampaignID
        , CountryCode
        , CAST(EventTime as DATE)
) AS source
ON (
    Source.CampaignID = Target.CampaignID
        AND Source.CountryCode = Target.CountryCode
        AND Source.EventDate = Target.EventDate
)
WHEN MATCHED THEN
    UPDATE SET 
          AvgBidPrice = Source.AvgBidPrice
        , AvgCostPerMille = Source.AvgCostPerMille 
WHEN NOT MATCHED THEN
    INSERT (
           CampaignID,
           CountryCode, 
           EventDate, 
           AvgBidPrice, 
           AvgCostPerMille
           )
    VALUES (
           Source.CampaignID,
           Source.CountryCode, 
           Source.EventDate, 
           Source.AvgBidPrice, 
           Source.AvgCostPerMille
           ) ;
