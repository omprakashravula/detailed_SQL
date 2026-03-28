-- selecting movie based score
SELECT * FROM campusx.`movies (1)`
where score=(select max(score) from campusx.`movies (1)`);
select * from campusx.`movies (1)`
order by score desc limit 1;
SELECT * FROM campusx.`movies (1)`
where score=(select min(score) from campusx.`movies (1)`);

-- return of subquerry three type scalar,row subquery,table subquery
-- based on exicuation independent,corelated
-- used in select ,insert,delete,update

-- scalar return  subquery--
-- find movies with highest profit
select * from campusx.`movies (1)`
where gross-budget=(select max(gross-budget) from campusx.`movies (1)`);

select * from campusx.`movies (1)`
where score>(select avg(score) from campusx.`movies (1)`);

select * from campusx.`movies (1)`
where score=(select max(score) from campusx.`movies (1)`
where year=2000) and year=2000;

select * from campusx.`movies (1)`
where score=(select max(score) from campusx.`movies (1)`where votes>(select avg(votes) from campusx.`movies (1)`));

-- row subquerys using zomato dataset
-- users who never order
use zomato;
select * from users
where user_id in
(select user_id from users
except
select user_id from orders);

-- find all movies made by top 3 directors in trems of total gross income

with top_d as(select director,sum(gross-budget)as'profit' from campusx.movies
group by director
order by profit desc limit 3)
select * from campusx.movies
where director in (select * from top_d);

select * from campusx.movies
where star in
(select star from campusx.movies
where votes>25000
group by star
having avg(score)>8.5);

-- table sunqueary
-- most proffitble movie  for each year
select * from campusx.movies
where (year,gross-budget) in (select year,max(gross-budget) from campusx.movies
group by year);

-- most highest rated movie of each genre votes cut of 2500
select * from campusx.movies
where(genre,score)in(
select genre,max(score) from campusx.movies
where votes>25000
group by genre ) and votes>25000;

-- top highest gross movies oftop 5 director combo in terms of total_gross income

with top_star_dic as (select star,director,max(gross-budget)as'profit' from campusx.movies
group by star,director
order by profit desc limit 5)
select * from campusx.movies
where (star,director,gross-budget)in(select * from top_star_dic);

-- -------------------------------------------------------------------------- =--
-- co related subqueary
select * from campusx.movies t1
where score>(select avg(score) from campusx.movies m2 where m2.genre=t1.genre);

-- fav food of customer
with f as(select t1.user_id,
t4.f_name,count(*)as'freq' from orders t1
join order_details t2
on t1.order_id=t2.order_id
join users t3
on t1.user_id=t3.user_id
join food t4
on t2.f_id=t4.f_id
group by t1.user_id,t4.f_name)
select * from f m1
where freq=(select max(freq) from f m2 where m2.user_id=m1.user_id );

-- ---------------------------------------------
-- ----sub queary on select --------------

-- percentage of vaotes get by movies compered by all movies
select name,votes,round((votes/(select sum(votes) from campusx.movies)*100),3)from campusx.movies;

-- display names,geere ,movies,and avg(sccore) of genre
select name,genre,score,(select avg(score) from campusx.movies m2 where m2.genre=m1.genre ) from campusx.movies m1;

-- -----------------------------------------------------------------------------------------------------------------
-- subqure using from
select * from(
select r_id,avg(restaurant_rating) from orders
group by r_id) t1
join restaurants t2
on t1.r_id=t2.r_id;
----------------------------------------------------------------------------------------------
select genre,avg(score) from campusx.movies
group by genre
having avg(score)>(select avg(score) from campusx.movies);

----------------------------------------------------------------------------------------
-- sub querys using insert ----
insert into zomato.loyalusers
(name)
select name from zomato.orders t1
join users t2
on t1.user_id=t2.user_id
group by t2.name
having count(*)>2;

-- --------------------------------------------------------------------------------------------------------------
-- sub querys using update--
update into zomato.loyalusers m1
set money=(select sum(amount)*0.1 from zomato.orders m2
		group by user_id 
where m1.user_id=m2.user_id;
-- -----------------------------------------------------------------------------
-- deleting the rows

delete from zomato.users
where user_id in
(select user_id from users
except
select user_id from orders)














