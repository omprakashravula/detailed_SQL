SELECT * FROM emp.laptopdata;
use emp;
-- creating a copy of the table
-- it oly create a column name not data
create table laptops_backup like laptopdata;
select * from laptops_backup;
-- inssertinf the data into  empty  above table 
insert into laptops_backup
select * from laptopdata;

-- renaming the table column name
alter table laptops_backup change column `Unnamed: 0` ID INT;

-- checking the table  description using information schene
select data_length/1024 from information_schema.tables
where table_schema='emp'
and table_name='laptops_backup';

-- removing null values
-- use gropuby functions tack the singke values from groupby use min id,or any one column as us NOT IN () using drop drop the rows
select distinct(inches) from laptops_backup;

-- replacing the values
UPDATE laptops_backup
set RAM=replace(RAM,'GB','');
select * from laptops_backup;

-- chaning the column datatype
alter table laptops_backup modify column ram integer;


select * from information_schema.tables
where table_schema='emp'
and table_name='laptops_backup';
update laptops_backup
set weight=replace(weight,'kg','');
select * from laptops_backup;

-- if else function in sql
alter table laptops_backup modify column price integer;
select distinct(opsys),
case
	when opsys like '%mac%' then 'macos'
    when opsys like '%window%' then 'windows'
    when opsys like '%linux%' then 'linux'
    when opsys like 'No Os' Then 'N/a'
    else 'other'
    end AS 'O/S'
 from laptops_backup;
 
 -- if else function in sql replacing  with other valueses
 update laptops_backup
 set opsys=case
	when opsys like '%mac%' then 'macos'
    when opsys like '%window%' then 'windows'
    when opsys like '%linux%' then 'linux'
    when opsys like 'No Os' Then 'N/a'
    else 'other'
    end;
    
    -- adding new columns fo the dable
    alter table laptopdata add column gpu_brand varchar(255) after gpu,
    add column gpu_name varchar(255) after gpu_brand;
    select * from laptopdata;
    
    -- updating table using SUBSTRING_INDEX()
    update laptopdata l1
    set gpu_brand=(select substring_index(gpu,' ',1) from laptopdata l2 where l2.`Unnamed: 0`=l1.`Unnamed: 0` );
    