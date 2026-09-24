-- =====================================================
-- DATABASE CREATION
-- =====================================================

CREATE DATABASE Churn;

USE Churn;


-- =====================================================
-- TABLE CREATION
-- =====================================================

CREATE TABLE telco_churn (
    CustomerID VARCHAR(20) PRIMARY KEY,
    Count INT,
    Country VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(100),
    Zip_Code INT,
    Lat_Long VARCHAR(50),
    Latitude DECIMAL(10,6),
    Longitude DECIMAL(10,6),
    Gender VARCHAR(20),
    Senior_Citizen VARCHAR(10),
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    Tenure_Months INT,
    Phone_Service VARCHAR(10),
    Multiple_Lines VARCHAR(30),
    Internet_Service VARCHAR(30),
    Online_Security VARCHAR(30),
    Online_Backup VARCHAR(30),
    Device_Protection VARCHAR(30),
    Tech_Support VARCHAR(30),
    Streaming_TV VARCHAR(30),
    Streaming_Movies VARCHAR(30),
    Contract VARCHAR(30),
    Paperless_Billing VARCHAR(10),
    Payment_Method VARCHAR(50),
    Monthly_Charges DECIMAL(10,2),
    Total_Charges DECIMAL(12,2),
    Churn_Label VARCHAR(10),
    Churn_Value TINYINT,
    Churn_Score INT,
    CLTV INT,
    Churn_Reason VARCHAR(100)
);


-- =====================================================
-- VIEW DATA
-- =====================================================

SELECT *
FROM telco_churn;