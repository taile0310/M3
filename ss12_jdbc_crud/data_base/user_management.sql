create database user_management;

use user_management;

create table users (
  id int(3) not null auto_increment primary key, 
  user_name varchar(120) not null, 
  user_email varchar(120) not null, 
  country varchar(120)
);

delimiter // 
create procedure delete_users(in id int) 
begin 
delete from users 
where 
  users.id = id;
end //
delimiter ;

delimiter // 
create procedure update_users
(
  in u_id int, 
  u_name varchar(120), 
  u_email varchar(120), 
  u_country varchar(120)
) begin 
update 
  users 
set 
  user_name = u_name, 
  user_email = u_email, 
  country = u_country 
where 
  id = u_id;
end //
delimiter ;

insert into users (user_name, user_email, country) 
values 
  (
    'Minh', 'minh@gmail.com', 'VietNam'
  ), 
  (
    'Kante', 'kante@gmail.com', 'Canada'
  ), 
  (
    'Shinzao', 'shinzao@gmail.com', 'China'
  ), 
  (
    'Tomy', 'tomy@gmail.com', 'England'
  );
  
select 
  * 
from 
  users;
  
delete from 
  users 
where 
  id = 2;
  
select 
  * 
from 
  users 
where 
  country = "Canada";
  
call delete_users(1);

call update_users(
  16, 'hoa', 'tai@gmail.com', 'VietNam'
);
