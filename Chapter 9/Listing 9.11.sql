SELECT 
      li.database_id
    , li.ActualVLFs
    , mf.size/1024/1024 AS SizeInGB
    , mf.size/1024/1024*2. AS MinIdealVLFs
    , mf.size/1024/1024*4. AS MaxIdealVLFs
FROM (
    SELECT database_id, COUNT(*) AS ActualVLFs
    FROM sys.dm_db_log_info(DB_ID('MarketingArchive'))
    GROUP BY database_id
) li
INNER JOIN sys.master_files mf
    ON li.database_id = mf.database_id
WHERE mf.type = 1 ;
