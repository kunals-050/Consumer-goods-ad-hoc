# 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
# segment unique_products_2020 unique_products_2021 difference 

with unique_2020 as (select p.segment, count(distinct(s.product_code)) as unique_products_2020
from fact_sales_monthly s
join dim_product p
using (product_code)
where fiscal_year = 2020
group by p.segment),

unique_2021 as (select p.segment, count(distinct(s.product_code)) as unique_products_2021
from fact_sales_monthly s
join dim_product p
using (product_code)
where fiscal_year = 2021
group by p.segment)

select u.segment, u.unique_products_2020, un.unique_products_2021,
(un.unique_products_2021 - u.unique_products_2020) as difference
from unique_2020 u
join unique_2021 un
using (segment);