/*Data: grocery_db schema data tables
Task: Write a query (or queries, hint: maybe CTE could be useful here...) that calculates the average spend per customer, for customers that shopped less than 5 times
Expected Output: Your final output will contain a row for every customer that meets the criteria, and 3 columns:
customer_id
average_transaction_spend (you will calculate this)
transaction_count (you will calculate this)*/

with transaction_totals as (
  select 
    customer_id,
    transaction_id,
    sum(sales_cost) as total_transaction_spend

  from 
    grocery_db.transactions

  group by 
    customer_id,
    transaction_id
),
customer_avg_spend as (
  select 
    customer_id,
    avg(total_transaction_spend) as average_transaction_spend,
    count(transaction_id) as transaction_count

  from 
    transaction_totals

  group by 
    customer_id
)
select 
  customer_id,
  average_transaction_spend,
  transaction_count

from 
  customer_avg_spend

where 
  transaction_count < 5;
