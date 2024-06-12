# RazorERPDB

## Overview
  This repository contains SQL scripts for setting up the RazorERPDB, which is the database for the RazorERP system. The database includes tables, stored procedures, and optional data seeding scripts. It's important to execute these scripts in the correct order to ensure the database is set up properly.

## Order of Scripts
1. **Database Creation**
    - The first script to run is the database creation script. This script sets up the RazorERPDB database.
      ```sql
      RazorERPDB.sql
      ```
    - Make sure to create a SQL Server user with the necessary permissions for accessing the database.
2. **Tables**
    - The table creation scripts must be executed in a specific order. Each script is prefixed with a number to indicate the sequence in which they should be run.
3. **Stored Procedures**
    - After the tables have been created, you can run the stored procedure scripts. These scripts do not have a specific order but should be run after all table creation scripts.
4. **Optional Data Seeding**
    - Finally, you can run the optional data seeding scripts to populate the database with initial data. These scripts can be run in any order after the tables and stored procedures have been created.
