DECLARE @Manager HIERARCHYID ;

SELECT @Manager = ManagerHierarchyID  
FROM dbo.Employees
WHERE EmployeeID = 2 ;  

SELECT
      EmployeeID
    , FirstName
    , LastName
    , ManagerHierarchyID.ToString()
FROM dbo.Employees
WHERE ManagerHierarchyID.IsDescendantOf(@Manager) = 1 ;
