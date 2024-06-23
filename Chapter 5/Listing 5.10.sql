CREATE NONCLUSTERED INDEX [NI-CustomerContactEmail-Include-FirstName-LastName] ON dbo.CustomerContacts(CustomerContactEmail) 
    INCLUDE(CustomerContactFirstName, CustomerContactLastName) ;
