/*Data: grocery_db schema data tables
Task: Identify the top 3 product areas, based on the highest total items sold
Expected Output: Your query should return three rows, with the columns product_area_name and total_items. 
Rows should be in descending order for total_items*/

select 
  b.product_area_name,
  sum(a.num_items) as total_items

from 
  grocery_db.transactions a
  inner join grocery_db.product_areas b on a.product_area_id = b.product_area_id

group by 
  b.product_area_name

order by 
  total_items desc

limit 3;
