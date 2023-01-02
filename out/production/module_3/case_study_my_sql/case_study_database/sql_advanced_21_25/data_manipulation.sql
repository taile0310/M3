use furama_management;

select 
  * 
from 
  hop_dong;
select 
  * 
from 
  khach_hang;
select 
  * 
from 
  nhan_vien;
  
-- 21.  Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
-- tạo view nhân viên
create view v_nhan_vien as 
select 
  nv.* 
from 
  nhan_vien nv 
  join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
where 
  dia_chi like '% Đà Nẵng' 
  and ngay_lam_hop_dong = '2021/04/25';
  
-- hiển thị view nhân viên
select 
  * 
from 
  v_nhan_vien;
  
-- 22.Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set 
  sql_safe_updates = 0;
update 
  v_nhan_vien 
set 
  dia_chi = 'Liên Chiểu';
select 
  * 
from 
  v_nhan_vien;
  
-- 23.Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang
-- giải thích 
-- tạo ra hàm xóa 
delimiter // create procedure sp_xoa_khach_hang(in xoa_ma_khach_hang int) begin if xoa_ma_khach_hang not in(
  select 
    kh.ma_khach_hang 
  from 
    khach_hang kh
) then signal sqlstate "45000" 
set 
  message_text = "mã khách hàng không tồn tại";
else 
delete from 
  khach_hang 
where 
  xoa_ma_khach_hang = ma_khach_hang;
end if;
end // delimiter;

-- gọi hàm xóa 
call sp_xoa_khach_hang(6);

-- 24.Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
-- giải thích
-- tạo ra hàm thêm mới hợp dồng 
delimiter // create procedure sp_them_moi_hop_dong(
  ma_hop_dong int, ngay_lam_hop_dong datetime, 
  ngay_ket_thuc datetime, tien_dat_coc double, 
  ma_nhan_vien int, ma_khach_hang int, 
  ma_dich_vu int
) begin insert into hop_dong (
  ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
  tien_dat_coc, ma_nhan_vien, ma_khach_hang, 
  ma_dich_vu
) value (
  ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
  tien_dat_coc, ma_nhan_vien, ma_khach_hang, 
  ma_dich_vu
);
end // delimiter;

-- gọi tới hàm thêm mới hợp đồng
call sp_them_moi_hop_dong (
  13, '2022-12-21', '2022-12-24', '250000', 
  3, 1, 3
);

-- 25.Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- giải thích
-- tạo bảng lưu lại lịch sử xóa hợp đồng
create table lich_su_xoa_hop_dong(
  ma_hop_dong int primary key, ngay_xoa_hop_dong datetime, 
  so_luong_hop_dong_con_lai int
);
select 
  * 
from 
  lich_su_xoa_hop_dong;
  
-- tạo trigger xóa hợp dồng
delimiter //
create trigger tr_xoa_hop_dong 
after 
  delete on hop_dong for each row 
  begin 
  insert into lich_su_xoa_hop_dong (
    ma_hop_dong, ngay_xoa_hop_dong, so_luong_hop_dong_con_lai
  ) value (
    old.ma_hop_dong, 
    now(), 
    (
      select 
        count(ma_hop_dong) 
      from 
        hop_dong
    )
  );
end // 
delimiter ;

select 
  * 
from 
  hop_dong;
  
-- mở khóa ngoại
set 
  foreign_key_checks = 0;
  
-- tiến hành xóa các hợp đồng theo mã hợp đồng
delete from 
  hop_dong hd 
where 
  hd.ma_hop_dong = 3;
