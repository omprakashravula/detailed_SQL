use zomato;
SELECT * FROM food;

#count no of rows;
SELECT count(*) FROM orders;

-- selct random sample;
select * from users order by rand() limit 3;

-- selecting null  rows based on ssome column
select * from orders
where restaurant_rating ='';

-- update null values
update orders
set restaurant_rating=null
where restaurant_rating=0;

-- find orders placed byeadch customers
select t2.name,count(*) from orders t1
join users t2
on t1.user_id=t2.user_id
group by  t2.name;

-- find resturant with most menu
select t2.r_name,count(*) from  menu t1
join restaurants t2
on t1.r_id=t2.r_id
group by t2.r_name;

-- find number of votesand avg rating ofmthe rasturant
select t2.r_id,avg(restaurant_rating),count(*) from restaurants t1
join orders t2
on t1.r_id=t2.r_id
where restaurant_rating is not null
group by t2.r_id;

-- find the foodthat  is being sold most number of resturant
select * from (select t1.r_id,sum(amount) from orders t1
join restaurants t2
on t1.r_id=t2.r_id
where monthname(date(date))='june'
group by t1.r_id
having sum(amount)>400) t3
join restaurants t4
on t3.r_id=t4.r_id;

-- user who never orders
select * from users
where user_id in(
(select user_id from users
except
select user_id from orders));

select * from orders t1
join order_details t2
on t1.order_id=t2.order_id
where user_id=1 and date between '2022-05-10' and '2022-05-26';

-- customer faverate food
select user_id,f_name,count(*) from orders t1
join order_details t2
on t1.order_id=t2.order_id
join food t3
on t2.f_id=t3.f_id
group by user_id,f_name
order by count(*) desc;

-- delivary partner salary
select partner_id,count(*)*100+avg(delivery_rating)*1000 as ''
from orders
group by partner_id;

-- resturant with only vegtarian












