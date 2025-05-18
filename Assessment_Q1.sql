/*
QUESTION ONE
from users table
users_customusers as U,
first_name + last_name as fullname
id = join

from savings table S
new_balance (sum of new balance as total deposit)
confirmed_amount (savings count)
owner_id

from plans_plan table P
investment_count (investment count)
*/

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    s.savings_count,
    p.investment_count,
    s.total_deposits
FROM
    users_customuser u
JOIN (
    SELECT 
        owner_id,
        COUNT(*) AS savings_count,
        SUM(new_balance) AS total_deposits
    FROM 
        savings_savingsaccount
    WHERE 
        confirmed_amount > 0
    GROUP BY 
        owner_id
) s ON s.owner_id = u.id
JOIN (
    SELECT 
        owner_id,
        COUNT(*) AS investment_count
    FROM 
        plans_plan
    WHERE 
        amount > 0
    GROUP BY 
        owner_id
) p ON p.owner_id = u.id
ORDER BY 
    s.total_deposits DESC;