SET STATISTICS TIME ON ;

SELECT 
      AVG(BidPrice)
    , AVG(CostPerMille)
FROM dbo.ImpressionsArchive ;
