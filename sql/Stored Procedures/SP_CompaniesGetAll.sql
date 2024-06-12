USE RazorERPDB;
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'SP_CompaniesGetAll')
BEGIN
    EXEC ('CREATE PROCEDURE SP_CompaniesGetAll AS BEGIN SET NOCOUNT ON; END');
END
GO
ALTER PROCEDURE SP_CompaniesGetAll
AS
BEGIN
    SELECT 
        Id,
        Name
    FROM Companies;
END;
GO
