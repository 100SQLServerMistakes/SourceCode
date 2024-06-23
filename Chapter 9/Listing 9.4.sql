SELECT 
      OBJECT_NAME(ips.object_id) AS table_name
	, i.name AS index_name
	, ips.index_type_desc
	, ips.index_level
	, ips.page_count
	, ips.page_count /128 AS index_level_size_MB
	, ips.avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats(DB_ID('MarketingArchive'), NULL, NULL, NULL, 'Detailed') ips
INNER JOIN sys.indexes i 
    ON i.object_id = ips.object_id 
	AND i.index_id = ips.index_id 
WHERE index_level = 0 ;
