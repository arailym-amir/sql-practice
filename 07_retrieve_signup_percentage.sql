/*Write a query to retrieve, for each gender and mailer type, the number of customers, signups, and corresponding signup percentage. Round the signup percentage to two decimal places. 
For this exercise, only consider those records where the gender is populated, and the campaign name is "delivery_club"
Alias the number of customers, signups, and corresponding signup percentage derived attributes as customer_count, signups, and signup_percentage, respectively. 
Sort the result set by signup percentage in descending order.*/

select
	a.gender,
	b.mailer_type,
	count(*) as customer_count,
	sum(b.signup_flag) as signups,
	round((sum(b.signup_flag) * 1.0) / count(*)	* 100, 2) as signup_percentage

from
	grocery_db.customer_details a
	inner join grocery_db.campaign_data b on a.customer_id = b.customer_id

where
	a.gender is not null
	and b.campaign_name = 'delivery_club'

group by
	a.gender,
	b.mailer_type

order by
	signup_percentage desc;
