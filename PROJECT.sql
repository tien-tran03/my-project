

--create database Asignment_PRJ301
--drop database Asignment_PRJ301a
USE Asignment_PRJ301 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[is_admin] [bit] NOT NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[isActive] [bit] NULL,
	[phoneNumber] [nvarchar](255),
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[img_url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductQuantity] [int] NULL,
	[Sellprice] [float] NULL,
	[OrderItemID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 08/03/2024 1:10:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderDate] [date] NULL,
	[TotalAmount] [float] NULL,
	[account_id] [int] NULL,
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08/03/2024 1:10:38 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[Category] [nvarchar](max) NOT NULL,
	[Price] [float] NULL,
	[StockQuantity] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[image_url] [varchar](255) NULL,
	[Quantity] [int] NULL,
	[Sellprice] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (2, N'admin', N'123', 1, N'First Name 1', N'Last Name 1', N'email1@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (3, N'guest', N'123', 0, N'First Name 2', N'Last Name 2', N'email2@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (4, N'admin2', N'123', 1, N'First Name 3', N'Last Name 3', N'email3@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (5, N'guest2', N'123', 0, N'First Name 4', N'Last Name 4', N'email4@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (6, N'guest3', N'123', 0, N'First Name 5', N'Last Name 5', N'email5@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (7, N'guest4', N'123', 0, N'First Name 6', N'Last Name 6', N'email6@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (8, N'admin3', N'123', 1, N'First Name 7', N'Last Name 7', N'email7@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (9, N'guest5', N'123', 0, N'First Name 8', N'Last Name 8', N'email8@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (10, N'guest6', N'123', 0, N'Vinh', N'Nguyen', N'email9@example.com', 1, NULL,null)
INSERT [dbo].[Accounts] ([account_id], [username], [password], [is_admin], [first_name], [last_name], [email], [isActive],[phoneNumber], [address]) VALUES (11, N'guest7', N'123', 0, N'First Name 10', N'Last Name 10', N'email10@example.com', 1, NULL,null)

SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (1, N'Đồ uống - Giải khát', N'2e11784ae26eb70797f8aba399088137.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (2, N'Gia vị', N'icon-sp-06.png')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (3, N'Bánh kẹo', N'360_F_350023616_wzEpzFsUC9Yh9yKvYI9uVPOHSX57gLaS.jpg')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (4, N'Rau củ - Trái cây', N'harvest-icon-fruit-symbol-vector-22391046.jpg')
--INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (5, N'Trứng', N'1000_F_277143513_98MvHZeEQbwQFU2HD4UnDfkVwGYGcGyb.jpg')
--INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (6, N'Sữa', N'milk-icon-thin-linear-milk-outline-icon-isolated-on-white-background-line-vector-milk-sign-symbol-for-web-and-mobile-700-257803844.jpg')
--INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [img_url]) VALUES (7, N'Đồ ăn liền', N'istockphoto-1442349745-1024x1024.jpg')
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (13, 28, 1, 10000, 19)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (14, 71, 1, 45000, 20)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (15, 20, 1, 54600.5, 21)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (15, 21, 1, 15000.599609375, 22)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (16, 24, 1, 165000, 23)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (16, 25, 2, 60000, 24)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (16, 70, 1, 42000, 25)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (16, 72, 1, 0, 26)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (17, 20, 1, 54600.5, 27)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (18, 20, 1, 54600.5, 28)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (19, 20, 1, 54600.5, 29)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (20, 21, 1, 15000.599609375, 30)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (21, 6, 1, 10000, 31)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (21, 21, 1, 15000.599609375, 32)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (22, 21, 5, 15000.599609375, 33)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (23, 6, 2, 10000, 34)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (24, 6, 2, 10000, 35)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (25, 6, 2, 10000, 36)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (26, 23, 1, 160000, 37)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (26, 8, 1, 18000, 38)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (27, 5, 1, 27000, 39)

INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (29, 82, 1, 72000, 41)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (30, 25, 1, 60000, 42)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (31, 21, 1, 15000.599609375, 43)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (32, 74, 1, 60000, 44)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (33, 26, 1, 50000, 45)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (34, 22, 1, 32000, 46)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (35, 25, 1, 60000, 47)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (36, 71, 1, 45000, 48)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (37, 72, 1, 55000, 49)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (38, 23, 1, 160000, 50)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (38, 27, 1, 50000, 51)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (38, 21, 1, 15000.599609375, 52)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (39, 70, 1, 42000, 53)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (39, 21, 1, 15000.599609375, 54)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (40, 22, 1, 32000, 55)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (40, 23, 1, 160000, 56)
INSERT [dbo].[OrderItems] ([OrderID], [ProductID], [ProductQuantity], [Sellprice], [OrderItemID]) VALUES (40, 24, 1, 165000, 57)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-12-07' AS Date), 50, 3, 1, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-10-17' AS Date), 8.98, NULL, 3, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-07-12' AS Date), 20, 5, 5, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), NULL, 7, 13, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), NULL, 7, 14, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 69601.1015625, 7, 15, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 327000, 7, 16, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 54600.5, 9, 17, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 54600.5, 2, 18, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 54600.5, 10, 19, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 15000.599609375, 10, 20, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 25000.599609375, 10, 21, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 75003, 10, 22, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 20000, 10, 23, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 20000, 10, 24, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 20000, 10, 25, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-01' AS Date), 178000, 10, 26, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 27000, 10, 27, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), NULL, 10, 28, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), NULL, 10, 29, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), NULL, 10, 30, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 15000.599609375, 10, 31, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 60000, 10, 32, N'Hanoi')
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 50000, 6, 33, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 32000, 10, 34, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 60000, 10, 35, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 45000, 5, 36, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 55000, 5, 37, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2023-11-06' AS Date), 225000.59375, 10, 38, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2024-03-04' AS Date), 57000.6015625, 3, 39, NULL)
INSERT [dbo].[Orders] ([OrderDate], [TotalAmount], [account_id], [OrderID], [address]) VALUES (CAST(N'2024-03-08' AS Date), 357000, 10, 40, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (1, N'Bánh phồng tôm', N'Bánh kẹo', 2000, 200, 3,  N'snack-partyz-ba-nh-pho-m-tom-33g-6-600x600.jpg', 0, 5000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (2, N'Bánh danisa', N'Bánh kẹo', 45000, 150, 3, N'banh-quy-bo-danisa-hop-454g-201912151549483089.webp', 0, 45000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (3, N'Bánh quy Cosy Socola', N'Bánh kẹo', 20000, 300, 3,  N'8934680052122.jpg', 0, 24800)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (4, N'Khoai Tây Snack', N'Bánh kẹo', 10000, 100, 3,  N'Snack-Lays-110g.png', 1, 11000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (5, N'Snack khoai tây Lays tôm hùm cay lon 105 g', N'Bánh kẹo', 25000, 104, 3,  N'SNACK-KHOAI-TAY-VI-TOM-HUM-CAY-LAYS-STAX-LON-105G.jpg', 1, 27000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (6, N'Kẹo máy chiếu Relkon Justice League', N'Bánh kẹo', 5000, 0, 3,  N'395269.jpg', 0, 10000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (7, N'Lay’s Stax Vị Cay Nồng 100g', N'Bánh kẹo', 30000, 100, 3,  N'40b4f5c56401d975f3f7346d28f518dd.png_2200x2200q80.png_.webp', 0, 34000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (8, N'Lay’s Stax Vị Thịt Nướng 100g', N'Bánh kẹo', 15000, 99, 3,  N'snack-khoai-tay-vi-suon-nuong-bbq-lays-stax-lon-150g-202306200857177202.jpg', 1, 18000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (9, N'Bánh quế Poca nhân kem hương ổi 115g', N'Bánh kẹo', 12000, 115, 3,  N'8.jpg', 0, 16000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (10, N'Bánh quế Poca nhân kem hương trứng muối 115g', N'Bánh kẹo', 13000, 115, 3,  N'banh-que-nhan-kem-huong-trung-muoi-poca-goi-115g-202301121024003153.jpg', 0, 16000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (11, N'Khô bò miếng cay truyền thống Pichi gói 50g', N'Bánh kẹo', 50000, 50, 3,  N'8c25891bb8aeeea098f8a06a0b51fc00.png', 0, 52000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (12, N'Bánh gạo Nhật Ichi vị mật ong Kameda gói 180g', N'Bánh kẹo', 12000, 0, 3, N'Kamada-ichi-180g.jpg', 0, 18000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (13, N'Mì hảo hảo', N'Đồ ăn liền', 3000, 100, 7,  N'mi-hao-hao-bun-mi-pho-viet-o-nhat-vietmart.jpg', 0, 3500)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (14, N'Mì Omachi chua cay', N'Đồ ăn liền', 6000, 500, 7,  N'1_d5014f1548bf481bbde51d26aeb792e9_ab41b9caa33447a1b98f02b5984ce2d8_grande.jpg', 0, 7000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (15, N'Nui hình xoắn Meizan gói 300g', N'Đồ ăn liền', 25000, 300, 7, N'nui-xoan-meizan.jpg', 0, 29750)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (16, N'Mì Toowoomba Ramen Yorihada Lốc 4 Gói 120g', N'Đồ ăn liền', 80000, 150, 7, N'8809695251269-1_2.jpg.webp', 0, 99000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (17, N'Mì Hảo Hảo Hải Sản Gói 71g', N'Đồ ăn liền', 3500, 50, 7,  N'8934563106140.jpg.webp', 0, 4000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (18, N'Mì Omachi Xốt Bò Hầm Ly 70G', N'Đồ ăn liền', 8000, 100, 7,  N'8936136164700.jpg.webp', 0, 10000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (19, N'Mì Gà Cay Samyang Lốc 5 Gói 145g', N'Đồ ăn liền', 150000, 250, 7,  N'8801073141797-1.jpg.webp', 0, 191000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (20, N'Thùng 7up 24 lon 320ml', N'Đồ uống - Giải khát', 54600.19921875, 450, 1, N'sgc_7up-lon-t24-20230912040338.png', 12, 54600.5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (21, N'Pepsi abcdzyx', N'Đồ uống - Giải khát', 10000, 20, 1, N'nuoc_ngot_pepsi_lon_320_ml_415ef91bdb15487ab3079155c3635f66.webp', 10, 18000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (22, N'Ice Tea đào', N'Đồ uống - Giải khát', 30000, 48, 1,  N'lipton-hop-ice-tea-dao-14gx16-hop.webp', 2, 32000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (23, N'Thùng 24 lon nước giải khát không calo 330ml', N'Đồ uống - Giải khát', 150000, 21, 1,  N'162428512734310011245-t-loc-6-lon-nuoc-giai-khot-zero-coca-cola-khung-duong-330ml-og.jpg', 3, 160000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (24, N'Thùng 24 lon nước không calo chanh 330ml', N'Đồ uống - Giải khát', 150000, 23, 1,  N'thung-24-lon-nuoc-ngot-pepsi-khong-calo-vi-chanh-320ml-202211291009095419.jpg', 1, 165000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (25, N'Nước giải khát có gas Coca Cola 6 chai x 390ml', N'Đồ uống - Giải khát', 45200, 4, 1, N'a6308f1d-12fa-4bd1-93a8-3d510accffb1_20210908042617-og.jpg', 2, 60000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (26, N'Lốc 6 chai nước giải khát hương chanh Sprite 390ml', N'Đồ uống - Giải khát', 45200, 5, 1, N'nuoc_ngot_sprite_huong_chanh_loc_6_chai_x_390ml_3a3e41bb5e4f4edba30f47dac9d5d578_master.jpg', 1, 50000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (27, N'Lốc 6 chai nước Zero SS.pet COCA-COLA 390ml', N'Đồ uống - Giải khát', 45200, 5, 1, N'6-chai-nuoc-ngot-co-ga-coca-cola-zero-390ml-202110281747040298.jpg', 1, 50000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (28, N'Lốc 6 chai nước ngọt Pepsi có ga không calo chai 390ml', N'Đồ uống - Giải khát', 8000, 6, 1, N'nuoc-ngot-pepsi-khong-calo-chai-390ml-202207042341248789.jpg', 0, 10000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (29, N'Trứng gà ác 729 Ba Vì giỏ 10 quả', N'Trứng', 50000, 1, 5, N'tr-ng-ga-so-trang-tr-i-729-ba-vi-gi-10-qu-9574014058526.jpg', 0, 60000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (30, N'Trứng gà tươi Dabaco hộp 10 quả', N'Trứng', 30000, 1, 5, N'8936057560032-1.jpg.webp', 0, 34000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (31, N'Trứng gà Omega 3 Dabaco hộp 10 quả', N'Trứng', 55000, 1, 5,N'227666.jpg', 0, 57000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (32, N'update', N'Bánh kẹo', 24000, 0, 3,N'751509030219e17b6423c3b70c7df4eb_4e1f87f95d334d4d89dc911d1855a2bc.jpg', 12, 34567)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (34, N'Trứng gà DHA Dabaco hộp 10 quả', N'Trứng', 52000, 1, 5, N'8936057560100.jpg.webp', 0, 59000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (38, N'Cải thảo', N'Rau củ - Trái cây', 8000, 1, 4,  N'cai-thao.jpg', 0, 10000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (39, N'Cà rốt', N'Rau củ - Trái cây', 2500, 1, 4,N'10069.jpg', 0, 5000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (40, N'Củ cải trắng', N'Rau củ - Trái cây', 8000, 1, 4, N'000000191.jpg', 0, 8200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (41, N'Củ đậu', N'Rau củ - Trái cây', 2000, 1, 4,  N'20151207120139-1.jpg', 0, 3200)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (42, N'Hành tây', N'Rau củ - Trái cây', 12000, 1, 4, N'chua-yeu-sinh-ly-bang-hanh-tay-1640623099790731187596.jpg', 0, 15000.599609375)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (43, N'Khoai môn', N'Rau củ - Trái cây', 15000, 1, 4,  N'5wYLaBg.jpg', 0, 16000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (44, N'Khoai tây', N'Rau củ - Trái cây', 29900, 1, 4, N'Khoai-tay-2.jpg', 0, 30000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (45, N'Su su', N'Rau củ - Trái cây', 15000, 1, 4,  N'751509030219e17b6423c3b70c7df4eb_4e1f87f95d334d4d89dc911d1855a2bc.jpg', 0, 15900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (46, N'Cà chua Đà Lạt', N'Rau củ - Trái cây', 26900, 1, 4, N'ca-chua-beed.jpg', 0, 27900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (47, N'Bí đỏ tròn', N'Rau củ - Trái cây', 10000, 1, 4,  N'b9edb47fb13ffa61a2f24d9de633ee32_f7dc0339ec9644ae93f7eb26644592d8.jpg', 0, 14900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (48, N'Bí xanh', N'Rau củ - Trái cây', 17900, 1, 4, N'20230105_bi-xanh.jpg', 0, 20000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (49, N'Cà tím ', N'Rau củ - Trái cây', 22000, 1, 4, N'ca-tim-2.png', 0, 23000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (50, N'Gừng củ', N'Rau củ - Trái cây', 50000, 1, 4,N'gung-tui-100g-1-2-cu-202205201545192733.jpg', 0, 60000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (51, N'Khoai lang giống nhật', N'Rau củ - Trái cây', 45000, 1, 4,N'khoai_lang_giong_nhat_da_lat-570x421.jpg', 0, 49900)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (52, N'Cam lòng vàng', N'Rau củ - Trái cây', 32000, 1, 4,  N'cam-long-vang-tui-1kg-6-8-trai-202211230808448956.jpg', 0, 39900)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (53, N'Dưa hấu giống nhật', N'Rau củ - Trái cây', 45000, 1, 4,  N'523bca325007a6a1d638b5035bc0188e.png', 0, 45730)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (54, N'Sữa tươi tiệt trùng Vinamilk có đường hộp 1 lít', N'Sữa', 30000, 1, 6,  N'fm100_khong_duong_1l_1__1__ea466b35d8244df1bf665db273bc4820_master.webp', 0, 33000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (55, N'Sữa tươi tiệt trùng Vinamilk không đường hộp 1 lít', N'Sữa', 29000, 1, 6,  N'sua-tuoi-tiet-trung-khong-duong-vinamilk-100-sua-tuoi-hop-1-lit-202309061116528899.jpg', 0, 33000)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (56, N'Lốc 4 hộp sữa tươi tiệt trùng Vinamilk có đường 180ml', N'Sữa', 25000, 1, 6,  N'fm100_co_duong_180ml_1_pln_62c14c6493ab475d99e1875174ccbe72_master.webp', 0, 30400)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (57, N'Sữa tươi tiệt trùng Vinamilk không đường lốc 4 hộp x 180ml', N'Sữa', 25000, 1, 6, N'sua-tuoi-tiet-trung-vinamilk-100-khong-duong-loc-4-hop-180ml-1630385575.jpg', 0, 30400)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (58, N'Sữa lúa mạch Milo protein canxi hộp 210ml', N'Sữa', 8000, 1, 6,  N'sua-lua-mach-milo-nap-van-hop-210ml-202104140055511486.jpg', 0, 9800)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (59, N'Lốc 4 hộp sữa tươi tiệt trùng có đường Vinamilk Green Farm 180ml', N'Sữa', 30000, 1, 6,  N'cd_180ml_loc_55fba7841945408f98a81df5898f01d0_master.webp', 0, 34600)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (60, N'Lốc 4 hộp sữa tươi tiệt trùng ít đường Vinamilk Green Farm 180ml', N'Sữa', 30000, 1, 6,  N'rid_180ml_loc_8b7faedd6713480ea31e49756819524b_master.webp', 0, 34600)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (61, N'Lốc 4 hộp sữa chua uống dâu có thạch Nuvi', N'Sữa', 20000, 1, 6, N'img-1454-1667882799819.webp', 0, 29600)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (62, N'Lốc 4 hộp sữa chua uống cam có thạch NUVI 170ml', N'Sữa', 25000, 0, 6,  N'img-1450-1667883263028.webp', 1, 29600)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (63, N'Lốc 4 hộp sữa tươi tiệt trùng không đường Vinamilk Green Farm 180ml', N'Sữa', 30000, 1, 6, N'green-farm-khong-duong.jpg', 0, 34600)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (64, N'Lốc 4 hộp sữa chua uống TH Milk hương cam 180ml', N'Sữa', 25000, 1, 6,  N'sua-chua-uong-tiet-trung-huong-cam-th-true-yogurt-180ml-loc-4-hop.jpg', 0, 27100)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (65, N'Lốc 4 hộp sữa chua uống Topkid hương dâu 180ml', N'Sữa', 20000, 1, 6,  N'8935217414116-2.jpg.webp', 0, 27500)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (66, N'Lốc 4 hộp sữa chua uống Topkid hương cam 180ml', N'Sữa', 25000, 1, 6,  N'loc-4-hop-sua-chua-uong-cam-th-true-yogurt-top-kid-180ml-1.webp', 0, 27500)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (67, N'Sữa chua uống tiệt trùng hương việt quất tự nhiên TH True Yogurt lốc 4 hộp x 180ml', N'Sữa', 23000, 1, 6,  N'sua-chua-uong-tiet-trung-viet-quat-th-true-yogurt-180ml-loc-4-hop.jpg', 0, 27100)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (68, N'Sữa tiệt trùng Cô gái Hà Lan không đường hộp 1lít', N'Sữa', 24000, 1, 6,  N'8934841901962-500x500.webp', 0, 29700)
--INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (69, N'Sữa tiệt trùng Cô gái Hà Lan có đường hộp 1L', N'Sữa', 23000, 1, 6,  N'sua-tuoi-tiet-trung-dutch-lady-co-duong-hop-1-lit-thung-12-hop-2_1630502455.jpg', 0, 29700)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (70, N'Nước mắm cá cơm Thuận Phát 60 độ đạm chai 500ml', N'Gia vị', 35000, 0, 2,  N'c0b640b7-8ac4-463b-a78a-e2122d5739a9.webp', 1, 42000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (71, N'Dầu đậu nành Simply chai 1 lít', N'Gia vị', 40000, 0, 2,  N'dau-dau-nanh-nguyen-chat-simply-chai-1-lit-202201181537524535.jpg', 1, 45000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (72, N'Nước mắm Nam Ngư cao cấp ủ chượp và đóng chai tại Phú Quốc chai 500ml', N'Gia vị', 52000, 0, 2, N'Nam-ngu-phu-quoc-1-1.jpg', 1, 55000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (73, N'Dầu đậu nành Meizan can 5L', N'Gia vị', 251100, 1, 2,  N'dau-an-cao-cap-meizan-gold-can-5-lit-202209171641556987.webp', 0, 275000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (74, N'Dầu đậu nành TƯỜNG AN Marvela 1L', N'Gia vị', 55900, 0, 2, N'dau-dau-nanh-tuong-an-marvela-chai-1-lit-202212031545352201.png', 1, 65000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (75, N'Dầu đậu nành Gold Tiara 2L', N'Gia vị', 110700, 1, 2, N'09dafc5ade1003bf1dd68f09e2ad1085.jpg', 0, 115000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (76, N'Dầu ăn thượng hạng Neptune Light chai 5L', N'Gia vị', 265600, 1, 2, N'losupply-quan-tan-phu-quan-tan-phu-ho-chi-minh-1618467447167540212-dau-an-neptune-light-5l-0-1638717939.jpg', 0, 270000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (77, N'Hạt nêm Aji-ngon Ajinomoto gói 900g', N'Gia vị', 57400, 1, 2, N'hat-nem-vi-heo-aji-ngon-goi-900g-202308111727336027.jpg', 0, 60000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (78, N'Hạt nêm Chin-Su gói 1Kg', N'Gia vị', 46000, 1, 2,  N'db7dd843534a56b82a8e3cd5f10e819b.jpg', 0, 50000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (79, N'Nước tương tỏi ớt Chinsu 330ml', N'Gia vị', 16200, 1, 2,  N'nuoc-tuong-chinsu-nam-shiitake-chai-330ml-202111181932366545.jpg', 0, 18000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (80, N'Xốt mayonnaise Aji-mayo chai 260g', N'Gia vị', 36600, 1, 2,  N'xot-mayonnaise-ajinomoto-vi-chua-beo-chai-260g-202304241647567247.jpg', 0, 38000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (81, N'Sốt Aij - Mayo mayoinaise ngọtdịu 260g', N'Gia vị', 36600, 1, 2,  N'28666b8fc225b9af9fd5d0dc00afe7a1.jpg', 0, 38000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (82, N'Bột ngọt (mì chính) Ajinomoto gói 1kg', N'Gia vị', 69300, 0, 2,  N'bot-ngot-ajinomoto-goi-1kg-201912111050349172.jpg', 1, 72000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (83, N'Muối chấm Tôm chua cay Hảo Hảo 120g', N'Gia vị', 16000, 1, 2, N'muoi-cham-hao-hao-tom-chua-cay-120g.jpg', 0, 21000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (84, N'Bánh trứng tươi – chà bông Karo Richy', N'Bánh kẹo', 30000, 50, 3,  N'a81eef329a775c0f1235b7c3dc459d92.jpg', 0, 32000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (86, N'Bánh Custas kem trứng Orion hộp 276g', N'Bánh kẹo', 30000, 12, 3,  N'custas12p_b49a0c2a-0101-4a6d-b79b-6abfd745eee3-og.png', 0, 34000)
INSERT [dbo].[Products] ([ProductID], [ProductName], [Category], [Price], [StockQuantity], [CategoryID],  [image_url], [Quantity], [Sellprice]) VALUES (101, N'demo', N'Đồ uống - Giải khát', 10000, 50, 1,  N'sgc_7up-lon-t24-20230912040338.png', 1, 18000)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_user]    Script Date: 08/03/2024 1:10:38 SA ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [unique_user] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts1] FOREIGN KEY([account_id])
REFERENCES [dbo].[Accounts] ([account_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts1]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE Asignment_PRJ301 SET  READ_WRITE 
GO



