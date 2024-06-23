CREATE DATABASE HumanResources ;
GO

USE HumanResources ;
GO

CREATE TABLE dbo.Employees (
    EmployeeID               NVARCHAR(MAX)    NOT NULL,
    FirstName                NVARCHAR(MAX)    NOT NULL,
    LastName                 NVARCHAR(MAX)    NOT NULL,
    DateOfBirth              NVARCHAR(MAX)    NOT NULL,
    EmployeeStartDate        NVARCHAR(MAX)    NOT NULL,
    ManagerID                NVARCHAR(MAX)    NULL,
    Salary                   NVARCHAR(MAX)    NOT NULL,
    Department               NVARCHAR(MAX)    NOT NULL,
    DepartmentCode           NVARCHAR(MAX)    NOT NULL,
    Role                     NVARCHAR(MAX)    NOT NULL,
    WeeklyContractedHours    NVARCHAR(MAX)    NOT NULL,
    StaffOrContract          NVARCHAR(MAX)    NOT NULL,
    ContractEndDate          NVARCHAR(MAX)    NULL
) ;
