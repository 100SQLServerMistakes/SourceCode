BACKUP DATABASE Marketing 
TO  DISK = 'D:\Backups\MarketingFull256.bak' 
WITH ENCRYPTION (
      ALGORITHM = AES_256
    , SERVER CERTIFICATE = CertForBackupEncryption
) ;
