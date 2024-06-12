USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UsersGetByCompany')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UsersGetByCompany AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UsersGetByCompany
    @CompanyId UNIQUEIDENTIFIER,
    @Role NVARCHAR(50) = NULL
AS
BEGIN
    SELECT 
        Id,
        Role,
        CompanyId,
        FirstName,
        LastName,
        Email,
        PhoneNumber
    FROM Users 
    WHERE CompanyId = @CompanyId 
      AND (@Role IS NULL OR Role = @Role);
END;
GO