USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Companies')
BEGIN
    CREATE TABLE Companies
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
        Name NVARCHAR(100) NOT NULL
    );
END
ELSE
BEGIN
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Companies') AND name = 'Id')
    BEGIN
        ALTER TABLE Companies ADD Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID();
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Companies') AND name = 'Name')
    BEGIN
        ALTER TABLE Companies ADD Name NVARCHAR(100) NOT NULL;
    END
END
GO