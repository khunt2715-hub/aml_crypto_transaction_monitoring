-- ===============================================================================
-- Decision Layer
-- 04_sender_investigation.sql
-- Creates an Investigation Queue 
-- ===============================================================================

CREATE OR REPLACE VIEW investigation_queue AS
SELECT
    source_account_id,
    source_owner_name,
    final_risk_score,
    behavior_shift_score,
    alert_level,

    -- prioritization score (simple ranking logic)
    ROUND(
        (final_risk_score * 0.7) +
        (behavior_shift_score * 0.3)
    , 2) AS priority_score

FROM sender_alerts
WHERE alert_level IN ('ALERT', 'MONITOR', 'WATCH');