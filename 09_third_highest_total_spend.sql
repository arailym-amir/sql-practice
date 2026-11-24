/*Data: grocery_db schema data tables
Task: Write a query (or queries, hint: CTE might be useful here) that returns the customer who has the third highest total spend (of all customers)
Expected Output: Your final output should return one row, and two columns:
customer_id
total_spend (the total spend for this particular customer)*/

with ranked_customers as (
  select 
    customer_id,
    sum(sales_cost) as total_spend,
    rank() over (order by sum(sales_cost) desc) as spending_rank

  from 
    grocery_db.transactions

  group by 
    customer_id
)
select 
  customer_id,
  total_spend

from 
  ranked_customers

where 
  spending_rank = 3;
