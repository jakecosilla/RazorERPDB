IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'RazorERPDB')
BEGIN
    CREATE DATABASE RazorERPDB;
END
GO