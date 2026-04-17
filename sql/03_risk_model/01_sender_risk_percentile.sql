-- ===============================================================================
-- Risk Model
-- 01_sender_risk_percentile.sql
-- Relative Risk Scoring - Transactions. Amounts, Bursts and Volatilty
-- ===============================================================================

CREATE OR REPLACE VIEW sender_risk_percentile AS
SELECT
    source_account_id,
    source_owner_name,

    PERCENT_RANK() OVER (ORDER BY total_txns) AS txns_pct,
    PERCENT_RANK() OVER (ORDER BY total_amount) AS amount_pct,
    PERCENT_RANK() OVER (ORDER BY max_txns_day) AS burst_pct,
    PERCENT_RANK() OVER (ORDER BY stddev_daily_amount) AS volatility_pct

FROM sender_activity_profile;

