# Write your MySQL query statement below
select distinct(c.title)
from TVProgram p
left join Content c on c.content_id = p.content_id
where c.kids_content = 'Y' and left(p.program_date,7) = '2020-06' and content_type = 'Movies'