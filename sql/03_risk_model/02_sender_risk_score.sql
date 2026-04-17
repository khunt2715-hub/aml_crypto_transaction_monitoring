-- ===============================================================================
-- Risk Model
-- 02_sender_risk_score.sql
-- Relative Risk Scoring - Transactions. Amounts, Bursts and Volatilty
-- ===============================================================================

CREATE OR REPLACE VIEW sender_risk_score AS
SELECT
    source_account_id,
	source_owner_name,
    ROUND(
        (
            txns_pct * 0.20 +
            amount_pct * 0.25 +
            burst_pct * 0.25 +
            volatility_pct * 0.30
        ) * 100
    , 2) AS risk_score

FROM sender_risk_percentile;
