use furama_management;

-- 6. Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
-- giải thích 
-- NOT IN kiểm tra không nằm trong tập giá trị
select 
  distinct dv.ma_dich_vu, 
  dv.ten_dich_vu, 
  dv.dien_tich, 
  dv.chi_phi_thue, 
  ldv.ten_loai_dich_vu 
from 
  dich_vu dv 
  join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
  join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
where 
  dv.ma_dich_vu not in (
    select 
      hd.ma_dich_vu 
    from 
      hop_dong hd 
    where 
      ngay_lam_hop_dong between '2021/01/01' 
      and '2021/03/31'
  );
  
-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
select 
  distinct dv.ma_dich_vu, 
  dv.ten_dich_vu, 
  dv.dien_tich, 
  dv.so_nguoi_toi_da, 
  dv.chi_phi_thue, 
  ldv.ten_loai_dich_vu 
from 
  dich_vu dv 
  join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu 
  join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
where 
  dv.ma_dich_vu in (
    select 
      hd.ma_dich_vu 
    from 
      hop_dong hd 
    where 
      ngay_lam_hop_dong between '2020/01/01' 
      and '2020/12/31'
  ) 
  and dv.ma_dich_vu not in (
    select 
      hd.ma_dich_vu 
    from 
      hop_dong hd 
    where 
      ngay_lam_hop_dong between '2021/01/01' 
      and '2021/12/31'
  );
  
-- 8.  Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1: dùng DISTINCT dùng để loại bỏ các đối tượng trùng lặp
select 
  distinct kh.ho_ten 
from 
  khach_hang kh;
  
-- cách 2: dùng GROUP BY vè mặt chức năng tương tự như DISTINCT
select 
  kh.ho_ten 
from 
  khach_hang kh 
group by 
  kh.ho_ten;
  
-- cách 3 dùng UNION dùng để kết hợp nhiều câu lệnh SELECT và lấy ra giá trị khác nhau
select 
  kh.ho_ten 
from 
  khach_hang kh 
union 
select 
  kh.ho_ten 
from 
  khach_hang kh;
  
-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
-- giải thích
-- dùng MONTH() đê truy xuất tới tháng trong tập giá trị
select 
  month(hd.ngay_lam_hop_dong) as thang, 
  count(hd.ma_khach_hang) as so_luong_khach_dat_phong 
from 
  hop_dong hd 
group by 
  month(hd.ngay_lam_hop_dong) 
order by 
  thang;
  
-- 10.  Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select 
  hd.ma_hop_dong, 
  hd.ngay_lam_hop_dong, 
  hd.ngay_ket_thuc, 
  hd.tien_dat_coc, 
  sum(hd_ct.so_luong) as so_luong_dich_vu_di_kem 
from 
  hop_dong hd 
  join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong 
group by 
  hd.ma_hop_dong 
order by 
  hd.ma_hop_dong;
