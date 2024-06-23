EXEC sp_addmessage 50001, 16, 'Attempt to disable xp_cmdshell' ;
GO

CREATE TRIGGER prevent_xp_cmdshell
ON ALL SERVER
FOR ALTER_INSTANCE
AS
BEGIN
  DECLARE @Statement NVARCHAR(4000) ;
  
  SET @Statement = (SELECT EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'nvarchar(4000)')) ;
  
  IF (CHARINDEX('sp_configure', @Statement) > 0)  
         AND (CHARINDEX('xp_cmdshell', @Statement) > 0)
  BEGIN
    RAISERROR(50001, 16, 1, 'Attempt to disable xp_cmdshell') WITH LOG ;
    ROLLBACK ;
  END
END ;
GO
