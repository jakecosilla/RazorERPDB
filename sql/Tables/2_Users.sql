USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Users')
BEGIN
    CREATE TABLE Users
    (
        Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
        Password NVARCHAR(100) NOT NULL,
        Role NVARCHAR(50) NOT NULL,
        CompanyId UNIQUEIDENTIFIER NOT NULL,
        FirstName NVARCHAR(100) NOT NULL,
        LastName NVARCHAR(100) NOT NULL,
        Email NVARCHAR(100) NOT NULL,
        PhoneNumber NVARCHAR(20) NOT NULL,
        FOREIGN KEY (CompanyId) REFERENCES Companies(Id)
    );
END
ELSE
BEGIN
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'Id')
    BEGIN
        ALTER TABLE Users ADD Id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID();
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'Password')
    BEGIN
        ALTER TABLE Users ADD Password NVARCHAR(100) NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'Role')
    BEGIN
        ALTER TABLE Users ADD Role NVARCHAR(50) NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'CompanyId')
    BEGIN
        ALTER TABLE Users ADD CompanyId UNIQUEIDENTIFIER NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'FirstName')
    BEGIN
        ALTER TABLE Users ADD FirstName NVARCHAR(100) NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'LastName')
    BEGIN
        ALTER TABLE Users ADD LastName NVARCHAR(100) NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'Email')
    BEGIN
        ALTER TABLE Users ADD Email NVARCHAR(100) NOT NULL;
    END
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('Users') AND name = 'PhoneNumber')
    BEGIN
        ALTER TABLE Users ADD PhoneNumber NVARCHAR(20) NOT NULL;
    END
    -- Add foreign key if it does not exist
    IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID('FK_Users_Companies'))
    BEGIN
        ALTER TABLE Users ADD CONSTRAINT FK_Users_Companies FOREIGN KEY (CompanyId) REFERENCES Companies(Id);
    END
END
GO