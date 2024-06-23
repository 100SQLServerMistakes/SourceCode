SET STATISTICS TIME ON ;

SELECT
      CustomerContactFirstName
    , CustomerContactLastName
    , CustomerContactEmail
FROM dbo.CustomerContacts 
ORDER BY CustomerContactEmail ;
