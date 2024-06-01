SET SESSION sql_mode = TRIM(BOTH ',' FROM REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));

with cte_1 as (
SELECT 
channel,
round(sum((sold_quantity*gross_price)/1000000),2) as gross_sales_mln

FROM fact_sales_monthly s
join dim_customer
using(customer_code)
join fact_gross_price
using(product_code)

where s.fiscal_year = 2021
group by channel)

select * ,
round(gross_sales_mln*100/sum(gross_price_mln) over(),2) as percentage
from cte_1
