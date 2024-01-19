# Write your MySQL query statement below
with temp as (
    select if(from_id > to_id, from_id, to_id) as person2, if(from_id < to_id, from_id, to_id) as person1, c.*
    from calls c
)

select person1, person2, count(*) as call_count, sum(duration) as total_duration
from temp
group by person1, person2;