USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UserAdd')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UserAdd AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UserAdd
    @Password NVARCHAR(100),
    @Role NVARCHAR(50),
    @CompanyId UNIQUEIDENTIFIER,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    INSERT INTO Users (Id, Password, Role, CompanyId, FirstName, LastName, Email, PhoneNumber)
    VALUES (NEWID(), @Password, @Role, @CompanyId, @FirstName, @LastName, @Email, @PhoneNumber);
END;
GO