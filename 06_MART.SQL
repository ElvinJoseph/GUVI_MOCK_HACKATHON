USE WAREHOUSE BANK_WH;
USE DATABASE BANK_DB;
USE SCHEMA MART;

-- DIMENSIONS
CREATE OR REPLACE DYNAMIC TABLE DIM_CUSTOMER
TARGET_LAG = '5 minutes'
WAREHOUSE = BANK_WH
AS
SELECT DISTINCT
    customerId,
    customerName,
    city,
    accountType
FROM CORE.CUSTOMER_CORE;

CREATE OR REPLACE DYNAMIC TABLE DIM_ACCOUNT
TARGET_LAG = '5 minutes'
WAREHOUSE = BANK_WH
AS
SELECT DISTINCT
    accountId,
    customerId,
    accountStatus
FROM CORE.ACCOUNT_CORE;

CREATE OR REPLACE DYNAMIC TABLE DIM_DATE
TARGET_LAG = '5 minutes'
WAREHOUSE = BANK_WH
AS
SELECT DISTINCT
    DATE(transactionDate) AS date,
    MONTH(transactionDate) AS month,
    YEAR(transactionDate) AS year
FROM CORE.TRANSACTION_CORE;

CREATE OR REPLACE DYNAMIC TABLE DIM_LOAN
TARGET_LAG = '5 minutes'
WAREHOUSE = BANK_WH
AS
SELECT DISTINCT
    loanId,
    customerId,
    loanAmount,
    interestRate,
    loanStatus
FROM CORE.LOAN_CORE;

-- FACT TABLE
CREATE OR REPLACE DYNAMIC TABLE FACT_TRANSACTION
TARGET_LAG = '5 minutes'
WAREHOUSE = BANK_WH
AS
SELECT
    t.transactionId,
    t.accountId,
    a.customerId,
    t.transactionAmount,
    t.transactionType,
    t.transactionDate
FROM CORE.TRANSACTION_CORE t
JOIN CORE.ACCOUNT_CORE a
ON t.accountId = a.accountId;

SELECT * FROM  DIM_CUSTOMER;

SELECT * FROM  DIM_ACCOUNT;

SELECT * FROM  DIM_DATE;

SELECT * FROM  FACT_TRANSACTION;
