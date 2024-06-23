DECLARE @object_id BIGINT
SET @object_id = (
    SELECT object_id 
    FROM sys.objects 
    WHERE name = 'Impressions'
) ;


SELECT 
      OBJECT_NAME(ips.Object_id) AS TableName
    , i.name AS IndexName
    , ips.avg_fragmentation_in_percent
    , ips.avg_page_space_used_in_percent
    , index_level
FROM sys.dm_db_index_physical_stats(DB_ID('Marketing'),@object_id,NULL,NULL,'DETAILED') ips
INNER JOIN sys.indexes i
    ON ips.index_id = i.index_id
    AND ips.object_id = i.object_id
ORDER BY 
      ips.object_id
    , ips.index_id
    , index_level DESC ;
