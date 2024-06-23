DECLARE @FirstName TABLE (FirstName NVARCHAR(32)) ;

DECLARE @LastName TABLE (LastName NVARCHAR(32)) ;

DECLARE @domain TABLE (Domain NVARCHAR(250)) ;

DECLARE @topleveldomain TABLE (TLD NVARCHAR(6)) ;

DECLARE @email TABLE (Email NVARCHAR(256)) ;

INSERT INTO @FirstName
VALUES
('Rachel'),
('Seth'),
('Tony'),
('Angel'),
('Isabell'),
('Robert'),
('Adelaide'),
('Jessie'),
('Paxton'),
('London'),
('Jadyn'),
('Corey'),
('Maximo'),
('Johan'),
('Mariah'),
('Raven'),
('Hamza'),
('Cristofer'),
('Molly'),
('Malcolm') ;

INSERT INTO @LastName
VALUES
 ('Hill'),
 ('Acosta'),
 ('Oconnell'),
 ('Jefferson'),
 ('Cross'),
 ('Patel'),
 ('House'),
 ('Price'),
 ('Morales'),
 ('Reeves'),
 ('Rice'),
 ('Drake'),
 ('Briggs'),
 ('Henry'),
 ('Aguilar'),
 ('Holloway'),
 ('Burnett'),
 ('Aguilar'),
 ('Simon'),
 ('Barry') ;

INSERT INTO @domain
SELECT 
    CONCAT(FirstName, LastName)
FROM @FirstName
CROSS JOIN @LastName ;

 INSERT INTO @topleveldomain
 VALUES
 ('.net'),
 ('.com'),
 ('.co.uk'),
 ('.eu'),
 ('.ru'),
 ('.edu'),
 ('.gov'),
 ('.ninja'),
 ('.io'),
 ('.co'),
 ('.ai'),
 ('.ca'),
 ('.me'),
 ('.de'),
 ('.fr'),
 ('.ac'),
 ('.am'),
 ('.ax'),
 ('.ba'),
 ('.ch') ;

INSERT INTO @email
SELECT
    CONCAT(Domain, TLD)
FROM @domain
CROSS JOIN @topleveldomain ;
    

INSERT INTO dbo.CustomerContacts(CustomerContactFirstName, CustomerContactLastName, CustomerContactEmail)
SELECT
      FirstName
    , LastName
    , Email
FROM @FirstName
CROSS JOIN @LastName
CROSS JOIN @email ;
