CREATE DATABASE PromotionDB ;
GO

ALTER DATABASE PromotionDB SET RECOVERY SIMPLE ;
GO

USE PromotionDB ;
GO

CREATE TABLE dbo.Incidental (
    ID    INT
) ;
GO


BACKUP DATABASE PromotionDB 
TO  DISK = 'D:\Backups\PromotionDBSimpleBackup.bak' ;
GO
