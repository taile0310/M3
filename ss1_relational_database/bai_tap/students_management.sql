create database students_management;
use students_management;

create table class(
  id int primary key, 
  name_class varchar(15)
);
-- thêm mới dữ liệu
insert into class value(1, 'c0922g1'), 
(2, 'c1022g1');
-- chỉnh sửa dữ liệu
-- 0 là mở
set 
  sql_safe_updates = 0;
update 
  class 
set 
  name_class = 'c1122g1' 
where 
  name_class = 'c0922g1';
-- 1 là đóng
set 
  sql_safe_updates = 1;
  
create table teacher(
  id int primary key, 
  `name` varchar(50), 
  age int, 
  `country` varchar(50)
);
-- thêm mới dữ liệu
insert into teacher value(1, 'Tai', 22, 'Da Nang'), 
(2, 'Sy', 32, 'Ha Noi');
-- chỉnh sửa dữ liệu
set 
  sql_safe_updates = 0;
update 
  teacher 
set 
  name = 'Quan' 
where 
  name = 'Tai';
set 
  sql_safe_updates = 1;
-- hiển thị dữ liệu
select 
  * 
from 
  class;
select 
  * 
from 
  teacher;
