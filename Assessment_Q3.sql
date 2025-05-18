/*
QUESTION 3
Steps:
1: Identify active accounts (either savings or investment) from the plans_plan and savings_savingsaccount tables.
2: Find the last transaction date for each account.
3: Calculate the number of days of inactivity (inactivity_days).
4: Filter for accounts with no transactions in the last 365 days.*/

SELECT 
    p.id AS plan_id,
    s.owner_id,
    CASE 
        WHEN p.is_fixed_investment = 1 THEN 'Investment'
        ELSE 'Savings'
    END AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(s.transaction_date)) AS inactivity_days
FROM 
    plans_plan p
JOIN 
    savings_savingsaccount s ON s.plan_id = p.id
WHERE 
    p.is_deleted = 0  
GROUP BY 
    p.id, s.owner_id, p.is_fixed_investment
HAVING 
    inactivity_days > 365;  