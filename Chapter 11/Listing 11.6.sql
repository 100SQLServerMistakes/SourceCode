ALTER INDEX ImpressionUID 
ON marketing.Impressions REBUILD 
WITH(
    ONLINE = ON,
    MAXDOP = 1
) ;
