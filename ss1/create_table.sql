create database if not exists bai1;
use bai1;

create table class(
id int primary key,
name_class varchar(15)
);
-- them moi du lieu
insert into class value(1,'c0922g1'),(2,'c1022g1');
-- hien thi du lieu (lay tat ca thong tin cot )
select * from class;
-- chinh sua du lieu => doi ten class
-- 0 la mo 
set sql_safe_update = 0;
-- 1 la dong
set sql_safe_update = 1;
update class set name_class = 'c1122g1' where id = 1;

