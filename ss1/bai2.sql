create database if not exists bai2;
use bai2;
create table teacher(
id int primary key,
`name`  varchar(50),
age int,
`country` varchar(50)
);
-- them du lieu moi
insert into teacher value(1,'Tai',22,'Da Nang'),(2,'Sy',32,'Ha Noi');
-- hien thi du lieu 
select * from teacher;
-- chinh sua du lieu
set sql_safe_update = 0;
set sql_safe_update = 1;
update teacher set name = 'Quan' where id = 1;
