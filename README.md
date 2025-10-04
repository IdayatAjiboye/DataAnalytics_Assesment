# DataAnalytics_Assesment
This repository contains 4 SQL queries as part of my submission.

Query 1:  
In this query, I Identified customers who have both a savings and an investment plan, sorted by total deposits.
The finance team wants to segment customers by how often they transact.  

Four tables are provided but for this, 3 are required; 
	I joined- 
  users_customuser
	savings_savingsaccount
	plans_plan 


**Approach**
- Used `CASE` to separate savings vs. investment.  
- Counted savings and investment plans per customer.  
- Summed `confirmed_amount` (converted from kobo to naira by dividing by 100).  
- Filtered only customers who have at least one of each plan type.  

**Challenges**  
- Ensuring correct grouping by `owner_id` to avoid duplicate counts.  
- Remembering to convert all amounts from kobo to naira for readability.

Query 2:   
