USE master;
GO

ALTER DATABASE Lab091
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE
DROP DATABASE Lab091

CREATE DATABASE Lab091
GO

USE Lab091
GO

CREATE TABLE KhachHang (
	MaKH int PRIMARY KEY IDENTITY,
	TenKH nvarchar(50),
	DiaChi nvarchar(50),
	SoDT varchar(10),
	CONSTRAINT chk_SoDT CHECK (SoDT LIKE '%[0-9]%')
)
GO

CREATE TABLE DanhSachSanPham (
	MaSP int PRIMARY KEY IDENTITY(100,1),
	TenSP nvarchar(50),
	MoTaSP nvarchar(50),
	GiaSP money,
	-- Gia tai thoi diem hien tai
	SoLuongSP int,
	-- So luong SP trong kho
	CONSTRAINT chk_GiaSPKho CHECK (GiaSP > 0)
)
GO

CREATE TABLE DonHang (
	MaDH int PRIMARY KEY IDENTITY(1010,10),
	MaKH int,
	NgayDat date,
	TrangThaiDH bit,
	CONSTRAINT fk_MaKH FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH),
	CONSTRAINT chk_NgatDat CHECK (NgayDat <= CAST( GETDATE() AS DATE ))
)
GO

CREATE TABLE DonDHChiTiet (
	MaDH int,
	MaSP int,
	SoLuongMua int,
	GiaSP money,
	CONSTRAINT fk_maDH FOREIGN KEY (MaDH) REFERENCES dbo.DonHang(MaDH),
	CONSTRAINT fk_maSP FOREIGN KEY (MaSP) REFERENCES dbo.DanhSachSanPham(MaSP),
	CONSTRAINT chk_GiaSPCTiet CHECK (GiaSP > 0)
)
GO

INSERT INTO dbo.KhachHang
(
    --MaKH - column value is auto-generated
    TenKH,
    DiaChi,
    SoDT
)
VALUES
(
    -- MaKH - int
    N'Nguyen Thi Thu Trang', -- TenKH - nvarchar
    N'100 Hang Mam', -- DiaChi - nvarchar
    '0945521139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Doan Van Nam', -- TenKH - nvarchar
    N'100 Hang Dau', -- DiaChi - nvarchar
    '0945524139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Dinh Van Dung', -- TenKH - nvarchar
    N'100 Hang Thung', -- DiaChi - nvarchar
    '0945991139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Doan Thi Thu', -- TenKH - nvarchar
    N'100 Hang Than', -- DiaChi - nvarchar
    '0945528573' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Doan Chi Binh', -- TenKH - nvarchar
    N'100 Hang Muoi', -- DiaChi - nvarchar
    '0945513249' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Doan Thu Trang', -- TenKH - nvarchar
    N'100 Hang Khoai', -- DiaChi - nvarchar
    '0945529848' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Tran Quang Khai', -- TenKH - nvarchar
    N'100 Hang Luoc', -- DiaChi - nvarchar
    '0949931139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Tran Duc Anh', -- TenKH - nvarchar
    N'100 Hang Voi', -- DiaChi - nvarchar
    '0949873139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Nguyen Ba Vinh', -- TenKH - nvarchar
    N'100 Hang Cot', -- DiaChi - nvarchar
    '0949293139' -- SoDT - bigint
),

(
    -- MaKH - int
    N'Nguyen Ba The', -- TenKH - nvarchar
    N'100 Hang Ma', -- DiaChi - nvarchar
    '0949223139' -- SoDT - bigint
)

SELECT * FROM dbo.KhachHang kh

INSERT INTO dbo.DanhSachSanPham
(
    --MaSP - column value is auto-generated
    TenSP,
    MoTaSP,
    GiaSP,
    SoLuongSP
)
VALUES
(
    -- MaSP - int
    N'Dau Goi Clear', -- TenSP - nvarchar
    N'Dau Goi Sach Dau va Da Gau', -- MoTaSP - nvarchar
    100000, -- GiaSP - money
    15 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Sua tam Enchanter', -- TenSP - nvarchar
    N'Sua tam lam da min mang va tuoi khoe', -- MoTaSP - nvarchar
    150000, -- GiaSP - money
    20 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Tui Milo Co Lon', -- TenSP - nvarchar
    N'20 Goi Milo cho co the khoe manh', -- MoTaSP - nvarchar
    200000, -- GiaSP - money
    10 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Chao Dinh Duong', -- TenSP - nvarchar
    N'Chao Dinh Duong cho moi nha', -- MoTaSP - nvarchar
    3000, -- GiaSP - money
    50 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Raid', -- TenSP - nvarchar
    N'Thuoc xit con trung hieu qua 100%', -- MoTaSP - nvarchar
    200000, -- GiaSP - money
    15 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Sua tuoi Ba Vi', -- TenSP - nvarchar
    N'Sua tuoi nguyen chat 100%', -- MoTaSP - nvarchar
    60000, -- GiaSP - money
    20 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Dao cao rau X-MEN', -- TenSP - nvarchar
    N'Dao cao rau cho dan ong thich duc', -- MoTaSP - nvarchar
    5000, -- GiaSP - money
    25 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Kem duong da NIVEA', -- TenSP - nvarchar
    N'Kem duong da cao cap', -- MoTaSP - nvarchar
    400000, -- GiaSP - money
    10 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Kem chong nang Anessa Perfect UV', -- TenSP - nvarchar
    N'Kem chong nang bao ve da khoi tia UV', -- MoTaSP - nvarchar
    300000, -- GiaSP - money
    25 -- SoLuongSP - int
),

