ALTER DATABASE PromotionDB SET RECOVERY FULL ;
GO

INSERT INTO dbo.Incidental
SELECT object_id
FROM sys.all_objects ;
