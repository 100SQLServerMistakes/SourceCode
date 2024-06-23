UPDATE dbo.Employees
SET EncryptedSalaryWithAuth = 
(
    SELECT EncryptedSalaryWithAuth
    FROM dbo.Employees
    WHERE FirstName = 'Bob' 
        AND LastName = 'Walford'
)
WHERE FirstName = 'Robin'
    AND LastName = 'Round' ;