(
    -- MaSP - int
    N'Sua rua mat POND', -- TenSP - nvarchar
    N'Sua rua mat cho da mat trang hong rang ro', -- MoTaSP - nvarchar
    350000, -- GiaSP - money
    30 -- SoLuongSP - int
)
SELECT * FROM dbo.DanhSachSanPham dssp

INSERT INTO dbo.DonHang
(
    --MaDH - column value is auto-generated
    MaKH,
    NgayDat,
    TrangThaiDH
)
VALUES
(
    -- MaDH - int
    1, -- MaKH - int
    '2020-03-20', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    2, -- MaKH - int
    '2020-04-10', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    3, -- MaKH - int
    '2020-05-04', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    4, -- MaKH - int
    '2020-08-16', -- NgayDat - date
    0 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    5, -- MaKH - int
    '2020-08-16', -- NgayDat - date
    0 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    6, -- MaKH - int
    '2020-06-20', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    7, -- MaKH - int
    '2020-07-29', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    8, -- MaKH - int
    '2020-06-23', -- NgayDat - date
    1 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    9, -- MaKH - int
    '2020-08-14', -- NgayDat - date
    0 -- TrangThaiDH - binary
),

(
    -- MaDH - int
    10, -- MaKH - int
    '2020-01-23', -- NgayDat - date
    1 -- TrangThaiDH - binary
)

SELECT * FROM dbo.DonHang dh


INSERT INTO dbo.DonDHChiTiet
(
    MaDH,
    MaSP,
    SoLuongMua,
    GiaSP
)
VALUES
(
    1010, -- MaDH - int
    100, -- MaSP - int
    1, -- SoLuongMua - int
    90000 -- GiaSP - money
),

(
    1010, -- MaDH - int
    101, -- MaSP - int
    2, -- SoLuongMua - int
    160000 -- GiaSP - money
),

(
    1020, -- MaDH - int
    109, -- MaSP - int
    3, -- SoLuongMua - int
    400000 -- GiaSP - money
),

(
    1030, -- MaDH - int
    102, -- MaSP - int
    1, -- SoLuongMua - int
    180000 -- GiaSP - money
),

(
    1030, -- MaDH - int
    107, -- MaSP - int
    2, -- SoLuongMua - int
    420000 -- GiaSP - money
),

(
    1030, -- MaDH - int
    105, -- MaSP - int
    5, -- SoLuongMua - int
    50000 -- GiaSP - money
),

(
    1040, -- MaDH - int
    108, -- MaSP - int
    1, -- SoLuongMua - int
    300000 -- GiaSP - money
),

(
    1040, -- MaDH - int
    106, -- MaSP - int
    4, -- SoLuongMua - int
    5000 -- GiaSP - money
),

(
    1050, -- MaDH - int
    105, -- MaSP - int
    10, -- SoLuongMua - int
    2500 -- GiaSP - money
),

(
    1050, -- MaDH - int
    105, -- MaSP - int
    2, -- SoLuongMua - int
    50000 -- GiaSP - money
),

(
    1060, -- MaDH - int
    102, -- MaSP - int
    1, -- SoLuongMua - int
    220000 -- GiaSP - money
),

(
    1060, -- MaDH - int
    103, -- MaSP - int
    10, -- SoLuongMua - int
    3000 -- GiaSP - money
),

(
    1070, -- MaDH - int
    109, -- MaSP - int
    1, -- SoLuongMua - int
    400000 -- GiaSP - money
),

(
    1070, -- MaDH - int
    108, -- MaSP - int
    1, -- SoLuongMua - int
    300000 -- GiaSP - money
),

