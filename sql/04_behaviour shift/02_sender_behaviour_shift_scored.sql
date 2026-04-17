-- ===============================================================================
-- Behaviour Shift
-- 02_sender_behaviour_shift_scored.sql
-- Detecting Changes in Sender Activity 
-- Scoring the change in Behaviour 
-- ===============================================================================

CREATE OR REPLACE VIEW sender_behavior_shift_scored AS
SELECT
    source_account_id,
    source_owner_name,

    -- transaction growth
    CASE
        WHEN prev_txns = 0 THEN recent_txns
        ELSE recent_txns / prev_txns
    END AS txn_growth_ratio,

    -- volume growth
    CASE
        WHEN prev_amount = 0 THEN recent_amount
        ELSE recent_amount / prev_amount
    END AS volume_growth_ratio

FROM sender_behavior_shift;