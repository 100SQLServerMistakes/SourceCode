SELECT SupplierContactFirstName, SupplierContactLastName
FROM dbo.SupplierContacts
UNION
SELECT CustomerContactFirstName, CustomerContactLastName
FROM dbo.CustomerContacts ;

SELECT SupplierContactFirstName, SupplierContactLastName
FROM dbo.SupplierContacts
UNION ALL
SELECT CustomerContactFirstName, CustomerContactLastName
FROM dbo.CustomerContacts ;
