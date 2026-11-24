/*Data: grocery_db schema data tables
Task: Return a list of customers that have shopped in all 5 product areas!
Expected Output: Your query should return two columns:
customer_id
unique_product_areas (the count of unique product areas for that customer)*/

select
  customer_id,
  count(distinct(product_area_id)) AS product_id_count
  
from
  grocery_db.transactions
  
group by
  customer_id
  
having
  count(distinct(product_area_id)) = 5;
