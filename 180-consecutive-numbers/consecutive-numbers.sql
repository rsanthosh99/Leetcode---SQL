# Write your MySQL query statement below
select distinct(num) as ConsecutiveNums
from (
    select num , lead(num) OVER ( order by id) as lead_num, lag(num) OVER (order by id) as lag_num from logs
) as temp
where (num = lag_num) and (num = lead_num);