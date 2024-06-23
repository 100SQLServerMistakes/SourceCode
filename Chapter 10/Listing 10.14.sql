SELECT *
FROM dbo.ImpressionsArchivePartitioned
WHERE CampaignID = 44538 
AND EventTime >= '20210101' AND EventTime <= '20211231' ;

SELECT *
FROM dbo.ImpressionsArchivePartitioned
WHERE CampaignID = 44538 
OR EventTime >= '20210101' AND EventTime <= '20211231' ;
