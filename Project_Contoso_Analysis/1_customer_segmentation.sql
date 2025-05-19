with customer_ltv as (
	SELECT
		customerkey,
		cleaned_name,
		SUM(total_net_revenue) AS total_ltv
	FROM
		cohort_analysis
	GROUP BY
		customerkey,
		cleaned_name
), customer_segments as (
	select PERCENTILE_CONT(0.25) within group (order by total_ltv) as ltv_25th_pctl,
		   PERCENTILE_CONT(0.75) within group (order by total_ltv) as ltv_75th_pctl
	from customer_ltv
), segment_values as (
	select 
		c.*,
		case 
			when c.total_ltv < cs.ltv_25th_pctl then '1 - Low-Value'
			when c.total_ltv <= cs.ltv_75th_pctl then '2 - Mid-Value'
			else  '3 - High-Value'
		end as customer_segment
		
	from customer_ltv c,
		customer_segments cs
)
select
	customer_segment,
	SUM(total_ltv) as total_LTV,
	COUNT(customerkey) as customer_count,
	SUM(total_ltv) / COUNT(customerkey) as average_ltv
from segment_values
group by
	customer_segment
order by 
	customer_segment DESC




