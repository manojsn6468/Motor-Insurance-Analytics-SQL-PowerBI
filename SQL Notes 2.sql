use motor_insurance;

-- Basic KPI
SELECT
    COUNT(*) AS total_claim_records,
    ROUND(SUM(ClaimAmount), 2) AS total_claim_amount,
    ROUND(AVG(ClaimAmount), 2) AS avg_claim_amount
FROM motor_claim;

-- Joining

SELECT
    p.Region,
    COUNT(c.IDpol) AS claim_records,
    ROUND(SUM(c.ClaimAmount), 2) AS total_claim_amount
FROM motor_policy p
JOIN motor_claim c
    ON p.IDpol = c.IDpol
GROUP BY p.Region
ORDER BY total_claim_amount DESC;

-- vehicle fuel
SELECT
    p.VehGas,
    COUNT(c.IDpol) AS claim_records,
    ROUND(SUM(c.ClaimAmount), 2) AS total_claim_amount
FROM motor_policy p
JOIN motor_claim c
    ON p.IDpol = c.IDpol
GROUP BY p.VehGas
ORDER BY total_claim_amount DESC;



-- Claims by Vehicle Brand

SELECT
    p.VehBrand,
    COUNT(c.IDpol) AS claim_records,
    ROUND(SUM(c.ClaimAmount), 2) AS total_claim_amount
FROM motor_policy p
JOIN motor_claim c
    ON p.IDpol = c.IDpol
GROUP BY p.VehBrand
ORDER BY total_claim_amount DESC;

-- In middle of Power bi  work we checked blank values for Vehgas

 -- Checked blank values for Vehgas for donut chart
SELECT COUNT(*) AS blank_vehgas
FROM motor_policy
WHERE VehGas IS NULL
   OR TRIM(VehGas) = '';
   
   SELECT
    COUNT(*) AS unmatched_claim_rows,
    SUM(c.ClaimAmount) AS unmatched_claim_amount
FROM motor_claim c
LEFT JOIN motor_policy p
    ON c.IDpol = p.IDpol
WHERE p.IDpol IS NULL;
