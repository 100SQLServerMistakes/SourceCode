DECLARE @UserDetails XML ;

SET @UserDetails = N'<User>
    <FirstName>Peter</FirstName>
    <LastName>Carter</LastName>
    <email>peter@carter.com</email>
    <UserPassword>myPaSSw0rd</UserPassword>
</User>' ;

EXEC sp_adduser @UserDetails ;
