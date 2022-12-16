create database data_query_student_management;

use data_query_student_management;

create table class(
  class_id int auto_increment primary key, 
  class_name varchar(60) not null, 
  start_date datetime not null, 
  `status` bit
);

create table student(
  student_id int auto_increment primary key, 
  student_name varchar(30) not null, 
  address varchar(50), 
  phone varchar(20), 
  `status` bit, 
  class_id int not null, 
  foreign key(class_id) references class(class_id)
);

create table `subject`(
  sub_id int auto_increment primary key, 
  sub_name varchar(30) not null, 
  credit tinyint not null default 1, 
  `status` bit default 1
);

create table mark(
  mark_id int auto_increment primary key, 
  sub_id int not null, 
  student_id int not null, 
  mark float, 
  examtimes tinyint, 
  unique key(sub_id, student_id), 
  foreign key(sub_id) references `subject`(sub_id), 
  foreign key(student_id) references student(student_id)
);

-- thêm mới dữ liệu
insert into class value (1, 'A1', '2008-12-20', 1), 
(2, 'A2', '2008-12-22', 1), 
(3, 'B3', current_date, 0);

insert into student value (1, 'Hung', 'Ha Noi', '0912113113', 1, 1), 
(2, 'Hoa', 'Hai phong', null, 1, 1), 
(3, 'Manh', 'HCM', '0123123123', 0, 2);

insert into `subject` value (1, 'CF', 5, 1), 
(2, 'C', 6, 1), 
(3, 'HDJ', 5, 1), 
(4, 'RDBMS', 10, 1);

insert into mark value (1, 1, 1, 8, 1), 
(2, 1, 2, 10, 2), 
(3, 2, 1, 12, 1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select 
  * 
from 
  student 
where 
  student_name like 'h%';
  
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select 
  * 
from 
  class 
where 
  month(start_date) = 12;
  
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select 
  * 
from 
  `subject` 
where 
  credit > 2 
  or credit < 6;
  
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2
-- lưu ý cần phải mở trước khi thay đổi đối với `status` = 1 (bật chế độ an toàn)
set 
  sql_safe_updates = 0;
update 
  student 
set 
  class_id = 2 
where 
  student_name like 'Hung';
  
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select 
  s.student_name, 
  sub.sub_name, 
  mark 
from 
  mark m 
  join student s on m.student_id = s.student_id 
  join `subject` sub on m.sub_id = sub.sub_id 
order by 
  m.mark desc;
