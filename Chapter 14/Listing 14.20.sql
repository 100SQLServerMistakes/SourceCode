DECLARE @UserName NVARCHAR(128) = 'Pete' ;
DECLARE @Password NVARCHAR(128) = 'Password1' ;

EXEC dbo.Login @username, @password ;


SET @UserName = ''' OR 1=1--' ;
SET @Password = 'randomchars' ;

EXEC dbo.Login @username, @password ;
