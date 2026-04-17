-- ===============================================================================
-- Activity Profile
-- 01_activity_profile.sql
-- ===============================================================================

-- Daily Activity View by Account
-- To Monitor Daily Counts and amounts for each account

CREATE OR REPLACE VIEW sender_daily_activity AS
SELECT
    source_account_id,
    source_owner_name,
    DATE(created_at_utc) AS txn_date,
    COUNT(*) AS daily_txns,
    SUM(total_amount) AS daily_amount
FROM transactions_clean
GROUP BY source_account_id, source_owner_name, DATE(created_at_utc);

-- Activity Profile
-- Establishes the Account Profile over time including total transactions and amounts, daily averages and standard deviations

CREATE OR REPLACE VIEW sender_activity_profile AS
SELECT
    source_account_id,
    source_owner_name,

    COUNT(*) AS active_days,
    SUM(daily_txns) AS total_txns,
    SUM(daily_amount) AS total_amount,

    AVG(daily_txns) AS avg_txns_per_day,
    MAX(daily_txns) AS max_txns_day,

    AVG(daily_amount) AS avg_daily_amount,
    MAX(daily_amount) AS max_daily_amount,

    STDDEV(daily_amount) AS stddev_daily_amount

FROM sender_daily_activity
GROUP BY source_account_id, source_owner_name;