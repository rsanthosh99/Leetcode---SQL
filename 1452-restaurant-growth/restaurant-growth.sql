# # Write your MySQL query statement below
select 
   c.visited_on, 
    (select sum(amount) from customer where visited_on between date_sub(c.visited_on, INTERVAL 6 DAY) and c.visited_on) as amount,
    (select round(sum(amount)/7,2) from customer where visited_on between date_sub(c.visited_on, INTERVAL 6 DAY) and c.visited_on) as average_amount
from customer c
where c.visited_on >= (select date_add(min(visited_on), INTERVAL 6 DAY) from customer)
group by c.visited_on
order by c.visited_on;

