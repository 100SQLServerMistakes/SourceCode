CREATE PROCEDURE dbo.Login
      @UserName NVARCHAR(128)
    , @Password NVARCHAR(128)
AS
BEGIN
    SELECT *
    FROM dbo.Users
    WHERE UserName = @UserName
        AND UserPassword = @Password ;
END
