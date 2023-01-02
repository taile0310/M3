create database erd_to_relational_model;

use erd_to_relational_model;

create table phieu_xuat(
  so_phieu_xuat int primary key, ngay_xuat date, 
  don_gia_xuat double, so_luong_xuat int
);

create table vat_tu(
  ma_vat_tu int primary key, 
  ten_vat_tu varchar(50)
);

create table phieu_nhap(
  so_phieu_nhap int primary key, ngay_nhap date
);

create table don_dat_hang(
  so_don_hang int primary key, 
  ngay_dat_hang date, 
  ma_so_nha_cung_cap int, 
  foreign key(ma_so_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table nha_cung_cap(
  ma_nha_cung_cap int primary key, 
  ten_nha_cung_cap varchar(50), 
  dia_chi varchar(50)
);

create table so_dien_thoai(
  ma_so_nha_cung_cap int, 
  sdt_nha_cung_cap varchar(10), 
  foreign key(ma_so_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_hang_vat_tu(
  ma_so_vat_tu int, 
  ma_so_don_hang int, 
  ngay_mua_hang date, 
  thoi_gian_giao_hang datetime, 
  primary key(ma_so_vat_tu, ma_so_don_hang), 
  foreign key(ma_so_vat_tu) references vat_tu(ma_vat_tu), 
  foreign key(ma_so_don_hang) references don_dat_hang(so_don_hang)
);

create table phieu_xuat_vat_tu(
  ma_so_phieu_xuat int, 
  ma_so_vat_tu int, 
  don_gia_xuat double, 
  so_luong_xuat int, 
  primary key(ma_so_phieu_xuat, ma_so_vat_tu), 
  foreign key(ma_so_phieu_xuat) references phieu_xuat(so_phieu_xuat), 
  foreign key(ma_so_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap_vat_tu(
  ma_so_vat_tu int, 
  ma_so_phieu_nhap int, 
  don_gia_nhap double, 
  so_luong_nhap int, 
  primary key(ma_so_vat_tu, ma_so_phieu_nhap), 
  foreign key(ma_so_vat_tu) references vat_tu(ma_vat_tu), 
  foreign key(ma_so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);
