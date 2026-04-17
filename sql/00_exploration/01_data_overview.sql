-- ===============================================================================
-- Exploration
-- 01_data_overview.sql
-- Checking transaction counts, date ranges and unique acccounts
-- ===============================================================================

SELECT COUNT(*) FROM transactions_clean;
SELECT MIN(created_at_utc), MAX(created_at_utc) FROM transactions_clean;
SELECT COUNT(DISTINCT source_account_id) FROM transactions_clean;