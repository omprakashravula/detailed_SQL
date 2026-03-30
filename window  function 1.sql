-- whindow functions ---
-- window function are similar to groupby but window function does collaps the table to into single rows
-- it perfomes calulation on set of row reelated to the row
-- give the output over by row umlike groupby it gives summerize result

-- agg function with over---
-- syntax aggfun(marks)over(partion by group)
use campusx;
SELECT *,avg(marks)over(partition by branch),
max(marks)over(partition by branch),
max(marks)over(),
min(marks)over(),
min(marks)over(partition by branch)
 FROM campusx.marks;
 
-- find all students whos marks > avg marks of there respective branch
-- select * from marks 
-- where marks>(select avg(marks) from marks )
select * from (select *,avg(marks) over(partition by branch) as 'branch_avg' from marks) t
where t.marks>t.branch_avg;

-- -----------------------------------------------------------------------------------------------------------------------------
-- rank/dense/row_number
-- top two customer of eadch month
-- syntax-- rank()over(partition by group order by marks desc)
-- based on order values it will rank--

select *,
rank() over(partition by branch  order by marks desc) as'ranking',
dense_rank()over(partition by branch order by marks desc) as 'dens_rank',
concat(branch,'-',row_number()over(partition by branch order by marks asc))
from marks;

--  top paying customers of each month
select * from (SELECT t1.*,t2.name,
rank()over(partition by monthname(date) order by amount desc) as'month_rank'
FROM zomato.orders t1
join zomato.users t2
on t1.user_id=t2.user_id) t3
where t3.month_rank=1 or t3.month_rank=2;

-- ---------------------------------------------------------------------------------------------------------------------
-- first/last nth value using window functions
-- frames on window functionare subset of group function default rows between unbounded preceding and current row--
-- frames are important inthe function 
select *,
FIRST_VALUE(marks)over(partition by branch order by marks desc),
LAST_VALUE(marks)over(partition by branch order by marks DESC
					rows between unbounded preceding and unbounded following),
 nth_VALUE(name,2)over(partition by branch order by marks DESC
					rows between unbounded preceding and unbounded following)
from marks;
select * from marks;
-- finding branch topper
select * from(select*,
first_value(name)over(partition by branch order by marks desc)as'topper_name',
first_value(marks)over(partition by branch order by marks desc)as'topermarks'
 from marks) t
 where t.name=t.topper_name and t.marks=topermarks;
 select * from(select*,
last_value(name)over(partition by branch order by marks desc
                     rows between unbounded preceding and unbounded following)as'topper_name',
last_value(marks)over(partition by branch order by marks desc
						rows between unbounded preceding and unbounded following)as'topermarks'
 from marks) t
 where t.name=t.topper_name and t.marks=topermarks;
 
 -- -----------------------------------------------------------------------------------------------------
 -- lead and lag function in sql------
select *,
lag(marks)over(partition by branch order by student_id),
lead(marks)over()
 from marks;
 
 select monthname(date),sum(amount),
 ((sum(amount)-lag(sum(amount))over())/(lag(sum(amount))over()))*100
 from zomato.orders
 group by monthname(date) 

 
 





 











