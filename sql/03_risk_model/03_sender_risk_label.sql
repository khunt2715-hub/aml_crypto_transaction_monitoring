-- ===============================================================================
-- Risk Model
-- 03_sender_risk_score_label.sql
-- Relative Risk Scoring - Transactions. Amounts, Bursts and Volatilty
-- ===============================================================================

CREATE OR REPLACE VIEW sender_risk_labeled AS
SELECT
    source_account_id,
    source_owner_name,
    risk_score,

    CASE
        WHEN risk_score >= 70 THEN 'HIGH'
        WHEN risk_score >= 40 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS risk_level

FROM sender_risk_score;