-- 1. High-Value Customers with Multiple Products--

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    SUM(CASE WHEN p.is_regular_savings = 1 THEN 1 ELSE 0 END) AS savings_count,
    SUM(CASE WHEN p.is_a_fund = 1 THEN 1 ELSE 0 END) AS investment_count,
    SUM(s.confirmed_amount) / 100.0 AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY u.id, u.first_name, u.last_name
HAVING savings_count > 0 AND investment_count > 0
ORDER BY total_deposits DESC;