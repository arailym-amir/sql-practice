/*Write a query that returns only the customer details 
(customer id, distance from store, gender, credit score) and the sales_cost for customers 
whose first transaction exceeded $100.
Your SQL code must follow these requirements:
Common table expressions (CTEs) instead of nested subqueries
Use of a window function
Use an INNER JOIN*/


with cust_orders as (
select
  customer_id,
  transaction_id,
  transaction_date,
  sum(sales_cost) as sales_cost
  
from
  grocery_db.transactions t
  
group by
  customer_id,
  transaction_id,
  transaction_date

),
firstorders as (

select
  customer_id,
  transaction_id,
  transaction_date,
  sales_cost,
  row_number() over (partition by customer_id order by transaction_date asc, transaction_id asc) as row_num
  
from
  cust_orders t
)

select
  cd.customer_id,
  cd.distance_from_store,
  cd.gender,
  cd.credit_score,
  fo.sales_cost
 
FROM 
  grocery_db.customer_details cd
  inner join firstorders fo on (cd.customer_id = fo.customer_id)
  
where
  fo.sales_cost > 100
  and fo.row_num = 1;
