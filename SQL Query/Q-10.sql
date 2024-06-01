SET SESSION sql_mode = TRIM(BOTH ',' FROM REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));

with cte_1 as (
	select 
	division,product_code,product,sum(sold_quantity) as total_sold_quantity,
    rank() over(partition by division order by (sum(sold_quantity)) desc) as rank_order
	from dim_product
	join fact_sales_monthly
	using(product_code)
	where fiscal_year = 2021
	group by product_code )

select * 
from cte_1
where rank_order <= 3
