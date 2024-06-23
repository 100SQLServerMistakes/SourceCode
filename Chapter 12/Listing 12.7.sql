SELECT
      total_vlf_count
    , active_vlf_count
    , log_truncation_holdup_reason
FROM sys.dm_db_log_stats(DB_ID('Marketing')) ;
