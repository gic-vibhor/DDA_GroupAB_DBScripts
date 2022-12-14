USE [master]
GO
/****** Object:  Database [Courier_Management]    Script Date: 04-11-2022 19:56:15 ******/
CREATE DATABASE [Courier_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Courier_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Courier_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Courier_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Courier_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Courier_Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Courier_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Courier_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Courier_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Courier_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Courier_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Courier_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Courier_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Courier_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Courier_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Courier_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Courier_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Courier_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Courier_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Courier_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Courier_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Courier_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Courier_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Courier_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Courier_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Courier_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Courier_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Courier_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Courier_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Courier_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Courier_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Courier_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Courier_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Courier_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Courier_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Courier_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Courier_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Courier_Management] SET QUERY_STORE = OFF
GO
USE [Courier_Management]
GO
/****** Object:  Table [dbo].[ItemDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemDetails](
	[OrderId] [varchar](50) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[Item Description] [varchar](max) NULL,
	[No. of Items] [numeric](18, 0) NULL,
	[ItemCategory] [varchar](50) NULL,
 CONSTRAINT [PK_ItemDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [varchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[SenderId] [varchar](50) NOT NULL,
	[WeightofItem (in Kg)] [decimal](18, 2) NULL,
	[LengthofItem (ft)] [decimal](18, 2) NULL,
	[BreadthofItem (ft)] [decimal](18, 2) NULL,
	[HeightofItem (ft)] [decimal](18, 2) NULL,
	[RecipientId] [varchar](50) NOT NULL,
	[IsFragile] [bit] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipmentDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipmentDetails](
	[OrderId] [varchar](50) NOT NULL,
	[SourceCity] [varchar](50) NOT NULL,
	[DestinationCity] [varchar](50) NOT NULL,
	[SourceDispatchTimeStamp] [datetime] NULL,
	[CurrentCity] [varchar](50) NOT NULL,
	[IntermediateCity] [varchar](50) NULL,
	[Total Weight] [decimal](18, 2) NOT NULL,
	[Subtotal Amount] [decimal](18, 2) NULL,
	[IsFragile] [bit] NOT NULL,
	[ExpectedDeliveryTimeStamp] [datetime] NULL,
	[CurrentCentreCode] [numeric](18, 0) NOT NULL,
	[DestinationCentreCode] [numeric](18, 0) NULL,
	[CurrentLocationArrivalTimeStamp] [datetime] NULL,
	[HasDelivered] [bit] NOT NULL,
	[InTransit] [bit] NOT NULL,
	[IsReturned] [bit] NOT NULL,
	[ReturnDestinationCentreCode] [numeric](18, 0) NULL,
	[ReturnDestinationCity] [varchar](50) NULL,
	[ReturnDestinationState] [varchar](50) NULL,
 CONSTRAINT [PK_ShipmentDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_OrderDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[View_OrderDetails]
as 
SELECT dbo.ItemDetails.OrderId AS OrderId, dbo.ItemDetails.ItemName, dbo.ItemDetails.[Item Description], dbo.ItemDetails.[No. of Items], 
dbo.ItemDetails.ItemCategory, dbo.[Order].OrderDate, dbo.[Order].SenderId, dbo.[Order].[WeightofItem (in Kg)],
dbo.[Order].[LengthofItem (ft)],          
dbo.[Order].[BreadthofItem (ft)], dbo.[Order].[HeightofItem (ft)],
dbo.[Order].RecipientId, dbo.[Order].IsFragile, dbo.ShipmentDetails.SourceCity,

dbo.ShipmentDetails.DestinationCity, dbo.ShipmentDetails.SourceDispatchTimeStamp, dbo.ShipmentDetails.CurrentCity,     
dbo.ShipmentDetails.IntermediateCity, dbo.ShipmentDetails.[Total Weight], dbo.ShipmentDetails.[Subtotal Amount],
dbo.ShipmentDetails.ExpectedDeliveryTimeStamp, dbo.ShipmentDetails.CurrentCentreCode, dbo.ShipmentDetails.DestinationCentreCode,  
dbo.ShipmentDetails.CurrentLocationArrivalTimeStamp, dbo.ShipmentDetails.HasDelivered, dbo.ShipmentDetails.InTransit,
dbo.ShipmentDetails.IsReturned, dbo.ShipmentDetails.ReturnDestinationCentreCode, dbo.ShipmentDetails.ReturnDestinationCity,   
dbo.ShipmentDetails.ReturnDestinationState FROM   dbo.ItemDetails INNER JOIN          
dbo.[Order] ON dbo.ItemDetails.OrderId = dbo.[Order].OrderId INNER JOIN    
dbo.ShipmentDetails ON dbo.[Order].OrderId = dbo.ShipmentDetails.OrderId

GO
/****** Object:  Table [dbo].[CustomerSupport]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSupport](
	[ComplaintNo] [varchar](50) NOT NULL,
	[userid] [varchar](50) NOT NULL,
	[Query] [varchar](max) NOT NULL,
	[Response] [varchar](max) NULL,
	[QueryStatus] [varchar](max) NOT NULL,
	[ComplaintStatus] [varchar](50) NOT NULL,
	[CustomerSupportName] [varchar](50) NULL,
	[CustomerSupportId] [varchar](50) NULL,
	[TypeofIssue] [varchar](50) NOT NULL,
	[ComplaintTimeStamp] [datetime] NOT NULL,
	[ResponseTimeStamp] [datetime] NULL,
 CONSTRAINT [PK_CustomerSupport] PRIMARY KEY CLUSTERED 
(
	[ComplaintNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentDetails](
	[OrderId] [varchar](50) NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
	[BankName] [varchar](50) NULL,
	[PaymentTimeStamp] [datetime] NOT NULL,
	[PaymentStatus] [varchar](50) NOT NULL,
	[PaymentReferenceId] [varchar](50) NULL,
 CONSTRAINT [PK_PaymentDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RateList]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RateList](
	[SGST Percent] [decimal](18, 2) NOT NULL,
	[CGST Percent] [decimal](18, 2) NOT NULL,
	[Rate/Kg/100km] [decimal](18, 2) NOT NULL,
	[ItemCategory] [varchar](50) NOT NULL,
	[FragilityCharges] [varchar](50) NULL,
 CONSTRAINT [PK_RateList] PRIMARY KEY CLUSTERED 
(
	[ItemCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[ContactNo] [numeric](18, 0) NOT NULL,
	[AlternateNo] [numeric](18, 0) NULL,
	[AddressLine1] [varchar](max) NOT NULL,
	[AddressLine2] [varchar](max) NOT NULL,
	[AddressLine3] [varchar](max) NULL,
	[Landmark] [varchar](max) NULL,
	[City] [varchar](50) NOT NULL,
	[District] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[ZipCode] [numeric](18, 0) NOT NULL,
	[Role] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CustomerSupport] ([ComplaintNo], [userid], [Query], [Response], [QueryStatus], [ComplaintStatus], [CustomerSupportName], [CustomerSupportId], [TypeofIssue], [ComplaintTimeStamp], [ResponseTimeStamp]) VALUES (N'COMP_001', N'CUST_002', N'Item not delivered', N'Item in transit and expeceted to be delivered by today EOD', N'Addressed', N'Open', N'Vikram Kumar', N'USER_002', N'Delivery Status', CAST(N'2022-09-18T10:30:00.000' AS DateTime), CAST(N'2022-09-18T10:35:00.000' AS DateTime))
INSERT [dbo].[CustomerSupport] ([ComplaintNo], [userid], [Query], [Response], [QueryStatus], [ComplaintStatus], [CustomerSupportName], [CustomerSupportId], [TypeofIssue], [ComplaintTimeStamp], [ResponseTimeStamp]) VALUES (N'COMP_002', N'CUST_005', N'Item Broken', N'Will investigate with delivery team', N'Addressed', N'Closed', N'Abhishek A', N'USER_001', N'Delivery Status', CAST(N'2022-09-16T12:15:00.000' AS DateTime), CAST(N'2022-09-16T12:30:00.000' AS DateTime))
INSERT [dbo].[CustomerSupport] ([ComplaintNo], [userid], [Query], [Response], [QueryStatus], [ComplaintStatus], [CustomerSupportName], [CustomerSupportId], [TypeofIssue], [ComplaintTimeStamp], [ResponseTimeStamp]) VALUES (N'COMP_003', N'CUST_002', N'Wrong Parcel delivered', N'', N'Unassigned', N'Open', N'Vikram Kumar', N'USER_002', N'Incorrect Delivery', CAST(N'2022-09-15T17:30:00.000' AS DateTime), CAST(N'2022-09-15T17:40:00.000' AS DateTime))
GO
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1001', N'Utensils', N'Steel Plates', CAST(5 AS Numeric(18, 0)), N'Household')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1002', N'Dell Latitude', N'Laptop', CAST(1 AS Numeric(18, 0)), N'Electronics')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1003', N'Detergent', N'Detergent', CAST(2 AS Numeric(18, 0)), N'FMCG')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1004', N'Glassware', N'', CAST(4 AS Numeric(18, 0)), N'Household')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1005', N'Document', N'Document', CAST(150 AS Numeric(18, 0)), N'Document')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1006', N'Bicycle', N'', CAST(1 AS Numeric(18, 0)), N'Mobility')
INSERT [dbo].[ItemDetails] ([OrderId], [ItemName], [Item Description], [No. of Items], [ItemCategory]) VALUES (N'1007', N'Laptop', N'', CAST(1 AS Numeric(18, 0)), N'Electronics')
GO
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1001', CAST(N'2022-09-17' AS Date), N'CUST_002', CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.75 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), N'CUST_003', 0, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1002', CAST(N'2022-09-14' AS Date), N'CUST_001', CAST(0.75 AS Decimal(18, 2)), CAST(0.25 AS Decimal(18, 2)), CAST(0.25 AS Decimal(18, 2)), CAST(0.25 AS Decimal(18, 2)), N'CUST_004', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1003', CAST(N'2022-09-16' AS Date), N'CUST_003', CAST(2.25 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.75 AS Decimal(18, 2)), N'CUST_001', 0, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1004', CAST(N'2022-09-16' AS Date), N'CUST_001', CAST(4.25 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), N'CUST_005', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1005', CAST(N'2022-09-15' AS Date), N'CUST_005', CAST(3.25 AS Decimal(18, 2)), CAST(1.75 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), N'CUST_002', 0, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1006', CAST(N'2022-09-11' AS Date), N'CUST_002', CAST(0.90 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), N'CUST_003', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1007', CAST(N'2022-09-11' AS Date), N'CUST_004', CAST(3.00 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), CAST(2.50 AS Decimal(18, 2)), CAST(1.50 AS Decimal(18, 2)), N'CUST_001', 0, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'112', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_001', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'1235576', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_002', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'12376', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_002', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'255', CAST(N'2022-05-08' AS Date), N'CUST_001', CAST(55.20 AS Decimal(18, 2)), CAST(23.20 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), N'CUST_001', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'555', CAST(N'2022-02-06' AS Date), N'cust_001', NULL, NULL, NULL, NULL, N'cust_002', NULL, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'656', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_001', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'6565', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_001', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'6576', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_001', 1, 1)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [SenderId], [WeightofItem (in Kg)], [LengthofItem (ft)], [BreadthofItem (ft)], [HeightofItem (ft)], [RecipientId], [IsFragile], [IsActive]) VALUES (N'657776', CAST(N'2022-12-12' AS Date), N'cust_001', CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), N'cust_001', 1, 1)
GO
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1001', N'Cash', N'', CAST(N'2022-09-17T10:30:00.000' AS DateTime), N'Success', N'')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1002', N'UPI', N'ICICI Bank', CAST(N'2022-09-14T10:30:00.000' AS DateTime), N'Success', N'ICI0002156')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1003', N'Credit Card', N'HDFC Bank', CAST(N'2022-09-16T12:30:00.000' AS DateTime), N'Success', N'HDF003258')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1004', N'Cash', N'', CAST(N'2022-09-16T15:30:00.000' AS DateTime), N'Success', N'')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1005', N'Net Banking', N'SBI', CAST(N'2022-09-15T09:15:20.000' AS DateTime), N'Success', N'RX012993ET')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1006', N'UPI', N'FEDERAL BANK', CAST(N'2022-09-11T11:10:28.000' AS DateTime), N'Success', N'FE995023XD')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1007', N'Cash', N'', CAST(N'2022-09-11T16:20:18.000' AS DateTime), N'Success', N'')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'112', N'UPI', N'SBI', CAST(N'2022-11-01T21:54:35.907' AS DateTime), N'Success', N'GDJEN455522HSH42')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'1235576', N'UPI', N'SBI', CAST(N'2022-11-05T21:54:37.907' AS DateTime), N'Success', N'IJH546H42HHU856')
INSERT [dbo].[PaymentDetails] ([OrderId], [PaymentType], [BankName], [PaymentTimeStamp], [PaymentStatus], [PaymentReferenceId]) VALUES (N'12376', N'UPI', N'SBI', CAST(N'2022-11-01T21:54:35.907' AS DateTime), N'Success', N'GDJEN455522HSH42')
GO
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'Document', N'100')
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(50.00 AS Decimal(18, 2)), N'Electronics', N'150')
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), N'FMCG', N'90')
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), N'Household', N'130')
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), N'Mobility', N'200')
INSERT [dbo].[RateList] ([SGST Percent], [CGST Percent], [Rate/Kg/100km], [ItemCategory], [FragilityCharges]) VALUES (CAST(9.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), N'Other', N'100')
GO
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1001', N'Chennai', N'Bangalore', CAST(N'2022-09-17T10:30:00.000' AS DateTime), N'Chennai', N'Vellore', CAST(2.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 0, CAST(N'2022-09-18T02:00:00.000' AS DateTime), CAST(101 AS Numeric(18, 0)), CAST(202 AS Numeric(18, 0)), CAST(N'2022-09-17T10:45:00.000' AS DateTime), 0, 1, 0, CAST(202 AS Numeric(18, 0)), N'Chennai', N'Tamil Nadu')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1002', N'Chennai', N'Hyderabad', CAST(N'2022-09-14T10:30:00.000' AS DateTime), N'Chennai', N'Nellore', CAST(1.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), 1, CAST(N'2022-09-16T11:00:00.000' AS DateTime), CAST(101 AS Numeric(18, 0)), CAST(303 AS Numeric(18, 0)), CAST(N'2022-09-14T10:45:00.000' AS DateTime), 0, 1, 0, CAST(303 AS Numeric(18, 0)), N'Chennai', N'Tamil Nadu')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1003', N'Bangalore', N'Chennai', CAST(N'2022-09-14T10:30:00.000' AS DateTime), N'Bangalore', N'Vellore', CAST(2.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), 0, CAST(N'2022-09-16T12:30:00.000' AS DateTime), CAST(202 AS Numeric(18, 0)), CAST(101 AS Numeric(18, 0)), CAST(N'2022-09-17T11:15:00.000' AS DateTime), 0, 1, 0, CAST(202 AS Numeric(18, 0)), N'Bangalore', N'Karnataka')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1004', N'Chennai', N'Chennai', CAST(N'2022-09-16T16:30:00.000' AS DateTime), N'Chennai', N'Chennai', CAST(2.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), 1, CAST(N'2022-09-17T12:30:00.000' AS DateTime), CAST(101 AS Numeric(18, 0)), CAST(101 AS Numeric(18, 0)), CAST(N'2022-09-16T16:00:00.000' AS DateTime), 0, 1, 0, CAST(101 AS Numeric(18, 0)), N'Chennai', N'Tamil Nadu')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1005', N'Chennai', N'Chennai', CAST(N'2022-09-15T09:15:00.000' AS DateTime), N'Chennai', N'Chennai', CAST(3.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), 0, CAST(N'2022-09-15T18:30:00.000' AS DateTime), CAST(101 AS Numeric(18, 0)), CAST(101 AS Numeric(18, 0)), CAST(N'2022-09-15T09:15:00.000' AS DateTime), 0, 1, 0, CAST(101 AS Numeric(18, 0)), N'Chennai', N'Tamil Nadu')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1006', N'Chennai', N'Bengaluru', CAST(N'2022-09-11T11:10:28.000' AS DateTime), N'Chennai', N'Vellore', CAST(15.00 AS Decimal(18, 2)), CAST(950.00 AS Decimal(18, 2)), 1, CAST(N'2022-09-12T12:30:00.000' AS DateTime), CAST(101 AS Numeric(18, 0)), CAST(202 AS Numeric(18, 0)), CAST(N'2022-09-11T12:15:00.000' AS DateTime), 0, 1, 0, CAST(202 AS Numeric(18, 0)), N'Bengaluru', N'Karnataka')
INSERT [dbo].[ShipmentDetails] ([OrderId], [SourceCity], [DestinationCity], [SourceDispatchTimeStamp], [CurrentCity], [IntermediateCity], [Total Weight], [Subtotal Amount], [IsFragile], [ExpectedDeliveryTimeStamp], [CurrentCentreCode], [DestinationCentreCode], [CurrentLocationArrivalTimeStamp], [HasDelivered], [InTransit], [IsReturned], [ReturnDestinationCentreCode], [ReturnDestinationCity], [ReturnDestinationState]) VALUES (N'1007', N'Hyderabad', N'Chennai', CAST(N'2022-09-11T16:20:00.000' AS DateTime), N'Chennai', N'Nellore', CAST(3.00 AS Decimal(18, 2)), CAST(790.00 AS Decimal(18, 2)), 0, CAST(N'2022-09-12T12:30:00.000' AS DateTime), CAST(303 AS Numeric(18, 0)), CAST(101 AS Numeric(18, 0)), CAST(N'2022-09-11T18:15:00.000' AS DateTime), 0, 1, 0, CAST(303 AS Numeric(18, 0)), N'Hyderabad', N'Telangana')
GO
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'CUST_001', N'Ram', N'Prasad', CAST(9911223344 AS Numeric(18, 0)), CAST(9910223345 AS Numeric(18, 0)), N'No.10/2 Fifth Cross', N'Cheran Nagar', N'Perumbakkam', N'Behind AB Hospital', N'Chennai', N'Chennai', N'Tamil Nadu', CAST(600100 AS Numeric(18, 0)), N'Customer', N'abc123', N'abc@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'CUST_002', N'Kumar', N'', CAST(9911223386 AS Numeric(18, 0)), CAST(9911223387 AS Numeric(18, 0)), N'No.111 Block A', N'Seaview Apartments', N' Adyar', N'', N'Chennai', N'Chennai', N'Tamil Nadu', CAST(600041 AS Numeric(18, 0)), N'Customer', N'abc234', N'abc234@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'CUST_003', N'Mohan', N'A', CAST(9911443386 AS Numeric(18, 0)), NULL, N'14/3 Pragathi layout', N'Belathur', N'Krishnarajapura', N'', N'Bengaluru', N'Bengaluru', N'Karnataka', CAST(560067 AS Numeric(18, 0)), N'Customer', N'abc345', N'abc345@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'CUST_004', N'Divya', N'', CAST(9988001122 AS Numeric(18, 0)), CAST(9988001123 AS Numeric(18, 0)), N'12 Block 2', N'Tellapur-Osman Nagar Rd', N'Tellapur', N'Beside Mayfair Villas', N'Hyderabad', N'Hyderabad', N'Telangana', CAST(500019 AS Numeric(18, 0)), N'Customer', N'cust004', N'cust004@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'CUST_005', N'Anu', N'Priya', CAST(9262005112 AS Numeric(18, 0)), CAST(9262007212 AS Numeric(18, 0)), N'312 EMAMI TEJOMAYA', N'1/4A, Rajiv Gandhi Salai', N'Egatoor', N'Near Toll Gate', N'Chennai', N'Chennai', N'Tamil Nadu', CAST(600130 AS Numeric(18, 0)), N'Customer', N'cust005', N'cust005@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_001', N'Abhishek', N'A', CAST(9905443386 AS Numeric(18, 0)), CAST(9905443387 AS Numeric(18, 0)), N'22 Fern Block', N'Bhakti Vedanta, Swami Vivekananda Rd, Azad Nagar, JVPD Scheme', N'Vile Parle West', N'', N'Mumbai', N'Mumbai', N'Maharashtra', CAST(400049 AS Numeric(18, 0)), N'Employee', N'user001', N'user001@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_002', N'Vikram', N'Kumar', CAST(9923444686 AS Numeric(18, 0)), NULL, N'70/B, Main Patel Rd, Block 2', N'Najafgarh Road Industrial Area', N'Vile Parle West', N'', N'New Delhi', N'Delhi', N'Delhi', CAST(110015 AS Numeric(18, 0)), N'Employee', N'user002', N'user001@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_003', N'Harish', N'Kumar', CAST(9651122200 AS Numeric(18, 0)), NULL, N'132 A Block', N'GIDA Road - Queens Way', N'Marine Drive', N'', N'Kochi', N'Kochi', N'Kerala', CAST(682018 AS Numeric(18, 0)), N'Employee', N'user003', N'user003@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_004', N'Priyanka', N'', CAST(9222006511 AS Numeric(18, 0)), CAST(9222006512 AS Numeric(18, 0)), N'41-A', N'Shree Nagar Society, Purushottam Nagar', N'Akota', N'Near LnT circle', N'Vadodara', N'Vadodara', N'Gujarat', CAST(390020 AS Numeric(18, 0)), N'Employee', N'user004', N'user004@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_005', N'Reshmi', N'S', CAST(9265112200 AS Numeric(18, 0)), NULL, N'2210 Vinayak Apartment', N'Shreemani Society, Delite Accessories Cross Rd', N'Mithakhali, Navrangpura', N'Near Abhishek Complex', N'Ahmedabad', N'Ahmedabad', N'Gujarat', CAST(380009 AS Numeric(18, 0)), N'Employee', N'user005', N'user005@abc.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [ContactNo], [AlternateNo], [AddressLine1], [AddressLine2], [AddressLine3], [Landmark], [City], [District], [State], [ZipCode], [Role], [Password], [Email]) VALUES (N'USER_006', N'Vibhor', N'Chauhan', CAST(9656265323 AS Numeric(18, 0)), NULL, N'39', N'Sector 137', N'Noida', N'Advant Tower', N'Noida', N'Gautam Buddha Nagar', N'Uttar Pradesh', CAST(201305 AS Numeric(18, 0)), N'Employee', N'vi@@123', N'vibhor@hotmail.com')
GO
ALTER TABLE [dbo].[CustomerSupport]  WITH CHECK ADD  CONSTRAINT [FK_CustomerSupport_User] FOREIGN KEY([CustomerSupportId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[CustomerSupport] CHECK CONSTRAINT [FK_CustomerSupport_User]
GO
ALTER TABLE [dbo].[CustomerSupport]  WITH CHECK ADD  CONSTRAINT [FK_CustomerSupport_UserID] FOREIGN KEY([userid])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[CustomerSupport] CHECK CONSTRAINT [FK_CustomerSupport_UserID]
GO
ALTER TABLE [dbo].[ItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemDetails_ItemCategory] FOREIGN KEY([ItemCategory])
REFERENCES [dbo].[RateList] ([ItemCategory])
GO
ALTER TABLE [dbo].[ItemDetails] CHECK CONSTRAINT [FK_ItemDetails_ItemCategory]
GO
ALTER TABLE [dbo].[ItemDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[ItemDetails] CHECK CONSTRAINT [FK_ItemDetails_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_ReceipientId] FOREIGN KEY([RecipientId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_ReceipientId]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_SenderID] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_SenderID]
GO
ALTER TABLE [dbo].[PaymentDetails]  WITH CHECK ADD  CONSTRAINT [FK_PaymentDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[PaymentDetails] CHECK CONSTRAINT [FK_PaymentDetails_Order]
GO
ALTER TABLE [dbo].[ShipmentDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[ShipmentDetails] CHECK CONSTRAINT [FK_ShipmentDetails_Order]
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Calculate_TotalAmount]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Calculate_TotalAmount]
(
 @totalweight decimal(18,2)
,@isfragile bit
,@ItemCategory varchar(50)
,@distance decimal (5,2)
)
as

begin

 declare @itemsrate decimal (18,2)
 declare @amount decimal (18,2)
 declare @fragilitycharges int
 declare @cgst decimal(18, 2)
 declare @sgst decimal(18, 2)
 declare @TotalAmount decimal(18, 2)

 set @itemsrate = cast((select [Rate/Kg/100km] from [dbo].[RateList] where ItemCategory=@ItemCategory) as decimal (18,2))
 set @cgst = cast((select [CGST Percent] from [dbo].[RateList] where ItemCategory=@ItemCategory) as decimal (18,2))
 set @sgst = cast((select [SGST Percent] from [dbo].[RateList] where ItemCategory=@ItemCategory) as decimal (18,2))
 set @fragilitycharges= isnull((select FragilityCharges from [dbo].[RateList] where ItemCategory=@ItemCategory),0)

 if ((@distance%100)>0)
         set @amount = (@itemsrate*@totalweight*((@distance/100)+1))

		 else
		   
		   set @amount = (@itemsrate*@totalweight*((@distance/100)))
 
 if (@isfragile= 1)
                   set @amount = @amount +@fragilitycharges

set @TotalAmount = @amount+(@amount*(@cgst/cast (100 as decimal (5,2))) )+(@amount*(@sgst/cast (100 as decimal (5,2))) )
 
 select @TotalAmount as TotalAmount

end
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Create_User]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Create_User]
(  
       @UserId varchar(50)
      ,@FirstName varchar(50)
      ,@LastName varchar(50)=Null
      ,@ContactNo numeric(18, 0)
      ,@AlternateNo numeric(18, 0)=Null
      ,@AddressLine1 varchar(MAX)
      ,@AddressLine2 varchar(MAX)
      ,@AddressLine3 varchar(MAX)=Null
      ,@Landmark varchar(MAX)=Null
      ,@City  varchar(50)
      ,@District varchar(50)
      ,@State varchar(50)
      ,@ZipCode numeric(18, 0)
      ,@Role varchar(50)
      ,@Password varchar(50)
      ,@Email varchar(50)
)
as
begin

declare @count int = (select count (UserId) from [dbo].[User] where UserId=@UserId)


if (@count=0)
begin
insert into [dbo].[User]     ([UserId]
                                   ,[FirstName]
                                   ,[LastName]
                                   ,[ContactNo]
                                   ,[AlternateNo]
                                   ,[AddressLine1]
                                   ,[AddressLine2]
                                   ,[AddressLine3]
                                   ,[Landmark]
                                   ,[City]
                                   ,[District]
                                   ,[State]
                                   ,[ZipCode]
                                   ,[Role]
                                   ,[Password]
                                   ,[Email]) values 
								                     (  @UserId
									                   ,@FirstName
	                                                   ,@LastName
	                                                   ,@ContactNo
	                                                   ,@AlternateNo 
	                                                   ,@AddressLine1
	                                                   ,@AddressLine2
	                                                   ,@AddressLine3
	                                                   ,@Landmark 
									                   ,@City
									                   ,@District
									                   ,@State
									                   ,@ZipCode
									                   ,@Role
									                   ,@Password
									                   ,@Email
													            )
								                    
									 	  select '1' as retCode		
									 	  end						
									 	  else	
										  begin
									 	  select '0' as retCode	
										  print 'User already exists'
										  end
									 end;							
									 								
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_CategoryRate]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Insert_CategoryRate]
(           @SGST decimal(18,2)
           ,@CGST decimal(18,2)
           ,@Rateperkgper100 decimal(18,2)
           ,@ItemCategory varchar(50)
           ,@FragilityCharges varchar(50)=Null
)
as
begin

declare @countcategoryrow int = (select count([ItemCategory]) from [dbo].[RateList] where [ItemCategory]=@ItemCategory)

if  (@countcategoryrow =0)
begin
INSERT INTO [dbo].[RateList]
           ([SGST Percent]
           ,[CGST Percent]
           ,[Rate/Kg/100km]
           ,[ItemCategory]
           ,[FragilityCharges])
     VALUES
           ( @SGST 
           ,@CGST
           ,@Rateperkgper100
           ,@ItemCategory
           ,@FragilityCharges)

		   select '1' as retCode
		   end

		   else 
            select '0' as retCode
end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_CustomerQuery]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UDSP_Insert_CustomerQuery]

           (
             @ComplaintNo varchar(50)
            ,@userid varchar(50)
            ,@Query varchar(max)
            ,@TypeofIssue varchar(50)
			)
			as
begin

    INSERT INTO [dbo].[CustomerSupport]
           ([ComplaintNo]
           ,[userid]
           ,[Query]
           ,[QueryStatus]
           ,[ComplaintStatus]
           ,[TypeofIssue]
           ,[ComplaintTimeStamp]
           )
     VALUES
           ( @ComplaintNo
            ,@userid
            ,@Query
            ,'Unassigned'
            ,'Open'
            ,@TypeofIssue
			,(select getdate())
		   )
end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_ItemDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UDSP_Insert_ItemDetails]
(           @OrderId varchar(50)
           ,@ItemName varchar(50)
           ,@ItemDescription varchar(max)=Null
           ,@NoofItems numeric(18,0)
           ,@ItemCategory varchar(50)
)
as
begin

declare @countorderidrow int = (select count([OrderId]) from [dbo].[ItemDetails] where [OrderId]=@OrderId)

if  (@countorderidrow =0)
begin
INSERT INTO [dbo].[ItemDetails]
           ([OrderId]
           ,[ItemName]
           ,[Item Description]
           ,[No. of Items]
           ,[ItemCategory])
     VALUES
            (@OrderId 
           ,@ItemName 
           ,@ItemDescription 
           ,@NoofItems 
           ,@ItemCategory)

		   select '1' as retCode
		   end

		   else 
            select '0' as retCode
end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_OrderDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Insert_OrderDetails]

(@OrderId varchar(50),
 @OrderDate date,
 @SenderId varchar(50),
 @WeightofItem decimal(18,2)=Null,
 @LengthofItem decimal(18,2)=Null,
 @BreadthofItem  decimal(18,2)=Null,
 @HeightofItem decimal(18,2)=Null,
 @RecipientId varchar(50),
 @IsFragile bit=Null) 

as
begin
declare @sender int
declare @recipient int
declare @orderidcount int

set @Sender = (select count([UserId]) from [dbo].[User] where [UserId]= @SenderId)
set @Recipient = (select count([UserId]) from [dbo].[User] where [UserId]= @RecipientId)
set @orderidcount = (select count([OrderId]) from [dbo].[Order] where [OrderId]= @OrderId)

	if (@sender>0 and @Recipient>0 and @orderidcount=0 )
	    begin
				insert into [dbo].[Order] ([OrderId]
					  ,[OrderDate]
					  ,[SenderId]
					  ,[WeightofItem (in Kg)]
					  ,[LengthofItem (ft)]
					  ,[BreadthofItem (ft)]
					  ,[HeightofItem (ft)]
					  ,[RecipientId]
					  ,[IsFragile]) values (@OrderId ,
				                            @OrderDate,
				                            @SenderId ,
				                            @WeightofItem,
				                            @LengthofItem ,
				                            @BreadthofItem,
				                            @HeightofItem ,
				                            @RecipientId,
				                            @IsFragile)

				  select '1' as retCode
				  
				  end
  else
 
  select '0' as retCode
 end;
 


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_PaymentDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Insert_PaymentDetails]

(      @OrderId varchar(50)
      ,@PaymentType varchar(50)
      ,@BankName varchar(50)=Null 
      ,@PaymentTimeStamp datetime
      ,@PaymentStatus varchar(50)
      ,@PaymentReferenceId varchar(50)=Null
)
as
begin

declare @count int = (select count ([OrderId])from [dbo].[Order] where [OrderId]=@OrderId)
declare @countorderpayment int = (select count ([OrderId])from [dbo].[PaymentDetails] where [OrderId]=@OrderId)

if (@count=1 and @countorderpayment=0)
begin
insert into [dbo].[PaymentDetails] ([OrderId]
                                   ,[PaymentType]
                                   ,[BankName]
                                   ,[PaymentTimeStamp]
                                   ,[PaymentStatus]
                                   ,[PaymentReferenceId]) values 
								   (@OrderId
								   ,@PaymentType
								   ,@BankName
								   ,@PaymentTimeStamp
								   ,@PaymentStatus
								   ,@PaymentReferenceId ) 

	  select '1' as retCode
	  end
	  else
	  select '0' as retCode
end;
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Insert_ShipmentDetails]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[UDSP_Insert_ShipmentDetails]

(          @OrderId varchar(50)
          , @SourceCity varchar(50)
          , @DestinationCity varchar(50)
          , @SourceDispatchTimeStamp varchar(50)=Null
          , @CurrentCity varchar(50)
          , @IntermediateCity varchar(50)=Null
          , @TotalWeight decimal(18,2)
          , @SubtotalAmount decimal(18,2)=Null
          , @IsFragile bit
          , @ExpectedDeliveryTimeStamp varchar(50) =Null
          , @CurrentCentreCode numeric(18,0)
          , @DestinationCentreCode numeric(18,0)=Null
          , @CurrentLocationArrivalTimeStamp varchar(50)=Null
          , @HasDelivered bit
          , @InTransit bit
          , @IsReturned bit
          , @ReturnDestinationCentreCode numeric(18,0)=Null
          , @ReturnDestinationCity varchar(50)=Null
          , @ReturnDestinationState varchar(50)=Null)

		   as
          begin
		   declare @countorderidrow int = (select count([OrderId]) from [dbo].[ShipmentDetails] where [OrderId]=@OrderId)
           if  (@countorderidrow =0)
		   begin
           INSERT INTO [dbo].[ShipmentDetails]
           ([OrderId]
           ,[SourceCity]
           ,[DestinationCity]
           ,[SourceDispatchTimeStamp]
           ,[CurrentCity]
           ,[IntermediateCity]
           ,[Total Weight]
           ,[Subtotal Amount]
           ,[IsFragile]
           ,[ExpectedDeliveryTimeStamp]
           ,[CurrentCentreCode]
           ,[DestinationCentreCode]
           ,[CurrentLocationArrivalTimeStamp]
           ,[HasDelivered]
           ,[InTransit]
           ,[IsReturned]
           ,[ReturnDestinationCentreCode]
           ,[ReturnDestinationCity]
           ,[ReturnDestinationState])
     VALUES
          (@OrderId
           ,@SourceCity
           ,@DestinationCity
           ,Convert(datetime, @SourceDispatchTimeStamp)
           ,@CurrentCity
           ,@IntermediateCity
           ,@TotalWeight
           ,@SubtotalAmount
           ,@IsFragile
           ,Convert(datetime, @ExpectedDeliveryTimeStamp)
           ,@CurrentCentreCode
           ,@DestinationCentreCode
           ,Convert(datetime, @CurrentLocationArrivalTimeStamp)
           ,@HasDelivered
           ,@InTransit
           ,@IsReturned
           ,@ReturnDestinationCentreCode
           ,@ReturnDestinationCity
           ,@ReturnDestinationState)

		   select '1' as retCode
		   end

		else 
            select '0' as retCode

 end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Update_Currentlocation]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[UDSP_Update_Currentlocation]

(           @OrderId varchar(50)
          , @CurrentCity varchar(50)
          , @IntermediateCity varchar(50)=Null          
          , @CurrentCentreCode numeric(18,0)          
          , @HasDelivered bit
          , @InTransit bit
          )

   as
   begin
		   declare @countorderidrow int = (select count([OrderId]) from [dbo].[ShipmentDetails] where [OrderId]=@OrderId)
           if  (@countorderidrow =1)
		   begin
           update [dbo].[ShipmentDetails] set
           [CurrentCity]=@CurrentCity
           ,[IntermediateCity]=@IntermediateCity
           ,[CurrentCentreCode]=@CurrentCentreCode
           ,[CurrentLocationArrivalTimeStamp]= (select getdate())
           ,[HasDelivered]=0
           ,[InTransit]=1
		   where OrderId=@OrderId
           
    	   select '1' as retCode
		   end

		else 
            select '0' as retCode

 end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Update_EmployeeResponse]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UDSP_Update_EmployeeResponse]

           (
             @ComplaintNo varchar(50)
            ,@Response varchar(max)
            ,@CustomerSupportName varchar(50)
            ,@CustomerSupportId varchar(50)
			)
			as
begin

  update  [dbo].[CustomerSupport] set 
            Response = @Response
           ,CustomerSupportName= @CustomerSupportName
           ,[QueryStatus]='Addressed'
           ,[ComplaintStatus]='Close'
           ,CustomerSupportId= @CustomerSupportId
           ,ResponseTimeStamp=(select getdate())
     
			where ComplaintNo=@ComplaintNo
		   
end


GO
/****** Object:  StoredProcedure [dbo].[UDSP_Update_Password]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UDSP_Update_Password]
(  
       @UserId varchar(50)
      ,@password varchar(50)      
)
as
begin

declare @count int = (select count (UserId) from [dbo].[User] where UserId=@UserId)

      if (@count=1)
            begin
                    update [dbo].[User] set [Password] = @password where UserId =@UserId								                    
	                select '1' as retCode
					print 'Password Updated Successfully'
		    end						
				    else	
		    begin
					select '0' as retCode	
					print 'User does not exists'
	        end
end;							
									 								
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Update_Rate]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UDSP_Update_Rate]
(
 @SGST decimal(18,2)
,@CGST decimal(18,2)
,@RATEperKg decimal (18,2)
,@fragilitycharges int=Null
,@ItemCategory varchar(50)
)
as
begin
update [dbo].[RateList] set [CGST Percent]=@CGST , [SGST Percent]=@SGST, [Rate/Kg/100km]=@RATEperKg, 
       FragilityCharges=isnull(@fragilitycharges,0) where ItemCategory=@ItemCategory

	   end
GO
/****** Object:  StoredProcedure [dbo].[UDSP_Update_UserRole]    Script Date: 04-11-2022 19:56:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UDSP_Update_UserRole]
(  
       @UserId varchar(50)
      ,@Role varchar(50)      
)
as
begin

declare @count int = (select count (UserId) from [dbo].[User] where UserId=@UserId)

      if (@count=1)
            begin
                    update [dbo].[User] set [Role] = @Role where UserId =@UserId								                    
	                select '1' as retCode		
		    end						
									 	  else	
		    begin
					select '0' as retCode	
					print 'User does not exists'
	        end
									 end;							
									 								
GO
USE [master]
GO
ALTER DATABASE [Courier_Management] SET  READ_WRITE 
GO
