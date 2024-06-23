ALTER INDEX ImpressionUID
ON marketing.Impressions 
SET (
    OPTIMIZE_FOR_SEQUENTIAL_KEY = ON
) ;
