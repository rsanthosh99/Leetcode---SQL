# Write your MySQL query statement below
select left_operand, operator, right_operand, (
    case
    when operator = '>' and l.value > r.value then 'true'
    when operator = '=' and l.value = r.value then 'true'
    when operator = '<' and l.value < r.value then 'true'
    else 'false'
    end
) as value
from Expressions e
left join Variables l on l.name = e.left_operand
left join Variables r on r.name = e.right_operand