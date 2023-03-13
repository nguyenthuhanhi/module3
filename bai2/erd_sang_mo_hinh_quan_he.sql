create database erd;
use erd;

create table phieu_xuat(
	so_px int primary key,
    ngay_xuat date
);
create table vat_tu(
	ma_vattu int primary key,
    ten_vattu varchar(50)
);
create table phieu_nhap(
	so_pn int primary key,
    ngay_nhap date
);
create table don_dh(
	so_dh int primary key,
    ngay_dh date
);
create table nha_cc(
	ma_ncc int primary key,
    ten_ncc varchar (50),
    dia_chi varchar(50),
    sdt int
);

create table chi_tiet_phieu_xuat(
	dg_nx float,
    sl_xuat int,
    so_px int,
	FOREIGN KEY (so_px)  REFERENCES phieu_xuat(so_px),
    ma_vattu int,
    FOREIGN KEY (ma_vattu)  REFERENCES vat_tu(ma_vattu)
);
create table chi_tiet_phieu_nhap(
   dg_nhap float,
   sl_nhap int,
    ma_vattu int,
	FOREIGN KEY (ma_vattu)  REFERENCES vat_tu(ma_vattu),
    so_pn int,
    foreign key (so_pn)references phieu_nhap(so_pn)
);
create table chi_tiet_don_dat_hang(
	 ma_vattu int,
    FOREIGN KEY (ma_vattu)  REFERENCES vat_tu(ma_vattu),
    so_dh int,
    foreign key (so_dh)references don_dh(so_dh)
);
create table cung_cap(
	ma_ncc int,
    foreign key (ma_ncc)references nha_cc(ma_ncc)
);