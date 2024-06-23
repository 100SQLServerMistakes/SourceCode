SELECT
      1 AS 'EmployeeID'
    , '5331 Rexford Court' AS 'Address.Line1'
    , 'Montgomery'         AS 'Address.City'
    , 'AL'                 AS 'Address.State'
    , '36116'              AS 'Address.ZipCode'
FOR JSON PATH, ROOT ('EmployeeAddress') ;
