 /*
    QUESTION FOUR
    Steps:
	1. Account Tenure: Calculate the account's age in months from the signup date (created_on).
	2. Total Transactions: Sum up the total value of transactions for each customer.
	3. Estimated CLV: Use the formula CLV = (total_transactions / tenure) * 12 * avg_profit_per_transaction, where the profit per transaction is assumed to be 0.1% (0.001) of the transaction value.
	4. Order by CLV: Finally, sort the customers by their estimated CLV from highest to lowest.*/
    
    SELECT 
    u.id AS customer_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    TIMESTAMPDIFF(MONTH, u.created_on, CURDATE()) AS tenure_months,
    COUNT(s.id) AS total_transactions,
    (COUNT(s.id) * SUM(s.amount) * 0.001 / TIMESTAMPDIFF(MONTH, u.created_on, CURDATE()) * 12) AS estimated_clv
FROM 
    users_customuser u
JOIN 
    savings_savingsaccount s ON s.owner_id = u.id
GROUP BY 
    u.id
ORDER BY 
    estimated_clv DESC;