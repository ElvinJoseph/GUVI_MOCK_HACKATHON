USE WAREHOUSE BANK_WH;
USE DATABASE BANK_DB;
USE SCHEMA CORE;

CREATE OR REPLACE TABLE CUSTOMER_CORE AS
SELECT
UPPER(TRIM(customerId)) AS customerId,
INITCAP(TRIM(customerName)) AS customerName,
LOWER(TRIM(email)) AS email,
UPPER(TRIM(city)) AS city,
UPPER(TRIM(accountType)) AS accountType
FROM RAW.RAW_CUSTOMER;


CREATE OR REPLACE TABLE ACCOUNT_CORE
AS
SELECT
    UPPER(TRIM(accountId)) AS accountId,
    UPPER(TRIM(customerId)) AS customerId,
    balance,
    UPPER(TRIM(accountStatus)) AS accountStatus
FROM RAW.RAW_ACCOUNT;

CREATE OR REPLACE TABLE TRANSACTION_CORE
AS
SELECT
    UPPER(TRIM(transactionId)) AS transactionId,
    UPPER(TRIM(accountId)) AS accountId,
    transactionAmount,
    UPPER(TRIM(transactionType)) AS transactionType,
    DATE(transactionDate) AS transactionDate
FROM RAW.RAW_TRANSACTION;


CREATE OR REPLACE TABLE LOAN_CORE
AS
SELECT
    UPPER(TRIM(loanId)) AS loanId,
    UPPER(TRIM(customerId)) AS customerId,
    loanAmount,
    interestRate,
    UPPER(TRIM(loanStatus)) AS loanStatus
FROM RAW.RAW_LOAN;

CREATE OR REPLACE TABLE FRAUD_ALERT_CORE
AS
SELECT
    UPPER(TRIM(alertId)) AS alertId,
    UPPER(TRIM(transactionId)) AS transactionId,
    fraudScore,
    UPPER(TRIM(reason)) AS reason,
    UPPER(TRIM(status)) AS status
FROM RAW.RAW_FRAUD_ALERT;

SELECT * FROM CUSTOMER_CORE;

SELECT * FROM ACCOUNT_CORE;

SELECT * FROM TRANSACTION_CORE;

SELECT * FROM LOAN_CORE;

SELECT * FROM FRAUD_ALERT_CORE;