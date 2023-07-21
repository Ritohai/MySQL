CREATE DATABASE qlbh;
use qlbh;

CREATE TABLE khachhang(
MaKH varchar(4) primary key,
tenKH nvarchar(30),
Diachi varchar(50) not null,
ngaysinh datetime not null,
sodt varchar(15) not null unique
);

CREATE TABLE nhanvien(
MaNV varchar(4) primary key,
Hoten varchar(30),
Gioitinh bit,
Diachi varchar(50),
Ngaysinh datetime,
Dienthoai varchar(15) not null,
Email text not null,
Noisinh varchar(20),
Ngayvaolam date not null,
MaNQL varchar(4) not null
);

CREATE TABLE nhacungcap(
MaNCC varchar(5) primary key,
TenNCC varchar(50),
Diachi varchar(50),
Dienthoai varchar(15) not null unique,
Email varchar(30),
Website varchar(30) not null
);

CREATE TABLE loaiSP(
MaloaiSP varchar(4) primary key,
TenloaiSP varchar(30),
Ghichu varchar(100)
);

CREATE TABLE sanpham(
MaSP varchar(4)  primary key,
MaloaiSP varchar(4),
TenSP varchar(50),
Donvitinh varchar(10),
Ghichu varchar(100) not null,
foreign key (MaloaiSP) references LoaiSP(MaloaiSP)
);

CREATE TABLE phieunhap(
SOPN varchar(5) primary key,
MaNV varchar(4),
MaNCC varchar(5),
Ngaynhap datetime default now(),
Ghichu varchar(100) not null,
foreign key (MaNCC) references nhacungcap(MaNCC),
foreign key (MaNV) references nhanvien(MaNV)
);

CREATE TABLE CTPHIeunhap(
MaSP varchar(4),
SoPN varchar(5),
Soluong smallint,
gianhap real default 0,
foreign key (SoPN) references phieunhap(SoPN),
foreign key (MaSP) references sanpham(MaSP)
);

CREATE TABLE phieuxuat(
SoPX varchar(5) primary key,
MaNV varchar(4),
MaKH varchar(4),
Ngayban datetime default  now(),
ghichu text not null,
foreign key (MaKH) references khachhang(MaKH),
foreign key (MaNV) references nhanvien(MaNV)
);

CREATE TABLE CTPHIEUXUAT(
SoPX varchar(5),
MaSP varchar(4),
SOluong smallint ,
giaban real ,
foreign key (SoPX) references phieuxuat(SoPX),
foreign key (MaSP) references sanpham(MaSP)
);
 
 
 INSERT INTO nhanvien (manv, hoten, gioitinh, diachi, ngaysinh, dienthoai, email, noisinh, ngayvaolam, manql)
VALUES
  ('NV01', 'Nguyen Van A', 1, '123 Nguyen Hue, TP.HCM', '1990-01-15', '0901234567', 'nv.a@example.com', 'TP.HCM', '2020-01-01 08:00:00', "NV01"),
  ('NV02', 'Tran Thi B', 0, '456 Le Loi, TP.HCM', '1995-05-20', '0912345678', 'tt.b@example.com', 'TP.HCM', '2021-03-15 09:30:00', 'NV02'),
  ('NV03', 'Pham Van C', 1, '789 Vo Van Tan, TP.HCM', '1988-11-02', '0987654321', 'pv.c@example.com', 'TP.HCM', '2019-10-10 07:45:00', 'NV02');
INSERT INTO khachhang (makh, tenkh, diachi, ngaysinh, sodt)
VALUES
  ('KH01', 'Nguyen Thi D', '101 Nguyen Trai, TP.HCM', '1985-12-25', '0978123456'),
  ('KH02', 'Tran Van E', '202 Le Lai, TP.HCM', '1992-08-10', '0987123456'),
  ('KH03', 'Le Thi F', '303 Vo Van Tan, TP.HCM', '1989-06-18', '0918123456');
INSERT INTO nhacungcap (mancc, tenncc, diachi, dienthoai, email, website)
VALUES
  ('NCC01', 'Cong ty A', '15 Le Duan, TP.HCM', '0909123456', 'info@ncc-a.com', 'www.ncc-a.com'),
  ('NCC02', 'Cong ty B', '25 Nguyen Thi Minh Khai, TP.HCM', '0918234567', 'info@ncc-b.com', 'www.ncc-b.com'),
  ('NCC03', 'Cong ty C', '35 Tran Hung Dao, TP.HCM', '0987654321', 'info@ncc-c.com', 'www.ncc-c.com');
INSERT INTO loaisp (maloaisp, tenloaisp, ghichu)
VALUES
  ('LSP1', 'Điện thoại di động', 'Các sản phẩm điện thoại di động'),
  ('LSP2', 'Laptop', 'Các sản phẩm laptop'),
  ('LSP3', 'Phụ kiện điện tử', 'Các phụ kiện điện tử');
INSERT INTO sanpham (masp, maloaisp, tensp, donvitinh, ghichu)
VALUES
  ('SP01', 'LSP1', 'iPhone 12', 'cái', 'Màu đen, bộ nhớ 128GB'),
  ('SP02', 'LSP1', 'Samsung Galaxy S21', 'cái', 'Màu xanh, bộ nhớ 256GB'),
  ('SP03', 'LSP2', 'Dell XPS 13', 'cái', 'Core i7, RAM 16GB');
INSERT INTO phieunhap (sopn, manv, mancc, ngaynhap, ghichu)
VALUES
  ('PN01', 'NV01', 'NCC01', '2023-07-10 10:30:00', 'Phiếu nhập số 1'),
  ('PN02', 'NV02', 'NCC02', '2023-07-15 15:45:00', 'Phiếu nhập số 2'),
  ('PN03', 'NV03', 'NCC03', '2023-07-20 09:00:00', 'Phiếu nhập số 3');
INSERT INTO ctphieunhap (masp, sopn, soluong, gianhap)
VALUES
  ('SP01', 'PN01', 50, 15000000),
  ('SP02', 'PN01', 30, 13000000),
  ('SP03', 'PN02', 20, 18000000),
  ('SP01', 'PN03', 40, 14500000);
INSERT INTO phieuxuat (sopx, manv, makh, ngayban, ghichu)
VALUES
  ('PX01', 'NV01', 'KH01', '2023-08-12 14:30:00', 'Phiếu xuất số 1'),
  ('PX02', 'NV02', 'KH02', '2023-08-18 10:15:00', 'Phiếu xuất số 2'),
  ('PX03', 'NV03', 'KH03', '2023-08-20 16:00:00', 'Phiếu xuất số 3');
INSERT INTO ctphieuxuat (sopx, masp, soluong, giaban)
VALUES
  ('PX01', 'SP01', 10, 20000000),
  ('PX01', 'SP02', 20, 18000000),
  ('PX02', 'SP03', 5, 22000000),
  ('PX03', 'SP01', 15, 19500000);

-- drop database qlbh;