use management_resort;

-- thêm chức vụ
insert into `position` value (1, 'Quản lý'), 
(2, 'Nhân viên');

-- thêm trình độ học vấn
insert into education_degree value (1, 'Trung Cấp'), 
(2, 'Cao Đẳng'), 
(3, 'Đại Học'), 
(4, 'Sau Đại Học');

-- thêm bộ phận 
insert into division value (1, 'Sale-Marketing'), 
(2, 'Hành chính'), 
(3, 'Phục vụ'), 
(4, 'Quản lý');

-- thêm loại khách hàng 
insert into customer_type values
(1, 'Diamond'), 
(2, 'Platinium'), 
(3, 'Gold'), 
(4, 'Silver'), 
(5, 'Member');  


-- thêm nhân viên
insert into employee  (`name`, date_of_birth, id_card, phone_number, email, address, salary, position_id, education_degree_id, division_id) values 
('Nguyen A', '2000/12/03','123456',0365503855,'a@gmail.com','Hai Chau, Da Nang',250000,1,3,4),
('Nguyen B', '2000/12/11','123454',0365503854,'b@gmail.com','Thanh Khe, Da Nang', 200000,2,2,3),
('Nguyen C', '2000/01/31','123455',0365503852,'c@gmail.com','Cam Le, Da Nang',260000,1,3,3),
('Nguyen D', '2000/05/17','123457',0365503851,'d@gmail.com','Hoa Vang, Da Nang',200000,2,1,1);


-- thêm khách hàng
insert into customer (`name`, date_of_birth, gender, id_card, phone_number, email, address, customer_type_id) values
('Nguyen A', '1999/01/12',0,'1234506','0345555255','a@gmail.com','HCM',2),
('Nguyen B', '1994/01/12',1,'1234456','0345555355','b@gmail.com','Da Nang',1),
('Nguyen C', '1997/01/12',0,'1234256','0345555455','c@gmail.com','Ha Noi',3),
('Nguyen D', '1993/01/12',1,'1234856','0345585555','d@gmail.com','Hai Phong',4),
('Nguyen E', '1996/01/12',1,'1234856','0345556555','d@gmail.com','Lam Dong',5),
('Nguyen F', '1995/01/12',1,'1234856','0345255555','d@gmail.com','Dak Lak',1),
('Nguyen H', '1990/01/12',1,'1234856','0343555555','d@gmail.com','Nghe An',4);


-- hiển thị danh sách nhân viên 
select * from employee;

-- hiển thị danh sách khách hàng
select * from customer;

-- xóa nhân viên theo id 
delete from employee where id = 2;

-- xóa khách hàng theo id 
delete from customer where id = 2;

-- gọi đến SP update nhân viên  
call update_employee (10,'Nguyen D', '2000/05/17','123457',0365503851,'d@gmail.com','Hoa Vang, Da Nang',200000,2,1,1);

-- gọi đến SP update khách hàng
call update_customer (11,'Nguyen HHH', '1990/01/12',1,'1234856','0343555555','d@gmail.com','Ben Tre',4);

-- tìm kiếm nhân viên theo tên  
select * from employee where `name` like "% A";


