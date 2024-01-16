# Write your MySQL query statement below
with temp as (
    select m.*, 
        ( 
            case 
            when host_goals > guest_goals then 3
            when host_goals = guest_goals then 1
            else 0
            end
        ) as h_score,
        (
            case 
            when host_goals > guest_goals then 0
            when host_goals = guest_goals then 1
            else 3
            end 
        ) as g_score 
    from Matches m
), t2 as ( 
    select t.*, h.h_score as score
    from Teams t
    left join temp h on h.host_team = t.team_id
    union all
    select t.*,g.g_score as score
    from Teams t
    left join temp g on g.guest_team = t.team_id
)

select team_id, team_name, IFNULL (sum(score),0) as num_points
from t2
group by t2.team_id
order by num_points desc, team_id;
# select * from temp;
