# Write your MySQL query statement below
with cum_sum as (
    select *, sum(weight) over (order by turn) as cum
    from Queue
    order by turn
 )

 select person_name 
 from cum_sum
 where turn = (
    select max(turn)
    from cum_sum 
    where cum <= 1000);