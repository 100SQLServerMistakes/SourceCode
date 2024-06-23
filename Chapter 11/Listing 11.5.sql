SELECT 
      i.name AS IndexName
    , ips.avg_page_space_used_in_percent AS PageDensity
    , ips.index_level    #A
    , ips.page_count    #A
    , ips.record_count    #A
FROM sys.dm_db_index_physical_stats(
                  DB_ID('Marketing')
                , OBJECT_ID('marketing.Impressions')
                , NULL
                , NULL
                , 'DETAILED'
    ) ips
INNER JOIN sys.indexes i
    ON ips.index_id = i.index_id
    AND ips.object_id = i.object_id 
    AND i.name = 'ImpressionUID' ;
