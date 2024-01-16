# Write your MySQL query statement below
with Activity_t as (
    select a.*, rank() over (partition by player_id order by event_date) as ranker
    from Activity a
)

select player_id, event_date as first_login 
from Activity_t
where ranker = 1