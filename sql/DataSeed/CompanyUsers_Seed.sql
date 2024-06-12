USE RazorERPDB;
GO

-- Check and Insert Data into Companies Table
IF NOT EXISTS (SELECT * FROM Companies WHERE Name = 'Google')
BEGIN
    INSERT INTO Companies (Id, Name) VALUES (NEWID(), 'Google');
END
GO

IF NOT EXISTS (SELECT * FROM Companies WHERE Name = 'Meta')
BEGIN
    INSERT INTO Companies (Id, Name) VALUES (NEWID(), 'Meta');
END
GO

IF NOT EXISTS (SELECT * FROM Companies WHERE Name = 'Toyota')
BEGIN
    INSERT INTO Companies (Id, Name) VALUES (NEWID(), 'Toyota');
END
GO

-- Seed admin users for each company

-- Admin for Google
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Google');
    DECLARE @AdminPassword NVARCHAR(100) = '$2a$11$vuSAB8x8Wk6cZTYqEdBIru/a2ubWa7IE6On5dsqeLm0qHOdugKxvW'; -- "adminpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'admin_google@example.com')
    BEGIN
        DECLARE @AdminUserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@AdminUserId, @AdminPassword, 'Admin', @CompanyId, 'Admin', 'Google', 'admin_google@example.com', '1234567890');
    END
END
GO

-- Admin for Meta
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Meta');
    DECLARE @AdminPassword NVARCHAR(100) = '$2a$11$vuSAB8x8Wk6cZTYqEdBIru/a2ubWa7IE6On5dsqeLm0qHOdugKxvW'; -- "adminpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'admin_meta@example.com')
    BEGIN
        DECLARE @AdminUserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@AdminUserId, @AdminPassword, 'Admin', @CompanyId, 'Admin', 'Meta', 'admin_meta@example.com', '1234567890');
    END
END
GO

-- Admin for Toyota
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Toyota');
    DECLARE @AdminPassword NVARCHAR(100) = '$2a$11$vuSAB8x8Wk6cZTYqEdBIru/a2ubWa7IE6On5dsqeLm0qHOdugKxvW'; -- "adminpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'admin_toyota@example.com')
    BEGIN
        DECLARE @AdminUserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@AdminUserId, @AdminPassword, 'Admin', @CompanyId, 'Admin', 'Toyota', 'admin_toyota@example.com', '1234567890');
    END
END
GO

-- Seed user role for each company

-- User for Google
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Google');
    DECLARE @UserPassword NVARCHAR(100) = '$2a$11$cqdsiECTNxnaeEkimAMnBuUkg7lLd.7Yh900NCmzcWUvDD2Dpoi5i'; -- "userpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'user_google@example.com')
    BEGIN
        DECLARE @UserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@UserId, @UserPassword, 'User', @CompanyId, 'User', 'Google', 'user_google@example.com', '0987654321');
    END
END
GO

-- User for Meta
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Meta');
    DECLARE @UserPassword NVARCHAR(100) = '$2a$11$cqdsiECTNxnaeEkimAMnBuUkg7lLd.7Yh900NCmzcWUvDD2Dpoi5i'; -- "userpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'user_meta@example.com')
    BEGIN
        DECLARE @UserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@UserId, @UserPassword, 'User', @CompanyId, 'User', 'Meta', 'user_meta@example.com', '0987654321');
    END
END
GO

-- User for Toyota
BEGIN
    DECLARE @CompanyId UNIQUEIDENTIFIER = (SELECT Id FROM Companies WHERE Name = 'Toyota');
    DECLARE @UserPassword NVARCHAR(100) = '$2a$11$cqdsiECTNxnaeEkimAMnBuUkg7lLd.7Yh900NCmzcWUvDD2Dpoi5i'; -- "userpass"
    IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'user_toyota@example.com')
    BEGIN
        DECLARE @UserId UNIQUEIDENTIFIER = NEWID();
        INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
        VALUES (@UserId, @UserPassword, 'User', @CompanyId, 'User', 'Toyota', 'user_toyota@example.com', '0987654321');
    END
END
GO
