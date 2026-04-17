-- ===============================================================================
-- Decision Layer
-- 02_sender_final_risk_explained.sql
-- Explains the risk scoring results for the 4 areas of review:
-- High activity vs peers, Sudden Behaviour Change, Burst Activity Pattern, Volatility
-- ===============================================================================


CREATE OR REPLACE VIEW sender_final_risk_explained AS
SELECT
    source_account_id,
    source_owner_name,
    final_risk_score,
    risk_level,

    -- explanation signals
    CASE 
        WHEN percentile_risk_score > 80 THEN 'High activity vs peers'
        ELSE NULL
    END AS reason_peer_risk,

    CASE 
        WHEN behavior_shift_score > 70 THEN 'Sudden behavior change'
        ELSE NULL
    END AS reason_shift,

    CASE 
        WHEN max_txns_day > total_txns * 0.3 THEN 'Burst transaction pattern'
        ELSE NULL
    END AS reason_burst,

    CASE 
        WHEN stddev_daily_amount > total_amount * 0.5 THEN 'High volatility'
        ELSE NULL
    END AS reason_volatility

FROM sender_final_risk;