/*Data: grocery_db schema data tables
Task: Write a query that returns, for each customer, their total spend within the Fruit product area, and their total spend within the Meat product area.
Expected Output: Your final output will have a row for each customer, and will have 3 columns:
customer_id
total_fruit_spend (you will create this)
total_meat_spend (you will create this)*/

select 
  a.customer_id,
  sum(case when b.product_area_name = 'Fruit' then a.sales_cost else 0 end) as total_fruit_spend,
  sum(case when b.product_area_name = 'Meat' then a.sales_cost else 0 end) as total_meat_spend

from 
  grocery_db.transactions a
  inner join grocery_db.product_areas b on a.product_area_id = b.product_area_id

group by 
  a.customer_id
  
order by
  a.customer_id;
