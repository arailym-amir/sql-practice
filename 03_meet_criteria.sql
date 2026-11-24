/*Data: grocery_db schema data tables
Task: Write a query that provides the count of customers that meet the following criteria:
Are male
Live between 2 and 3 miles from the store (inclusive)
Have a credit score greater than 0.4
Expected Output: Your query should return one column called customer_count and just one row, 
which shows the number of customers that meet the criteria*/

select 
  count(*) as customer_count

from 
  grocery_db.customer_details

where 
  gender = 'M'
  and distance_from_store between 2 and 3
  and credit_score > 0.4;
