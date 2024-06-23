CREATE DATABASE SQLInjection ;
GO

USE SQLInjection ;
GO

CREATE TABLE dbo.Users
(
    ID              INT              NOT NULL    IDENTITY    PRIMARY KEY,
    UserName        NVARCHAR(128)     NOT NULL,
    UserPassword    NVARCHAR(512)    NOT NULL
) ;
GO

INSERT INTO dbo.Users(UserName, UserPassword)
VALUES('Pete', 'Password1'),
      ('Terri', 'MyPassword') ;
GO
