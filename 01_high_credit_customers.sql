/*Data: grocery_db schema data tables
Task: Identify customers who have a credit score over 0.5 and who spent more than $100 in September 2020.
Expected Output: Return data with 3 columns:
customer_id
credit_score
total_sales (the customer's spend in September 2020)*/

select 
  a.customer_id,
  a.credit_score,
  sum(b.sales_cost) as total_spend
    
from 
  grocery_db.customer_details a
  inner join grocery_db.transactions b on a.customer_id = b.customer_id
  
where 
  a.credit_score > 0.5 
  and b.transaction_date between '2020-09-01' and '2020-09-30'
    
group by 
  a.customer_id,
  a.credit_score
    
having 
  sum(b.sales_cost) > 100;
