-- =====================================================
-- CHURN REASON CATEGORY
-- =====================================================

ALTER TABLE telco_churn
ADD COLUMN `Churn_Reason_Category` VARCHAR(50);


-- =====================================================
-- CATEGORIZE CHURN REASONS
-- =====================================================

UPDATE telco_churn
SET `Churn_Reason_Category` =
    CASE
        WHEN `Churn_Label` = 'No' THEN NULL

        WHEN `Churn_Reason` IN (
            'Competitor offered higher download speeds',
            'Competitor offered more data',
            'Competitor made better offer',
            'Competitor had better devices'
        ) THEN 'Competitor'

        WHEN `Churn_Reason` IN (
            'Attitude of support person',
            'Attitude of service provider',
            'Poor expertise of phone support',
            'Poor expertise of online support',
            'Service dissatisfaction'
        ) THEN 'Service'

        WHEN `Churn_Reason` IN (
            'Price too high',
            'Extra data charges',
            'Long distance charges'
        ) THEN 'Pricing'

        WHEN `Churn_Reason` IN (
            'Network reliability',
            'Lack of affordable download/upload speed'
        ) THEN 'Network'

        WHEN `Churn_Reason` IN (
            'Product dissatisfaction',
            'Limited range of services'
        ) THEN 'Product'

        WHEN `Churn_Reason` = 'Lack of self-service on Website'
            THEN 'Digital Experience'

        WHEN `Churn_Reason` IN (
            'Moved',
            'Deceased'
        ) THEN 'Life Change'

        WHEN `Churn_Reason` = 'Don''t know'
            THEN 'Unknown'

        ELSE 'Other'
    END;


-- =====================================================
-- TENURE GROUPS
-- =====================================================

ALTER TABLE telco_churn
ADD COLUMN `Tenure_groups` VARCHAR(50);


UPDATE telco_churn
SET `Tenure_groups` =
    CASE
        WHEN `Tenure_Months` BETWEEN 0 AND 12
            THEN '0-12'

        WHEN `Tenure_Months` BETWEEN 13 AND 24
            THEN '13-24'

        WHEN `Tenure_Months` BETWEEN 25 AND 48
            THEN '25-48'

        WHEN `Tenure_Months` >= 49
            THEN '49+'

        ELSE NULL
    END;