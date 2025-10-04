-- 2. Transaction Frequency Analysis--

WITH txn_counts AS (
    SELECT 
        owner_id,
        COUNT(*) * 1.0 / NULLIF(TIMESTAMPDIFF(
            MONTH, 
            MIN(transaction_date), 
            MAX(transaction_date)
        ), 0) AS avg_txn_per_month
    FROM savings_savingsaccount
    GROUP BY owner_id
)
SELECT 
    CASE 
        WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
        WHEN avg_txn_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(owner_id) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM txn_counts
GROUP BY frequency_category;