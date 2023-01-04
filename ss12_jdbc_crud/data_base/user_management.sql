create database user_management;
use user_management;

create table users (
id int(3) not null auto_increment primary key,
user_name varchar(120) not null,
user_email varchar(120) not null,
country varchar(120)
);

insert into users (user_name, user_email, country) values
('Minh','minh@gmail.com','VietNam'),
('Kante','kante@gmail.com','Canada'),
('Shinzao','shinzao@gmail.com','China'),
('Tomy','tomy@gmail.com','England');

select * from users;
