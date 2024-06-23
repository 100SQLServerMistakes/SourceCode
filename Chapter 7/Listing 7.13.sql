CREATE PROCEDURE dbo.CalculateCampaignSummary
    @CampaignID INT,
    @Budget MONEY
AS
BEGIN
    DECLARE @AvgCPM DECIMAL ;
    DECLARE @CampaignCost MONEY ;
    DECLARE @NoOfImp INT ;
    DECLARE @AvgBidPrice MONEY ;
    DECLARE @CostOfBidPerc DECIMAL ;
    DECLARE @BudgetDifference MONEY ;

    SELECT 
          @NoOfImp = COUNT(*) 
        , @CampaignCost = (SUM(CostPerMille) / 1000) * COUNT(*) 
    FROM marketing.Impressions
    WHERE CampaignID = @CampaignID
    GROUP BY CampaignID ;

    SELECT 
          @avgcpm = AvgCostPerMille
        , @avgbidprice = AvgBidPrice
    FROM reporting.ImpressionAggregates
    WHERE CampaignID = @CampaignID ;

    SET @CostOfBidPerc = (@AvgBidPrice / @AvgCPM) * 100 ;
    SET @BudgetDifference = @budget - @CampaignCost ;

    SELECT 
          @CampaignID CampaignID
        , @AvgCPM AvgCPM
        , @CampaignCost CampaignCost
        , @NoOfImp ImpQty
        , @CostOfBidPerc CostToBidPercentage
        , @BudgetDifference ;

    SELECT DISTINCT
          ReferralURL
        , RenderingID
    FROM marketing.Impressions
    WHERE CampaignID = @CampaignID ;
END
