# Write your MySQL query statement below

#---->My Answer
# WITH
# n_r_table as (
#     select user_id, count(rating) as n_r
#     from MovieRating
#     group by user_id
# ),
# avg_table as (
#     select movie_id, avg(rating) as avg_rating
#     from MovieRating
#     where month(created_at) = '02'
#     group by movie_id
# )

# (select name as results
# from Users
# where user_id in (
#     select user_id
#     from n_r_table
#     where n_r = (select max(n_r) from n_r_table)
# )
# order by name limit 1
# )

# union all

# (
# select title as results
# from Movies
# where movie_id in (
#     select movie_id 
#     from avg_table
#     where avg_rating in (select max(avg_rating) from avg_table ) 
# ) 
# order by title 
# limit 1
# )

#Optimal Solution --> Remember to use Limit appropriately!

(SELECT name AS results
FROM MovieRating JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating JOIN Movies USING(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1);
