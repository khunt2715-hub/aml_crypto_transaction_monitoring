-- ===============================================================================
-- 03_load_data_clean.sql
-- Properly formatting currency and time fields
-- ===============================================================================

INSERT INTO transactions_clean (
    id, type, payment_id, source_tenant_id, source_account_id,
    destination_tenant_id, destination_external_account_id,
    amount, purpose_of_payment, created_at_utc, modified_at_utc,
    country, destination_owner_name, source_owner_name,
    destination_currency, source_currency, crypto_amount,
    transaction_hash, total_amount,
    exchange_rate, dynamic_properties, settlement_rate,
    payments_api_payment_reference, destination_currency_code
)
SELECT
    id,
    type,
    payment_id,
    source_tenant_id,
    source_account_id,
    destination_tenant_id,
    destination_external_account_id,

    CAST(NULLIF(amount, '') AS DECIMAL(18,6)),
    purpose_of_payment,
    STR_TO_DATE(LEFT(created_at_utc, 19), '%Y-%m-%d %H:%i:%s'),
    STR_TO_DATE(LEFT(modified_at_utc, 19), '%Y-%m-%d %H:%i:%s'),

    country,
    destination_owner_name,
    source_owner_name,
    destination_currency,
    source_currency,

    CAST(NULLIF(crypto_amount, '') AS DECIMAL(18,10)),
    transaction_hash,
    CAST(NULLIF(keyrails_fee_amount, '') AS DECIMAL(18,6)),
	CAST(NULLIF(total_amount, '') AS DECIMAL(18,6)),
	CAST(NULLIF(exchange_rate, '') AS DECIMAL(18,10)),

    dynamic_properties,  -- convert to JSON later if valid

    CAST(NULLIF(settlement_rate, '') AS DECIMAL(18,10)),
    payments_api_payment_reference,
    destination_currency_code
FROM transactions_raw;