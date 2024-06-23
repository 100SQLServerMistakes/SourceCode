ALTER INDEX ImpressionUID 
ON marketing.Impressions RESUME 
WITH(
    MAXDOP = 1
) ;