(
    1070, -- MaDH - int
    101, -- MaSP - int
    1, -- SoLuongMua - int
    150000 -- GiaSP - money
),

(
    1080, -- MaDH - int
    101, -- MaSP - int
    1, -- SoLuongMua - int
    150000 -- GiaSP - money
),

(
    1080, -- MaDH - int
    100, -- MaSP - int
    1, -- SoLuongMua - int
    100000 -- GiaSP - money
),

(
    1090, -- MaDH - int
    105, -- MaSP - int
    2, -- SoLuongMua - int
    60000 -- GiaSP - money
),

(
    1090, -- MaDH - int
    106, -- MaSP - int
    10, -- SoLuongMua - int
    5000 -- GiaSP - money
),

(
    1100, -- MaDH - int
    108, -- MaSP - int
    1, -- SoLuongMua - int
    300000 -- GiaSP - money
),

(
    
	1100, -- MaDH - int
    104, -- MaSP - int
    1, -- SoLuongMua - int
    200000 -- GiaSP - money
)

SELECT * FROM dbo.DonDHChiTiet ddt

-- Liet ke khach hang da mua hang
SELECT * FROM dbo.KhachHang kh
	INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
	WHERE dh.TrangThaiDH = 1
	-- 1 la da tra tien, 0 la chua tra tien ( moi dat hang gan day)

-- Liet ke danh sach san pham
SELECT * FROM dbo.DanhSachSanPham dssp

-- Liet ke danh sach don dat hang
SELECT * FROM dbo.DonHang dh

-- Liet ke khach hang theo thu tu ALPHABET
SELECT * FROM dbo.KhachHang kh
	ORDER BY kh.TenKH ASC

-- Liet ke danh sach khach hang
SELECT * FROM dbo.DanhSachSanPham dssp
	ORDER BY dssp.GiaSP DESC

-- Liet ke danh sach cac san pham ma khach hang Nguyen Thi Thu Trang da mua
SELECT dh.MaDH, kh.TenKH, dssp.TenSP, dssp.GiaSP, ddt.SoLuongMua, dssp.GiaSP * ddt.SoLuongMua AS [TongTienCacSP] FROM dbo.KhachHang kh
	INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
	INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
	INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP
	WHERE kh.TenKH = 'Nguyen Thi Thu Trang' AND dh.TrangThaiDH = 1

-- So Khach hang da mua o cua hang
SELECT COUNT(kh.TenKH) AS [TongKhachDaMuaHang] FROM dbo.KhachHang kh
	INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
	INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
	INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP
	WHERE dh.TrangThaiDH = 1

-- So mat hang ma cua hang ban
SELECT COUNT(dssp.MaSP) AS [SoMatHangCuaCuaHang] FROM dbo.DanhSachSanPham dssp

-- Tong Tien Tung Don Hang
SELECT dh.MaDH, kh.TenKH, SUM(dssp.GiaSP * ddt.SoLuongMua) AS [TongTienCanThanhToan] FROM dbo.KhachHang kh
	INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
	INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
	INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP
	GROUP BY dh.MaDH, kh.TenKH

-- Tao index
CREATE VIEW TenHangVaNguoiDat
AS
	SELECT dssp.TenSP, kh.TenKH FROM dbo.KhachHang kh
		INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
		INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
		INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP
SELECT * FROM dbo.TenHangVaNguoiDat thvnd

DROP VIEW IF EXISTS View_KhachHang
CREATE VIEW View_KhachHang
AS
	SELECT DISTINCT kh.TenKH, kh.DiaChi, kh.SoDT FROM dbo.KhachHang kh
		INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
		INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
		INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP

SELECT * FROM dbo.View_KhachHang vkh

CREATE VIEW View_KhachHang_SanPham
AS
	SELECT kh.TenKH, kh.SoDT, dssp.TenSP, ddt.SoLuongMua, dh.NgayDat FROM dbo.KhachHang kh
		INNER JOIN dbo.DonHang dh ON kh.MaKH = dh.MaKH
		INNER JOIN dbo.DonDHChiTiet ddt ON dh.MaDH = ddt.MaDH
		INNER JOIN dbo.DanhSachSanPham dssp ON ddt.MaSP = dssp.MaSP 
SELECT * FROM dbo.View_KhachHang_SanPham vkhsp

SELECT * FROM dbo.DanhSachSanPham dssp
SELECT * FROM dbo.DonDHChiTiet ddt
SELECT * FROM dbo.DonHang dh
SELECT * FROM dbo.KhachHang kh