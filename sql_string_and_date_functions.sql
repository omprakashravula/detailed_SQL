create database strdb;
USE strdb;
create table employees(
empid int,
first_name varchar(255),
last_name varchar(30),
depertment varchar(30),
city varchar(30)
);
insert into employees values
(1,'john','smith','sales','newyork'),
(2,'ravi','kumar','finance','london'),
(3,'robert','taylor','it','sudney'),
(4,'emma','watson','marketing','totnoto'),
(5,'david','clark','marketing','paris');

select * from employees;
-- concat----
select empid,concat(first_name,' ',last_name)as'full_name' from employees;
select empid,concat_ws('-',first_name,last_name,depertment)as'full_name' from employees;
-- length--
select first_name,length(first_name) from employees;
select length('😊');

-- car_length
select char_length('😊');

-- lowercase/lcase
select lower(depertment),lcase(city) from employees;

-- uppercase/lcase
select upper(depertment),ucase(city) from employees;

-- substring/substr()
select first_name,substring(first_name,1,3),last_name,substring(last_name,2,4) from employees;

-- instr
select  depertment,instr(depertment,'a') as 'positionofa'from employees;

-- left() and right()
select first_name,left(first_name,2)as leftchar,right(first_name,2)as rifhrchar from employees;

-- reverse
select reverse(first_name) from employees;

-- replace
select depertment,replace(depertment,'sales','salees') from employees;

-- trim 
select trim('   sql  ')as'trimmed';
select trim(leading 'a'from 'aaaaahello');
select trim(trailing 'a'from 'helloaaaa');
select trim(both 'a'from 'aaaaahelloaaaaa');

-- ----------------------------------------------------------------------------------------------------- --
-- date and time functions
-- curdate() -- returns  current date (yyyy-mm-dd) formate
select curdate();
select current_date();
-- curtime - return curretn time (hh-mm-ss)
select curtime();
select current_time();

-- now()retrurn date and time (yyyy-mm-d-ss)
select now() as currentdatetime;

-- sysdate()-- returns sysetms curent date and time
select sysdate() as systemdate;

-- date()
select date('2024-02-07 08:04:30')as onlydate;

select time('2024-02-07 08:04:30') as onlytime;

-- year(),month(),daypart()
select year('2024-02-07 08:04:30') as yearpart,
month('2024-02-07 08:04:30')as monthpart,
monthname('2024-02-07 08:04:30')as monthpart,
day('2024-02-07 08:04:30') as daypart;

-- dayname() -- retun weekday name
select dayname(now())as dayname;
select monthname(now())monthname;

-- date_formate()
-- %y=year(4digits)
-- %m=month(2 digit)
-- %M=monthname
-- %d =day
-- %w=hours
-- %i=minutes
-- %s=seconds

select date_format('2026-03-31','%d-%M-%y-%W-%h-%i-%s') as formateeddate;

-- datediff() returns diffence between two dates
select datediff(now(),'2003-02-21');
-- add date()
select adddate('2025-12-20',interval 10 day) as newdate;
select adddate('2025-12-20',interval 1 year) as newdate;
select adddate('2025-12-20',interval 1 month) as newdate;
-- subdate/date_sub
select subdate('2025-12-20',interval 10 day);
select subdate('2025-12-20',interval 1 year) as newdate;

-- add time() -- adds a time intervel too given time or datetime
select addtime('2025-12-30 03:30:00','02:00:00');
-- subtime() -- subs a time intervel too given time or datetime
select subtime('2025-12-30 03:30:00','02:00:00');
-- time diff return the diffrenedce time betwen two times
select timediff('10:30:00','08:00:00')as timedifference;

-- extract  -- extract specific part from date
select extract(year from'2025-03-25');
select extract(month from'2025-03-25')as extractyear;
 




