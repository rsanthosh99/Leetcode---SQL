# Write your MySQL query statement below

select c.customer_id, c.name
from customers c 
left join orders o on c.customer_id = o.customer_id
left join product p on o.product_id = p.product_id
group by customer_id
having sum(if(left(o.order_date,7) = '2020-06', (o.quantity * p.price),0))  >= 100 and sum(if(left(o.order_date,7) = '2020-07', (o.quantity * p.price),0))  >= 100
