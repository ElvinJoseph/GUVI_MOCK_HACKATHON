USE WAREHOUSE BANK_WH;
USE DATABASE BANK_DB;
USE SCHEMA CORE;

-- JOIN QUERY
SELECT c.customerName, t.transactionAmount
FROM CUSTOMER_CORE c
JOIN ACCOUNT_CORE a ON c.customerId = a.customerId
JOIN TRANSACTION_CORE t ON a.accountId = t.accountId;

-- AGGREGATE QUERY
SELECT a.customerId, SUM(t.transactionAmount) total_spent
FROM TRANSACTION_CORE t
JOIN ACCOUNT_CORE a ON t.accountId = a.accountId
GROUP BY a.customerId;

-- JSON QUERY
USE SCHEMA RAW;

SELECT value:transactionId::STRING AS transactionId, value:fraudScore::FLOAT AS fraudScore
FROM FRAUD_ALERT, LATERAL FLATTEN(INPUT => RAW_DATA);