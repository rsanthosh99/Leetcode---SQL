# Write your MySQL query statement below
select id,count(*) as num
from(
    (
    select requester_id as id
    from RequestAccepted
    )
    UNION ALL
    (
    select accepter_id as id
    from RequestAccepted
    )) temp
group by id
order by count(*) DESC limit 1;
