-- ===============================================================================
-- 01_schema.sql Create Table for Outgoing FX Transactions
-- Data includes transactions for the period of July 7, 2025 - December 31, 2025
-- ===============================================================================

-- Table Creation - Raw Data 
-- Importing all data from csv file in text format

CREATE TABLE transactions_raw (
    id TEXT,
    type TEXT,
    payment_id TEXT,
    source_tenant_id TEXT,
    source_account_id TEXT,
    destination_tenant_id TEXT,
    destination_external_account_id TEXT,
    amount TEXT,
    purpose_of_payment TEXT,
    created_at_utc TEXT,
    modified_at_utc TEXT,
    country TEXT,
    destination_owner_name TEXT,
    source_owner_name TEXT,
    destination_currency TEXT,
    source_currency TEXT,
    crypto_amount TEXT,
    transaction_hash TEXT,
    total_amount TEXT,
    exchange_rate TEXT,
    dynamic_properties TEXT,
    settlement_rate TEXT,
    payments_api_payment_reference TEXT,
    destination_currency_code TEXT
);


-- Table Creation - Clean Transaction Data
-- Formatting the data for proper analysis

CREATE TABLE transactions_clean (
    id VARCHAR(64) PRIMARY KEY,
    type VARCHAR(50),
    payment_id VARCHAR(64),
    source_tenant_id VARCHAR(64),
    source_account_id VARCHAR(64),
    destination_tenant_id VARCHAR(64),
    destination_external_account_id VARCHAR(64),

    amount DECIMAL(18,6),
    crypto_amount DECIMAL(18,10),
    total_amount DECIMAL(18,6),

    source_currency VARCHAR(10),
    destination_currency VARCHAR(10),
    destination_currency_code VARCHAR(10),

    exchange_rate DECIMAL(18,10),
    settlement_rate DECIMAL(18,10),

    country VARCHAR(10),
    purpose_of_payment VARCHAR(255),

    source_owner_name VARCHAR(255),
    destination_owner_name VARCHAR(255),

    transaction_hash VARCHAR(128),
    payments_api_payment_reference VARCHAR(128),

    created_at_utc DATETIME,
    modified_at_utc DATETIME,

    dynamic_properties JSON
);