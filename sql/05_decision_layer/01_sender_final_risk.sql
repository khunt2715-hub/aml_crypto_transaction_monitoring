-- ===============================================================================
-- Decision Layer
-- 01_sender_final_risk.sql
-- Combines peer-based scoring and behavioural change detection
-- ===============================================================================


CREATE OR REPLACE VIEW sender_final_risk AS
SELECT
    a.source_account_id,
    a.source_owner_name,

    -- raw behavior context
    a.total_txns,
    a.total_amount,
    a.max_txns_day,
    a.stddev_daily_amount,

    -- static risk (peer-based)
    p.risk_score AS percentile_risk_score,

    -- behavioral change risk
    s.behavior_shift_score,

    -- FINAL COMBINED SCORE (0–100)
    ROUND(
        (
            (p.risk_score * 0.60) +
            (s.behavior_shift_score * 0.40)
        )
    , 2) AS final_risk_score,

    -- risk label
    CASE
        WHEN (
            (p.risk_score * 0.60) +
            (s.behavior_shift_score * 0.40)
        ) >= 70 THEN 'HIGH'
        WHEN (
            (p.risk_score * 0.60) +
            (s.behavior_shift_score * 0.40)
        ) >= 40 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS risk_level

FROM sender_activity_profile a

LEFT JOIN sender_risk_score p
    ON a.source_account_id = p.source_account_id

LEFT JOIN sender_behavior_shift_risk s
    ON a.source_account_id = s.source_account_id;