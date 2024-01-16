# Write your MySQL query statement below
with temp as (
    select w.name, w.product_id, p.product_name, w.units, p.Width, p.Length, p.Height
    from Warehouse w
    left join Products p on p.product_id = w.product_id
)


select t.name as warehouse_name, sum(t.units * t.Width * t.Length * t.Height) as volume
from temp t
group by name
