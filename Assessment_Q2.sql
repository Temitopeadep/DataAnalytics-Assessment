/*
QUESTION 2

Steps:
1: Calculate total transactions and months per customer.
2: Calculate average transactions per month for each customer.
3: Categorize customers based on the average number of transactions.
4: Aggregate and display the results.
*/

SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    AVG(avg_transactions_per_month) AS avg_transactions_per_month
FROM (
    SELECT 
        u.id AS customer_id,
        -- Calculate the number of transactions per month for each customer
        SUM(1) / COUNT(DISTINCT MONTH(s.transaction_date)) AS avg_transactions_per_month,
        -- Categorize based on the average transactions per month
        CASE
            WHEN SUM(1) / COUNT(DISTINCT MONTH(s.transaction_date)) >= 10 THEN 'High Frequency'
            WHEN SUM(1) / COUNT(DISTINCT MONTH(s.transaction_date)) BETWEEN 3 AND 9 THEN 'Medium Frequency'
            WHEN SUM(1) / COUNT(DISTINCT MONTH(s.transaction_date)) <= 2 THEN 'Low Frequency'
        END AS frequency_category
    FROM 
        users_customuser u
    JOIN 
        savings_savingsaccount s ON s.owner_id = u.id
    GROUP BY 
        u.id
) AS transaction_summary
GROUP BY 
    frequency_category;
