use data_query_student_management;

select 
  * 
from 
  class;
select 
  * 
from 
  student;
select 
  * 
from 
  `subject`;
select 
  * 
from 
  mark;
  
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select 
  sub_id, 
  sub_name, 
  max(credit) as max 
from 
  `subject` 
group by 
  sub_id 
order by 
  max desc 
limit 
  1;
select 
  * 
from 
  `subject` 
order by 
  credit desc 
limit 
  1;
select 
  * 
from 
  `subject` 
where 
  credit = (
    select 
      max(credit) 
    from 
      `subject`
  );
  
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select 
  * 
from 
  mark 
where 
  mark = (
    select 
      max(mark) 
    from 
      mark
  );
  
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
-- giaỉ thích 
-- dùng LEFT JOIN để lấy được thông tin bảng bên trái 
-- from 'table1' join 'table2' -> LEFT JOIN (table1) và RIGHT JOIN (table2)
select 
  s.student_id, 
  s.student_name, 
  s.class_id, 
  ifnull(
    avg(m.mark), 
    0
  ) as `avg` 
from 
  student s 
  left join mark m on m.student_id = s.student_id 
group by 
  student_id 
order by 
  `avg` desc;
