SELECT brand_name,count(*),avg(price),max(price) FROM campusx.smartphones
group by brand_name
having count(*)>50;
select has_nfc,avg(price),avg(rating) from campusx.smartphones
group by has_nfc;
use campusx;
select avg(price) from smartphones
group by extended_memory_available
order by avg(price) asc;
select brand_name,processor_brand,avg(price) from campusx.smartphones
group by brand_name,processor_brand
order by brand_name,processor_brand;
select brand_name,avg(price)from campusx.smartphones
group by brand_name
order by avg(price) limit 5;
select brand_name,avg(screen_size)from campusx.smartphones
group by brand_name
order by avg(screen_size) limit 5;
select has_nfc,avg(price) from campusx.smartphones
where brand_name='samsung' and has_5g='True'
group by has_nfc;
select * from campusx.smartphones
where price=(select max(price) from campusx.smartphones);
select * from campusx.smartphones
order by price desc limit 1;
select brand_name,avg(rating),avg(price),count(*) from campusx.smartphones
where has_5g='True'
group by brand_name
having count(*)>10 and avg(rating)>70
order by avg(price) desc limit 5




