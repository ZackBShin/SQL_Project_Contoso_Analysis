with customer_last_purchase as (
	select 
		customerkey,
		cleaned_name,
		orderdate,
		row_number() over (partition by customerkey order by orderdate DESC) as rn,
		first_purchase_date,
		cohort_year
	from cohort_analysis 
), churned_customers as (
	select
		customerkey,
		cleaned_name,
		orderdate as last_purchase_date,
		case
			when orderdate < (select MAX(orderdate) from sales) - interval '6 months' then 'Churned'
			else 'Active'
		end as customer_status,
		cohort_year
		
	from customer_last_purchase
	where rn = 1
		and first_purchase_date < (select MAX(orderdate) from sales) - interval '6 months'
)
select
	cohort_year,
	customer_status,
	COUNT(customerkey) as num_customers,
	SUM(COUNT(customerkey)) OVER(partition by cohort_year) as total_customers,
	ROUND(COUNT(customerkey) / SUM(COUNT(customerkey)) OVER(partition by cohort_year), 2) as status_percentage
from churned_customers
group by cohort_year, customer_status






