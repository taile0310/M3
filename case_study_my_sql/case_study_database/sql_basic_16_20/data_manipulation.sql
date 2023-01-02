use furama_management;

select 
  * 
from 
  nhan_vien;
select 
  * 
from 
  khach_hang;
select 
  * 
from 
  hop_dong_chi_tiet;
select 
  * 
from 
  dich_vu_di_kem;
select 
  * 
from 
  loai_dich_vu;
select 
  * 
from 
  loai_dich_vu;
  
-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- hiển thị ra danh sách nhân viên chưa từng làm hợp đồng
select 
  nv.ma_nhan_vien 
from 
  nhan_vien nv -- left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where 
  nv.ma_nhan_vien not in (
    select 
      ma_nhan_vien 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) in (2019, 2020, 2021) 
    group by 
      ma_nhan_vien
  );
  
-- xóa nhân viên chưa từng làm hợp đồng
set 
  sql_safe_updates = 0;
delete from 
  nhan_vien nv 
where 
  nv.ma_nhan_vien not in (
    select 
      ma_nhan_vien 
    from 
      hop_dong 
    where 
      year(ngay_lam_hop_dong) in (2019, 2020, 2021) 
    group by 
      ma_nhan_vien
  );
  
-- 17.  Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update 
  khach_hang kh 
set 
  ma_loai_khach = 1 
where 
  kh.ma_khach_hang in (
    select 
      kh_thanh_toan.ma_khach_hang 
    from 
      (
        select 
          dvdk_hdct.ma_khach_hang, 
          dvdk_hdct.ho_ten, 
          sum(
            chi_phi_thue + dvdk_hdct.thanh_toan_dv
          ) as thanh_toan_hd 
        from 
          (
            select 
              kh.ma_khach_hang, 
              kh.ho_ten, 
              lk.ten_loai_khach, 
              dv.chi_phi_thue, 
              sum(hd_ct.so_luong * dv_dk.gia) as thanh_toan_dv 
            from 
              khach_hang kh 
              left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
              left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
              left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
              left join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong 
              left join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem 
            where 
              year(ngay_lam_hop_dong) = 2021 
              and lk.ten_loai_khach = 'Platinium' 
            group by 
              hd.ma_hop_dong
          ) as dvdk_hdct 
        group by 
          dvdk_hdct.ma_khach_hang 
        having 
          thanh_toan_hd > 1000000
      ) as kh_thanh_toan
  );
  
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  hd.ngay_lam_hop_dong 
from 
  khach_hang kh 
  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
where 
  year(ngay_lam_hop_dong) < 2021;
set 
  sql_safe_updates = 0;
delete from 
  khach_hang kh 
where 
  kh.ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(ngay_lam_hop_dong) < 2021
  );
  
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- giải thích
-- hiển thị dịch vụ sử dụng hơn 10 lần
select 
  dv_dk.ma_dich_vu_di_kem, 
  dv_dk.ten_dich_vu_di_kem, 
  sum(so_luong) as so_lan 
from 
  dich_vu_di_kem dv_dk 
  join hop_dong_chi_tiet hd_ct on dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem 
  join hop_dong hd on hd.ma_hop_dong = hd_ct.ma_hop_dong 
where 
  year(ngay_lam_hop_dong) = 2020 
group by 
  ma_dich_vu_di_kem 
having 
  so_lan >= 10;
  
-- cập nhập giá X2 với những dịch vụ sử dụng trên 10 lần
update 
  dich_vu_di_kem dv_dk 
set 
  gia = (gia + gia) 
where 
  dv_dk.ma_dich_vu_di_kem in (
    select 
      hd_ct.ma_dich_vu_di_kem 
    from 
      hop_dong_chi_tiet hd_ct 
      join hop_dong hd on hd.ma_hop_dong = hd_ct.ma_hop_dong 
    where 
      year(ngay_lam_hop_dong) = 2020 
    group by 
      ma_dich_vu_di_kem 
    having 
      sum(so_luong) >= 10
  );
  
-- 20.  Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  nv.ma_nhan_vien as id, 
  nv.ho_ten, 
  nv.email, 
  nv.so_dien_thoai, 
  nv.ngay_sinh, 
  nv.dia_chi 
from 
  nhan_vien nv 
union all 
select 
  kh.ma_khach_hang as id, 
  kh.ho_ten, 
  kh.email, 
  kh.so_dien_thoai, 
  kh.ngay_sinh, 
  kh.dia_chi 
from 
  khach_hang kh;
