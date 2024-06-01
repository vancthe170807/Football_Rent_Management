-- SQL DATABASE PRJ301

-- I. Tạo Database:
create database FootballRentManagement

-- II. Tạo các bảng
	-- 1. Tạo bảng phân quyền
	create table [RoleUser] (
		rolecode varchar(3) primary key,
		rolename nvarchar(13)
	)

		-- 1.1. Nhập dữ liệu vào bảng phân quyền
		insert into [RoleUser] (rolecode, rolename) values
		('ADM', N'Quản trị viên'),
		('EMP', N'Nhân viên'),
		('CUS', N'Khách hàng')

	-- 2. Tạo bảng User
	create table [User] (
		fullname nvarchar(30) not null,
		phone varchar(15) primary key,
		email varchar(30) unique,
		[password] varchar(20),
		rolecode varchar(3) NOT NULL DEFAULT 'CUS' REFERENCES RoleUser(rolecode)
	)

		-- 2.1. Nhập dữ liệu về bảng User (tạo 1 số quyền cho 1 số ng nhất định)
		insert into [User] (fullname, phone, email, [password], rolecode) values
		(N'Quản trị viên', '0976812898', 'chuthevan450@gmail.com', '12345678', 'ADM'),
		(N'Bùi Văn Nguyện', '0334567890', 'nguyenbvhe176674@fpt.edu.vn', '12345678', 'EMP'),
		(N'Vũ Quang Mạnh', '0345678901', 'manhvqhe173160@fpt.edu.vn', '12345678', 'EMP')

		-- 2.2. Nhập dữ liệu về bảng User (Không nhập quyền, chỉ dành cho khách hàng)
		insert into [User] (fullname, phone, email, [password]) values
		(N'Chu Thế Văn', '0399349064', 'chuthevan1281@gmail.com', '12345678'),
		(N'Nguyễn Quang Nghĩa', '0356789012', 'nghianqhe180458@fpt.edu.vn', '12345678'),
		(N'Nguyễn Khang Linh', '0367890123', 'linhnkhe182413@fpt.edu.vn', '12345678')

	-- 3. Tạo bảng Thông tin sân bóng
	create table FieldInfo (
		FieldCode varchar(6) primary key, -- Mã sân
		FieldName nvarchar(8), -- Tên sân, ví dụ: Sân 5 1, Sân 7 2, Sân 11 1, ...
		FieldType int, -- Loại sân, ví dụ: 5, 7, 11
		RentPrice int, -- Giá thuê sân trong 1 giờ, ví dụ: 200000đ/h, 500000đ/h
		[image] varchar(255) -- Ảnh chi tiết sân
	)