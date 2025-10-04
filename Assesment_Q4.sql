-- 4. Customer Lifetime Value (CLV) --
SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    SUM(s.confirmed_amount) / 100.0 AS total_transactions,
    ROUND( ((SUM(s.confirmed_amount) / 100.0) / 
           NULLIF(TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()),0)) 
           * 12 * 0.001, 2) AS estimated_clv
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
GROUP BY u.id, u.first_name, u.last_name, u.date_joined
ORDER BY estimated_clv DESC;