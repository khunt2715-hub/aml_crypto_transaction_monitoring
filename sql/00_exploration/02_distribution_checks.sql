-- ===============================================================================
-- Exploration
-- 02_distribution_checks.sql
-- Identifying users with the highest volume of activity. 
-- Logic check for transaction counts
-- ===============================================================================

SELECT 
source_account_id, 
source_owner_name, 
COUNT(*) AS txn_count
FROM transactions_clean
GROUP BY source_account_id, source_owner_name
ORDER BY txn_count DESC;