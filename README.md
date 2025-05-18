# DataAnalytics-Assessment
## Challenges on Questions

### Question One
* I tried to sort by total deposit as required by the question, however, my code was not running until I used a subquery
### Question Two
* Having difficulties in calculating the monthly average, did some research to resolve on COUNT(DISTINCT CONCAT(YEAR(transaction_date), '-', MONTH(transaction_date)))
### Question Three
* The data for both comes from different tables (transactions in savings_savingsaccount, plans in plans_plan)	I Join both tables using plan_id and determine the type using is_fixed_investment flag
### Question Four
* I was wondering  whether to use amount or confirmed_amount from the savings_savingsaccount table, I later resolved on using confirmed_amount.
