select 
get_fiscal_quarters(date) as quarter,
sum(sold_quantity) as total_sold_quantity
from fact_sales_monthly
where fiscal_year = 2020
group by (get_fiscal_quarters(date))