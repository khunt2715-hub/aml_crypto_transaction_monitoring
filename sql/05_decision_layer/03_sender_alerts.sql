-- ===============================================================================
-- Decision Layer
-- 03_sender_alerts.sql
-- Creates an Alert View with a Priority Level Assigned - Alert, Monitor, Watch and Normal
-- ===============================================================================

CREATE OR REPLACE VIEW sender_alerts AS
SELECT
    source_account_id,
    source_owner_name,
    final_risk_score,
    behavior_shift_score,

    CASE
        WHEN final_risk_score >= 70 AND behavior_shift_score >= 70 THEN 'ALERT'
        WHEN final_risk_score >= 70 THEN 'MONITOR'
        WHEN behavior_shift_score >= 70 THEN 'WATCH'
        ELSE 'NORMAL'
    END AS alert_level

FROM sender_final_risk;

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