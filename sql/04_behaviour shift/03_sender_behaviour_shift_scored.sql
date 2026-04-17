-- ===============================================================================
-- Behaviour Shift
-- 03_sender_behaviour_shift_risk.sql
-- Detecting Changes in Sender Activity 
-- Assigning risk score to the behaviour changes with 40% allocated to Transaction growth and 60% allocated to change in Amount 
-- ===============================================================================

CREATE OR REPLACE VIEW sender_behavior_shift_risk AS
SELECT
    source_account_id,
    source_owner_name,

    ROUND(
        LEAST(100,
            (
                (txn_growth_ratio * 40) +
                (volume_growth_ratio * 60)
            )
        )
    , 2) AS behavior_shift_score

FROM sender_behavior_shift_scored;