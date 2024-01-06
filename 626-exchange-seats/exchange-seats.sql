# Write your MySQL query statement below
with alter_id as (
    select student, 
    CASE 
        WHEN (id = (select max(id) from Seat)) and (id%2=1)  THEN id 
        WHEN id%2 = 0 THEN id-1 
        WHEN id%2=1 THEN id+1 
        END as n_id
    from Seat
)

select n_id as id, student
from alter_id
order by n_id;

