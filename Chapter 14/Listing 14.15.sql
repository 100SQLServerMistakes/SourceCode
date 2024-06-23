OPEN SYMMETRIC KEY SalaryKey
DECRYPTION BY CERTIFICATE SalaryCert ;


SELECT
      FirstName
    , LastName
    , Role
    , CAST(
          CONVERT(
              VARCHAR(10), 
              DECRYPTBYKEY(
                  EncryptedSalaryWithAuth, 
                  1 , 
                  CONVERT(VARBINARY, EmployeeID)
              )
          ) AS MONEY
      )
FROM dbo.Employees 
WHERE (FirstName = 'Bob' AND LastName = 'Walford') OR
      (FirstName = 'Robin' AND LastName = 'Round') ;

CLOSE SYMMETRIC KEY SalaryKey ;
