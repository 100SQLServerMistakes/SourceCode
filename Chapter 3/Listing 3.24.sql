DECLARE @EmployeeAddress NVARCHAR(MAX) ;

SET @EmployeeAddress = (
    SELECT
          1 AS 'EmployeeID'
        , '5331 Rexford Court' AS 'Address.Line1'
        , 'Montgomery'         AS 'Address.City'
        , 'AL'                 AS 'Address.State'
        , '36116'              AS 'Address.ZipCode'
    FOR JSON PATH, ROOT ('EmployeeAddress')
) ;

SELECT *
FROM OPENJSON(@EmployeeAddress, '$.EmployeeAddress[0]')
WITH (
    EmployeeID SMALLINT,
    Line1 NVARCHAR(64) '$.Address.Line1',
    City NVARCHAR(64) '$.Address.City',
    [State] NCHAR(2) '$.Address.State',
    ZipCode NVARCHAR(10) '$.Address.ZipCode'
) ;
