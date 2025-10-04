
-- 3. Account Inactivity Alert --

SELECT 
    p.id AS plan_id,
    s.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
        ELSE 'Other'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM plans_plan p
JOIN savings_savingsaccount s 
    ON p.id = s.plan_id
GROUP BY p.id, s.owner_id, type
HAVING inactivity_days > 365;