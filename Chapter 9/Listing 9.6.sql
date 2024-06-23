USE MarketingArchive ;
GO

SELECT
    name
	, AvailableSpaceMB
	, CurrentSizeMB
	, (CurrentSizeMB - AvailableSpaceMB) * 1.2 AS TargetSizeMB
FROM (
    SELECT 
          name
        , size / 128 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT) / 128 AS AvailableSpaceMB
	    , size / 128 AS CurrentSizeMB
    FROM sys.database_files
    WHERE type = 0
) df ;
