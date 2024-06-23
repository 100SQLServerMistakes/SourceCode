DROP TABLE dbo.Employees
GO

CREATE TABLE dbo.Employees (
    EmployeeID             SMALLINT      NOT NULL  PRIMARY KEY,
    FirstName              NVARCHAR(32)  NOT NULL,
    LastName               NVARCHAR(32)  NOT NULL,
    DateOfBirth            DATE          NOT NULL,
    EmployeeStartDate      DATE          NOT NULL,
    ManagerID              SMALLINT      NULL,
    Salary                 MONEY         NOT NULL,
    Department             NVARCHAR(64)  NOT NULL,
    DepartmentCode         NVARCHAR(4)   NOT NULL,
    Role                   NVARCHAR(64)  NOT NULL,
    WeeklyContractedHours  INT           NOT NULL,
    StaffOrContract        BIT           NOT NULL,
    ContractEndDate        DATE          NULL
) ;
