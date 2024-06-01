SELECT 
product_code,product,round(manufacturing_cost,2) as manufacturing_cost
FROM dim_product
join fact_manufacturing_cost
using(product_code)

where manufacturing_cost in 
( select max(manufacturing_cost) from fact_manufacturing_cost
  union
  select min(manufacturing_cost) from fact_manufacturing_cost)
order by manufacturing_cost desc