create database building_tables_and_manipulating_databases;

use building_tables_and_manipulating_databases;

create table student(
id int auto_increment primary key,
name_student varchar(50),
gender boolean,
birthday date,
email varchar(50),
point int,
username varchar(50),
class_id int,
foreign key(class_id) references class(id)
);

create table class(
id int auto_increment primary key,
name_class varchar(50)
);

-- thêm dữ liệu class
insert into class value
(1,'c1121g1'),
(2,'c1221g1');

-- thêm dữ liệu student
insert into student value
(1,'nguyen ngoc cu','1','1981/12/1',null,8,'cunn',1),
(2,'le hai chung','1','1981/12/12',null,5,'chunglh',null),
(3,'hoang huu hoan','1','1990/12/12',null,6,'hoanghh',2),
(4,'dau dung','1','1987/12/12',null,8,'dungd',null),
(5,'ta dinh huynh','1','1981/12/12',null,7,'huynhtd',2),
(6,'nguyen minh hai','1','1981/12/12',null,9,'hainm',1);

-- 1.Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào
select id, name_student, class_id from student where class_id = 1 or class_id = 2;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
select id, name_student, class_id from student order by class_id asc;

-- 4. Lấy thông tin của các học viên tên “Hai” và 'Huynh’.
select name_student from student where name_student like '%huynh' or name_student like '%hai';

-- 5. Lấy ra học viên có điểm lớn hơn 5
select id, name_student, point from student where point > 5;

-- 6. Lấy ra học viên có họ là “nguyen”
select name_student from student where name_student like 'nguyen%';

-- 7. Thông kế số lượng học sinh theo từng loại điểm
select point, count(name_student) from student group by point;

-- 8. Thông kế số lượng học sinh theo từng loại điểm và phải lớn hơn 5
select count(id) from student where point > 5;

-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select point, count(name) from student where point > 5 group by point having count (name) >2;
 
-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet
select id, name_student from student where class_id = 1 order by name_student desc;