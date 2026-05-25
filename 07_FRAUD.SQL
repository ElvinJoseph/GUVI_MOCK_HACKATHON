USE WAREHOUSE BANK_WH;
USE DATABASE BANK_DB;
USE SCHEMA MART;

CREATE OR REPLACE VIEW MART.FRAUD_ANALYSIS AS
SELECT
    t.transactionId,
    t.accountId,
    t.transactionAmount,
    t.transactionType,
    t.transactionDate,
    f.fraudScore,
    f.reason,
    CASE
        WHEN f.fraudScore > 0.8 THEN 'HIGH'
        WHEN f.fraudScore > 0.5 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS risk_level
FROM MART.FACT_TRANSACTION t
LEFT JOIN CORE.FRAUD_ALERT_CORE f
ON t.transactionId = f.transactionId;

SELECT * FROM FRAUD_ANALYSIS LIMIT 10;