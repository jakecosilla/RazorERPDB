USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UsersGetAll')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UsersGetAll AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UsersGetAll
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
    FROM Users;
END;
GO
