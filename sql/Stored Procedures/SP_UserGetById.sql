USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UserGetById')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UserGetById AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UserGetById
    @Id UNIQUEIDENTIFIER
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
    WHERE Id = @Id;
END;
GO