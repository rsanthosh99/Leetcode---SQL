# Write your MySQL query statement below
with temp as (
    select c.caller_id as caller, c.duration
    from calls c
    union
    select s.callee_id as caller, s.duration
    from calls s
), temp2 as (
    select t.caller, t.duration, p.phone_number as ph, c.name as country
    from temp t
    left join person p on p.id = t.caller
    left join country c on c.country_code = left(p.phone_number,3)
)

select country 
from temp2 
group by country
having avg(duration) > (select avg(duration) from calls)
