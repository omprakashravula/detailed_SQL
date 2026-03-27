SELECT model,screen_size FROM campusx.smartphones
where brand_name='samsung'
order by screen_size desc limit 5;
select brand_name,model,(num_front_cameras+num_rear_cameras) as total_cam from campusx.smartphones
order by total_cam desc;
select * from campusx.smartphones
order by battery_capacity asc limit 1,1;
select * from campusx.smartphones
where brand_name='apple'
order by rating asc;
select * from campusx.smartphones
order by brand_name asc,rating asc;
select * from campusx.smartphones
order by brand_name asc,price asc