use furama_management;

-- hiển thị khách hàng
select 
  * 
from 
  khach_hang;
select 
  * 
from 
  loai_khach;
select 
  * 
from 
  hop_dong;
select 
  * 
from 
  hop_dong_chi_tiet;
               
-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
-- giải thích
-- sử dụng hàm SUBSTRING_INDEX trả về chuỗi con của chuỗi đã cho trước với số lần xuát hiện của dấu cách
-- SUBSTRING_INDEX (chuỗi,'dấu cách', giá trị số)
-- giá trị âm thì trả về bên trái 'dấu cách' ngược lại giá trị dương thì trả về bên phải 'dấu cách'
-- char_length dùng để kiểm tra độ dài kí tự theo điều kiện đã cho
select 
  * 
from 
  khach_hang 
where 
  substring_index(ho_ten, ' ',-1) like 'H%' 
  or substring_index(ho_ten, ' ',-1) like 'T%' 
  or substring_index(ho_ten, ' ',-1) like 'K%' 
  and char_length(ho_ten) <= 15;
  
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
-- giải thích
-- khi tìm địa chỉ thì cần chú ý các kí tự phía trước nó và khoảng trắng
-- sử dụng hàm YEAR() để trả về năm của ngày đã chỉ định, CURDATE() hàm trả về ngày của máy tính
-- có nghĩa là lấy năm 2022 - 1992 = 30 tuổi
select 
  * 
from 
  khach_hang 
where 
  dia_chi like '% Đà Nẵng' 
  or dia_chi like '% Quảng Trị' 
  and year(
    curdate()
  ) - year(ngay_sinh) between 18 
  and 50;
  
-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
-- giải thích 
-- sử dụng JOIN để liên kết các bảng với nhau, sử dụng ORDER BY để sắp xếp tăng giảm 
select 
  kh.ma_loai_khach, 
  kh.ho_ten, 
  count(hd.ma_khach_hang) as so_lan 
from 
  khach_hang kh 
  join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang 
  join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach 
where 
  lk.ten_loai_khach = 'Diamond' 
group by 
  kh.ma_loai_khach, 
  kh.ho_ten, 
  hd.ma_khach_hang 
order by 
  so_lan;
  
-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
-- với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
-- dv_dk.gia, dv.chi_phi_thue, hd_ct.so_luong
select 
  distinct kh.ma_khach_hang, 
  kh.ho_ten, 
  lk.ten_loai_khach, 
  hd.ma_hop_dong, 
  dv.ten_dich_vu, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc, 
  (chi_phi_thue + so_luong * gia) as tong_tien 
from 
  khach_hang kh 
  join loai_khach lk 
  join hop_dong hd 
  join dich_vu dv 
  join dich_vu_di_kem dv_dk 
  join hop_dong_chi_tiet hd_ct on lk.ma_loai_khach = kh.ma_loai_khach 
  and hd.ma_khach_hang = kh.ma_khach_hang 
  and dv.ma_dich_vu = hd.ma_dich_vu 
  and dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem 
  and hd_ct.ma_hop_dong = hd.ma_hop_dong 
order by 
  ma_khach_hang;
