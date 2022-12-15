create database build_sales_management_data;

use build_sales_management_data;

create table customer(
  customer_id int primary key, 
  customer_name varchar(50), 
  customer_age int
);

create table orders(
  orders_id int primary key, 
  orders_date date, 
  orders_total_price double, 
  customer_id int, 
  foreign key(customer_id) references customer(customer_id)
);

create table product(
  product_id int primary key, 
  product_name varchar(50), 
  product_price double
);

create table order_detail(
  order_id int, 
  product_id int, 
  orders_qty int, 
  foreign key(order_id) references orders(orders_id), 
  foreign key(product_id) references product(product_id)
);
