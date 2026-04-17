-- ===============================================================================
-- Behaviour Shift
-- 01_sender_behaviour_shift.sql
-- Detecting Changes in Sender Activity 
-- Most Recent 30 days compared to Previous 30 days
-- ===============================================================================

CREATE OR REPLACE VIEW sender_behavior_shift AS
SELECT
    source_account_id,
    source_owner_name,

    -- recent 30 days (end of dataset)
    SUM(CASE 
        WHEN created_at_utc >= (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 30 DAY
        THEN 1 ELSE 0
    END) AS recent_txns,

    SUM(CASE 
        WHEN created_at_utc >= (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 30 DAY
        THEN total_amount ELSE 0
    END) AS recent_amount,

    -- previous 30 days
    SUM(CASE 
        WHEN created_at_utc < (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 30 DAY
        AND created_at_utc >= (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 60 DAY
        THEN 1 ELSE 0
    END) AS prev_txns,

    SUM(CASE 
        WHEN created_at_utc < (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 30 DAY
        AND created_at_utc >= (
            SELECT MAX(created_at_utc) FROM transactions_clean
        ) - INTERVAL 60 DAY
        THEN total_amount ELSE 0
    END) AS prev_amount

FROM transactions_clean
GROUP BY source_account_id, source_owner_name;

