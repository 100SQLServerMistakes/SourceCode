BACKUP CERTIFICATE CertForBackupEncryption 
TO FILE = 'c:\Certs\CertForBackupEncryptionCert'  
WITH PRIVATE KEY (
    FILE = 'c:\certs\CertForBackupEncryptionPK' ,   
    ENCRYPTION BY PASSWORD = 'Pa$$w0rd' 
) ;  
