

with ranking_tb as
(
    select d.name as Department,e.name as Employee,salary, DENSE_RANK() over (
        partition by departmentId
        order by salary DESC
    ) as sal_rank
    from Employee e
    left join Department d on d.id = e.departmentId
    order by departmentId, salary DESC
)


select Department, Employee, salary 
from ranking_tb
where sal_rank <=3