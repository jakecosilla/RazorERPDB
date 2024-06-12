USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CompanyGetById')
BEGIN
    EXEC ('CREATE PROCEDURE SP_CompanyGetById AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_CompanyGetById
    @CompanyId UNIQUEIDENTIFIER
AS
BEGIN
    SELECT 
        Id,
        Name
    FROM Companies 
    WHERE Id = @CompanyId;
END;
GO
