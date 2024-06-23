USE master
GO

CREATE PROCEDURE sp_listing_2_12
AS
BEGIN
    SELECT 'Hello! I am in the master database!' ;
END
GO

USE SalesDb
GO

EXEC sp_listing_2_12 ;
