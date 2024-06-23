BEGIN TRY
    ALTER INDEX ImpressionUID 
    ON marketing.Impressions RESUME 
    WITH(
        MAXDOP = 1
    ) ;
END TRY
BEGIN CATCH
    ALTER INDEX ImpressionUID 
    ON marketing.Impressions REBUILD 
    WITH(
        ONLINE = ON,
        RESUMABLE = ON,
        MAX_DURATION = 1,
        MAXDOP = 1
    ) ;
END CATCH
