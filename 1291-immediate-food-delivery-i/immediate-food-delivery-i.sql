# Write your MySQL query statement below
select round(avg(if(order_date = customer_pref_delivery_date, 1, 0))*100,2) as immediate_percentage
from delivery