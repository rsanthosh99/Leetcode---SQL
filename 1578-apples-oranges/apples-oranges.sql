# Write your MySQL query statement below
with temp as (

    select sale_date, sum(if(fruit = 'apples', sold_num, 0)) as apple_count, sum(if(fruit = 'oranges', sold_num, 0)) as orange_count
    from sales
    group by sale_date
)
select sale_date,  (apple_count  - orange_count) as diff from temp;