create database management_resort;

use management_resort;

-- chức vụ 
create table `position` (
id int primary key,
`name` varchar(45)
);

-- trình độ học vấn 
create table education_degree (
id int primary key,
`name` varchar(45)
);

-- bộ phận
create table division (
id int primary key,
`name` varchar(45)
);

-- loại khách hàng 
create table customer_type (
id int primary key,
`name` varchar(45)
);

-- loại cơ sở  
create table facility_type (
id int primary key,
`name` varchar(45)
);

create table rent_type (
id int primary key,
`name` varchar(45)
);

create table attach_facility (
id int primary key,
`name` varchar(45),
cost double,
unit varchar(10),
`status` varchar(45)
);

create table employee (
id int primary key auto_increment,
`name` varchar(45),
date_of_birth date,
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
salary double,
position_id int,
education_degree_id int,
division_id int,
foreign key(position_id) references `position` (id) ,
foreign key (education_degree_id) references education_degree (id),
foreign key (division_id) references division (id)
);





create table customer (
id int primary key auto_increment,
`name` varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
customer_type_id int,
foreign key(customer_type_id) references customer_type (id)
);

create table facility (
id int primary key auto_increment,
`name` varchar(45),
area int,
cost double,
max_people int,
standard_room varchar(45),
description_other_convenience varchar(255),
pool_area double,
number_of_floors int,
facility_free text,
rent_type_id int,
facility_type_id int,
foreign key(rent_type_id) references rent_type (id),
foreign key(facility_type_id) references facility_type(id)
);

create table contract (
id int primary key,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int,
foreign key(employee_id) references employee(id),
foreign key(customer_id) references customer(id),
foreign key(facility_id) references facility(id)
);

create table contract_detail (
id int primary key,
quantity int,
contract_id int,
attach_facility_id int,
foreign key(contract_id) references contract(id),
foreign key(attach_facility_id) references attach_facility (id)
);

-- tạo SP update nhân viên
 delimiter // 
create procedure update_employee
(in u_id int ,
u_name varchar(45),
u_date_of_birth date,
u_id_card varchar(45),
u_phone_number varchar(45),
u_email varchar(45),
u_address varchar(45),
u_salary double,
u_position_id int,
u_education_degree_id int,
u_division_id int
) begin 
update 
  employee 
set 
`name` = u_name,
date_of_birth = u_date_of_birth,
id_card = u_id_card
,phone_number =u_phone_number
, email =u_email
, address=u_address
, salary=u_salary
, position_id=u_position_id
, education_degree_id=u_education_degree_id
, division_id=u_division_id
where 
  id = u_id;
end //
delimiter ;

-- tạo SP update khách hàng
delimiter //
create procedure update_customer 
(in c_id int ,
c_name varchar(45),
c_date_of_birth date,
c_gender bit(1),
c_id_card varchar(45),
c_phone_number varchar(45),
c_email varchar(45),
c_address varchar(45),
c_customer_type_id int) begin 
update 
customer 
set `name` = c_name,
 date_of_birth = c_date_of_birth,
 gender = c_gender,
  id_card = c_id_card,
 phone_number =c_phone_number,
email = c_email ,
address = c_address,
customer_type_id = c_customer_type_id
where id = c_id;
end //
delimiter 












