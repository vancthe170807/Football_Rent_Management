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
		-- 3.1. Nhập dữ liệu về bảng Thông tin sân bóng
		insert into FieldInfo (FieldCode, FieldName, FieldType, RentPrice, [image]) values
		('SAN501', N'Sân 5 1', 5, 150000, 'image/501.jpg'),
		('SAN502', N'Sân 5 2', 5, 150000, 'image/502.jpg'),
		('SAN503', N'Sân 5 3', 5, 150000, 'image/503.jpg'),
		('SAN701', N'Sân 7 1', 7, 200000, 'image/701.jpg'),
		('SAN702', N'Sân 7 2', 7, 200000, 'image/702.jpg'),
		('SAN111', N'Sân 11', 11, 500000, 'image/111.jpg')

	-- 4. Tạo bảng Thông tin dụng cụ cho thuê
	create table EquipmentInfo (
		EquipmentCode varchar(6) primary key, -- Mã dụng cụ
		EquipmentName nvarchar(50), -- Tên dụng cụ
		RentPrice int, -- Giá thuê dụng cụ trong 1 giờ, ví dụ: 200000đ/h, 500000đ/h
		[Description] text,
		[image] varchar(255) -- Ảnh chi tiết sân
	)

		-- 4.1. Nhập dữ liệu Thông tin dụng cụ cho thuê
		insert into EquipmentInfo (EquipmentCode, EquipmentName, RentPrice, [image]) values
		('PIT01R', N'Áo Pitch - Đỏ - S', 20000, 'image/Equipment/PITR.jpg'),
		('PIT02R', N'Áo Pitch - Đỏ - M', 21000, 'image/Equipment/PITR.jpg'),
		('PIT03R', N'Áo Pitch - Đỏ - L', 22000, 'image/Equipment/PITR.jpg'),
		('PIT04R', N'Áo Pitch - Đỏ - XL', 23000, 'image/Equipment/PITR.jpg'),
		('PIT05R', N'Áo Pitch - Đỏ - XXL', 24000, 'image/Equipment/PITR.jpg'),
		('PIT01G', N'Áo Pitch - Xanh lá - S', 20000, 'image/Equipment/PITG.jpg'),
		('PIT02G', N'Áo Pitch - Xanh lá - M', 21000, 'image/Equipment/PITG.jpg'),
		('PIT03G', N'Áo Pitch - Xanh lá - L', 22000, 'image/Equipment/PITG.jpg'),
		('PIT04G', N'Áo Pitch - Xanh lá - XL', 23000, 'image/Equipment/PITG.jpg'),
		('PIT05G', N'Áo Pitch - Xanh lá - XXL', 24000, 'image/Equipment/PITG.jpg'),
		('PIT01Y', N'Áo Pitch - Vàng - S', 20000, 'image/Equipment/PITY.jpg'),
		('PIT02Y', N'Áo Pitch - Vàng - M', 21000, 'image/Equipment/PITY.jpg'),
		('PIT03Y', N'Áo Pitch - Vàng - L', 22000, 'image/Equipment/PITY.jpg'),
		('PIT04Y', N'Áo Pitch - Vàng - XL', 23000, 'image/Equipment/PITY.jpg'),
		('PIT05Y', N'Áo Pitch - Vàng - XXL', 24000, 'image/Equipment/PITY.jpg'),
		('BAL04A', N'Quả bóng đá - Adidas - 4', 21000, 'image/Equipment/BallAdidas.jpg'),
		('BAL05A', N'Quả bóng đá - Adidas - 5', 27000, 'image/Equipment/BallAdidas.jpg'),
		('BAL04N', N'Quả bóng đá - Nike - 4', 20000, 'image/Equipment/BallNike.jpg'),
		('BAL05N', N'Quả bóng đá - Nike - 5', 25000, 'image/Equipment/BallNike.jpg'),
		('BAL04D', N'Quả bóng đá - Động Lực - 4', 17000, 'image/Equipment/BallDongluc.jpg'),
		('BAL05D', N'Quả bóng đá - Động Lực - 5', 20000, 'image/Equipment/BallDongluc.jpg'),
		('GLO06A', N'Găng tay thủ môn - Adidas - 6', 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO07A', N'Găng tay thủ môn - Adidas - 7', 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO08A', N'Găng tay thủ môn - Adidas - 8', 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO09A', N'Găng tay thủ môn - Adidas - 9', 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO10A', N'Găng tay thủ môn - Adidas - 10', 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO06N', N'Găng tay thủ môn - Nike - 6', 20000, 'image/Equipment/GKGloveNike.jpg'),
		('GLO07N', N'Găng tay thủ môn - Nike - 7', 20000, 'image/Equipment/GKGloveNike.jpg'),
		('GLO08N', N'Găng tay thủ môn - Nike - 8', 20000, 'image/Equipment/GKGloveNike.jpg'),
		('GLO09N', N'Găng tay thủ môn - Nike - 9', 20000, 'image/Equipment/GKGloveNike.jpg'),
		('GLO10N', N'Găng tay thủ môn - Nike - 10', 20000, 'image/Equipment/GKGloveNike.jpg')

	-- 5. Tạo bảng thông tin Sản phẩm bán (đồ ăn, thức uống)
	create table Product (
		ProductCode varchar(10) primary key, -- Mã sản phẩm
		ProductName nvarchar(30), -- Tên sản phẩm
		ProductPrice int, -- Đơn giá sản phẩm
		[image] varchar(255) -- Ảnh chi tiết sản phẩm
	)

		-- 5.1. Nhập dữ liệu thông tin Sản phẩm:
		insert into Product (ProductCode, ProductName, ProductPrice, image) values
		('SNACK00001', N'Snack Oishi Tôm vị Cay 45g', 6000, '/image/Product/OishiTomCay45g.jpg'),
		('SNACK00002', N'Snack Oishi Tôm vị Cay ĐB 45g', 6000, '/image/Product/OishiTomCayDB45g.jpg'),
		('SNACK00003', N'Snack Oishi Hành 45g', 6000, '/image/Product/OishiTHanh45g.jpg'),
		('SNACK00004', N'Snack KT O''Star muối 32g', 6000, '/image/Product/KhoaiTayOStarMuoi32g.jpg'),
		('SNACK00005', N'Snack KT O''Star Rong biển 32g', 6000, '/image/Product/KhoaiTayOStarRongBien32g.jpg'),
		('DRINK00001', N'Nước khoáng Aquafina 500ml', 6000, '/image/Product/Aquafina.jpg'),
		('DRINK00002', N'Nước tăng lực Sting NS 330ml', 10000, '/image/Product/StingNhanSam.jpg'),
		('DRINK00003', N'Nước tăng lực Sting Dâu 330ml', 6000, '/image/Product/StingDau.jpg'),
		('DRINK00004', N'Coca-Cola Nguyên bản 330ml Lon', 6000, '/image/Product/Cocacola330mllon.jpg'),
		('DRINK00005', N'Sport Drink Aquarius', 6000, '/image/Product/AquariusThuong.jpg'),
		('DRINK00006', N'Sport Drink Aquarius 0 Calo', 6000, '/image/Product/Aquarius0Calories.jpg')

	-- 6. Tạo bảng thông tin trạng thái đặt thuê sân, dụng cụ
	create table [Status] (
		[Status] varchar(7) primary key -- Waiting, Cancel, Success
	)

		-- 6.1. Nhập dữ liệu thông tin trạng thái đặt thuê sân, dụng cụ
		insert into [Status] ([Status]) values ('Pending'), ('Cancel'), ('Success')

	-- 7. Tạo bảng thông tin Order
	CREATE TABLE Orders (
		InvoiceID INT IDENTITY(1,1) PRIMARY KEY, -- Mã hoá đơn
		phone VARCHAR(15) NOT NULL references [User](phone), -- Số điện thoại người order
		BookingDate DATETIME NOT NULL, -- Ngày đặt
		TotalCost DECIMAL(10, 2) NOT NULL, -- Tổng giá tiền
		[Status] VARCHAR(7) NOT NULL DEFAULT 'Pending' references [Status]([Status]) -- Trạng thái đặt đơn
	);

	-- 8. Tạo bảng thông tin đặt thuê sân
	create table FieldBookingRent (
		FieldRentID INT IDENTITY(1,1) PRIMARY KEY, -- Mã thuê sân
		InvoiceID int references Orders(InvoiceID), -- Mã hoá đơn (quan hệ với Order)
		FieldCode varchar(6) references FieldInfo(FieldCode), -- Mã sân
		StartTime datetime not null, -- Giờ bắt đầu thuê
		EndTime datetime not null, -- Giờ kết thúc
		FieldCost int -- Phí thuê sân: FieldCost = RentPrice * (EndTime - StartTime)
	)

	-- 9. Tạo bảng thông tin đặt thuê dụng cụ
	create table EquipmentBookingRent (
		EquipmentRentID int primary key, -- Mã thuê dụng cụ
		InvoiceID int references Orders(InvoiceID), -- Mã hoá đơn liên kết
		StartTime datetime not null, -- Giờ bắt đầu thuê
		EndTime datetime not null, -- Giờ kết thúc
		TotalEquipmentCost int -- Phí thuê dụng cụ: TotalEquipmentCost = RentPrice * (EndTime - StartTime) * Qualtity
	)

	-- 10. Tạo bảng thông tin chi tiết cho thuê dụng cụ
	CREATE TABLE EquipmentBookingDetails (
		DetailEquipmentRentID INT IDENTITY(1,1) PRIMARY KEY, -- Mã dụng cụ cho thuê chi tiết
		EquipmentRentID INT NOT NULL references EquipmentBookingRent(EquipmentRentID), -- Mã thuê dụng cụ
		EquipmentCode VARCHAR(6) NOT NULL references EquipmentInfo(EquipmentCode), -- Mã dụng cụ
		Quantity INT NOT NULL, -- Số lượng dụng cụ
		CostPerUnit DECIMAL(10, 2) NOT NULL, -- Đơn giá
		TotalCost AS (Quantity * CostPerUnit) PERSISTED -- Thành tiền
	);

	-- 11. Tạo bảng thông tin mua sản phẩm (đồ ăn, thức uống)
	create table BuyingProduct (
		BuyingProductID int primary key, -- Mã đơn mua
		InvoiceID int references Orders(InvoiceID), -- Mã hoá đơn liên kết
		TotalBuyingProductCost int -- Phí thuê dụng cụ: TotalBuyingProductCost = BuyingPrice * Qualtity
	)
	
	-- 12. Tạo bảng thông tin chi tiết cho thuê dụng cụ
	CREATE TABLE BuyingProductDetails (
		DetailBuyingProductID INT IDENTITY(1,1) PRIMARY KEY, -- Mã sản phẩm mua
		BuyingProductID INT NOT NULL references BuyingProduct(BuyingProductID), -- Mã thuê dụng cụ
		ProductCode VARCHAR(10) NOT NULL references Product(ProductCode), -- Mã dụng cụ
		Quantity INT NOT NULL, -- Số lượng dụng cụ
		CostPerUnit DECIMAL(10, 2) NOT NULL, -- Đơn giá
		TotalCost AS (Quantity * CostPerUnit) PERSISTED -- Thành tiền
	);


