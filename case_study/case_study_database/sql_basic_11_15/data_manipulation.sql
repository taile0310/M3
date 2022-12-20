use furama_management;

-- 11.  Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi 
-- những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  distinct kh.ho_ten, 
  dv_dk.ten_dich_vu_di_kem 
from 
  khach_hang kh 
  join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
  join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem 
where 
  (lk.ten_loai_khach like 'Diamond') 
  and (
    kh.dia_chi like '% Vinh' 
    or '% Quảng Ngãi'
  );
  
-- 12.  Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách 
-- hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
  hd.ma_hop_dong, 
  nv.ho_ten as nhan_vien, 
  kh.ho_ten as khach_hang, 
  kh.so_dien_thoai, 
  dv.ten_dich_vu, 
  hd.tien_dat_coc, 
  sum(hd_ct.so_luong) as so_luong_dich_vu_di_kem 
from 
  hop_dong hd 
  join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien 
  join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong 
where 
  hd.ma_hop_dong in (
    select 
      hd.ma_hop_dong 
    from 
      hop_dong hd 
    where 
      quarter(ngay_lam_hop_dong) = 4 
      and year(ngay_lam_hop_dong) = 2020
  ) 
  and hd.ma_hop_dong not in (
    select 
      hd.ma_hop_dong 
    from 
      hop_dong hd 
    where 
      quarter(ngay_lam_hop_dong) = 1 
      and quarter(ngay_lam_hop_dong) = 2 
      and year(ngay_lam_hop_dong) = 2021
  ) 
group by 
  hd.ma_hop_dong;
  
-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
-- giải thích
-- Mệnh đề HAVING được sử dụng đề lọc dữ liệu dựa trên kết quả trả về của GROUP BY.
select 
  dv_dk.ma_dich_vu_di_kem, 
  dv_dk.ten_dich_vu_di_kem, 
  sum(hd_ct.so_luong) as so_luong 
from 
  dich_vu_di_kem dv_dk 
  join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem 
group by 
  dv_dk.ma_dich_vu_di_kem 
having 
  so_luong = (
    select 
      max(so_luong) 
    from 
      hop_dong_chi_tiet
  ) 
order by 
  so_luong desc;
  
-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
select 
  hd.ma_hop_dong, 
  ldv.ten_loai_dich_vu, 
  dv_dk.ten_dich_vu_di_kem, 
  sum(hd_ct.so_luong) as so_lan_su_dung 
from 
  dich_vu_di_kem dv_dk 
  join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem 
  join hop_dong hd on hd.ma_hop_dong = hd_ct.ma_hop_dong 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
group by 
  dv_dk.ma_dich_vu_di_kem, 
  hd.ma_hop_dong 
having 
  so_lan_su_dung = (
    select 
      min(hd_ct.so_luong) 
    from 
      hop_dong_chi_tiet hd_ct
  );
  
-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien,
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
  nv.ma_nhan_vien, 
  nv.ho_ten, 
  td.ten_trinh_do, 
  bp.ten_bo_phan, 
  nv.so_dien_thoai, 
  nv.dia_chi 
from 
  nhan_vien nv 
  join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do 
  join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan 
  join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien 
where 
  year(ngay_lam_hop_dong) in (2020, 2021) 
group by 
  nv.ma_nhan_vien 
having 
  count(hd.ma_nhan_vien) <= 3 
order by 
  ma_nhan_vien;
