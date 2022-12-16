create database data_query_sale_management;

use data_query_sale_management;

create table customer(
  customer_id int primary key, 
  customer_name varchar(50), 
  customer_age int
);

create table `order`(
  order_id int primary key, 
  order_date date, 
  order_total_price double, 
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
  order_qty int, 
  foreign key(order_id) references `order`(order_id), 
  foreign key(product_id) references product(product_id)
);

-- thêm thông tin mới
insert into customer value (1, 'Minh Quan', 10), 
(2, 'Ngoc Oanh', 20), 
(3, 'Hong Ha', 50);

insert into product value (1, 'May Giat', 3), 
(2, 'Tu Lanh', 5), 
(3, 'Dieu Hoa', 7), 
(4, 'Quat', 1), 
(5, 'Bep Dien', 2);

insert into `order` value (1, '2006/03/21', null, 1), 
(2, '2006/03/23', null, 2), 
(3, '2006/03/16', null, 1);

insert into order_detail value (1, 1, 3), 
(1, 3, 7), 
(1, 4, 2), 
(2, 1, 1), 
(3, 1, 8), 
(2, 5, 4), 
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  order_id, 
  order_date, 
  order_total_price 
from 
  `order`;
  
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  distinct c.customer_id, 
  c.customer_name, 
  p.product_name, 
  p.product_price 
from 
  customer c 
  join `order` o 
  join product p 
  join order_detail od on c.customer_id = o.customer_id 
  and p.product_id = od.product_id 
  and o.order_id = od.order_id;
  
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select 
  distinct c.customer_name 
from 
  customer c 
where 
  c.customer_id not in (
    select 
      o.customer_id 
    from 
      `order` o 
    where 
      o.order_id
  );
