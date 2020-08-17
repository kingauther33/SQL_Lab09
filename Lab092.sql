USE master;
GO

ALTER DATABASE Lab092
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE
DROP DATABASE Lab092

CREATE DATABASE Lab092
GO

USE Lab092
GO

CREATE TABLE HangSP (
	MaSoHang int PRIMARY KEY IDENTITY,
	TenHang nvarchar(50),
	DiaChi nvarchar(50),
	SoDT nvarchar(50),
	CONSTRAINT chk_SoDT CHECK (SoDT LIKE '[0]%[0-9]%')
)
GO

CREATE TABLE DanhSachSP (
	MaSP int PRIMARY KEY IDENTITY(100,10),
	TenSP nvarchar(50),
	MaSoHang int,
	MoTa nvarchar(50),
	DonVi nvarchar(10),
	Gia int,
	SoLuongTrongKho int,
	CONSTRAINT fk_MaSoHang FOREIGN KEY (MaSoHang) REFERENCES dbo.HangSP(MaSoHang),
	CONSTRAINT chk_Gia CHECK (Gia > 0)
)
GO

INSERT INTO dbo.HangSP VALUES
	('Sony', '10 Hang Cot', '0900139400'),
	('SamSung', '10 Hang Tre', '0900139411'),
	('ASUS', '10 Hang Dau', '0934534411'),
	('OPPO', '10 Hang Ma', '0903239411');

INSERT INTO dbo.DanhSachSP VALUES
	('May In Samsung450', 2, 'May in dang e', 'Chiec', 3500, 15),
	('Dien thoai Sony Xperia 5', 1, 'Dien thoai thong minh hot nhat hien nay', 'Chiec', 17000, 100),
	('May In Samsung450', 2, 'May in dang e', 'Chiec', 400, 20),
	('Dien Thoai OPPO A37F', 4, 'Dien thoai Son Tung', 'Chiec', 4000, 30),
	('ASUS Zenbook Pro DUO UX581GV', 3, 'Asus laptop 15.6inch', 'Chiec', 75000, 50);

SELECT * FROM dbo.DanhSachSP dss
SELECT * FROM dbo.HangSP hs

-- Danh sach alphabet nguoc
SELECT * FROM dbo.DanhSachSP dss
	ORDER BY dss.TenSP DESC

-- Danh sach theo thu tu gia giam dan
SELECT * FROM dbo.DanhSachSP dss
	ORDER BY dss.Gia DESC

-- Thong tin hang ASUS
SELECT * FROM dbo.HangSP hs
	WHERE hs.TenHang = 'ASUS'

-- San pham it hon 25 chiec
SELECT * FROM dbo.DanhSachSP dss
	WHERE dss.SoLuongTrongKho <= 25

-- San pham hang ASUS
SELECT hs.TenHang, dss.TenSP, dss.MoTa, dss.Gia FROM dbo.DanhSachSP dss
	INNER JOIN dbo.HangSP hs ON dss.MaSoHang = hs.MaSoHang
	WHERE hs.TenHang = 'ASUS'

-- Dem so hang
SELECT COUNT(MaSoHang) AS SoLuongHang FROM dbo.HangSP hs

-- So mat hang cua hang ban
SELECT COUNT(dss.TenSP) AS SoSPCuaHangBan FROM dbo.DanhSachSP dss

-- Tong So San Pham Moi loai
SELECT dss.TenSP, SUM(dss.SoLuongTrongKho) AS TongSoSanPhamTrongKho FROM dbo.DanhSachSP dss
	GROUP BY dss.TenSP

-- Tao index
DROP VIEW IF EXISTS View_TenHang_Mota
CREATE VIEW View_TenHang_Mota
AS
	SELECT dss.TenSP, dss.MoTa FROM dbo.DanhSachSP dss
SELECT * FROM dbo.View_TenHang_Mota vthm

DROP VIEW IF EXISTS View_SanPham
CREATE VIEW View_SanPham
AS
	SELECT dss.MaSP, dss.TenSP, dss.Gia  FROM dbo.DanhSachSP dss
SELECT * FROM dbo.View_SanPham vsp

DROP VIEW IF EXISTS View_SanPham_Hang
CREATE VIEW View_SanPham_Hang
AS
	SELECT dss.MaSP, dss.TenSP, hs.TenHang FROM dbo.DanhSachSP dss
		INNER JOIN dbo.HangSP hs ON dss.MaSoHang = hs.MaSoHang
SELECT * FROM dbo.View_SanPham_Hang vsph
