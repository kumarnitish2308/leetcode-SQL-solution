-- Level Medium 
with cte as(
    select id,student,
    lead(id) over(order by id) as next,
    lag(id) over(order by id) as prev
    from seat
)

select
case  -- exchanging the seats based on id                                               
when id % 2 != 0 and next is not null then next
when id % 2 = 0 then prev
when id % 2 != 0 and next is null then id
else null
end as id, student 
from cte
order by id;

