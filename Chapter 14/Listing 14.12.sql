OPEN SYMMETRIC KEY SalaryKey
DECRYPTION BY CERTIFICATE SalaryCert ;


SELECT
      FirstName
    , LastName
    , Role
    , CAST(CONVERT(VARCHAR(10),DECRYPTBYKEY(EncryptedSalary)) AS MONEY)
FROM dbo.Employees 
WHERE (FirstName = 'Bob' AND LastName = 'Walford') OR
      (FirstName = 'Robin' AND LastName = 'Round') ;

CLOSE SYMMETRIC KEY SalaryKey ;
