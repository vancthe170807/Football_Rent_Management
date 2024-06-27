-- SQL DATABASE PRJ301 - ASSIGNMENT

-- Note: phải bôi đen từng mục 1 rồi mới excute query

-- Lệnh Alter table (dùng để thay đổi cột dữ liệu củ bảng có sẵn: Create, Update dữ liệu, Delete)
alter table Orders ADD TotalAmount int

-- Lệnh Xoá bảng
drop table Orders
-- Update dữ liệu
update EquipmentInfo set image = 'image/Equipment/GKGloveNike.jpeg' where EquipmentCode = 'GLO10N'

/*
Danh sách các bảng:
	1. Quyền người dùng: RoleUser (Adminstrator - Quản trị viên, Employee - Nhân viên, Customer - Khách hàng)
	2. Thông tin người dùng: User
	3. Thông tin sân bóng: FieldInfo
	4. Thông tin dụng cụ cho thuê: EquipmentInfo
	5. Thông tin hàng hoá bán hàng (nước, đồ ăn): Product
	6. Thông tin trạng thái: Status (Pending - Đang chờ, Cancel - Huỷ, Success: Thành công)
	7. Thông tin Đơn đặt thuê: Orders
*/

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
		FieldCode varchar(7) primary key, -- Mã sân
		FieldName nvarchar(8) not null, -- Tên sân, ví dụ: Sân 5 1, Sân 7 2, Sân 11 1, ...
		FieldType int not null, -- Loại sân, ví dụ: 5, 7, 11
		RentPrice int not null, -- Giá thuê sân trong 1 giờ, ví dụ: 200000đ/h, 500000đ/h
		[image] varchar(255), -- Ảnh chi tiết sân
		[Description] text -- Mô tả chi tiết sân
	)

		-- 3.1. Nhập dữ liệu về bảng Thông tin sân bóng
		insert into FieldInfo (FieldCode, FieldName, FieldType, RentPrice, [image]) values
		('SAN501', N'Sân 5 1', 5, 150000, 'image/Field/SAN501.jpg'),
		('SAN502', N'Sân 5 2', 5, 150000, 'image/Field/SAN502.jpg'),
		('SAN503', N'Sân 5 3', 5, 150000, 'image/Field/SAN503.jpg'),
		('SAN701', N'Sân 7 1', 7, 200000, 'image/Field/SAN701.jpg'),
		('SAN702', N'Sân 7 2', 7, 200000, 'image/Field/SAN702.jpg'),
		('SAN1101', N'Sân 11', 11, 500000, 'image/Field/SAN111.jpg')
		select * from EquipmentInfo
	-- 4. Tạo bảng Thông tin dụng cụ cho thuê
	create table EquipmentInfo (
		EquipmentCode varchar(6) primary key, -- Mã dụng cụ
		EquipmentName nvarchar(50), -- Tên dụng cụ
		Quantities int not null,
		RentPrice int, -- Giá thuê dụng cụ trong 1 giờ, ví dụ: 200000đ/h, 500000đ/h
		[Description] text,
		[image] varchar(255) -- Ảnh chi tiết sân
	)
	select * from Product

		-- 4.1. Nhập dữ liệu Thông tin dụng cụ cho thuê
		insert into EquipmentInfo (EquipmentCode, EquipmentName, Quantities RentPrice, [image]) values
		('PIT01R', N'Áo Pitch - Đỏ - S', 10, 20000, 'image/Equipment/PITR.jpg'),
		('PIT02R', N'Áo Pitch - Đỏ - M', 10, 21000, 'image/Equipment/PITR.jpg'),
		('PIT03R', N'Áo Pitch - Đỏ - L', 10, 22000, 'image/Equipment/PITR.jpg'),
		('PIT04R', N'Áo Pitch - Đỏ - XL', 10, 23000, 'image/Equipment/PITR.jpg'),
		('PIT05R', N'Áo Pitch - Đỏ - XXL', 10, 24000, 'image/Equipment/PITR.jpg'),
		('PIT01G', N'Áo Pitch - Xanh lá - S', 10, 20000, 'image/Equipment/PITG.jpg'),
		('PIT02G', N'Áo Pitch - Xanh lá - M', 10, 21000, 'image/Equipment/PITG.jpg'),
		('PIT03G', N'Áo Pitch - Xanh lá - L', 10, 22000, 'image/Equipment/PITG.jpg'),
		('PIT04G', N'Áo Pitch - Xanh lá - XL', 10, 23000, 'image/Equipment/PITG.jpg'),
		('PIT05G', N'Áo Pitch - Xanh lá - XXL', 10, 24000, 'image/Equipment/PITG.jpg'),
		('PIT01Y', N'Áo Pitch - Vàng - S', 10, 20000, 'image/Equipment/PITY.jpg'),
		('PIT02Y', N'Áo Pitch - Vàng - M', 10, 21000, 'image/Equipment/PITY.jpg'),
		('PIT03Y', N'Áo Pitch - Vàng - L', 10, 22000, 'image/Equipment/PITY.jpg'),
		('PIT04Y', N'Áo Pitch - Vàng - XL', 10, 23000, 'image/Equipment/PITY.jpg'),
		('PIT05Y', N'Áo Pitch - Vàng - XXL', 10, 24000, 'image/Equipment/PITY.jpg'),
		('BAL04A', N'Quả bóng đá - Adidas - 4', 10, 21000, 'image/Equipment/BallAdidas.jpeg'),
		('BAL05A', N'Quả bóng đá - Adidas - 5', 10, 27000, 'image/Equipment/BallAdidas.jpeg'),
		('BAL04N', N'Quả bóng đá - Nike - 4', 10, 20000, 'image/Equipment/BallNike.jpg'),
		('BAL05N', N'Quả bóng đá - Nike - 5', 10, 25000, 'image/Equipment/BallNike.jpg'),
		('BAL04D', N'Quả bóng đá - Động Lực - 4', 10, 17000, 'image/Equipment/BallDongluc.jpg'),
		('BAL05D', N'Quả bóng đá - Động Lực - 5', 10, 20000, 'image/Equipment/BallDongluc.jpg'),
		('GLO06A', N'Găng tay thủ môn - Adidas - 6', 10, 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO07A', N'Găng tay thủ môn - Adidas - 7', 10, 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO08A', N'Găng tay thủ môn - Adidas - 8', 10, 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO09A', N'Găng tay thủ môn - Adidas - 9', 10, 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO10A', N'Găng tay thủ môn - Adidas - 10', 10, 20000, 'image/Equipment/GKGloveAdidas.jpg'),
		('GLO06N', N'Găng tay thủ môn - Nike - 6', 10, 20000, 'image/Equipment/GKGloveNike.jpeg'),
		('GLO07N', N'Găng tay thủ môn - Nike - 7', 10, 20000, 'image/Equipment/GKGloveNike.jpeg'),
		('GLO08N', N'Găng tay thủ môn - Nike - 8', 10, 20000, 'image/Equipment/GKGloveNike.jpeg'),
		('GLO09N', N'Găng tay thủ môn - Nike - 9', 10, 20000, 'image/Equipment/GKGloveNike.jpeg'),
		('GLO10N', N'Găng tay thủ môn - Nike - 10', 10, 20000, 'image/Equipment/GKGloveNike.jpeg')

	-- 5. Tạo bảng thông tin Sản phẩm bán (đồ ăn, thức uống)
	create table Product (
		ProductCode varchar(10) primary key, -- Mã sản phẩm
		ProductName nvarchar(30), -- Tên sản phẩm
		Quantities int not null,
		ProductPrice int, -- Đơn giá sản phẩm
		[image] varchar(255) -- Ảnh chi tiết sản phẩm
	)

		-- 5.1. Nhập dữ liệu thông tin Sản phẩm:
		insert into Product (ProductCode, ProductName, Quantities, ProductPrice, image) values
		('SNACK00001', N'Snack Oishi Tôm vị Cay 45g', 100, 6000, 'image/Product/OishiTomCay45g.jpeg'),
		('SNACK00002', N'Snack Oishi Tôm vị Cay ĐB 45g', 100, 6000, 'image/Product/OishiTomCayDB45g.jpeg'),
		('SNACK00003', N'Snack Oishi Hành 45g', 100, 6000, 'image/Product/OishiTHanh45g.png'),
		('SNACK00004', N'Snack KT O''Star muối 32g', 100, 6000, 'image/Product/KhoaiTayOStarMuoi32g.jpg'),
		('SNACK00005', N'Snack KT O''Star Rong biển 32g', 100, 6000, 'image/Product/KhoaiTayOStarRongBien32g.jpeg'),
		('DRINK00001', N'Nước khoáng Aquafina 500ml', 100, 6000, 'image/Product/Aquafina.jpg'),
		('DRINK00002', N'Nước tăng lực Sting NS 330ml', 100, 10000, 'image/Product/StingNhanSam.jpg'),
		('DRINK00003', N'Nước tăng lực Sting Dâu 330ml', 100, 10000, 'image/Product/StingDau.jpg'),
		('DRINK00004', N'Coca-Cola Nguyên bản 330ml Lon', 100, 10000, 'image/Product/Cocacola330mllon.png'),
		('DRINK00005', N'Sport Drink Aquarius', 100, 12000, 'image/Product/AquariusThuong.jpeg'),
		('DRINK00006', N'Sport Drink Aquarius 0 Calo', 100, 12000, 'image/Product/Aquarius0Calories.jpeg')

	-- 6. Tạo bảng thông tin trạng thái đặt thuê sân, dụng cụ
	create table [Status] (
		[Status] varchar(7) primary key -- Waiting, Cancel, Success
	)

		-- 6.1. Nhập dữ liệu thông tin trạng thái đặt thuê sân, dụng cụ
		insert into [Status] ([Status]) values ('Using'), ('Pending'), ('Cancel'), ('Success')

	-- 7. Tạo bảng thông tin Order (trong đó Sân là FK và bắt buộc phải có)
	CREATE TABLE Orders (
		OrderID INT IDENTITY(1,1) PRIMARY KEY, -- Mã hoá đơn
		CustomerPhone VARCHAR(15) NOT NULL references [User](phone), -- Số điện thoại khách hàng order
		EmployeePhone varchar(15) references [User](phone),
		FieldCode varchar(7) not null references FieldInfo(FieldCode), -- Mã sân đặt
		BookingDate DATETIME NOT NULL, -- Ngày đặt
		StartTime datetime not null, --Thời gian bắt đầu đặt sân
		EndTime datetime not null, -- Thời gian kết thúc đặt sân
		TotalAmount int,
		[Status] VARCHAR(7) NOT NULL DEFAULT 'Pending' references [Status]([Status]) -- Trạng thái đặt đơn
	);

		-- 7.1. Thêm dữ liệu vào bảng Order
		insert into Orders(CustomerPhone, FieldCode, BookingDate, StartTime, EndTime) values
		('0385913898', 'SAN502', '2024-06-25 23:00:00', '2024-06-26 17:00:00', '2024-06-26 19:00:00')

	-- 8. Tạo bảng thông tin đặt thuê dụng cụ
	create table OrderDetailsEquipment (
		OrderID int references Orders(OrderID), -- Mã đặt (references với bảng Orders)
		EquipmentCode varchar(6) references EquipmentInfo(EquipmentCode), -- Mã dụng cụ (references Equipment)
		EquipmentQuantity int, -- Số lượng dụng cụ
		primary key(OrderID, EquipmentCode)
	)

		-- 8.1. Thêm dữ liệu vào bảng OrderDetailsEquipment
		insert into OrderDetailsEquipment (OrderID, EquipmentCode, EquipmentQuantity) values
		(1, 'PIT01R', 3), (1, 'PIT04R', 2), (1, 'GLO09A', 1), (1, 'BAL05A', 1)

		-- 8.2. Xuất bảng chi tiết OrderDetailsEquipment
		SELECT 
			ord.OrderID, 
			ord.CustomerPhone, 
			ord.EmployeePhone, 
			ord.BookingDate, 
			ord.FieldCode, 
			ord.StartTime,
			ord.EndTime, 
			eqm.EquipmentName,
			ore.EquipmentQuantity
		FROM 
			Orders ord
		JOIN 
			OrderDetailsEquipment ore ON ore.OrderID = ord.OrderID
		JOIN
			EquipmentInfo eqm ON eqm.EquipmentCode = ore.EquipmentCode;

	-- 9. Tạo bảng OrderDetailsProduct
	create table OrderDetailsProduct (
		OrderID int references Orders(OrderID), -- Mã đặt (references với bảng Orders)
		ProductCode varchar(10) references Product(ProductCode), -- Mã đò ăn thức uống (references Product)
		ProductQuantity int -- Số lượng mỗi sản phẩm
		primary key(OrderID, ProductCode)
	)
	
		-- 9.1. Thêm dữ liệu vào bảng OrderDetailsProduct
		insert into OrderDetailsProduct (OrderID, ProductCode, ProductQuantity) values 
		(1, 'DRINK00002', 3), (1, 'DRINK00006', 2), (1, 'SNACK00003', 4), (1, 'SNACK00005', 3),
		(2, 'DRINK00002', 5), (2, 'DRINK00001', 1), (2, 'SNACK00001', 3), (2, 'SNACK00004', 7)

		-- 9.2. Thông tin chi tiết đơn
		SELECT 
			ord.OrderID, 
			ord.CustomerPhone, 
			ord.EmployeePhone, 
			ord.BookingDate, 
			ord.FieldCode, 
			ord.StartTime,
			ord.EndTime, 
			pro.ProductName,
			orp.ProductQuantity
		FROM 
			Orders ord
		JOIN 
			OrderDetailsProduct orp ON orp.OrderID = ord.OrderID
		JOIN
			Product pro ON pro.ProductCode = orp.ProductCode;
