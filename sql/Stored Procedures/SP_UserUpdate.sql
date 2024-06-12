USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UserUpdate')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UserUpdate AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UserUpdate
    @Id UNIQUEIDENTIFIER,
    @Role NVARCHAR(50),
	@Password NVARCHAR(100),
    @CompanyId UNIQUEIDENTIFIER,
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(100),
    @PhoneNumber NVARCHAR(20)
AS
BEGIN
    UPDATE Users
    SET Role = @Role, Password = @Password, CompanyId = @CompanyId, FirstName = @FirstName, LastName = @LastName, Email = @Email, PhoneNumber = @PhoneNumber
    WHERE Id = @Id;
END;
GO