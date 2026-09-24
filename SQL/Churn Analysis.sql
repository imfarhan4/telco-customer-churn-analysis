USE Churn;


-- =====================================================
-- 1. HOW MANY CUSTOMERS CHURNED?
-- =====================================================

SELECT
    COUNT(*) AS Churned_Customers
FROM telco_churn
WHERE Churn_Label = 'Yes';


-- =====================================================
-- 2. WHAT PERCENTAGE OF CUSTOMERS CHURNED?
-- =====================================================

SELECT
    ROUND(
        COUNT(CASE WHEN Churn_Label = 'Yes' THEN 1 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn;


-- =====================================================
-- 3. CHURN ANALYSIS BY GENDER
-- =====================================================

SELECT
    Gender,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN Churn_Label = 'Yes' THEN 1 END) AS Churned_Customers,
    ROUND(
        COUNT(CASE WHEN Churn_Label = 'Yes' THEN 1 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Gender;


-- =====================================================
-- 4. AVERAGE TENURE OF CHURNED CUSTOMERS
-- =====================================================

SELECT
    ROUND(AVG(Tenure_Months), 0) AS Avg_Tenure
FROM telco_churn
WHERE Churn_Label = 'Yes';


-- =====================================================
-- 5. CHURN ANALYSIS BY INTERNET SERVICE
-- =====================================================

SELECT
    Internet_Service,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn_Label = 'No' THEN 1 ELSE 0 END) AS Not_Churned,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Internet_Service;


-- =====================================================
-- 6. CHURN ANALYSIS BY CONTRACT TYPE
-- =====================================================

SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn_Label = 'No' THEN 1 ELSE 0 END) AS Not_Churned,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Contract;


-- =====================================================
-- 7. CHURN ANALYSIS BY PAYMENT METHOD
-- =====================================================

SELECT
    Payment_Method,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn_Label = 'No' THEN 1 ELSE 0 END) AS Not_Churned,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(
        SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Payment_Method;


-- =====================================================
-- 8. AVERAGE MONTHLY CHARGES:
--    CHURNED VS RETAINED CUSTOMERS
-- =====================================================

SELECT
    ROUND(
        AVG(CASE WHEN Churn_Label = 'Yes' THEN Monthly_Charges END),
        2
    ) AS Avg_Monthly_Charges_Churned,

    ROUND(
        AVG(CASE WHEN Churn_Label = 'No' THEN Monthly_Charges END),
        2
    ) AS Avg_Monthly_Charges_Retained
FROM telco_churn;


-- =====================================================
-- 9. SENIOR CITIZEN CHURN ANALYSIS
-- =====================================================

SELECT
    Senior_Citizen,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN Churn_Label = 'Yes' THEN 1 END) AS Churned_Customers,
    ROUND(
        COUNT(CASE WHEN Churn_Label = 'Yes' THEN 1 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Senior_Citizen;


-- =====================================================
-- 10. AVERAGE TENURE BY CONTRACT TYPE
-- =====================================================

SELECT
    Contract,
    ROUND(AVG(Tenure_Months), 0) AS Avg_Tenure
FROM telco_churn
GROUP BY Contract;


-- =====================================================
-- 11. CHURN REASONS ANALYSIS
-- =====================================================

SELECT
    Churn_Reason,
    COUNT(*) AS Churn_Count,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM telco_churn
            WHERE Churn_Label = 'Yes'
        ),
        2
    ) AS Percentage_of_Total_Churn
FROM telco_churn
WHERE Churn_Label = 'Yes'
  AND Churn_Reason IS NOT NULL
  AND Churn_Reason <> ''
GROUP BY Churn_Reason
ORDER BY Churn_Count DESC;


-- =====================================================
-- 12. TOP 5 CHURN REASONS
-- =====================================================

SELECT
    Churn_Reason,
    COUNT(*) AS Churn_Count
FROM telco_churn
WHERE Churn_Label = 'Yes'
  AND Churn_Reason IS NOT NULL
  AND Churn_Reason <> ''
GROUP BY Churn_Reason
ORDER BY Churn_Count DESC
LIMIT 5;


-- =====================================================
-- 13. CHURN ANALYSIS BY TENURE GROUP
-- =====================================================

SELECT
    Tenure_groups,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS Churn_Rate
FROM telco_churn
GROUP BY Tenure_groups
ORDER BY
    CASE Tenure_groups
        WHEN '0-12' THEN 1
        WHEN '13-24' THEN 2
        WHEN '25-48' THEN 3
        WHEN '49+' THEN 4
    END;