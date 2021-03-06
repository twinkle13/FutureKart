USE [FutureKart]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12-12-2018 17:51:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[ID] [uniqueidentifier] NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NULL,
	[Pin] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartVariantMapping]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartVariantMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[CartID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ProductsSold] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderDate] [smalldatetime] NOT NULL,
	[TotalAmount] [float] NOT NULL,
	[DeliveryAddressID] [uniqueidentifier] NOT NULL,
	[DeliveryDate] [smalldatetime] NOT NULL,
	[StatusID] [int] NOT NULL,
	[isCancelled] [char](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlaced]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlaced](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPlacedVariants]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPlacedVariants](
	[ID] [uniqueidentifier] NOT NULL,
	[OrderPlacedID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[SellingPrice] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [uniqueidentifier] NOT NULL,
	[CategoryID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[OrderLimit] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[TotalVariantsSold] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Property]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[HashPassword] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](11) NULL,
	[RoleID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddressMapping]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddressMapping](
	[ID] [uniqueidentifier] NOT NULL,
	[UserID] [uniqueidentifier] NULL,
	[AddressID] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Value]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Value](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Variant]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variant](
	[ID] [uniqueidentifier] NOT NULL,
	[SKU] [nvarchar](100) NULL,
	[ProductID] [uniqueidentifier] NOT NULL,
	[ListingPrice] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[QuantitySold] [int] NOT NULL,
	[Inventory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantImage]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantImage](
	[ID] [uniqueidentifier] NOT NULL,
	[VariantID] [uniqueidentifier] NOT NULL,
	[ImageURL] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantPropertyValue]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantPropertyValue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [uniqueidentifier] NOT NULL,
	[ValueID] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'bbda96dd-d64b-4ced-968a-0cf721c1aaad', N'xyx25sad', N'xyy', 1234, N'asd', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'2974b9f9-771f-42fd-a172-25e853d90bcd', N'xyx', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'e7e3a2c0-6c11-4715-ab54-2c72df7d0ac3', N'khghjed', N'asdjhkajfh', 132001, N'afhkjfh', N'hhjgafdf', N'dgfsg')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'05b9fb1b-2c19-444f-bc31-3b11882680b2', N'xyx', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'4e7a2c57-a095-4214-a1fb-428436b5442a', N'xyx', N'de', 121, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'65269f09-5c9e-404b-bd2f-4eabe059afcf', N'xyx25', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'038a7918-0398-4cfb-ba13-5325872511e3', N'xyx', N'xyy', 132001, N'asd', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'd9fe764e-d668-4adc-953b-6a67accfcac7', N'hfkjh', NULL, 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'6903ac47-6175-4496-adc5-6c8eb667df13', N'xyx2a', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'8bc3945a-8481-4a7d-9ad5-6df3a5fe0616', N'xyx2', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'2a574500-af4b-452a-b8bf-720bfda2d094', N'xyx', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'32a343f7-c68c-4b5e-a31b-b2155cd806b0', N'xyx2a', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'a1d77fb5-7678-4a10-9ac7-b4cd7fa80c67', N'xyx', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'3cf461b6-ed1b-4a4b-9901-b5f263371e04', N'xyx2', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'ac2ba395-ae0c-40fa-a1aa-e27461f2e769', N'xyx2', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[Address] ([ID], [AddressLine1], [AddressLine2], [Pin], [City], [State], [Country]) VALUES (N'eacc112e-6fff-4406-8e54-e4a054f307a3', N'xyx2a', N'xyy', 1234, N'gurgaon', N'Haryana', N'India')
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'e1c503ac-cee8-4cb7-b026-768182a97049', N'bfa5f8a3-1628-4e23-8b68-152f57504cb9', N'd5ffd500-fb04-49e9-b0d1-1bb3133889e4', 1800, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'8b8fab67-d409-437f-9fb3-96a39ce87138', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'd5ffd500-fb04-49e9-b0d1-1bb3133889e4', 1800, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'2c8c3813-62da-441f-878a-d3e82b45dee1', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'7adf84a3-3e3b-4ee9-ab09-8b64ea1224d8', 11050, 1)
INSERT [dbo].[CartVariantMapping] ([ID], [CartID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'4b7aedf0-09f1-4ccd-9758-f833b48cf052', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'3abbfd34-408b-4483-ab3c-005dee1bbd96', 0, 1)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Backpacks', 1000)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Headphones', 4000)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Mobiles', 3001)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Televisions', 6002)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Cameras', 5000)
INSERT [dbo].[Category] ([ID], [Name], [ProductsSold]) VALUES (N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Watches', 2000)
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'db7eb133-d2b9-45a8-9b4b-3a3263a95b56', CAST(N'2018-12-12T15:56:00' AS SmallDateTime), 9900, N'e7e3a2c0-6c11-4715-ab54-2c72df7d0ac3', CAST(N'2018-12-12T15:56:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'9aa99794-fdf3-41ba-812c-53ff0f9ffa82', CAST(N'2018-12-12T15:52:00' AS SmallDateTime), -17600, N'05b9fb1b-2c19-444f-bc31-3b11882680b2', CAST(N'2018-12-12T15:52:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'e493b383-62c3-49ea-afa4-8a8e3994cdb9', CAST(N'2018-12-10T11:34:00' AS SmallDateTime), 112, N'05b9fb1b-2c19-444f-bc31-3b11882680b2', CAST(N'2018-12-10T11:34:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'e0ff0e60-683c-469d-9d59-a6fa32d2f7ae', CAST(N'2018-12-10T11:40:00' AS SmallDateTime), 0, N'ac2ba395-ae0c-40fa-a1aa-e27461f2e769', CAST(N'2018-12-10T11:40:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'f7dc0b83-12fa-4c0c-8b8e-a7de7e1725f0', CAST(N'2018-12-10T11:43:00' AS SmallDateTime), 0, N'8bc3945a-8481-4a7d-9ad5-6df3a5fe0616', CAST(N'2018-12-10T11:43:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'd5f98f5c-99fc-4426-a61e-aff6ec2b00b8', CAST(N'2018-12-10T15:07:00' AS SmallDateTime), 341.88, N'038a7918-0398-4cfb-ba13-5325872511e3', CAST(N'2018-12-10T15:07:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'b71cc51c-25d4-4fc1-b364-b33b83ebc7fd', CAST(N'2018-12-10T11:17:00' AS SmallDateTime), 0, N'd9fe764e-d668-4adc-953b-6a67accfcac7', CAST(N'2018-12-10T11:17:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'e95dcac6-d8cf-4b72-85ad-da4632040b49', CAST(N'2018-12-12T13:41:00' AS SmallDateTime), 2070, N'2974b9f9-771f-42fd-a172-25e853d90bcd', CAST(N'2018-12-12T13:41:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[Order] ([ID], [OrderDate], [TotalAmount], [DeliveryAddressID], [DeliveryDate], [StatusID], [isCancelled]) VALUES (N'd2c4eb9d-095b-4a2b-964c-f8053e08ed35', CAST(N'2018-12-10T10:38:00' AS SmallDateTime), 112, N'a1d77fb5-7678-4a10-9ac7-b4cd7fa80c67', CAST(N'2018-12-10T10:38:00' AS SmallDateTime), 1, N'N ')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'96540397-2cdc-415a-bb2d-0678b338469b', N'db7eb133-d2b9-45a8-9b4b-3a3263a95b56', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'1ee9061f-c3a9-4fac-84db-1f8ddefe6536', N'9aa99794-fdf3-41ba-812c-53ff0f9ffa82', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'283a7265-7334-45f6-b0f6-527df781f44e', N'd5f98f5c-99fc-4426-a61e-aff6ec2b00b8', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'3cc8b004-a98b-47f1-a96b-7e2410d6bad9', N'd2c4eb9d-095b-4a2b-964c-f8053e08ed35', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'2e7aa747-64d2-422c-925a-844dd429cf74', N'e0ff0e60-683c-469d-9d59-a6fa32d2f7ae', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'19d8884c-4ecf-4926-8cb4-95954071ad3b', N'b71cc51c-25d4-4fc1-b364-b33b83ebc7fd', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'abb7d475-bd3c-43ba-8a83-b3da680bc5c2', N'f7dc0b83-12fa-4c0c-8b8e-a7de7e1725f0', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'a664810e-8022-4de3-8777-d8a0abbb9ce0', N'e95dcac6-d8cf-4b72-85ad-da4632040b49', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlaced] ([ID], [OrderID], [UserID]) VALUES (N'68aec090-aa53-43ae-808c-ff7332b278a7', N'e493b383-62c3-49ea-afa4-8a8e3994cdb9', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a')
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'f972c0ba-4f2b-4b00-b699-1e1b1683ba35', N'96540397-2cdc-415a-bb2d-0678b338469b', N'82426682-233e-4bf9-b9db-2453666d6e0b', 9900, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'aa555855-b4d6-4339-b9ed-7333e9d381bb', N'1ee9061f-c3a9-4fac-84db-1f8ddefe6536', N'c40bc2e8-0f43-4f0d-b1d0-4da9865a1fa1', -17600, 1)
INSERT [dbo].[OrderPlacedVariants] ([ID], [OrderPlacedID], [VariantID], [SellingPrice], [Quantity]) VALUES (N'1b671acd-72a1-4089-97b2-82bd45db8837', N'a664810e-8022-4de3-8777-d8a0abbb9ce0', N'd2317c37-8396-4a62-ba69-524b1d8c9b1e', 2070, 1)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd8222622-0a27-45b0-9849-03e4fb73c94f', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'TCL', N'Televisions TCL', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'25986eb5-225e-463a-97d7-05df67c8cf9f', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Sennheiser', N'Sennheiser Headphones', 6, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1883e9ff-2388-4170-83f4-0bca15460be9', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy4', N'Cameras Fuji', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'01d62d36-4ed8-475d-8fad-0c7747bc3376', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Getek', N'Cameras Getek', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'b5b911d5-22ae-41c5-9d7b-0dac3a8fc619', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy1', N'Watches Blancpain', 5, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'32226eca-78ff-4c20-8131-12509715141c', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Panasonic', N'Televisions Panasonic', 6, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'0516c264-a819-4f37-99f0-138e39679768', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy4', N'Televisions TCL', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'0761b857-31b5-4bee-88e9-15288a0d9218', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy6', N'Televisions LG', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'6b49513b-6c6a-4dce-b355-1ab656fea17f', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy6 Products', N'Cameras Products', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'e71ad450-5a2d-479d-874e-24024f55b6e8', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Skullcandy', N'Headphones Skullcandy', 2, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4dac763b-893d-4ca4-9718-249117196da8', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Sony', N'Televisions Sony', 3, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 300)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5fa1043b-5cba-4c19-9ac2-2daf13a997d5', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy6', N'Watches Sonata', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'47beb2eb-22f9-4bff-8b54-32e583eb5419', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'HeroFiber', N'Cameras HeroFiber', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'05203a7e-8f71-4cd2-8e17-330e3b9cb47e', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Toshiba', N'Televisions Toshiba', 4, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1b3679ad-5460-4e73-981f-362e5c02cc85', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy10', N'Televisions Westinghouse', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'329d339c-0a1f-4e29-9b96-37d9641d485f', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy2', N'Televisions Panasonic', 6, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'6be128d5-151b-451c-a01a-4091f67aee64', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Chopard', N'Watches Chopard', 6, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'3b81c951-5fb2-41a4-b39f-436c92cdf5a8', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy9', N'Cameras Getek', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f8d54c33-b21b-458b-bdb6-439de12c7312', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Grado', N'Headphones Grado', 2, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'78c74cf9-771b-47a7-889c-47a9f1bcbbf3', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Canon', N'Cameras Canon', 5, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'3b132d69-c34e-4529-b6ab-48cb5e703610', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Koss', N'Headphones Koss', 4, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f71bd047-104b-4bf8-b508-4afba19c0aba', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy7', N'Televisions Toshiba', 4, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'40f6f073-4caa-487f-95c9-4c38db1041ac', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy3', N'Televisions Sony', 3, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7a5a9b1f-1c69-4cad-8b9e-4cd7331b3d8b', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'SkyBags', N'SkyBags laptop bag', 5, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'37a6442a-8d43-4605-b3a7-4db607cb9678', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy4', N'Watches Hublot', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'557ec9e6-6268-49f2-96bc-50c3a072def5', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy9', N'Televisions Vizio', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd872ba45-4a53-463e-ab46-51bf6df90592', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dumm10', N'Watches Omega', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'fcfdb8f2-bc22-4cb8-a63f-535e15da3f82', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Blancpain', N'Watches Blancpain', 5, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'e8dce6b7-5efc-452b-bdae-553dd24494a8', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummm3', N'Watches Rolex', 3, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f7b29f0d-0664-4761-94db-583cd403e495', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Xiomi', N'Xiomi Mobiles', 2, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'19151f47-69d1-4502-8b60-592bcb07b21e', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Fuji', N'Cameras Fuji', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'79a5415f-9725-4f41-b55a-59d63e9de559', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Hublot', N'Watches Hublot', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'2d0beaf9-b83a-4e98-a2d7-59f3c514ca04', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Oppo', N'Oppo Mobiles', 3, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 300)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5824850e-0bc5-4977-8c68-59fc29a18e94', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Sony', N'Sony Mobiles', 2, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'edfe38b8-0891-46ad-b709-5ad98853a5d6', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Sony', N'Headphones Sony', 2, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'38e975bd-8970-4c00-83d6-5d92db5e3697', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy1', N'Televisions Hisense', 5, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'45271a60-787a-48be-942c-62d73d463211', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Motorola', N'Motorola Mobiles', 2, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'efbab5fc-6145-468f-99fd-696e6d02c00e', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Timex', N'Watches Timex', 4, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'eefbfa9e-b4d0-49c6-a5db-6a626e6d1224', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'American Tourister', N'American Tourister laptop bag', 6, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'c3abcdc1-f347-475b-876f-6c01bc836c48', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'HP', N'HP laptop bag', 3, N' A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on o', 300)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'93afda97-3d79-415c-8b21-6e00e39530d3', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Gucci', N'Watches Gucci', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1cabfd98-f757-4f34-bce8-717a160e85e3', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy2', N'Watches Chopard', 6, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'5079ea38-f225-4f69-9682-7222c6ab0b11', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'One plus', N'One plus Mobiles', 1, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'16481a4f-eed6-4335-9c0e-731c97c94123', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Huawei', N'Huawei Mobiles', 2, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4d026407-15ae-4e8e-bf34-7e13674eaaee', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Avantree', N'Headphones Avantree', 2, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd289472f-fcf1-41c7-8a2a-7f35b24e192c', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Vizio', N'Televisions Vizio', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1d379396-5b71-4bf9-91c6-832edd341a16', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Apple', N'Apple Mobiles', 5, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'19800adf-2355-43cf-8c25-85ceab7b7e93', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy8', N'Televisions Sharp', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'fc5e72fa-4094-4218-be0f-8735e46efa51', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Monster', N'Headphones Monster', 2, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'49bb3ed7-eb84-447c-8149-884330446dd8', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy8', N'Watches TITAN', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'8cbdf832-c980-4dcb-8c00-8a3597c4ccbf', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy10', N'Cameras HeroFiber', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'68f06279-13f0-4feb-b68b-8beece0ce049', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Edifier', N'Edifier Headphones', 3, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 300)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9e3c3d0a-1e8c-43b6-bcf4-8e0dc79aabe0', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Lenovo', N'Lenovo laptop bag', 1, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'19897da5-722b-486f-a34b-90ca7d3adf4c', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy8', N'Cameras BVI', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f42e0f29-45ed-417e-a608-91db18c11051', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'dummy5', N'Televisions Samsung', 1, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1d0e2ee0-fc5f-4a38-9fbb-92b83c4a5b9c', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy5', N'Watches Fastrack', 1, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'338703b5-bd7a-4db8-8d4a-94a18a08a0c2', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy9', N'Watches Gucci', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9a2272c2-1966-4b46-8da0-9a4cff3a8871', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Puma', N'Puma laptop bag', 2, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9dfbb56c-5e6a-435b-9032-9b9cf8ef1ecd', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Cosmus', N'Cosmus laptop bag', 4, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'544d965a-b5f7-43ea-b2ad-9d4b2635ce86', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Hisense', N'Televisions Hisense', 5, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'84fb6cf3-7878-4265-80f7-a1ef5fce431e', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Tommy Hilfiger', N'Tommy Hilfiger laptop bag', 2, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f44baca5-0f27-4d37-aa0a-a25fa6870203', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Philips', N'Headphones Philips', 1, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'0d299367-2377-4314-9b71-a993694206ab', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy5', N'Cameras Panasonic', 1, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'98b80a0c-af36-4e7c-a0a1-adf36d0e6b41', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy2', N'Cameras Nikon', 6, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'334401f5-53af-4cc2-a402-ae85211f0402', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Samsung', N'Samsung Mobiles', 6, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f4e6ee3e-fe24-4ac2-8250-aea6a7e25ce6', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Made Products', N'Cameras Products', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd1a90c20-cf15-4f34-a666-b73d4315db36', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Fastrack', N'Watches Fastrack', 1, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'600525d2-2968-4562-b074-b86192b910bc', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy1', N'Cameras Canon', 5, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f44b6b8a-ac29-4968-8309-bb60c86e6b18', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Pentax', N'Cameras Pentax', 4, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'150c888b-585e-47e5-8df4-bd4fedc72b24', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Rolex', N'Watches Rolex', 3, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 300)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'96552f9a-e491-4159-b6d5-bf71592cbe98', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'LG', N'Televisions LG', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7857ef25-d6e8-4e49-9d80-c4b8f646e1e5', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Wildcraft', N'Wildcraft laptop bag', 2, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'a94d2698-d114-4825-9189-c7b7ab7ef54a', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'BVI', N'Cameras BVI', 2, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'd5eedd2a-963f-49b4-8529-d2e0655322e9', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Gear', N'Gear laptop bag', 2, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4ec47227-814c-47e3-8e64-d3e12d014a32', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Nikon', N'Cameras Nikon', 6, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 600)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'15b88c89-0993-458f-aa9d-d4176ca32ac3', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Sonata', N'Watches Sonata', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'83f8ceb3-d49d-405a-916f-d5da8ce3a090', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Samsung', N'Televisions Samsung', 1, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'6638cbdd-4240-4fee-8491-d7b7feb7b74e', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Sharp', N'Televisions Sharp', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'64dfed97-42a2-4e8d-a83e-d7f2b7789ca6', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'dummy7', N'Watches Timex', 4, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'ad867150-70b2-4f0f-8b32-da41172f35b5', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy3', N'Cameras Sony', 3, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'648b48c4-0a7a-4587-8c29-e50d31ffe648', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'dummy7', N'Cameras Pentax', 4, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 0)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'64941b41-66a9-46ad-b9b2-e568d2dd6c6e', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'Nokia', N'Nokia Mobiles', 4, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 400)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1efa6170-d929-4123-8eb6-e6bdc7af2eea', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'Omega', N'Watches Omega', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'4b02de18-75a2-4793-8515-e9986f002979', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Panasonic', N'Cameras Panasonic', 1, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 100)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'7f5b36ee-ee0a-4adf-834e-ec6f7e2e4146', N'215f0b52-0d52-49cd-ba2f-17b88f02c782', N'Safari', N'Safari laptop bag', 2, N'A backpack—also called bookbag, knapsack, rucksack, rucksac, pack, sackpack or backsack—is, in its simplest frameless form, a cloth sack carried on on', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'3168c485-863c-402e-b3d1-f462efbeb3ca', N'848d1bce-170b-4f7d-95d2-de75927be9ea', N'TITAN', N'Watches TITAN', 2, N'A watch is a timepiece intended to be carried or worn by a person. It is designed to keep working despite the motions caused by the person activities.', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'da19fcb3-6886-49f5-a64c-f63fd9381526', N'c2603e1b-ed13-48d9-b896-a2d9b6c45279', N'Westinghouse', N'Televisions Westinghouse', 2, N'Receivers can be external set-top boxes, or a built-in television tuner. Satellite television provides a wide range of channels and services, especial', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'9ef11898-0355-42b6-b655-fb19e9327fde', N'c24493da-9b3f-48ff-aa1d-1f4d02cd99b0', N'Bose', N'Bose Headphones', 5, N'When it comes to headphones, Audio-Technica is probably the first brand that comes to mind. Specializing in professional, DJ and studio headphones, Au', 500)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'f5a831f9-f0eb-4849-b1a6-fd7b8f54b76c', N'a38ce8b3-4077-4279-b249-81f5c3ac71a1', N'HTC', N'HTC Mobiles', 2, N'An electronic telecommunications device, often referred to as a cellular phone or cellphone. Mobile phones connect to a wireless communications networ', 200)
INSERT [dbo].[Product] ([ID], [CategoryID], [Name], [Title], [OrderLimit], [Description], [TotalVariantsSold]) VALUES (N'1a6d2121-437d-4040-aaf6-ff40f635996b', N'486dcf6c-f4ed-4490-b438-d37585f7e515', N'Sony', N'Cameras Sony', 3, N'A camera is an optical instrument for capturing still images or for recording moving images, which are stored in a physical medium such as in a digita', 300)
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'54992f0b-2e6f-47db-9711-39b665d697c8', N'type')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'570a8583-999c-416c-a474-4242e643343f', N'green')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'color')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'3f8a634c-9679-48bb-9d01-5d071d9f63d1', N'black')
INSERT [dbo].[Property] ([ID], [Name]) VALUES (N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'size')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'f6fae852-f96b-44c5-aa66-2592f34bd1b8', N'CUSTOMER')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'f54b83e7-09ff-41e2-89ad-d816063370c3', N'ADMIN')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'409cf64c-ea21-4e44-bf12-e97741ca4436', N'SELLER')
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [description]) VALUES (1, N'Processing')
INSERT [dbo].[Status] ([ID], [description]) VALUES (2, N'Delivered')
INSERT [dbo].[Status] ([ID], [description]) VALUES (3, N'Cancelled')
SET IDENTITY_INSERT [dbo].[Status] OFF
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'bfa5f8a3-1628-4e23-8b68-152f57504cb9', N'TestUser', N'$2a$10$w8nJDRYhuatCxV06tlSpD.H5j11pwL0W7hX9IlWuwqk8eHtyF20J.', N'test1234@gmail.com', N'7838236509', N'f6fae852-f96b-44c5-aa66-2592f34bd1b8')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'Test', N'$2a$10$jH24fvW1g/Nskzn9eo0oY.qO3nMjlX7MUkj.VVjrf2RoI9gCtsP5W', N'test@gmail.com', N'7838236509', N'f6fae852-f96b-44c5-aa66-2592f34bd1b8')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'9d542438-65fb-4737-8256-2001636abbd9', N'Twinkle', N'$2a$10$iakN5zYNuFYCms3Gtm0LH.L.CoOraNxydiipskmFA/A1O7qgkHIcO', N'karandhir64@yahoo.co.in', N'7838', N'409cf64c-ea21-4e44-bf12-e97741ca4436')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'3fd4cc78-8817-47b5-a48e-8d3180ae1e79', N'karan', N'$2a$10$O9TEprnXAvv0nyRFM4iFqu3MifeR5h2KUVZCpgniNeiGF8jrWLU7a', N'twinkle.kheterpal@nagarro.com', N'67', N'409cf64c-ea21-4e44-bf12-e97741ca4436')
INSERT [dbo].[User] ([ID], [Name], [HashPassword], [Email], [PhoneNumber], [RoleID]) VALUES (N'ca0af444-7c37-4dfc-8961-96e4f9926ec4', N'Twinkle', N'$2a$10$kGBWWIEzl.xFbbV3kUekG.F2MPDdZgr1rpmAGFU5Ra.WyWL5QAPFa', N'xyz@gmail.com', N'82829', N'f6fae852-f96b-44c5-aa66-2592f34bd1b8')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'fd00d855-11a1-473d-8e04-008cb5b77ce0', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'd9fe764e-d668-4adc-953b-6a67accfcac7')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'5466d766-f41b-47eb-9ecd-2855980d5bce', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'2974b9f9-771f-42fd-a172-25e853d90bcd')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'8382ebb3-6308-4b2a-ad3b-33529a9066df', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'bbda96dd-d64b-4ced-968a-0cf721c1aaad')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'88131d19-2160-4413-9162-4c10a5cc407b', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'6903ac47-6175-4496-adc5-6c8eb667df13')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'7c57a467-4776-40aa-94fd-5ad54979d7b5', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'038a7918-0398-4cfb-ba13-5325872511e3')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'8308347c-eb0b-4d95-9409-5c2269411cbf', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'e7e3a2c0-6c11-4715-ab54-2c72df7d0ac3')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'9c58381b-5461-47c7-bf03-634e6c120db9', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'65269f09-5c9e-404b-bd2f-4eabe059afcf')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'e7c10221-f065-43c1-adb3-6dbf74abf009', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'2a574500-af4b-452a-b8bf-720bfda2d094')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'846d61f9-7270-4df1-ba9a-81e901888080', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'8bc3945a-8481-4a7d-9ad5-6df3a5fe0616')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'56d1a7de-3b99-4482-93f6-aea469b3ea44', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'ac2ba395-ae0c-40fa-a1aa-e27461f2e769')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'04bbcdc7-4436-4dbe-9ae6-b6d412caeb33', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'eacc112e-6fff-4406-8e54-e4a054f307a3')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'9fcc52ae-356c-4d40-b8ae-baeeb6f1018f', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'05b9fb1b-2c19-444f-bc31-3b11882680b2')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'98e3107f-9f75-4beb-956a-c34aea4e9568', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'32a343f7-c68c-4b5e-a31b-b2155cd806b0')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'5d265ba2-b56a-4c3c-acfc-f0b03d887f66', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'4e7a2c57-a095-4214-a1fb-428436b5442a')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'27150ee0-aa0d-420f-b873-f67fb22e4e68', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'3cf461b6-ed1b-4a4b-9901-b5f263371e04')
INSERT [dbo].[UserAddressMapping] ([ID], [UserID], [AddressID]) VALUES (N'1786ed46-d41d-499c-acf7-fa162b619277', N'9e182b84-874d-4337-ad9c-1e6ce95c5c2a', N'a1d77fb5-7678-4a10-9ac7-b4cd7fa80c67')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'bc22262d-ae05-4625-9511-01afd038d4e9', N'8US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'a0f03d6f-b7c8-4569-aa3b-056d6302d487', N'red')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'42bab1c6-43ba-47c3-93d0-06021cbc1d38', N'6US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'6e14891b-6341-4df4-be34-06ad79b9c615', N'15inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'41e1b275-8e19-4143-a4b3-0e004357d35c', N'white')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'554bbd83-2787-48a2-af1e-2296f6f2f964', N'10inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'29036ce1-12a9-447c-8788-3016299dd70e', N'XLL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'4d2805e0-1062-4c72-a92f-399607ca77d0', N'green')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'ba076140-a79a-4fe1-bda0-3bb1eec345a7', N'null1')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'f9f1bc0d-cb64-4540-86d1-4212eb82f4cb', N'LARGE')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'59e3789c-d69d-4a9e-a3a0-46fe44d7f8fa', N'black')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'1eeeb60a-da92-4c08-9e90-4cbc009e73b1', N'6inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'16655154-50c5-42d2-a0f2-566649579a15', N'XL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'b3ac3971-7c6c-4ab8-a49d-57f958bf0968', N'32inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'ace98284-31fe-4230-b50a-5d8eb651d9e8', N'gold')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'c5cc7203-4817-4266-97c2-72115ca12435', N'wired')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'6168dcfa-a8ab-468a-96e9-773d5f00c53a', N'organe')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'2c99360b-9cdd-4fda-9e7a-87da22501dbb', N'7US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'79f97478-f0f9-4d2f-b896-8fd09dd8b1a7', N'10US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'f11a0794-1a21-4b9a-9acb-9303be13c98a', N'5US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'7aba586d-cb7b-4f69-b575-994c60dc2cc3', N'blue')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'ccd6f20f-63bd-4030-b731-a10489dad6f6', N'9US')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'37f9dd3d-0829-4a79-a110-ab8bd39cbe7e', N'M')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'c98be29e-85df-439f-b6c0-ad15be083dab', N'wireless')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'4255f318-c223-43a3-8365-b06589921783', N'L')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'1b9cc418-2847-4c01-9fba-b75a79b346b2', N'grey')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'd350c380-d601-4f0f-a61d-bf9079b2ad5c', N'yellowL')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'07922c30-40ed-44a5-b133-bfc33ee851a0', N'yellow')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'1784d5a8-14d7-482e-9d30-d78321ade982', N'null')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'd26bda1d-4a69-48ff-925d-e50f00bdd118', N'5inch')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'a03d97fd-ddf7-4775-a54c-e6ba770a52ea', N'S')
INSERT [dbo].[Value] ([ID], [Name]) VALUES (N'b23e3b7e-0445-4589-823e-e9f0e65fddc5', N'64inch')
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3abbfd34-408b-4483-ab3c-005dee1bbd96', N'1~1029', N'e71ad450-5a2d-479d-874e-24024f55b6e8', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1ed18c4d-7703-40db-85dd-015e7677afb4', N'1~1032', N'32226eca-78ff-4c20-8131-12509715141c', 22000, 180, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1fa3840d-4c05-459f-98ba-022db42ac647', N'1~1028', N'3b132d69-c34e-4529-b6ab-48cb5e703610', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3a9cddfe-2057-4ad8-a425-0290089cbfa2', N'5~1026', N'45271a60-787a-48be-942c-62d73d463211', 1700, 30, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'acdc17a3-a7a1-4672-8a95-05d93a10671f', N'1~1021', N'4b02de18-75a2-4793-8515-e9986f002979', 7200, 0, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'edb16adf-0d5c-4d5b-8962-0a068f2736af', N'1~1021', N'eefbfa9e-b4d0-49c6-a5db-6a626e6d1224', 2000, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'72a55ff0-a01c-471b-ab3b-0bff89b74d15', N'3', N'79a5415f-9725-4f41-b55a-59d63e9de559', 1750, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'397af1de-f6b3-408d-b08a-0c9d48499325', N'1', N'fcfdb8f2-bc22-4cb8-a63f-535e15da3f82', 1500, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7334c101-6196-4ecb-8991-0d54eda64b6f', N'8~1030', N'648b48c4-0a7a-4587-8c29-e50d31ffe648', 21300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd02d0479-f26b-4129-b183-0dc6d1b9d7f2', N'1031~1030', N'f4e6ee3e-fe24-4ac2-8250-aea6a7e25ce6', 9200, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'65852866-5868-4ad1-b101-1020585a2caa', N'8~1030', N'4b02de18-75a2-4793-8515-e9986f002979', 7200, 50, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'16f44b46-0437-4096-85dc-10af4887421e', N'1027~1026', N'5824850e-0bc5-4977-8c68-59fc29a18e94', 900, 20, 5, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'94dce791-eb4f-4068-9278-11ccbc911d50', N'3', N'49bb3ed7-eb84-447c-8149-884330446dd8', 5770, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b4aaf2c6-046d-483a-964d-12218dda34e8', N'3~1021', N'9e3c3d0a-1e8c-43b6-bcf4-8e0dc79aabe0', 700, 0, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'aaf7cf12-eb5a-4e18-97b0-18b8f8fcf452', N'1023', N'd1a90c20-cf15-4f34-a666-b73d4315db36', 7700, 50, 270, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0df98e62-f4cc-4fa2-92d0-1a405f1eb29e', N'8~1030', N'19151f47-69d1-4502-8b60-592bcb07b21e', 1520, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7bb03fdc-9de4-457c-8732-1b374a2ce60f', N'5~1030', N'98b80a0c-af36-4e7c-a0a1-adf36d0e6b41', 2200, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'727a98f4-0fcb-48ac-8f7d-1b4d154ade7f', N'1', N'3168c485-863c-402e-b3d1-f462efbeb3ca', 5700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd5ffd500-fb04-49e9-b0d1-1bb3133889e4', N'1~1029', N'25986eb5-225e-463a-97d7-05df67c8cf9f', 2000, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'14c38362-61be-4c3f-9c26-1bf61f20cc7a', N'5~1026', N'334401f5-53af-4cc2-a402-ae85211f0402', 2000, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'01541a96-ba6d-40d3-9b5d-1c2e441686d4', N'1~1021', N'9dfbb56c-5e6a-435b-9032-9b9cf8ef1ecd', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'81dd4612-cc71-46cb-ade3-1cd74bf0d2aa', N'1~1032', N'd289472f-fcf1-41c7-8a2a-7f35b24e192c', 267100, 100, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'64d65ba3-1b8c-46c0-a9c5-1ceeee2b224d', N'1', N'6be128d5-151b-451c-a01a-4091f67aee64', 2500, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'74d6fc80-dd5a-4421-b95c-1d6778b4c629', N'1022~1028', N'edfe38b8-0891-46ad-b709-5ad98853a5d6', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e3f3d5d2-6408-42c3-b5ee-21ba095e1afd', N'1~1033', N'557ec9e6-6268-49f2-96bc-50c3a072def5', 267100, 100, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4399ed88-fcb9-458e-90f3-23bedafd7e00', N'1022~1033', N'0761b857-31b5-4bee-88e9-15288a0d9218', 9900, 20, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'82426682-233e-4bf9-b9db-2453666d6e0b', N'1~1032', N'544d965a-b5f7-43ea-b2ad-9d4b2635ce86', 11000, 10, 276, 999)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4bc24b80-15b6-46b1-b836-260815e99856', N'5~1030', N'3b81c951-5fb2-41a4-b39f-436c92cdf5a8', 22100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'abd745d0-80b2-4f48-ba11-287dccf6daa8', N'1~1029', N'3b132d69-c34e-4529-b6ab-48cb5e703610', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'392ee8ac-b9cb-4cc8-88a7-2a2b55e13b5b', N'3~1021', N'9a2272c2-1966-4b46-8da0-9a4cff3a8871', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'af50695c-5e82-4de7-a245-2b6c9e06860c', N'1023', N'e8dce6b7-5efc-452b-bdae-553dd24494a8', 2750, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6c54d5be-e86a-4370-aa6f-2e0fde0c3d88', N'5~1030', N'19897da5-722b-486f-a34b-90ca7d3adf4c', 21700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e4c73c41-1488-49c1-8fb9-2e53d54f10ce', N'1~1021', N'01d62d36-4ed8-475d-8fad-0c7747bc3376', 22100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'11c4909f-84cf-4166-839f-2f80b8e75abc', N'1~1032', N'05203a7e-8f71-4cd2-8e17-330e3b9cb47e', 155300, 25, 110, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0fdc0f9a-f135-409e-abfa-316c390f0047', N'1~1029', N'f8d54c33-b21b-458b-bdb6-439de12c7312', 1500, 20, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'29d7157a-573f-40ff-a5a2-328cfc2d54a1', N'1~1032', N'4dac763b-893d-4ca4-9718-249117196da8', 22300, 10, 275, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1a355511-15a8-484d-bd8c-32c194a04102', N'1~1033', N'40f6f073-4caa-487f-95c9-4c38db1041ac', 22300, 10, 275, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7c7b6cd6-79cd-4b9b-9642-3483ea176c7c', N'1~1033', N'd289472f-fcf1-41c7-8a2a-7f35b24e192c', 267100, 100, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'20c9962d-f1e3-432b-9e3a-358281da00cf', N'3~1021', N'c3abcdc1-f347-475b-876f-6c01bc836c48', 2300, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1ee364a5-35ba-49e7-986e-35e3890a0f44', N'1~1021', N'19151f47-69d1-4502-8b60-592bcb07b21e', 1520, 0, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f2467edd-4104-4551-8b84-38c2e591cc77', N'1', N'd1a90c20-cf15-4f34-a666-b73d4315db36', 7500, 50, 270, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b03b08c0-8d9a-465d-8d9a-3ae98dc5a3ad', N'1022~1021', N'f4e6ee3e-fe24-4ac2-8250-aea6a7e25ce6', 9200, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'83b6b898-5d0e-4d52-882d-3cc8a567e219', N'1~1033', N'83f8ceb3-d49d-405a-916f-d5da8ce3a090', 55700, 50, 20, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5a7d8056-bdad-4100-9c18-3d3e56f7104e', N'8~1024', N'45271a60-787a-48be-942c-62d73d463211', 1700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'dd02326e-90ff-4d2d-868a-3d7731ef813d', N'1~1021', N'1a6d2121-437d-4040-aaf6-ff40f635996b', 2320, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cec98c70-0d7f-4198-8c54-40cf09e60712', N'5~1030', N'8cbdf832-c980-4dcb-8c00-8a3597c4ccbf', 22100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7d344e05-adef-42d6-b31b-46038d5961ad', N'3~1026', N'16481a4f-eed6-4335-9c0e-731c97c94123', 2100, 100, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7b3a42f9-b98b-4e7d-b31a-468543d70000', N'3', N'b5b911d5-22ae-41c5-9d7b-0dac3a8fc619', 1700, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'386ab9d8-8396-4292-8ecb-46dac10530cf', N'1~1028', N'9ef11898-0355-42b6-b655-fb19e9327fde', 1000, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9e68bef9-0079-4598-a2e1-489e34a87a35', N'1~1029', N'fc5e72fa-4094-4218-be0f-8735e46efa51', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3c177059-d1e5-4d53-a83b-4a68123d0b8e', N'1~1033', N'd8222622-0a27-45b0-9849-03e4fb73c94f', 51500, 50, 190, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8eae8dd6-385b-4423-a446-4abf1c712413', N'1', N'1efa6170-d929-4123-8eb6-e6bdc7af2eea', 2500, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3debb3b8-74e1-4a69-ab0a-4bdf08964f2a', N'1~1021', N'78c74cf9-771b-47a7-889c-47a9f1bcbbf3', 1200, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'62c49401-e4c0-40d8-9e42-4bfa95467655', N'5~1030', N'600525d2-2968-4562-b074-b86192b910bc', 1200, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e876e219-fa97-4c1a-a42c-4d63dbe8aa55', N'3', N'6be128d5-151b-451c-a01a-4091f67aee64', 2700, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c40bc2e8-0f43-4f0d-b1d0-4da9865a1fa1', N'1~1033', N'32226eca-78ff-4c20-8131-12509715141c', 22000, 180, 101, 999)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd0da0399-967f-4931-94c7-4f0b43240b32', N'1~1033', N'4dac763b-893d-4ca4-9718-249117196da8', 22300, 10, 275, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'45a2a00e-c59c-4a03-a1cc-4f5db5b15594', N'1~1021', N'7f5b36ee-ee0a-4adf-834e-ec6f7e2e4146', 1700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a824a5ba-0bc3-42df-b47c-4fa0182951b7', N'3~1026', N'1d379396-5b71-4bf9-91c6-832edd341a16', 1000, 10, 750, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6bd6ff18-7b6a-4275-8515-4fcdc61b17ab', N'1022~1033', N'96552f9a-e491-4159-b6d5-bf71592cbe98', 9900, 20, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd2317c37-8396-4a62-ba69-524b1d8c9b1e', N'7~1024', N'2d0beaf9-b83a-4e98-a2d7-59f3c514ca04', 2300, 10, 251, 999)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7ae4cb5c-5638-4d8c-939c-54e152150a3d', N'5~1030', N'ad867150-70b2-4f0f-8b32-da41172f35b5', 2320, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd827401e-7230-4ff3-8924-5559453c552c', N'1~1032', N'da19fcb3-6886-49f5-a64c-f63fd9381526', 235100, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'35b46a1d-5556-4e14-9616-577aefdd0ab6', N'1~1021', N'7a5a9b1f-1c69-4cad-8b9e-4cd7331b3d8b', 1000, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c382b2e7-b41e-42d0-886f-59a0464691d9', N'1~1021', N'9a2272c2-1966-4b46-8da0-9a4cff3a8871', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b0cc0859-a01f-41a7-a1e6-5b6694d39fae', N'1023', N'64dfed97-42a2-4e8d-a83e-d7f2b7789ca6', 5700, 25, 107, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cc7f1bdc-a704-4cdd-a3ca-603bb4a02aa3', N'1025~1024', N'5824850e-0bc5-4977-8c68-59fc29a18e94', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0fe1ce85-14d9-4004-bfcc-615b88f9ec46', N'3', N'3168c485-863c-402e-b3d1-f462efbeb3ca', 5770, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'bcf4a6c9-fc92-448a-b654-62d668d8ae3c', N'5~1030', N'1a6d2121-437d-4040-aaf6-ff40f635996b', 2320, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4f5d0ad5-03cf-4aa3-82af-63dfe83e376c', N'5~1030', N'a94d2698-d114-4825-9189-c7b7ab7ef54a', 21700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'8745181e-5e3e-44e3-8ba4-665a420344ac', N'1~1028', N'f44baca5-0f27-4d37-aa0a-a25fa6870203', 700, 60, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2f2c5470-7da0-4f1c-816c-6668fde6e666', N'3~1026', N'5079ea38-f225-4f69-9682-7222c6ab0b11', 700, 0, 7, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cc021a61-9040-4ee9-8333-669ef0f7d4df', N'1', N'79a5415f-9725-4f41-b55a-59d63e9de559', 1550, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'60529d01-7751-4469-99ea-69e0a7e242b6', N'1~1028', N'f8d54c33-b21b-458b-bdb6-439de12c7312', 1500, 20, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'67c20ec9-f2ee-45b2-8839-6ec5e640a8cc', N'3~1021', N'84fb6cf3-7878-4265-80f7-a1ef5fce431e', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'bcda868a-c058-4d16-8f4f-70de56e272a1', N'1023~1024', N'f7b29f0d-0664-4761-94db-583cd403e495', 1500, 0, 80, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b12a81f0-05d1-4822-9567-72cd85faf4b3', N'7~1024', N'16481a4f-eed6-4335-9c0e-731c97c94123', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'424c9300-878c-4f49-87b7-75315e2e2dec', N'1023~1024', N'f5a831f9-f0eb-4849-b1a6-fd7b8f54b76c', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'bdbbc376-0972-4d66-88bf-795dd0818037', N'3', N'1efa6170-d929-4123-8eb6-e6bdc7af2eea', 2700, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'77e283a6-158e-4166-aa25-79ab6a77ad17', N'1~1032', N'6638cbdd-4240-4fee-8491-d7b7feb7b74e', 155700, 30, 11, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e1c1a20e-dcfe-4701-92cb-7b456a9e68dd', N'1~1029', N'f44baca5-0f27-4d37-aa0a-a25fa6870203', 700, 60, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6bb8b2d5-a2f1-47ee-9946-7cac5c76ef72', N'1~1033', N'38e975bd-8970-4c00-83d6-5d92db5e3697', 11000, 10, 275, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cbacf58b-da16-4dbe-bbcc-7e36b5abb02a', N'1023~1024', N'1d379396-5b71-4bf9-91c6-832edd341a16', 1000, 10, 750, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f42a7f3e-31ab-4fbf-ad7e-7e8d3fc4dcb8', N'1~1029', N'4d026407-15ae-4e8e-bf34-7e13674eaaee', 1700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'34236180-3aab-4646-bd69-82d5409a5b16', N'3', N'1cabfd98-f757-4f34-bce8-717a160e85e3', 2700, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'908de0fd-691d-4849-a5a7-88159d177d81', N'3', N'fcfdb8f2-bc22-4cb8-a63f-535e15da3f82', 1700, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c776067b-4990-4f7e-a140-88e97ede23cb', N'5~1026', N'f7b29f0d-0664-4761-94db-583cd403e495', 1500, 0, 80, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'dc61c777-d8b7-4a2f-8b12-896923099e7a', N'5~1030', N'01d62d36-4ed8-475d-8fad-0c7747bc3376', 22100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'4b168a12-5b32-4383-8dd3-8a89f04c22d7', N'1~1032', N'83f8ceb3-d49d-405a-916f-d5da8ce3a090', 55700, 50, 20, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'33e28c7d-9be0-4ed2-a12e-8b48a5adf613', N'3~1021', N'7857ef25-d6e8-4e49-9d80-c4b8f646e1e5', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7adf84a3-3e3b-4ee9-ab09-8b64ea1224d8', N'1~1021', N'47beb2eb-22f9-4bff-8b54-32e583eb5419', 22100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'44d40317-3675-4a8e-b4ac-8d6d05c90e20', N'3~1021', N'9dfbb56c-5e6a-435b-9032-9b9cf8ef1ecd', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6ca1b678-7a32-450c-a934-8f256d7d597e', N'3~1021', N'd5eedd2a-963f-49b4-8529-d2e0655322e9', 1500, 0, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a32d56b0-a5e6-47cd-b204-8f433249e984', N'3', N'd872ba45-4a53-463e-ab46-51bf6df90592', 2700, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'04490b32-4522-4a19-88f7-90928f0ed05c', N'3~1021', N'7f5b36ee-ee0a-4adf-834e-ec6f7e2e4146', 1700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'487cd6ed-55e8-42b8-b5a5-91d8e86cc0c6', N'1023', N'338703b5-bd7a-4db8-8d4a-94a18a08a0c2', 2700, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3695a09f-78b6-4312-aae5-97c06f4a9e51', N'1', N'150c888b-585e-47e5-8df4-bd4fedc72b24', 2350, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'82a5b742-fe0c-4160-ac76-989abc4c3ae5', N'1031~1030', N'6b49513b-6c6a-4dce-b355-1ab656fea17f', 9200, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c73ad4c6-eb6f-4c83-ba2b-9c8a7570c50b', N'1~1033', N'f42e0f29-45ed-417e-a608-91db18c11051', 55700, 50, 20, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'949a5431-1df0-4984-975f-9e7e9e514ed7', N'1~1028', N'4d026407-15ae-4e8e-bf34-7e13674eaaee', 1700, 30, 101, 1000)
GO
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'a3a0958b-1abe-4a2a-a70d-9f0ed2b54b0c', N'3', N'37a6442a-8d43-4605-b3a7-4db607cb9678', 1750, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'045a78e4-3e55-40d3-b0e4-a43f44cff2c3', N'1~1033', N'6638cbdd-4240-4fee-8491-d7b7feb7b74e', 155700, 30, 11, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'3844e057-dde3-4913-8807-a62780da3251', N'1', N'efbab5fc-6145-468f-99fd-696e6d02c00e', 5300, 25, 107, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'18d8e327-db01-48fc-ab26-a6dd62f1e4b3', N'1~1028', N'25986eb5-225e-463a-97d7-05df67c8cf9f', 2000, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'74c3cd50-2cb1-4998-ad27-b09d34669813', N'1~1032', N'd8222622-0a27-45b0-9849-03e4fb73c94f', 51500, 50, 190, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'5c010c67-8343-4a97-b57c-b20970099eab', N'1~1021', N'a94d2698-d114-4825-9189-c7b7ab7ef54a', 21700, 30, 101, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6d321047-ed72-4e5e-a2a6-b3bed410b2d9', N'1~1021', N'd5eedd2a-963f-49b4-8529-d2e0655322e9', 1500, 0, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'54033a92-6822-4388-bc55-b3c11335711f', N'1023', N'1d0e2ee0-fc5f-4a38-9fbb-92b83c4a5b9c', 7700, 50, 270, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c4e5736d-0096-4355-a998-b4a80b3b9399', N'1~1028', N'fc5e72fa-4094-4218-be0f-8735e46efa51', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'00814264-6b91-4296-a17f-b7b6b8324c35', N'1~1033', N'0516c264-a819-4f37-99f0-138e39679768', 51500, 50, 190, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'59687196-73ed-4ec7-a5ae-b7ca44057373', N'1~1033', N'1b3679ad-5460-4e73-981f-362e5c02cc85', 235100, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0c627a26-ec10-4c2c-9c12-b8a60c296bf3', N'5~1030', N'78c74cf9-771b-47a7-889c-47a9f1bcbbf3', 1200, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e5d4958c-fcef-4ac5-a41a-b91f5edfbb2f', N'1~1028', N'68f06279-13f0-4feb-b68b-8beece0ce049', 2300, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'452f5589-734b-4a05-ab93-bb9755556068', N'3~1021', N'eefbfa9e-b4d0-49c6-a5db-6a626e6d1224', 2000, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cd32e2b4-83d9-4dfc-9030-bd033fb17cd7', N'8~1030', N'0d299367-2377-4314-9b71-a993694206ab', 7200, 50, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'029f66e5-8781-4d27-a306-c218de1ea427', N'1~1033', N'05203a7e-8f71-4cd2-8e17-330e3b9cb47e', 155300, 25, 110, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'17f29cd4-136d-4c8b-ba33-c4951db6b04f', N'1023', N'efbab5fc-6145-468f-99fd-696e6d02c00e', 5700, 25, 107, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'adb6e953-5e77-43b9-8c63-c5b8865b6905', N'5~1026', N'f5a831f9-f0eb-4849-b1a6-fd7b8f54b76c', 2100, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6e3eff2b-c6a8-4acb-9319-c8b22c9377d9', N'1~1021', N'f44b6b8a-ac29-4968-8309-bb60c86e6b18', 21300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'e9fd57c8-7b30-4f4d-bb71-c9b4dedc5f57', N'1023~1024', N'64941b41-66a9-46ad-b9b2-e568d2dd6c6e', 1300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'60266719-6ef1-4db9-8a7d-cab9e7716f4d', N'1', N'93afda97-3d79-415c-8b21-6e00e39530d3', 2500, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2367d0d2-2ba0-45c7-b4a9-cc0c468a092b', N'1022~1032', N'96552f9a-e491-4159-b6d5-bf71592cbe98', 9900, 20, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd5af6e36-92e2-438c-bf6c-cea5f9dc54a3', N'8~1030', N'f44b6b8a-ac29-4968-8309-bb60c86e6b18', 21300, 25, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'dfb925bc-67d9-43f1-86ea-cf48b4084f70', N'3~1026', N'64941b41-66a9-46ad-b9b2-e568d2dd6c6e', 1300, 25, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'73afedbf-2420-4cd5-829d-cf816171a8ea', N'3~1021', N'7a5a9b1f-1c69-4cad-8b9e-4cd7331b3d8b', 1000, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'7f7cf123-c634-4bb4-b82a-d0a44004c267', N'8~1024', N'334401f5-53af-4cc2-a402-ae85211f0402', 2000, 10, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'2304f2d9-558c-4586-9776-d1207193102b', N'1~1021', N'7857ef25-d6e8-4e49-9d80-c4b8f646e1e5', 2100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1a6bc1b4-55ff-4777-9c03-d3018ab15b90', N'1~1021', N'c3abcdc1-f347-475b-876f-6c01bc836c48', 2300, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0f9b448f-25a8-4683-b83c-d38c5e48a41f', N'1~1033', N'19800adf-2355-43cf-8c25-85ceab7b7e93', 155700, 30, 11, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd86c8842-b355-48cf-b153-d81691bbf379', N'1~1033', N'f71bd047-104b-4bf8-b508-4afba19c0aba', 155300, 25, 110, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'877076f4-ee20-4c73-9f9b-dd28938db2fb', N'8~1024', N'5079ea38-f225-4f69-9682-7222c6ab0b11', 700, 0, 70, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f40a45a7-7933-47fe-b393-dde7f2d41350', N'1022', N'5fa1043b-5cba-4c19-9ac2-2daf13a997d5', 5700, 20, 507, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'003908d7-18d7-4625-9e31-e25c839b705e', N'5~1030', N'4ec47227-814c-47e3-8e64-d3e12d014a32', 2200, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'f67d2ef5-d675-4b4b-9218-e4c17627bdd9', N'1023', N'93afda97-3d79-415c-8b21-6e00e39530d3', 2700, 10, 15, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'33c6bd75-ae79-4f0c-b35b-e59a3c83cf23', N'1022~1029', N'edfe38b8-0891-46ad-b709-5ad98853a5d6', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'6ab4846b-bb24-4dd3-8774-e5f856ba8fe3', N'1022~1021', N'84fb6cf3-7878-4265-80f7-a1ef5fce431e', 900, 20, 50, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'0a8a190b-c27f-49ea-9bf8-e68aeca73cf8', N'1~1033', N'329d339c-0a1f-4e29-9b96-37d9641d485f', 22000, 180, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'423d7307-3dfc-405d-b959-e8a99a7be789', N'1023', N'150c888b-585e-47e5-8df4-bd4fedc72b24', 2750, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'422d03de-4495-4436-9e35-e8b71d685565', N'1~1021', N'4ec47227-814c-47e3-8e64-d3e12d014a32', 2200, 10, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'd7af1620-5731-4d20-851d-e8bb773877e6', N'1~1033', N'544d965a-b5f7-43ea-b2ad-9d4b2635ce86', 11000, 10, 275, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'b20844d6-1a25-41d4-9083-eb50b843751c', N'1~1021', N'9e3c3d0a-1e8c-43b6-bcf4-8e0dc79aabe0', 700, 0, 200, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'9d75f2ee-1a02-4fea-b80b-eedaf9a0be32', N'1~1033', N'da19fcb3-6886-49f5-a64c-f63fd9381526', 235100, 50, 10, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'c0bfd9ac-7c15-4d47-b19c-f42a968d8ae2', N'8~1030', N'1883e9ff-2388-4170-83f4-0bca15460be9', 1520, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'cb1c5ff5-f956-4555-864e-f9fb163c6b03', N'1~1028', N'e71ad450-5a2d-479d-874e-24024f55b6e8', 2100, 100, 150, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'be9a2d44-c918-4942-a3ef-fb1c12efdd44', N'1022', N'15b88c89-0993-458f-aa9d-d4176ca32ac3', 5900, 20, 507, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'12e9ed4b-b789-4365-9747-fb5275ed05d5', N'5~1030', N'47beb2eb-22f9-4bff-8b54-32e583eb5419', 22100, 50, 100, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'1ef2f30a-682d-41db-88a5-fe7f88e434c6', N'3~1026', N'2d0beaf9-b83a-4e98-a2d7-59f3c514ca04', 2300, 10, 250, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'67a51964-0b6a-4a21-b1b7-fef59800b905', N'1~1029', N'9ef11898-0355-42b6-b655-fb19e9327fde', 1000, 10, 25, 1000)
INSERT [dbo].[Variant] ([ID], [SKU], [ProductID], [ListingPrice], [Discount], [QuantitySold], [Inventory]) VALUES (N'ac66f4c2-ad17-4eb4-9034-ffaaf90b08ad', N'1~1029', N'68f06279-13f0-4feb-b68b-8beece0ce049', 2300, 10, 25, 1000)
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b0f220d6-5844-49fa-b168-017a3eb27b12', N'949a5431-1df0-4984-975f-9e7e9e514ed7', N'https://image.shutterstock.com/image-photo/black-headphones-on-dark-wooden-450w-676210420.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e696707b-0d0c-4db3-b2b6-04e4131ed831', N'1a355511-15a8-484d-bd8c-32c194a04102', N'https://image.shutterstock.com/image-photo/man-watching-tv-streaming-movie-450w-788108023.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f37eba0d-9a1e-4fb5-8f14-06d57d94c4b9', N'e9fd57c8-7b30-4f4d-bb71-c9b4dedc5f57', N'https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b440b31b-73a2-4399-bc6c-086cb3aa610b', N'1fa3840d-4c05-459f-98ba-022db42ac647', N'https://image.shutterstock.com/image-photo/headphones-isolated-on-white-background-450w-377641141.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'de0e3e20-a3d9-410e-b73b-08d65b058469', N'77e283a6-158e-4166-aa25-79ab6a77ad17', N'https://image.shutterstock.com/image-photo/rear-view-couple-watching-movie-450w-630867182.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'86d1d39f-8b45-4445-97e3-0a221edf0eed', N'cec98c70-0d7f-4198-8c54-40cf09e60712', N'https://image.shutterstock.com/image-photo/budapest-hungary-november-30-2017-450w-1106200883.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'1074dca8-bc9f-422f-bdb2-0ab46cb5f1e0', N'cc7f1bdc-a704-4cdd-a3ca-603bb4a02aa3', N'https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'968e991f-73ed-48dc-9153-0b172f345a71', N'029f66e5-8781-4d27-a306-c218de1ea427', N'https://image.shutterstock.com/image-photo/4k-monitor-watching-smart-tv-450w-1076822465.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fb36dc61-30e5-42f5-b338-0c1b3462da5d', N'b12a81f0-05d1-4822-9567-72cd85faf4b3', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'551d2115-eb3d-4cf3-bdce-0e88591eaf4d', N'e4c73c41-1488-49c1-8fb9-2e53d54f10ce', N'https://image.shutterstock.com/image-photo/woman-using-dslr-mountain-suburb-450w-1184689315.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'1a3b400d-e52a-456c-a3a1-1010215b45f3', N'67c20ec9-f2ee-45b2-8839-6ec5e640a8cc', N'https://image.shutterstock.com/image-photo/summer-day-asian-woman-sitting-450w-1204292545.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'af16d2cf-d0cb-4e6b-8f24-1086c542cf18', N'18d8e327-db01-48fc-ab26-a6dd62f1e4b3', N'https://image.shutterstock.com/image-photo/headphones-isolated-on-white-background-450w-1206922312.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ccba8cf0-3f4c-4aed-91a7-1327fde169b9', N'7c7b6cd6-79cd-4b9b-9642-3483ea176c7c', N'https://image.shutterstock.com/image-photo/4k-monitor-isolated-on-white-450w-1182895069.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'98d55a64-3783-4328-b974-183e3b89d5a0', N'0c627a26-ec10-4c2c-9c12-b8a60c296bf3', N'https://image.shutterstock.com/image-photo/young-attractive-hipster-man-taking-450w-773318785.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c035494a-61d0-41a4-8941-1876a2edbdc6', N'45a2a00e-c59c-4a03-a1cc-4f5db5b15594', N'https://image.shutterstock.com/image-vector/vector-set-colorful-hiking-backpacks-450w-560693215.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b2de0b06-a367-47db-9a69-1876b9b4d7f6', N'6ab4846b-bb24-4dd3-8774-e5f856ba8fe3', N'https://image.shutterstock.com/image-photo/london-england-february-19-2017-450w-604559432.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2b752e14-6604-488b-8da2-18a2c8046d5b', N'67a51964-0b6a-4a21-b1b7-fef59800b905', N'https://image.shutterstock.com/image-photo/beautiful-young-woman-headphones-listening-450w-563670817.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c0b86501-28d7-47ae-acba-18c193478d64', N'dc61c777-d8b7-4a2f-8b12-896923099e7a', N'https://image.shutterstock.com/image-photo/pretty-woman-professional-photographer-dslr-450w-143794573.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd5c863f6-50fc-4cf3-8022-18ea16ce00fb', N'392ee8ac-b9cb-4cc8-88a7-2a2b55e13b5b', N'https://image.shutterstock.com/image-photo/open-red-school-backpack-on-450w-685419118.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ca3db267-d5a3-468b-b085-18f37256d1e7', N'424c9300-878c-4f49-87b7-75315e2e2dec', N'https://image.shutterstock.com/image-vector/different-ui-ux-gui-screens-450w-362295254.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3aba3578-af4c-42c2-a612-196f291544ba', N'74d6fc80-dd5a-4421-b95c-1d6778b4c629', N'https://image.shutterstock.com/image-photo/white-wireless-headphones-placed-on-450w-792861817.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e25ead81-8895-4fd8-98a3-2786c2c5abfa', N'14c38362-61be-4c3f-9c26-1bf61f20cc7a', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'24f80513-76f5-4fcd-b5c5-2968a3901fc0', N'20c9962d-f1e3-432b-9e3a-358281da00cf', N'https://image.shutterstock.com/image-photo/white-leather-backpack-isolated-on-450w-751910887.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0d6abe8f-8871-45bc-9d72-29c641e430a4', N'59687196-73ed-4ec7-a5ae-b7ca44057373', N'https://image.shutterstock.com/image-photo/woman-lying-on-sofa-watching-450w-1005705217.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c45227e2-caee-4447-9b2d-29e924dc5e2d', N'8eae8dd6-385b-4423-a446-4abf1c712413', N'https://image.shutterstock.com/image-photo/old-sport-model-vintage-rolex-450w-1191114829.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'7e3beb25-b12d-43ca-8e13-2fd7a9e2ecbe', N'7b3a42f9-b98b-4e7d-b31a-468543d70000', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215112.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ea2d07ce-a4ff-4216-819a-312949b154e9', N'cc021a61-9040-4ee9-8333-669ef0f7d4df', N'https://image.shutterstock.com/image-photo/ratchaburithailand-5-apr-2018-man-450w-1062177503.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'508925a2-d22c-48ce-9266-318c0a97a5de', N'1ef2f30a-682d-41db-88a5-fe7f88e434c6', N'https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b8a0c3be-229d-4344-8813-32dc4376c375', N'8745181e-5e3e-44e3-8ba4-665a420344ac', N'https://image.shutterstock.com/image-photo/girl-gamer-headset-pink-isolated-450w-1184133088.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b9d72508-ff03-435d-ba56-3ee7e0c93ee1', N'29d7157a-573f-40ff-a5a2-328cfc2d54a1', N'https://image.shutterstock.com/image-photo/young-woman-lying-on-carpet-450w-561873175.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'56505a7d-6473-49d7-a6c8-41293c9e1a70', N'a32d56b0-a5e6-47cd-b204-8f433249e984', N'https://image.shutterstock.com/image-photo/wrist-watch-isolated-on-white-450w-343320308.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'075f122b-e2c9-46ce-985e-4176e90b86e0', N'dd02326e-90ff-4d2d-868a-3d7731ef813d', N'https://thumb1.shutterstock.com/display_pic_with_logo/526873/313473329/stock-photo-digital-photography-workstation-modern-digital-dslr-camera-laptop-computer-and-display-313473329.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'caa7bd6e-cd06-439f-b6df-41cdcfb69896', N'3abbfd34-408b-4483-ab3c-005dee1bbd96', N'https://image.shutterstock.com/image-photo/man-on-couch-watches-movie-450w-326420261.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9de643a9-b650-4946-a43e-45468da008f2', N'af50695c-5e82-4de7-a245-2b6c9e06860c', N'https://image.shutterstock.com/image-photo/wireless-smart-watch-isolated-on-450w-788791027.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e6a66ab9-742a-4891-b3a6-458ad09e8efc', N'386ab9d8-8396-4292-8ecb-46dac10530cf', N'https://image.shutterstock.com/image-photo/beautiful-brunette-girl-headphones-listening-450w-1167175024.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ef2f5a05-6882-45de-abd1-4a398b4bf5de', N'c73ad4c6-eb6f-4c83-ba2b-9c8a7570c50b', N'https://image.shutterstock.com/image-photo/multi-generation-family-watching-tv-450w-401695120.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f89d3ad8-883a-43df-a83b-4a557fa72320', N'422d03de-4495-4436-9e35-e8b71d685565', N'https://image.shutterstock.com/image-photo/portrait-photographer-covering-her-face-450w-763047211.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'61bdb4bc-c2e5-42c7-b223-4dc486fb1e3b', N'4b168a12-5b32-4383-8dd3-8a89f04c22d7', N'https://image.shutterstock.com/image-photo/rear-view-asian-couple-watching-450w-1095818504.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e03853bd-91cb-4482-bdfb-4dd575d4828c', N'f2467edd-4104-4551-8b84-38c2e591cc77', N'https://image.shutterstock.com/image-photo/black-fitness-watch-activity-tracker-450w-1013750869.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a179e69f-7014-40bf-bbff-4e0935683d2f', N'01541a96-ba6d-40d3-9b5d-1c2e441686d4', N'https://image.shutterstock.com/image-vector/vector-set-colorful-woman-backpacks-450w-560711107.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'7987d308-521c-417e-83fc-4e51b60f53bc', N'd02d0479-f26b-4129-b183-0dc6d1b9d7f2', N'https://image.shutterstock.com/image-photo/camera-on-hand-landscape-photographer-450w-683705926.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c6d82b13-e20f-415d-87e3-4ebbd830cc68', N'c0bfd9ac-7c15-4d47-b19c-f42a968d8ae2', N'https://image.shutterstock.com/image-photo/dslr-camera-shot-isolated-gray-450w-583243450.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'112f5bc3-4842-4914-9344-4ebd6130d59b', N'cb1c5ff5-f956-4555-864e-f9fb163c6b03', N'https://image.shutterstock.com/image-illustration/white-headphone-isolated-on-light-450w-632746328.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4ba590d2-2af1-4077-aa86-4edcfa76a958', N'2304f2d9-558c-4586-9776-d1207193102b', N'https://image.shutterstock.com/image-photo/handsome-young-caucasian-man-packing-450w-736797694.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0e5cc317-aeb3-444f-ad03-523edd0f5346', N'81dd4612-cc71-46cb-ade3-1cd74bf0d2aa', N'https://image.shutterstock.com/image-vector/black-led-tv-television-screen-450w-713201665.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'42f2527f-7991-4868-accc-524df142217a', N'17f29cd4-136d-4c8b-ba33-c4951db6b04f', N'https://image.shutterstock.com/image-photo/antique-gold-pocket-watch-lies-450w-1152253118.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ce7ced2d-1d14-475b-beb1-535f9038a7cc', N'f42a7f3e-31ab-4fbf-ad7e-7e8d3fc4dcb8', N'https://image.shutterstock.com/image-illustration/3d-rendering-white-headphones-isolated-450w-1036270927.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'56864918-8196-4c4e-b54a-578929b04289', N'c382b2e7-b41e-42d0-886f-59a0464691d9', N'https://image.shutterstock.com/image-photo/drawstring-pack-isolated-on-white-450w-1173262708.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6b182653-7e97-47b7-bac9-57a079ede328', N'5a7d8056-bdad-4100-9c18-3d3e56f7104e', N'https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'43387956-b4f0-49e7-8576-5b78acd7a92a', N'74c3cd50-2cb1-4998-ad27-b09d34669813', N'https://image.shutterstock.com/image-photo/young-woman-sitting-on-couch-450w-630849437.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'42786977-8703-4648-b66b-5cb7c90f5386', N'6e3eff2b-c6a8-4acb-9319-c8b22c9377d9', N'https://image.shutterstock.com/image-photo/groningen-netherlands-august-19-2018-450w-1171028293.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'929483b6-d496-407f-a4ca-5e2708269633', N'6bb8b2d5-a2f1-47ee-9946-7cac5c76ef72', N'https://image.shutterstock.com/image-photo/4k-monitor-isolated-on-white-450w-357968483.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b82d5f9b-21e9-4bd1-afea-6042be18102f', N'bcda868a-c058-4d16-8f4f-70de56e272a1', N'https://image.shutterstock.com/image-photo/hand-holding-smartphone-drawn-media-450w-248776741.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'713b40ba-7999-4d3c-8418-62f6b2916a75', N'cd32e2b4-83d9-4dfc-9030-bd033fb17cd7', N'https://image.shutterstock.com/image-photo/varna-bulgaria-september-24-2016-450w-489971260.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3f7d5006-f853-42c4-8572-65eca7a59dca', N'1ee364a5-35ba-49e7-986e-35e3890a0f44', N'https://image.shutterstock.com/image-photo/young-asian-cute-artist-woman-450w-1170637762.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ecf825de-784e-45d9-af37-694314ffc0d4', N'72a55ff0-a01c-471b-ab3b-0bff89b74d15', N'https://image.shutterstock.com/image-photo/luxury-watches-450w-518569816.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0e356aaf-e7ee-451f-bce0-6ba78512cdab', N'33e28c7d-9be0-4ed2-a12e-8b48a5adf613', N'https://image.shutterstock.com/image-photo/hipster-yellow-backpack-map-closeup-450w-582264496.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ee0dc789-1a2c-4b1d-bdc5-6cb13eb371a2', N'acdc17a3-a7a1-4672-8a95-05d93a10671f', N'https://image.shutterstock.com/image-photo/abstract-dslr-camera-on-railway-450w-1165395928.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bbd73ec0-8ff1-4f3c-9cac-6cbbfd4e2ce1', N'04490b32-4522-4a19-88f7-90928f0ed05c', N'https://image.shutterstock.com/image-photo/back-school-happy-time-apple-450w-679992592.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'170e11fe-af46-4d5f-9df3-7067953ae559', N'64d65ba3-1b8c-46c0-a9c5-1ceeee2b224d', N'https://image.shutterstock.com/image-illustration/handwatch-icon-set-color-outline-450w-1165529206.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5819fbeb-2554-4dd2-95e4-72f58e08518c', N'12e9ed4b-b789-4365-9747-fb5275ed05d5', N'https://image.shutterstock.com/image-photo/budapest-hungary-november-30-2017-450w-1106200883.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'98506f14-234b-4fc9-bce5-72fa8508250f', N'2f2c5470-7da0-4f1c-816c-6668fde6e666', N'https://image.shutterstock.com/image-photo/mobile-phone-womans-hand-night-450w-157563671.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ac3887b8-a0b0-4f26-a1cf-77d7d425df5e', N'adb6e953-5e77-43b9-8c63-c5b8865b6905', N'https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8b064567-76e1-4e21-92c8-7836e2a6aeee', N'34236180-3aab-4646-bd69-82d5409a5b16', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215058.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a6ae7f30-8a8d-4276-a074-79fbf26aaf62', N'c40bc2e8-0f43-4f0d-b1d0-4da9865a1fa1', N'https://image.shutterstock.com/image-photo/young-couple-sitting-on-sofa-450w-1016394424.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9ca93c53-db97-4885-bb69-7c00083c3931', N'3debb3b8-74e1-4a69-ab0a-4bdf08964f2a', N'https://image.shutterstock.com/image-photo/dslr-camera-isolated-on-black-450w-1181503345.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a2926876-3c02-4004-b775-7ce0500a6119', N'1a6bc1b4-55ff-4777-9c03-d3018ab15b90', N'https://image.shutterstock.com/image-photo/natural-leather-backbag-isolated-on-450w-121743586.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'cdab9875-7655-4087-bfb9-7fd2ebb90ff2', N'f67d2ef5-d675-4b4b-9218-e4c17627bdd9', N'https://image.shutterstock.com/image-photo/woman-watch-gold-white-color-450w-575248648.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'18b0c04f-a017-44ec-afbb-8608ae125d5e', N'6c54d5be-e86a-4370-aa6f-2e0fde0c3d88', N'https://image.shutterstock.com/image-photo/nature-photography-concepts-professional-photographer-450w-1095016859.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'19b55b55-b245-499c-8d23-87a3082aea2f', N'd7af1620-5731-4d20-851d-e8bb773877e6', N'https://image.shutterstock.com/image-photo/4k-monitor-isolated-on-white-450w-357968483.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'72f55076-243a-4945-9d22-87fbbc49ab89', N'b03b08c0-8d9a-465d-8d9a-3ae98dc5a3ad', N'https://image.shutterstock.com/image-photo/burgas-bulgaria-may-4-2018-450w-1138310630.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'67dc493e-a356-454e-9b1f-887c002c5f6c', N'f40a45a7-7933-47fe-b393-dde7f2d41350', N'https://image.shutterstock.com/image-photo/bangkokthailand-9-apr-2018-woman-450w-1064714651.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6d1e817b-c8f4-45cd-8dd2-895fa2bb3414', N'a3a0958b-1abe-4a2a-a70d-9f0ed2b54b0c', N'https://image.shutterstock.com/image-photo/luxury-watches-450w-518569816.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8530d206-440c-40c0-b321-8f93803b8cad', N'7f7cf123-c634-4bb4-b82a-d0a44004c267', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4a622ee5-8981-455c-ad86-8fdaf7f6f012', N'3695a09f-78b6-4312-aae5-97c06f4a9e51', N'https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1181529889.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ad110050-8fae-4f75-bbd1-9134934b93f4', N'aaf7cf12-eb5a-4e18-97b0-18b8f8fcf452', N'https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1015451965.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'c9548532-2a07-4210-a71d-91a9927e02e3', N'33c6bd75-ae79-4f0c-b35b-e59a3c83cf23', N'https://image.shutterstock.com/image-photo/blue-headphones-isolated-on-white-450w-732459253.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'153255cf-3ffb-46d6-9180-91bfde43cbe3', N'0fe1ce85-14d9-4004-bfcc-615b88f9ec46', N'https://image.shutterstock.com/image-photo/mens-wrist-watch-450w-655935412.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ae1f8e06-f502-45e7-b9ef-9559aa6c639a', N'003908d7-18d7-4625-9e31-e25c839b705e', N'https://image.shutterstock.com/image-photo/antalya-turkey-june-29-2017-450w-678602104.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'51c1f9f9-860a-4c96-b7a1-97865329d84a', N'0f9b448f-25a8-4683-b83c-d38c5e48a41f', N'https://image.shutterstock.com/image-photo/television-sunrise-image-isolated-on-450w-725471698.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5ffeb1bb-4971-426a-96f7-9d1a730fe10d', N'3a9cddfe-2057-4ad8-a425-0290089cbfa2', N'https://image.shutterstock.com/image-vector/modern-lock-screen-ui-ux-450w-360826970.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'61aa5268-9561-4466-9181-9e7d0876a06e', N'd827401e-7230-4ff3-8924-5559453c552c', N'https://image.shutterstock.com/image-vector/retro-television-set-front-perspective-450w-662280256.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3a547a22-9091-43ba-97d7-a1662d7815e4', N'6ca1b678-7a32-450c-a934-8f256d7d597e', N'https://image.shutterstock.com/image-photo/black-backpack-isolated-over-white-450w-545294848.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5321b37f-26d5-4d45-a104-a212cf169d77', N'0a8a190b-c27f-49ea-9bf8-e68aeca73cf8', N'https://image.shutterstock.com/image-photo/young-couple-sitting-on-sofa-450w-1016394424.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'199e1d81-2844-4263-ba43-a28eb05be48c', N'abd745d0-80b2-4f48-ba11-287dccf6daa8', N'https://image.shutterstock.com/image-photo/headphones-isolated-on-white-close-450w-502911355.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b4c029b8-6380-4ede-b4b2-a46916fe40c6', N'65852866-5868-4ad1-b101-1020585a2caa', N'https://image.shutterstock.com/image-photo/varna-bulgaria-september-24-2016-450w-489971260.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9b4600cb-c54e-4266-a3b4-a53aa338beb2', N'1ed18c4d-7703-40db-85dd-015e7677afb4', N'https://image.shutterstock.com/image-photo/young-woman-sitting-on-sofa-450w-767180002.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'faa70101-8f89-4cc9-965c-a8d063846c92', N'e3f3d5d2-6408-42c3-b5ee-21ba095e1afd', N'https://image.shutterstock.com/image-photo/4k-monitor-isolated-on-white-450w-1182895069.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b6db2887-1aaa-46c3-9586-ab95f72dfb88', N'edb16adf-0d5c-4d5b-8962-0a068f2736af', N'https://image.shutterstock.com/image-photo/map-backpack-mobile-phone-earphone-450w-785154337.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'1c1f22e9-3daa-4e96-a446-ac8e14bc7134', N'3c177059-d1e5-4d53-a83b-4a68123d0b8e', N'https://image.shutterstock.com/image-photo/television-remote-control-hand-mockup-450w-1177732651.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'742975eb-7c94-497a-945c-ad812e2f26e3', N'e876e219-fa97-4c1a-a42c-4d63dbe8aa55', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215058.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'163c6837-62c6-4227-8a54-ae9704fe6da1', N'60529d01-7751-4469-99ea-69e0a7e242b6', N'https://image.shutterstock.com/image-photo/smiling-girl-relaxing-home-she-450w-393974911.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e2500340-ab2c-460f-9b2a-b093d11d0e0c', N'cbacf58b-da16-4dbe-bbcc-7e36b5abb02a', N'https://image.shutterstock.com/image-photo/businessman-using-mobile-device-check-450w-281485004.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f3154825-d09f-4e3d-8df0-b125156c9ae7', N'7adf84a3-3e3b-4ee9-ab09-8b64ea1224d8', N'https://image.shutterstock.com/image-photo/professional-digital-equipment-recording-video-450w-692685511.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ab54bf4d-538a-4c73-ac3a-b33336c75836', N'44d40317-3675-4a8e-b4ac-8d6d05c90e20', N'https://image.shutterstock.com/image-photo/hiker-woman-backpack-sleeping-bag-450w-296826152.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3ff1521e-e47e-45bf-8c22-b430e3b7a659', N'e1c1a20e-dcfe-4701-92cb-7b456a9e68dd', N'https://image.shutterstock.com/image-illustration/black-headphones-isolated-on-white-450w-584694106.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'1a8332c6-7d11-4fe4-a797-b4c33fd87e15', N'00814264-6b91-4296-a17f-b7b6b8324c35', N'https://image.shutterstock.com/image-photo/television-remote-control-hand-mockup-450w-1177732651.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a9e6022d-e938-4f64-ae4a-b4fe8860e607', N'd2317c37-8396-4a62-ba69-524b1d8c9b1e', N'https://image.shutterstock.com/image-vector/smartphone-mobile-phone-isolated-realistic-450w-703670326.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'872e81ce-00a3-4336-ba50-b6576a6cd7e2', N'60266719-6ef1-4db9-8a7d-cab9e7716f4d', N'https://image.shutterstock.com/image-photo/businessman-checking-time-watch-450w-381472021.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'cf4fe724-d44c-4795-bea3-b75107787c2d', N'73afedbf-2420-4cd5-829d-cf816171a8ea', N'https://image.shutterstock.com/image-photo/back-schoolbackpack-school-supplies-empty-450w-1107938438.jpg')
GO
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'f761d072-0aa6-4201-94f2-b996591b4230', N'877076f4-ee20-4c73-9f9b-dd28938db2fb', N'https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3aa77c24-304a-4478-83ae-bbdbe47a0fa3', N'a824a5ba-0bc3-42df-b47c-4fa0182951b7', N'https://image.shutterstock.com/image-photo/woman-using-her-mobile-phone-450w-160559990.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'bc49e677-f3a3-4bc7-abb0-bc2f2a4a189a', N'7334c101-6196-4ecb-8991-0d54eda64b6f', N'https://image.shutterstock.com/image-photo/happy-woman-on-vacation-photographing-450w-284581649.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'21b8688c-1c33-46cd-9a13-be799dd97a91', N'4bc24b80-15b6-46b1-b836-260815e99856', N'https://image.shutterstock.com/image-photo/pretty-woman-professional-photographer-dslr-450w-143794573.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'35de9339-1437-4ea5-808a-beb9343f86a0', N'9d75f2ee-1a02-4fea-b80b-eedaf9a0be32', N'https://image.shutterstock.com/image-photo/woman-lying-on-sofa-watching-450w-1005705217.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6d50b821-aa66-4620-9367-bf82cd491065', N'b0cc0859-a01f-41a7-a1e6-5b6694d39fae', N'https://image.shutterstock.com/image-photo/antique-gold-pocket-watch-lies-450w-1152253118.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'206a0006-6211-4c44-89d1-c0c2382063b9', N'7d344e05-adef-42d6-b31b-46038d5961ad', N'https://image.shutterstock.com/image-vector/elegant-smartphone-colorful-screen-icons-450w-644259847.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8a42960c-4dd1-4acc-8abd-c144088ef2c0', N'3844e057-dde3-4913-8807-a62780da3251', N'https://image.shutterstock.com/image-photo/elegant-outfit-closeup-brown-wrist-450w-370222298.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'378eb2c9-20a4-4ecb-a237-c48e3b5efeab', N'd5af6e36-92e2-438c-bf6c-cea5f9dc54a3', N'https://image.shutterstock.com/image-photo/happy-woman-on-vacation-photographing-450w-284581649.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd68c8882-7a3b-43fb-bd68-c4a3ce69a2a1', N'2367d0d2-2ba0-45c7-b4a9-cc0c468a092b', N'https://image.shutterstock.com/image-photo/cozy-interior-living-room-tv-450w-762819520.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fe4d57a0-b5c0-449b-98dd-c80907855442', N'62c49401-e4c0-40d8-9e42-4bfa95467655', N'https://image.shutterstock.com/image-photo/young-attractive-hipster-man-taking-450w-773318785.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd89ac9f8-8ffd-45bd-b2ea-c8b6281312b8', N'045a78e4-3e55-40d3-b0e4-a43f44cff2c3', N'https://image.shutterstock.com/image-photo/television-sunrise-image-isolated-on-450w-725471698.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'ccfd72ae-867e-4792-85a3-ccc511ae94c9', N'dfb925bc-67d9-43f1-86ea-cf48b4084f70', N'https://image.shutterstock.com/image-vector/mobile-phone-vector-450w-119386792.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'5430e027-b300-448a-9479-cd2ccdb7f39b', N'7ae4cb5c-5638-4d8c-939c-54e152150a3d', N'https://image.shutterstock.com/image-photo/photo-old-dslr-camera-on-450w-1026444436.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4b859f74-cace-419a-87e4-ce60bb093b5f', N'c4e5736d-0096-4355-a998-b4a80b3b9399', N'https://image.shutterstock.com/image-photo/pretty-girl-listening-music-her-450w-438996334.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'3c21fe74-8b46-44d1-81f4-d1c6d90f446c', N'452f5589-734b-4a05-ab93-bb9755556068', N'https://image.shutterstock.com/image-photo/back-school-first-day-education-450w-730273969.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'43edc72a-33eb-4b4b-a03d-d339d08a6a02', N'5c010c67-8343-4a97-b57c-b20970099eab', N'https://image.shutterstock.com/image-photo/digital-video-camera-gimbal-stabilization-450w-1086230840.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'13ba1026-5fca-4859-bf8c-d4fd55f4a47c', N'6bd6ff18-7b6a-4275-8515-4fcdc61b17ab', N'https://image.shutterstock.com/image-photo/4k-television-sky-monitor-landscape-450w-410515291.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'33b99743-a968-451c-9dea-d6150060dda9', N'727a98f4-0fcb-48ac-8f7d-1b4d154ade7f', N'https://image.shutterstock.com/image-photo/closeup-designer-watch-on-businessman-450w-383220994.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fb4b2880-4049-45f4-9c8a-d66bb5a5f044', N'bdbbc376-0972-4d66-88bf-795dd0818037', N'https://image.shutterstock.com/image-photo/wrist-watch-isolated-on-white-450w-343320308.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a756462b-c812-46cc-ac0b-d6b555f4c70b', N'94dce791-eb4f-4068-9278-11ccbc911d50', N'https://image.shutterstock.com/image-photo/mens-wrist-watch-450w-655935412.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'e8529389-c753-48aa-9cbc-d70933ffe598', N'7bb03fdc-9de4-457c-8732-1b374a2ce60f', N'https://image.shutterstock.com/image-photo/antalya-turkey-june-29-2017-450w-678602104.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'8723a298-7c24-4735-8475-d7a7a98293e4', N'83b6b898-5d0e-4d52-882d-3cc8a567e219', N'https://image.shutterstock.com/image-photo/multi-generation-family-watching-tv-450w-401695120.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2fb8136e-261b-4cee-96f7-d7fd3877f9ab', N'd86c8842-b355-48cf-b153-d81691bbf379', N'https://image.shutterstock.com/image-photo/4k-monitor-watching-smart-tv-450w-1076822465.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4dbeea9d-d1a3-489c-86f3-d82c2fcca628', N'54033a92-6822-4388-bc55-b3c11335711f', N'https://image.shutterstock.com/image-photo/stylish-mechanical-watch-on-arm-450w-1015451965.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6d0212c7-b3dd-4496-b86b-d83c5a6f7b16', N'4f5d0ad5-03cf-4aa3-82af-63dfe83e376c', N'https://image.shutterstock.com/image-photo/nature-photography-concepts-professional-photographer-450w-1095016859.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'300477f3-7bc4-4437-bdf5-d86715f54c8e', N'bcf4a6c9-fc92-448a-b654-62d668d8ae3c', N'https://image.shutterstock.com/image-photo/photo-old-dslr-camera-on-450w-1026444436.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'6bfff65c-68a0-40a3-96a9-d9a83e01a0ec', N'6d321047-ed72-4e5e-a2a6-b3bed410b2d9', N'https://image.shutterstock.com/image-vector/vector-set-colorful-touristic-backpacks-450w-560710138.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9fca25fa-0421-4f18-9da9-dad780deed04', N'e5d4958c-fcef-4ac5-a41a-b91f5edfbb2f', N'https://image.shutterstock.com/image-vector/vector-headphones-icon-flat-design-450w-350822219.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'9cc48e59-37f0-4429-855e-db19c59bd30f', N'11c4909f-84cf-4166-839f-2f80b8e75abc', N'https://image.shutterstock.com/image-photo/2-remote-control-satellite-receiver-450w-1176728536.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'566f6481-07d9-4c1a-9251-dc6b10b352aa', N'd5ffd500-fb04-49e9-b0d1-1bb3133889e4', N'https://image.shutterstock.com/image-photo/black-headphones-on-dark-wooden-450w-676210375.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'0092a04c-2bb2-4e60-92b8-dee440484e4b', N'82426682-233e-4bf9-b9db-2453666d6e0b', N'https://image.shutterstock.com/image-photo/young-woman-sitting-on-couch-450w-582987268.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'46280ab3-406f-400b-9f39-e1dd88e517ed', N'9e68bef9-0079-4598-a2e1-489e34a87a35', N'https://thumb9.shutterstock.com/display_pic_with_logo/168808172/786005032/stock-photo--d-rendering-headphones-isolated-on-white-background-786005032.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4f04eb8b-9fe3-4dbb-a472-f1ebd0f52e9e', N'487cd6ed-55e8-42b8-b5a5-91d8e86cc0c6', N'https://image.shutterstock.com/image-photo/woman-watch-gold-white-color-450w-575248648.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b01e5b51-6e5f-4145-8da5-f2eaa82ccf2f', N'82a5b742-fe0c-4160-ac76-989abc4c3ae5', N'https://image.shutterstock.com/image-photo/camera-on-hand-landscape-photographer-450w-683705926.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'fd40e1b3-58c6-4115-b11f-f3573a5f1e5f', N'35b46a1d-5556-4e14-9616-577aefdd0ab6', N'https://image.shutterstock.com/image-photo/vintage-backpack-on-natural-background-450w-1150555643.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'2a3d7f9a-8bdb-4328-9254-f39494bd8093', N'908de0fd-691d-4849-a5a7-88159d177d81', N'https://image.shutterstock.com/image-photo/stylish-watch-on-woman-hand-450w-1103215112.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'735d88b6-d838-44ad-908f-f51ed6663d09', N'4399ed88-fcb9-458e-90f3-23bedafd7e00', N'https://image.shutterstock.com/image-photo/4k-television-sky-monitor-landscape-450w-410515291.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'770252ce-7175-47ac-b787-f525aa950cfb', N'b4aaf2c6-046d-483a-964d-12218dda34e8', N'https://image.shutterstock.com/image-photo/school-bag-backpack-450w-282686744.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'22351729-5647-4257-9f8d-f533f1cbd5f0', N'ac66f4c2-ad17-4eb4-9034-ffaaf90b08ad', N'https://image.shutterstock.com/image-photo/yellow-headphones-on-background-music-450w-1097195234.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'd90d1f70-ab3a-43f4-985a-f59bff906d50', N'be9a2d44-c918-4942-a3ef-fb1c12efdd44', N'https://image.shutterstock.com/image-photo/luxury-watches-450w-518569825.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'60c626c7-efa1-4e9c-86e7-f621c05c5cdb', N'423d7307-3dfc-405d-b959-e8a99a7be789', N'https://image.shutterstock.com/image-photo/wireless-smart-watch-isolated-on-450w-788791027.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'b62cc76a-b080-4c6a-98e4-f8a0ced45047', N'397af1de-f6b3-408d-b08a-0c9d48499325', N'https://image.shutterstock.com/image-photo/closeup-toned-shot-male-watches-450w-267798710.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'4825e506-8e15-42fe-bd22-f93066c3d015', N'd0da0399-967f-4931-94c7-4f0b43240b32', N'https://image.shutterstock.com/image-photo/man-watching-tv-streaming-movie-450w-788108023.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'774a51c5-924a-48c0-abe6-fa9f557fa325', N'0df98e62-f4cc-4fa2-92d0-1a405f1eb29e', N'https://image.shutterstock.com/image-photo/dslr-camera-shot-isolated-gray-450w-583243450.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'35476891-95e6-4568-9842-fac197cc9e58', N'0fdc0f9a-f135-409e-abfa-316c390f0047', N'https://image.shutterstock.com/image-illustration/turquoise-wireless-headphones-isolated-on-450w-555398035.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'a23e90c3-5c23-46a0-9736-fbb674dcd599', N'16f44b46-0437-4096-85dc-10af4887421e', N'https://image.shutterstock.com/image-vector/design-mobile-application-ui-ux-450w-1069313000.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'61d6cf35-3121-4c17-97f6-fd10eff7a0ad', N'c776067b-4990-4f7e-a140-88e97ede23cb', N'https://image.shutterstock.com/image-photo/female-hands-hold-mobile-banking-450w-564088018.jpg')
INSERT [dbo].[VariantImage] ([ID], [VariantID], [ImageURL]) VALUES (N'45346ec1-d9b1-434f-9643-fed2999dbac6', N'b20844d6-1a25-41d4-9083-eb50b843751c', N'https://image.shutterstock.com/image-vector/vector-set-icons-military-camouflage-450w-560913790.jpg')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] ON 

INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'59e3789c-d69d-4a9e-a3a0-46fe44d7f8fa')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (2, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'f9f1bc0d-cb64-4540-86d1-4212eb82f4cb')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (3, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'7aba586d-cb7b-4f69-b575-994c60dc2cc3')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (4, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'bc22262d-ae05-4625-9511-01afd038d4e9')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (5, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'a0f03d6f-b7c8-4569-aa3b-056d6302d487')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (6, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'79f97478-f0f9-4d2f-b896-8fd09dd8b1a7')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (7, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'1b9cc418-2847-4c01-9fba-b75a79b346b2')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (8, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'41e1b275-8e19-4143-a4b3-0e004357d35c')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (9, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'f11a0794-1a21-4b9a-9acb-9303be13c98a')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (10, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'6168dcfa-a8ab-468a-96e9-773d5f00c53a')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (11, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'42bab1c6-43ba-47c3-93d0-06021cbc1d38')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (12, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'2c99360b-9cdd-4fda-9e7a-87da22501dbb')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (13, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'07922c30-40ed-44a5-b133-bfc33ee851a0')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (14, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'ccd6f20f-63bd-4030-b731-a10489dad6f6')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (15, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'37f9dd3d-0829-4a79-a110-ab8bd39cbe7e')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (16, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'4255f318-c223-43a3-8365-b06589921783')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (17, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'a03d97fd-ddf7-4775-a54c-e6ba770a52ea')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (18, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'16655154-50c5-42d2-a0f2-566649579a15')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (19, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'29036ce1-12a9-447c-8788-3016299dd70e')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (20, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'd350c380-d601-4f0f-a61d-bf9079b2ad5c')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (21, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'4d2805e0-1062-4c72-a92f-399607ca77d0')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (22, N'570a8583-999c-416c-a474-4242e643343f', N'7aba586d-cb7b-4f69-b575-994c60dc2cc3')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (23, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'1784d5a8-14d7-482e-9d30-d78321ade982')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (24, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'ba076140-a79a-4fe1-bda0-3bb1eec345a7')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1021, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'6e14891b-6341-4df4-be34-06ad79b9c615')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1022, N'3f8a634c-9679-48bb-9d01-5d071d9f63d1', N'7aba586d-cb7b-4f69-b575-994c60dc2cc3')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1023, N'7e6ee63a-ed50-4c24-9dd4-554cdf0e82bf', N'ace98284-31fe-4230-b50a-5d8eb651d9e8')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1024, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'd26bda1d-4a69-48ff-925d-e50f00bdd118')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1025, N'3f8a634c-9679-48bb-9d01-5d071d9f63d1', N'1b9cc418-2847-4c01-9fba-b75a79b346b2')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1026, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'1eeeb60a-da92-4c08-9e90-4cbc009e73b1')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1027, N'3f8a634c-9679-48bb-9d01-5d071d9f63d1', N'a0f03d6f-b7c8-4569-aa3b-056d6302d487')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1028, N'54992f0b-2e6f-47db-9711-39b665d697c8', N'c5cc7203-4817-4266-97c2-72115ca12435')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1029, N'54992f0b-2e6f-47db-9711-39b665d697c8', N'c98be29e-85df-439f-b6c0-ad15be083dab')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1030, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'554bbd83-2787-48a2-af1e-2296f6f2f964')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1031, N'3f8a634c-9679-48bb-9d01-5d071d9f63d1', N'41e1b275-8e19-4143-a4b3-0e004357d35c')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1032, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'b3ac3971-7c6c-4ab8-a49d-57f958bf0968')
INSERT [dbo].[VariantPropertyValue] ([ID], [PropertyID], [ValueID]) VALUES (1033, N'6408f79c-963b-46a9-ac12-8d73b85867bf', N'b23e3b7e-0445-4589-823e-e9f0e65fddc5')
SET IDENTITY_INSERT [dbo].[VariantPropertyValue] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 12-12-2018 17:51:27 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CartVariantMapping_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[CartVariantMapping] ADD  CONSTRAINT [default_CCartVariantMapping_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [default_ProductsSold]  DEFAULT ((0)) FOR [ProductsSold]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderDate]  DEFAULT (CONVERT([varchar](19),getdate(),(120))) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_DeliveryDate]  DEFAULT (CONVERT([varchar](19),getdate()+(5),(120))) FOR [DeliveryDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [default_OrderCancelled]  DEFAULT ('N') FOR [isCancelled]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_SellingPrice]  DEFAULT ((0)) FOR [SellingPrice]
GO
ALTER TABLE [dbo].[OrderPlacedVariants] ADD  CONSTRAINT [default_OrderPlacedVariants_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [default_TotalVariantsSold]  DEFAULT ((0)) FOR [TotalVariantsSold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_ListingPrice]  DEFAULT ((0)) FOR [ListingPrice]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_QuantitySold]  DEFAULT ((0)) FOR [QuantitySold]
GO
ALTER TABLE [dbo].[Variant] ADD  CONSTRAINT [default_Inventory]  DEFAULT ((0)) FOR [Inventory]
GO
ALTER TABLE [dbo].[VariantImage] ADD  CONSTRAINT [default_ImageURL]  DEFAULT ('https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png') FOR [ImageURL]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Cart] FOREIGN KEY([CartID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Cart]
GO
ALTER TABLE [dbo].[CartVariantMapping]  WITH CHECK ADD  CONSTRAINT [FK_CartVariantMapping_Variant] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[CartVariantMapping] CHECK CONSTRAINT [FK_CartVariantMapping_Variant]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_OrderAddressID] FOREIGN KEY([DeliveryAddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_OrderAddressID]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_statusID] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_statusID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_OrderID]
GO
ALTER TABLE [dbo].[OrderPlaced]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlaced_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[OrderPlaced] CHECK CONSTRAINT [FK_OrderPlaced_UserID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID] FOREIGN KEY([OrderPlacedID])
REFERENCES [dbo].[OrderPlaced] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_OrderPlacedID]
GO
ALTER TABLE [dbo].[OrderPlacedVariants]  WITH CHECK ADD  CONSTRAINT [FK_OrderPlacedVariants_VariantID] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[OrderPlacedVariants] CHECK CONSTRAINT [FK_OrderPlacedVariants_VariantID]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_Address]
GO
ALTER TABLE [dbo].[UserAddressMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserAddressMapping_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserAddressMapping] CHECK CONSTRAINT [FK_UserAddressMapping_User]
GO
ALTER TABLE [dbo].[Variant]  WITH CHECK ADD  CONSTRAINT [FK_Variant] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Variant] CHECK CONSTRAINT [FK_Variant]
GO
ALTER TABLE [dbo].[VariantImage]  WITH CHECK ADD  CONSTRAINT [FK_VariantImage] FOREIGN KEY([VariantID])
REFERENCES [dbo].[Variant] ([ID])
GO
ALTER TABLE [dbo].[VariantImage] CHECK CONSTRAINT [FK_VariantImage]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_PropertyID] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_PropertyID]
GO
ALTER TABLE [dbo].[VariantPropertyValue]  WITH CHECK ADD  CONSTRAINT [FK_VariantPropertyValue_ValueID] FOREIGN KEY([ValueID])
REFERENCES [dbo].[Value] ([ID])
GO
ALTER TABLE [dbo].[VariantPropertyValue] CHECK CONSTRAINT [FK_VariantPropertyValue_ValueID]
GO
/****** Object:  StoredProcedure [dbo].[AddAddress]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddAddress]
@UserID uniqueidentifier,
@AddressLine1 nvarchar(100),
@Pin int,
@City nvarchar(50),
@State nvarchar(50),
@Country nvarchar(50),
@AddressLine2 nvarchar(100) = ''
as
begin
declare @AddressID uniqueidentifier
 SET @AddressID = NEWID() 
 insert into Address(ID,AddressLine1,AddressLine2,Pin,City,State,Country) values(@AddressID,@AddressLine1,@AddressLine2,@Pin,@City,@State,@Country)
 insert into UserAddressMapping(ID,UserID,AddressID) values(newID(),@UserID,@AddressID)
end
GO
/****** Object:  StoredProcedure [dbo].[addCategory]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[addCategory]
@CategoryName nvarchar(100),
@CategoryID uniqueidentifier OUT
as
begin
declare @ID uniqueidentifier
IF EXISTS(select 'True' from Category where Name = @CategoryName)
   begin
      select @categoryID = ID from Category where Name = @CategoryName
   end;
else
  begin
    set @ID = newID()
       insert into Category(ID,Name) values (@ID,@CategoryName)
       set @categoryID = @ID
  end;
end
GO
/****** Object:  StoredProcedure [dbo].[AddItem]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddItem]
@CategoryName nvarchar(50),
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as
begin
	declare @CategoryID uniqueidentifier
	exec addCategory @CategoryName,@CategoryID OUTPUT

	exec AddProduct @ProductName,@Title,@OrderLimit,@Description,@CategoryID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage

end;
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProduct]
@ProductName nvarchar(100),
@Title nvarchar(150),
@OrderLimit int,
@Description nvarchar(150),
@CategoryID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)

as
begin
       declare @ProductID uniqueidentifier
       IF Exists(select 'True' from Product where Name = @ProductName and CategoryID = @CategoryID)
              begin
                     select @ProductID = ID from Product where name = @ProductName and CategoryID = @CategoryID
              end;
       else
       begin
              set @ProductID = NEWID()
              INSERT INTO Product(ID,CategoryID,Name,Title,OrderLimit,Description) values(@ProductID,@CategoryID,@ProductName,@Title,@OrderLimit,@Description);
       end;
	   exec AddVariant @ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory,@PropertyName,@ValueName,@VariantImage 
end;
GO
/****** Object:  StoredProcedure [dbo].[AddProperty]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddProperty]
@Name nvarchar(50),
@PropertyID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Property where Name = @Name)
	begin
		set @PropertyID = newID()
		insert into Property(ID,Name) values (@PropertyID,@Name)
	end
ELSE
	begin
		select @PropertyID = ID from Property where Name = @Name
	end
end;
GO
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRole]
@RoleName nvarchar(100),
@RoleID uniqueidentifier OUT
as
begin
IF not EXISTS (SELECT 'TRUE' FROM Role WHERE Name = @RoleName)
begin
	insert into Role(ID,Name) values (newID(), @RoleName)
end
select @RoleID =ID from Role WHERE Name =@RoleName
end
GO
/****** Object:  StoredProcedure [dbo].[AddToCart]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddToCart]
@UserID uniqueidentifier,
@VariantID uniqueidentifier,
@SellingPrice float,
@Quantity int
as
begin
 Declare
 @ID uniqueidentifier
 IF EXISTS (SELECT 'TRUE' FROM CartVariantMapping WHERE VariantID = @VariantID)
 begin
   update CartVariantMapping set Quantity = Quantity + 1
 end
 set @ID = newid()
 insert into CartVariantMapping(ID,CartID,VariantID,SellingPrice,Quantity) values (@ID,@UserID,@VariantID,@SellingPrice,@Quantity)
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddUser]
@UserName nvarchar(100),
@HashPassword nvarchar(4000),
@Email nvarchar(100),
@PhoneNumber int,
@RoleName nvarchar(100)
as
begin
declare @RoleID uniqueidentifier,
@ID uniqueidentifier

IF EXISTS (SELECT 'TRUE' FROM [USER] WHERE Email = @Email)
begin
	RAISERROR('User with same email id already exists',16,1)
end
else
begin
set @ID = NEWID()
exec AddRole @RoleName, @RoleID OUTPUT 
INSERT INTO [USER] (ID,Name,HashPassword,Email,PhoneNumber,RoleID) values (@ID,@UserName,HASHBYTES('SHA2_256',CONVERT(nvarchar(4000),@HashPassword)),
@Email,@PhoneNumber,@RoleID)
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddValue]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddValue]
@Name nvarchar(50),
@ValueID uniqueidentifier out
as 
begin
IF NOT EXISTS (select 'True' from Value where Name = @Name)
	begin
		set @ValueID = newID()
		insert into Value(ID,Name) values (@ValueID,@Name)

	end
ELSE
	begin
		select @ValueID = ID from Value where Name = @Name	
	end;
end;
GO
/****** Object:  StoredProcedure [dbo].[AddVariant]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddVariant] 
@ProductID uniqueidentifier,
@ListingPrice float,
@Discount float,
@QuantitySold int,
@Inventory int,
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@VariantImage nvarchar(200)
as 
begin
  declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier,
  @SKUCode nvarchar(100),
  @MapperKey int,
  @VariantID uniqueidentifier
  
SET NOCOUNT ON
 DECLARE @PropertyNameCursor varchar(50)
 DECLARE cursor_property CURSOR

STATIC FOR 
SELECT value FROM STRING_SPLIT(@PropertyName, '~')
OPEN cursor_property	
 DECLARE @ValueNameCursor varchar(50)
 DECLARE cursor_value CURSOR
 STATIC FOR 
 SELECT value FROM STRING_SPLIT(@ValueName, '~')
 open cursor_value
IF @@CURSOR_ROWS > 0  
 BEGIN 
 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor;

 WHILE @@Fetch_status = 0
 BEGIN
 PRINT 'PropertyName : '+@PropertyNameCursor
 exec AddProperty @PropertyNameCursor, @PropertyID OUTPUT


 
 PRINT 'PropertyValue : '+@ValueNameCursor
 exec AddValue @ValueNameCursor,@ValueID OUTPUT

 exec AddVariantPropertyValueMapping @PropertyNameCursor,@ValueNameCursor,@MapperKey OUTPUT

 if len(@SKUCode) >0
 begin
  set @SKUCode = @SKUCode + '~' + Convert(nvarchar(100),@MapperKey)
 end
 else
 begin
  set @SKUCode = Convert(nvarchar(100),@MapperKey)
 end

 FETCH NEXT FROM cursor_property INTO @PropertyNameCursor;
 FETCH NEXT FROM cursor_value INTO @ValueNameCursor
 END
END
CLOSE cursor_property
DEALLOCATE cursor_property
SET NOCOUNT OFF
CLOSE cursor_value
DEALLOCATE cursor_value
SET NOCOUNT OFF

 if not exists (select 'true' from Variant where SKU = @SKUCode and ProductID =@ProductID)
 begin
    set @VariantID = newID()
	
	insert into Variant(ID,SKU,ProductID,ListingPrice,Discount,QuantitySold,Inventory) values (@VariantID,@SKUCode,@ProductID,@ListingPrice,@Discount,@QuantitySold,@Inventory)
	exec AddVariantImage @VariantID,@VariantImage
 end
 else
 begin
	select @VariantID = ID from Variant where SKU = @SKUCode
	update Variant set Inventory = Inventory + 1 where ID = @VariantID and ProductID =@ProductID
 end
end
GO
/****** Object:  StoredProcedure [dbo].[AddVariantImage]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AddVariantImage]
@VariantID uniqueidentifier,
@ImageURL nvarchar(200) = 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png'
as
begin
	IF (@ImageURL IS NOT NULL) OR (LEN(@ImageURL) > 0)
	begin
		insert into VariantImage(ID,VariantID,ImageURL) values (newID(),@VariantID,@ImageURL)
	end
	ELSE
	BEGIN
		INSERT INTO VariantImage(VariantID) values (@VariantID)
	END
	
end;
GO
/****** Object:  StoredProcedure [dbo].[AddVariantPropertyValueMapping]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddVariantPropertyValueMapping]
@PropertyName nvarchar(50),
@ValueName nvarchar(50),
@MapID INT out
as
begin
 declare @PropertyID uniqueidentifier,
  @ValueID uniqueidentifier

  exec AddProperty @PropertyName, @PropertyID OUTPUT
  exec AddValue @ValueName, @ValueID OUTPUT
  select @PropertyID
  select @ValueID
 IF NOT EXISTS (SELECT 'TRUE' FROM VariantPropertyValue where PropertyID = @PropertyID AND ValueID = @ValueID)
 BEGIN
   insert into VariantPropertyValue(PropertyID,ValueID) values (@PropertyID,@ValueID)
 END
 SELECT @MapID = ID FROM VariantPropertyValue where PropertyID=@PropertyID AND ValueID = @ValueID
END
GO
/****** Object:  StoredProcedure [dbo].[CheckOutFromCart]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CheckOutFromCart]
@UserID uniqueidentifier,
@DeliveryAddressID uniqueidentifier,
@TotalAmount float
as
begin
 declare @OrderID uniqueidentifier,
 @OrderPlacedID uniqueidentifier
 exec PlaceOrder @UserID,@DeliveryAddressID,@TotalAmount,@OrderID OUTPUT
 set @OrderPlacedID = newid()

 insert into OrderPlaced (ID,OrderID,UserID) values (@OrderPlacedID,@OrderID,@UserID)

 insert into OrderPlacedVariants (ID,OrderPlacedID,VariantID,SellingPrice,Quantity) select newID(),
 @OrderPlacedID,VariantID,SellingPrice,Quantity from CartVariantMapping where CartID = @UserID

end
GO
/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 12-12-2018 17:51:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PlaceOrder]
@UserID uniqueidentifier,
@DeliveryAddressID uniqueidentifier,
@TotalAmount float,
@OrderID uniqueidentifier OUT
as
begin
 SET @OrderID = NEWID() 
 insert into [Order] (ID,OrderDate,TotalAmount,DeliveryAddressID,DeliveryDate) VALUES 
 (@OrderID,CONVERT(smalldatetime,CURRENT_TIMESTAMP) ,@TotalAmount,@DeliveryAddressID,CONVERT(smalldatetime, CURRENT_TIMESTAMP)+5)
end
GO
