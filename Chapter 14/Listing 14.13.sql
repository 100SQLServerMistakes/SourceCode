ALTER TABLE dbo.Employees
    ADD EncryptedSalaryWithAuth VARBINARY(8000) ;
GO

OPEN SYMMETRIC KEY SalaryKey
DECRYPTION BY CERTIFICATE SalaryCert ;

UPDATE dbo.Employees
        SET EncryptedSalaryWithAuth = 
            ENCRYPTBYKEY(
                Key_GUID('SalaryKey'), 
                CAST(Salary AS VARCHAR(10)), 
                1, 
                CAST(EmployeeID AS VARBINARY(8000))
            ) ;

CLOSE SYMMETRIC KEY SalaryKey ;
