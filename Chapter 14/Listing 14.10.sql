OPEN SYMMETRIC KEY SalaryKey
DECRYPTION BY CERTIFICATE SalaryCert ;

UPDATE dbo.Employees
    SET EncryptedSalary = 
        ENCRYPTBYKEY(KEY_GUID('SalaryKey'), CAST(Salary AS VARCHAR(10))) ;

CLOSE SYMMETRIC KEY SalaryKey ;
