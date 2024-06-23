CREATE PROCEDURE sp_addUser
    @UserDetails XML
AS
BEGIN

    OPEN SYMMETRIC KEY MagicChocKey
        DECRYPTION BY CERTIFICATE MagicChocCertificate ;

    INSERT INTO dbo.customers (
          FirstName
        , LastName
        , email
        , UserPassword
    )
    VALUES (
          @UserDetails.value('(/User/FirstName)[1]','nvarchar(128)')
        , @UserDetails.value('(/User/LastName)[1]','nvarchar(128)')
        , @UserDetails.value('(/User/email)[1]','nvarchar(512)')
        , ENCRYPTBYKEY(KEY_GUID('MagicChocKey'), @UserDetails.value('(/User/UserPassword)[1]','nvarchar(128)'))
    ) ;

    CLOSE SYMMETRIC KEY MagicChocKey ;
END
