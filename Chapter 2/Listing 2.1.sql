SELECT 
    name
FROM sys.procedures ;

SELECT 
    name
FROM sys.objects
WHERE type_desc = 'SQL_STORED_PROCEDURE' ;

SELECT 
    name
FROM sys.objects
WHERE type = 'P' ;
