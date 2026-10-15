# 6.  Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  for the  fiscal  year 2021
# and in the Indian  market. The final output contains these fields, customer_code customer average_discount_percentage

select c.customer_code, c.customer, ROUND(avg(p.pre_invoice_discount_pct) over(partition by c.customer_code),4) as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions p
using (customer_code)
where p.fiscal_year = 2021 and c.market = "India"
order by average_discount_percentage desc
limit 5;