SET SESSION sql_mode = TRIM(BOTH ',' FROM REPLACE(@@SESSION.sql_mode, 'ONLY_FULL_GROUP_BY', ''));

SELECT 
customer_code,customer,round(avg(pre_invoice_discount_pct),4) as avg_discount_pct
FROM dim_customer
join fact_pre_invoice_deductions
using(customer_code)
where fiscal_year = 2021 and
market = 'India'
group by customer
order by avg_discount_pct desc
limit 5
