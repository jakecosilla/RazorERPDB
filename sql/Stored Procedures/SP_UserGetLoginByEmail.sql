USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_UserGetLoginByEmail')
BEGIN
    EXEC ('CREATE PROCEDURE SP_UserGetLoginByEmail AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_UserGetLoginByEmail
    @Email NVARCHAR(100)
AS
BEGIN
    SELECT
        Password,
        Email,
		Role
    FROM Users 
    WHERE Email = @Email;
END;
GO