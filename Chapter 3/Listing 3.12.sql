DECLARE @EmployeeID INT ;

SET @EmployeeID = 22 ;

SELECT
    FirstName
    , LastName
    , Role
    , ManagerhierarchyID.ToString() AS ManagerHierarchyID
FROM dbo.Employees
WHERE ManagerHierarchyID = (
    SELECT ManagerHierarchyID.GetAncestor(2)
    FROM dbo.Employees
    WHERE EmployeeID = @EmployeeID
) ;
