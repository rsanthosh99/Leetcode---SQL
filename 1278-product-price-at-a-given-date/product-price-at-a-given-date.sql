# Write your MySQL query statement below
WITH latest_price as (
    select p1.product_id, p1.new_price, ROW_NUMBER () OVER (PARTITION BY p1.product_id ORDER BY p1.change_date DESC) as rn
    from Products p1
    where p1.change_date <= '2019-08-16'
),
prod_list as (
    select distinct(product_id) as product_id from products
)

select p1.product_id, IFNULL(lp.new_price, 10) as price
from prod_list p1 
left join latest_price lp on lp.product_id = p1.product_id and lp.rn = 1;
