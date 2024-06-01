with cte_1 as 
(SELECT 
(SELECT MONTHNAME(date)) as month,s.fiscal_year,
round((sold_quantity*gross_price),2) as gross_sales_amount

FROM fact_sales_monthly s
join dim_customer
using(customer_code)
join fact_gross_price
using(product_code)
where customer = 'Atliq Exclusive')

select 
month,fiscal_year,
sum(gross_sales_amount) as gross_sales_amount
from cte_1
group by month,fiscal_year