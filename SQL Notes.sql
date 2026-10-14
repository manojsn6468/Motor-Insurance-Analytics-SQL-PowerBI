use motor_insurance

-- Total Row Counts
select count(*) from motor_policy;
select count(*) from motor_claim;

-- Data Types 
DESCRIBE motor_policy;


-- To Check policies whethere there is any dublicate 
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT IDpol) AS unique_policies
FROM motor_policy;

SELECT
    COUNT(*) AS total_claim_rows,
    COUNT(DISTINCT IDpol) AS policies_with_claims
FROM motor_claim;

-- To check null values in both sheet
SELECT
    SUM(IDpol IS NULL) ,
    SUM(ClaimNb IS NULL),
    SUM(Exposure IS NULL) ,
    SUM(VehPower IS NULL) ,
    SUM(VehAge IS NULL)  ,
    SUM(DrivAge IS NULL) ,
    SUM(BonusMalus IS NULL) ,
    SUM(VehBrand IS NULL) ,
    SUM(VehGas IS NULL) ,
    SUM(Area IS NULL) ,
    SUM(Density IS NULL) ,
    SUM(Region IS NULL)
FROM motor_policy;

SELECT
    SUM(IDpol IS NULL),
    SUM(ClaimAmount IS NULL)
FROM motor_claim;

-- multiple claim records using group and having 
SELECT
    IDpol, COUNT(*) AS number_of_claims
FROM motor_claim
GROUP BY IDpol
HAVING COUNT(*) > 1
ORDER BY number_of_claims DESC;

-- To check whether every claim has a matching policy

SELECT COUNT(*) AS unmatched_claims
FROM motor_claim c
LEft JOIN motor_policy p
    ON c.IDpol = p.IDpol
WHERE p.IDpol IS NULL;

SELECT *
FROM motor_claim c
LEFT JOIN motor_policy p
    ON c.IDpol = p.IDpol
WHERE p.IDpol IS NULL;




-- Checked minimum, maximum and average values
SELECT
    MIN(DrivAge) AS min_driver_age,
    MAX(DrivAge) AS max_driver_age,
    ROUND(AVG(DrivAge), 2) AS avg_driver_age
FROM motor_policy;

SELECT
    MIN(VehAge) AS min_vehicle_age,
    MAX(VehAge) AS max_vehicle_age,
    ROUND(AVG(VehAge), 2) AS avg_vehicle_age
FROM motor_policy;

SELECT
    MIN(Exposure) AS min_exposure,
    MAX(Exposure) AS max_exposure,
    ROUND(AVG(Exposure), 2) AS avg_exposure
FROM motor_policy;

SELECT
    MIN(ClaimAmount) AS min_claim,
    MAX(ClaimAmount) AS max_claim,
    ROUND(AVG(ClaimAmount), 2) AS avg_claim
FROM motor_claim;

-- To check categorical data
-- Check how many different regions exist:
SELECT
    Region,
    COUNT(*) AS total_policies
FROM motor_policy
GROUP BY Region
ORDER BY total_policies DESC;

SELECT
    VehGas,
    COUNT(*) AS total_policies
FROM motor_policy
GROUP BY VehGas
ORDER BY total_policies DESC;

SELECT
    VehBrand,
    COUNT(*) AS total_policies
FROM motor_policy
GROUP BY VehBrand
ORDER BY total_policies DESC;

SELECT
    Area,
    COUNT(*) AS total_policies
FROM motor_policy
GROUP BY Area
ORDER BY Area;

-- Understanding claim data

SELECT
    ClaimNb,
    COUNT(*) AS total_policies
FROM motor_policy
GROUP BY ClaimNb
ORDER BY ClaimNb;

-- Policies with at least one claim

SELECT COUNT(*) AS policies_with_claims
FROM motor_policy
WHERE ClaimNb > 0;

-- Policies without any claims

SELECT COUNT(*) AS policies_without_claims
FROM motor_policy
WHERE ClaimNb = 0;
