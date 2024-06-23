SELECT
      Server
    , name
    , message
    , run_status
FROM (
    SELECT
          Server
        , j.name
        , jh.message
        , jh.run_status
        , ROW_NUMBER() OVER(PARTITION BY Server ORDER BY run_date, run_time DESC) AS RowNumber
    FROM msdb.dbo.sysjobhistory jh
    INNER JOIN msdb.dbo.sysjobs j
        ON j.job_id = jh.job_id
    WHERE jh.run_status = 0
    AND j.name = 'Backups'
) Results
WHERE RowNumber = 1 ;
