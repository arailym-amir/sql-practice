/*Data: grocery_db schema data tables
Task: Return the average customer credit score, split by gender, for customers who live less than 2 miles from the store.
Expected Output: Your query should return a row for each gender label, and two columns:
gender
avg_credit_score (you will calculate this)*/

select
  gender,
  avg(credit_score) as avg_credit_score
  
from
  grocery_db.customer_details
  
where
  distance_from_store < 2
  
group by
  gender;
