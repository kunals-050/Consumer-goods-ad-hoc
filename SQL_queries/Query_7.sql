# 7. Get the complete report of the Gross sales amount for the customer  “Atliq Exclusive”  for each month  .  This analysis helps to 
# get an idea of low and high-performing months and take strategic decisions. The final report contains these columns: 
# Month Year Gross sales Amount 

select monthname(s.date) as month, year(s.date) as year, round(sum(s.sold_quantity*g.gross_price),0) as Gross_sales_amount
from fact_sales_monthly s
join fact_gross_price g
using (product_code)
join dim_customer c
using (customer_code)
where c.customer = 'Atliq Exclusive'
group by month, year
order by year

