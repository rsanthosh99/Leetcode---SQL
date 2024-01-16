# Write your MySQL query statement below
with ranker as (
    select *, rank() OVER (partition by user_id order by time_stamp DESC) as ranks
    from Logins
    where year(time_stamp) = 2020 
)

select user_id, time_Stamp as last_stamp
from ranker
where ranks = 1;