ALTER INDEX ImpressionUID 
ON marketing.Impressions REBUILD 
WITH(
    ONLINE = ON,
    RESUMABLE = ON,
    MAX_DURATION = 1,
    MAXDOP = 1
) ;
