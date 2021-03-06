USE [FlowerShop]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[Categories_ID] [int] IDENTITY(1,1) NOT NULL,
	[Categories_Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[Categories_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[Customers_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customers_Name] [nvarchar](50) NULL,
	[Customers_Email] [varchar](50) NULL,
	[Customers_Password] [varchar](50) NULL,
	[Customers_Phone] [nvarchar](50) NULL,
	[Customers_Address] [nvarchar](150) NULL,
 CONSTRAINT [PK_CUSTOMERS] PRIMARY KEY CLUSTERED 
(
	[Customers_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE](
	[Image_ID] [int] IDENTITY(1,1) NOT NULL,
	[Image_Path] [nvarchar](100) NULL,
	[Product_ID] [int] NULL,
 CONSTRAINT [PK_IMAGE] PRIMARY KEY CLUSTERED 
(
	[Image_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[Orders_ID] [int] IDENTITY(1,1) NOT NULL,
	[Orders_Date] [date] NULL,
	[Customers_ID] [int] NULL,
	[Status] [tinyint] NULL,
	[Note] [nvarchar](150) NULL,
	[Payment_Method] [tinyint] NULL CONSTRAINT [DF_ORDERS_Payment_Method]  DEFAULT ((0)),
	[Payment_Status] [tinyint] NULL CONSTRAINT [DF_ORDERS_Payment_Status]  DEFAULT ((0)),
 CONSTRAINT [PK_ORDERS] PRIMARY KEY CLUSTERED 
(
	[Orders_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS_DETAIL]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS_DETAIL](
	[OrdersDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Orders_ID] [int] NULL,
	[Product_ID] [int] NULL,
	[Product_Num] [int] NULL,
 CONSTRAINT [PK_ORDERS_DETAIL] PRIMARY KEY CLUSTERED 
(
	[OrdersDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 5/2/2019 10:57:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Product_Price] [int] NULL,
	[Product_Description] [nvarchar](max) NULL,
	[Product_Stock_Quantity] [bigint] NULL,
	[Product_Status] [tinyint] NULL CONSTRAINT [DF_PRODUCT_Product_Status]  DEFAULT ((1)),
	[Categories_ID] [int] NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[CATEGORIES] ON 

INSERT [dbo].[CATEGORIES] ([Categories_ID], [Categories_Name]) VALUES (1, N'Hoa')
INSERT [dbo].[CATEGORIES] ([Categories_ID], [Categories_Name]) VALUES (2, N'Cây Văn phòng')
INSERT [dbo].[CATEGORIES] ([Categories_ID], [Categories_Name]) VALUES (3, N'Hạt giống')
INSERT [dbo].[CATEGORIES] ([Categories_ID], [Categories_Name]) VALUES (4, N'Đồ trang trí')
SET IDENTITY_INSERT [dbo].[CATEGORIES] OFF
SET IDENTITY_INSERT [dbo].[CUSTOMERS] ON 

INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (1, N'Phạm Việt Uyên', N'uyenpham456@gmail.com', N'12345', N'01234567890', N'Tp Huế, Thừa Thiên Huế')
INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (2, N'Nguyễn Văn A', N'avn@gmail.com', N'123456', N'12345', N'Huế')
INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (3, N'Nguyễn Văn B', N'bnv@gmail.com', N'12345', N'12345', N'Đà Nẵng')
INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (4, N'Nguyễn Văn C', N'cnv@gmail.com', N'12345', N'12345', N'Hà Nội')
INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (5, N'User1', N'user1@example.com', N'12345', N'12345', N'Đà Nẵng')
INSERT [dbo].[CUSTOMERS] ([Customers_ID], [Customers_Name], [Customers_Email], [Customers_Password], [Customers_Phone], [Customers_Address]) VALUES (6, N'Admin', N'admin@example.com', N'12345', N'0', N'0')
SET IDENTITY_INSERT [dbo].[CUSTOMERS] OFF
SET IDENTITY_INSERT [dbo].[IMAGE] ON 

INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (1, N'/Images\product\2\1.jpg', 2)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (2, N'/Images\product\3\1.jpg', 3)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (3, N'/Images\product\4\1.jpg', 4)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (4, N'/Images\product\5\1.jpg', 5)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (5, N'/Images\product\6\1.jpg', 6)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (6, N'/Images\product\7\1.jpg', 7)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (7, N'/Images\product\8\1.jpg', 8)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (8, N'/Images\product\9\1.jpg', 9)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (9, N'/Images\product\10\1.jpg', 10)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (10, N'/Images\product\11\1.jpg', 11)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (11, N'/Images\product\12\1.jpg', 12)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (12, N'/Images\product\13\1.jpg', 13)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (13, N'/Images\product\14\1.jpg', 14)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (14, N'/Images\product\15\1.jpg', 15)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (15, N'/Images\product\16\1.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (16, N'/Images\product\17\1.jpg', 17)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (17, N'/Images\product\2\2.jpg', 2)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (18, N'/Images\product\2\3.jpg', 2)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (19, N'/Images\product\2\4.jpg', 2)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (20, N'/Images\product\3\2.jpg', 3)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (21, N'/Images\product\3\3.jpg', 3)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (22, N'/Images\product\4\2.jpg', 4)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (23, N'/Images\product\4\3.jpg', 4)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (24, N'/Images\product\5\2.jpg', 5)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (25, N'/Images\product\5\3.jpg', 5)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (26, N'/Images\product\5\4.jpg', 5)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (27, N'/Images\product\5\5.jpg', 5)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (28, N'/Images\product\6\2.jpg', 6)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (29, N'/Images\product\6\3.jpg', 6)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (30, N'/Images\product\6\4.jpg', 6)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (31, N'/Images\product\7\2.jpg', 7)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (32, N'/Images\product\7\3.jpg', 7)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (33, N'/Images\product\7\4.jpg', 7)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (34, N'/Images\product\8\2.jpg', 8)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (35, N'/Images\product\8\3.jpg', 8)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (36, N'/Images\product\8\4.jpg', 8)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (37, N'/Images\product\9\2.jpg', 9)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (38, N'/Images\product\9\3.jpg', 9)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (39, N'/Images\product\9\4.jpg', 9)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (40, N'/Images\product\14\2.jpg', 14)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (41, N'/Images\product\14\3.jpg', 14)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (42, N'/Images\product\16\2.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (43, N'/Images\product\16\3.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (44, N'/Images\product\16\4.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (45, N'/Images\product\16\5.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (46, N'/Images\product\16\6.jpg', 16)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (47, N'/Images\product\17\2.jpg', 17)
INSERT [dbo].[IMAGE] ([Image_ID], [Image_Path], [Product_ID]) VALUES (48, N'/Images\product\17\3.jpg', 17)
SET IDENTITY_INSERT [dbo].[IMAGE] OFF
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (5, CAST(N'2019-04-20' AS Date), 1, 5, N'Test đặt hàng !', 0, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (6, CAST(N'2019-04-20' AS Date), 5, 2, N'Không', 0, 1)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (1002, CAST(N'2019-04-20' AS Date), 1, 2, N'', 0, 1)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (1003, CAST(N'2019-04-21' AS Date), 5, 1, N'', 0, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (1004, CAST(N'2019-04-21' AS Date), 5, 1, N'', 0, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (1005, CAST(N'2019-04-21' AS Date), 5, 0, N'', 0, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (2002, CAST(N'2019-04-24' AS Date), 1, 0, N'', 1, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (3002, CAST(N'2019-04-28' AS Date), 1, 0, N'Không', 1, 0)
INSERT [dbo].[ORDERS] ([Orders_ID], [Orders_Date], [Customers_ID], [Status], [Note], [Payment_Method], [Payment_Status]) VALUES (3003, CAST(N'2019-04-28' AS Date), 1, 0, N'', 0, 0)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
SET IDENTITY_INSERT [dbo].[ORDERS_DETAIL] ON 

INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (8, 5, 2, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (9, 5, 5, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (10, 6, 4, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (11, 6, 5, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (12, 6, 3, 4)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1002, 1002, 10, 5)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1003, 1002, 9, 10)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1004, 1003, 4, 2)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1005, 1003, 13, 3)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1006, 1004, 4, 2)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1007, 1004, 11, 2)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1008, 1005, 4, 2)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (1009, 1005, 14, 2)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (2002, 2002, 2, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3002, 3002, 2, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3003, 3002, 5, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3004, 3002, 3, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3005, 3003, 2, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3006, 3003, 5, 1)
INSERT [dbo].[ORDERS_DETAIL] ([OrdersDetail_ID], [Orders_ID], [Product_ID], [Product_Num]) VALUES (3007, 3003, 3, 1)
SET IDENTITY_INSERT [dbo].[ORDERS_DETAIL] OFF
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 

INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (2, N'Sen Đá Chuỗi Ngọc', 30000, N'Cây Sen Đá Chuỗi Ngọc Đứng phù hợp với việc trang trí bàn làm việc, góc học tập. Cây có hình thù giống như ngọn đuốc tạo cho ta cảm giác cần phát phát triển, cần phải phấn đấu. Cây phù hợp làm quà tặng, trang trí các góc nhỏ như bàn làm việc, góc học tập, lan can cửa sổ, bàn cà phê....', 97, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (3, N'Sen Đá Thược Dược', 39000, N'Cây sen đá thược dược ngoài ý nghĩa một tình yêu, tình bạn bền vững mãi với thời gian thì nó còn có ý nghĩa tình yêu của người là hạnh phúc của tôi. Cây dùng để trang trí tiểu cảnh, để bàn làm việc, bàn uống nước, bàn lễ tân, quán cà phê...', 94, 1, 2)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (4, N'Sen Đá Hồng Phấn', 41000, N'Sen đá hồng phấn có ý nghĩa cho một tình yêu và tình bạn bền vững mãi theo thời gian. Cây phù hợp để làm quà tặng, để bàn làm việc, trang trí quán cà phê, góc học tập...', 93, 1, 2)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (5, N'Sen Đá Nhím Đen', 50000, N'Cây Sen Đá Nhím Đen có hình thù khá thú vị và độc đáo vì thế nó phù hợp để trang trí bàn uống cà phê, bàn học, các ô nhỏ trên kệ hoặc các góc nhỏ, và làm quà tặng', 97, 1, 2)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (6, N'Sen Đá Sedum Cơm', 10000, N'Sen Đá Sedum Cơm nằm trong họ sedum là dòng có bông và lá rất nhỏ, phù hợp với những người yêu thích sự nhỏ nhắn, cây phù hợp để bàn làm việc và các góc nhỏ', 100, 1, 2)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (7, N'Chậu Hoa Đồng Tiền Đỏ', 25000, N'Hoa đồng tiền đỏ rất thích hợp làm món quà tặng cho cô gái mà bạn yêu để thể hiện tình cảm  và sự chân thành. Chậu hoa đồng tiền đỏ còn dùng trang trí văn phòng, phòng khách mang đến sự tươi sáng và vui vẻ.', 100, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (8, N'Hoa Đồng Tiền Mini', 50000, N'Hoa đồng tiền mini thích hợp trồng trong bồn hoa trang trí trước hiên nhà và ban công. Ngoài ra còn dùng trồng chậu để bàn trang trí văn phòng, phòng khách, ô trang trí trong nhà.', 500, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (9, N'Chậu Hoa Lily Cam', 80000, N'Hoa lily có thể dùng cắt cành cắm trong lọ trưng bày được 14 – 20 ngày. Hoa lily trong chậu sử dụng để chưng bàn làm việc hay phòng khách mang lại vẻ đẹp quyến rũ, quý phái,  tạo điểm nhấn cho căn phòng. Ngoài ra, một chậu lily còn là món quà ý nghĩa cho bạn bè, người thân.', 70, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (10, N'Set Thủy canh treo tường', 90000, N'Chất liệu:  Sắt,thủy tinh,hoa vải, trái nhựa ', 100, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (11, N'Chậu hoa garden', 260000, N'Chất liệu:  chậu sứ, hoa nhựa ', 298, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (12, N'Xe Đạp Hoa', 200000, N'Chất liệu:  nhựa cao cấp ', 100, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (13, N'Hoa mẫu đơn túi bố', 180000, N'Chất liệu:  Túi bố, hoa nhựa ', 197, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (14, N'Chậu hoa hồng trái tim', 220000, N'Chất liệu:  Chậu sứ, hoa giả', 97, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (15, N'Giỏ sắt hoa lavender', 220000, N'Chất liệu:  Sắt+ vải bố+hoa nhựa', 200, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (16, N'Chậu hoa bình tưới', 240000, N'Chất liệu:  Bình sắt, hoa nhựa', 70, 1, 1)
INSERT [dbo].[PRODUCT] ([Product_ID], [Product_Name], [Product_Price], [Product_Description], [Product_Stock_Quantity], [Product_Status], [Categories_ID]) VALUES (17, N'Chậu gỗ handmade', 200000, N'Chất liệu:  gỗ, hoa nhựa', 80, 1, 1)
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
ALTER TABLE [dbo].[IMAGE]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_PRODUCT] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[PRODUCT] ([Product_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[IMAGE] CHECK CONSTRAINT [FK_IMAGE_PRODUCT]
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_CUSTOMERS] FOREIGN KEY([Customers_ID])
REFERENCES [dbo].[CUSTOMERS] ([Customers_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDERS] CHECK CONSTRAINT [FK_ORDERS_CUSTOMERS]
GO
ALTER TABLE [dbo].[ORDERS_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_DETAIL_ORDERS] FOREIGN KEY([Orders_ID])
REFERENCES [dbo].[ORDERS] ([Orders_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDERS_DETAIL] CHECK CONSTRAINT [FK_ORDERS_DETAIL_ORDERS]
GO
ALTER TABLE [dbo].[ORDERS_DETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_DETAIL_PRODUCT] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[PRODUCT] ([Product_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORDERS_DETAIL] CHECK CONSTRAINT [FK_ORDERS_DETAIL_PRODUCT]
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_CATEGORIES] FOREIGN KEY([Categories_ID])
REFERENCES [dbo].[CATEGORIES] ([Categories_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_CATEGORIES]
GO
