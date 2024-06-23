ALTER INDEX ImpressionUID ON marketing.Impressions REBUILD 
WITH (
    FILLFACTOR = 90, 
    PAD_INDEX = ON
) ;
