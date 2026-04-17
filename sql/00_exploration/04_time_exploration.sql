-- ===============================================================================
-- Exploration
-- 04_time_exploration.sql
-- Time-based exploration
-- ===============================================================================

SELECT DATE(created_at_utc), COUNT(*)
FROM transactions_clean
GROUP BY DATE(created_at_utc)
ORDER BY DATE(created_at_utc);