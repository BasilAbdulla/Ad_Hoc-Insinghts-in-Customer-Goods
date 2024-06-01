with cte1 as (select segment,
COUNT(distinct(product_code)) as product_count_2020 
      from fact_sales_monthly
      join dim_product
      using(product_code)
      where fiscal_year = 2020
      group by segment),
      
cte2 as (select segment,
COUNT(distinct(product_code)) AS product_count_2021 
      from fact_sales_monthly
      join dim_product
      using(product_code)
      where fiscal_year = 2021
      group by segment)

select *,
unique_products_2021-unique_products_2020 as difference
from cte1 
join cte2
using (segment)  


    
