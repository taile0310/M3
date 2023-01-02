create database practice_with_view_index_store_procedure;

use practice_with_view_index_store_procedure;

create table products(
  id int auto_increment primary key, 
  product_code int, 
  product_name varchar(50), 
  product_price double, 
  product_amount int, 
  product_description varchar(255), 
  product_status varchar(50)
);

insert into products (
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) 
values 
  (
    01, 'bánh nabati', 5000, 10, 'ngon', 
    'còn hàng'
  ), 
  (
    02, 'bánh snack', 6000, 15, 'ngon,cay', 
    'còn hàng'
  ), 
  (
    03, 'bánh phồng tôm', 10000, 0, 
    'ngon', 'hết hàng'
  ), 
  (
    04, 'bánh su kem', 20000, 10, 'ngon, ngọt', 
    'còn hàng'
  );
  
-- hiển thị dữ liệu
select 
  * 
from 
  products;
  
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- UNIQUE INDEX nghĩa là hai hàng không thể có cùng giá trị chỉ mục
create unique index i_product_code on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_productname_productprice on products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain 
select 
  * 
from 
  products 
where 
  product_name = 'bánh phồng tôm';
  
-- So sánh câu truy vấn trước và sau khi tạo index
-- trả lời 
-- câu truy vấn trước khi tạo index thì nó chạy tất cả 4 hàng tốc độ truy vấn chậm hơn
-- nhưng sau khi tạo index thì câu truy vấn nó chỉ chạy tới hàng mình đã chỉ mục và tốc độ truy vấn nhanh hơn

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view v_products as 
select 
  product_code, 
  product_name, 
  product_price, 
  product_status 
from 
  products;
  
-- hiển thị view product v_products
select 
  * 
from 
  v_products;
  
-- Tiến hành sửa đổi view
-- giải thích
-- cập nhập hàng trong view
update 
  v_products 
set 
  product_price = 8000 
where 
  product_name = 'bánh nabati';
  
-- Tiến hành xoá view
drop 
  view v_products;
  
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- cách 1 : không truyền tham số
delimiter // create procedure get_all_products() begin 
select 
  * 
from 
  products;
end // delimiter;

call get_all_products();

-- cách 2 : truyền tham số 
delimiter // create procedure get_id_products(in product_id int) begin 
select 
  * 
from 
  products 
where 
  product_id = id;
end // delimiter;

call get_id_products(1);

-- Tạo store procedure thêm một sản phẩm mới
delimiter // create procedure add_new_product(
  new_code int, 
  new_name varchar(50), 
  new_price double, 
  new_amount int, 
  new_description varchar(255), 
  new_status varchar(50)
) begin insert into products(
  product_code, product_name, product_price, 
  product_amount, product_description, 
  product_status
) value (
  new_code, new_name, new_price, new_amount, 
  new_description, new_status
);
end // delimiter;

call add_new_product(
  05, 'bánh bao chiên', 25000, 30, 
  'ngon, béo', 'còn hàng'
);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter // create procedure edit_product(
  in edit_id int, 
  in edit_code int, 
  in edit_name varchar(50), 
  in edit_price double, 
  in edit_amount int, 
  in edit_description varchar(255), 
  in edit_status varchar(50)
) begin 
update 
  products 
set 
  product_code = edit_code, 
  product_name = edit_name, 
  product_price = edit_price, 
  product_amount = edit_amount, 
  product_description = edit_description, 
  product_status = edit_status 
where 
  edit_id = id;
end // delimiter;

call edit_product(
  2, 02, 'bánh snack', 6000, 0, 'ngon,cay', 
  'hết hàng'
);

-- Tạo store procedure xoá sản phẩm theo id
delimiter // create procedure delete_product(in delete_id int) begin 
delete from 
  products 
where 
  delete_id = id;
end // delimiter;

call delete_product(3);
