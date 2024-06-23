SELECT
      OBJECT_NAME(ius.object_id) AS TableName
    , i.name AS IndexName
    , i.type_desc
    , ius.user_seeks
    , ius.user_scans
    , ius.last_system_lookup
    , ius.last_user_seek
    , ius.last_user_scan
    , ius.last_user_lookup
FROM sys.dm_db_index_usage_stats ius
INNER JOIN sys.indexes i
    ON ius.index_id = i.index_id
    AND ius.object_id = i.object_id
WHERE DB_NAME(database_id) = 'Marketing' ;
