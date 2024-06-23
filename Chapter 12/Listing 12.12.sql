USE master ;  
GO  

CREATE MASTER KEY
    ENCRYPTION BY PASSWORD = 'Pa$$w0rd' ;  
GO  

CREATE CERTIFICATE CertForBackupEncryption
   WITH SUBJECT = 'Backup Encryption Certificate' ;  
GO  
