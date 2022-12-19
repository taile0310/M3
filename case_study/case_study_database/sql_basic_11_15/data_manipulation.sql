use furama_management;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select distinct kh.ho_ten, dv_dk.ten_dich_vu_di_kem from khach_hang kh
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem
where (lk.ten_loai_khach like 'Diamond')
and (kh.dia_chi like '% Vinh' or '% Quảng Ngãi');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_ten as nhan_vien, kh.ho_ten as khach_hang, kh.so_dien_thoai, dv.ten_dich_vu, hd.tien_dat_coc,
sum(hd_ct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong
where hd.ma_hop_dong in(select hd.ngay_lam_hop_dong from hop_dong hd where hd.ngay_lam_hop_dong between '2020/10/31' and '2020/12/31')
or hd.ma_hop_dong not in (select hd.ngay_lam_hop_dong from hop_dong hd where hd.ngay_lam_hop_dong between '2021/01/01' and '2021/06/30')
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
-- giải thích
-- dùng LIMIT giới hạn kết quả, thường thì nó nằm ở cuối cùng
select dv_dk.ma_dich_vu_di_kem, dv_dk.ten_dich_vu_di_kem,
sum(hd_ct.so_luong) as so_luong
from dich_vu_di_kem dv_dk
join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem
group by dv_dk.ma_dich_vu_di_kem
order by so_luong desc
limit 2;

