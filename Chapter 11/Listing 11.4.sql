SELECT 
      i.name AS IndexName
    , AVG(ips.avg_page_space_used_in_percent) AS AveragePageDensity
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
GROUP BY i.name
ORDER BY IndexName ;
