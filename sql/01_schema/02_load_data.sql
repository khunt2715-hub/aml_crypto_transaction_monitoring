-- ===============================================================================
-- 02_load_data.sql Importing Raw Data
-- Data includes transactions for the period of July 7, 2025 - December 31, 2025
-- ===============================================================================

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FX_Trans_Upload.csv'
INTO TABLE transactions_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

