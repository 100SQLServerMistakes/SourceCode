SELECT 
    in_row_used_page_count
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID('ImpressionsArchive')
    AND index_id = 1 ;
