-- ===============================================================================
-- Exploration
-- 03_validation_checks.sql
-- Validation checks for total activity
-- ===============================================================================

SELECT 
    SUM(total_amount),
    AVG(total_amount),
    MAX(total_amount)
FROM transactions_clean;