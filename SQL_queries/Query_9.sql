# 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?  The final output
#  contains these fields, channel gross_sales_mln percentage 

with CTE1 as (select c.channel, round(sum(s.sold_quantity*g.gross_price)/1000000, 2) as gross_sales_mln
from fact_sales_monthly s
join dim_customer c
using (customer_code)
join fact_gross_price g
using (product_code)
where s.fiscal_year = 2021
group by c.channel)

select *, round(gross_sales_mln*100/sum(gross_sales_mln) over(), 2) as market_share_pct
from CTE1
order by gross_sales_mln desc;
