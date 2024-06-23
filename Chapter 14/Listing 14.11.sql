UPDATE dbo.Employees
SET EncryptedSalary = 
(
    SELECT EncryptedSalary
    FROM dbo.Employees
    WHERE FirstName = 'Bob' 
        AND LastName = 'Walford'
)
WHERE FirstName = 'Robin'
    AND LastName = 'Round' ;
