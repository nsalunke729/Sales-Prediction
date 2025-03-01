USE [master]
GO
/****** Object:  Database [Shopping_mall_prediction_db]    Script Date: 31-01-2020 13:05:08 ******/
CREATE DATABASE [Shopping_mall_prediction_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping_mall_prediction_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopping_mall_prediction_db.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shopping_mall_prediction_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Shopping_mall_prediction_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping_mall_prediction_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Shopping_mall_prediction_db]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 31-01-2020 13:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[buying_master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buying_master](
	[buy_id] [int] IDENTITY(1,1) NOT NULL,
	[Age] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[P_id] [int] NULL,
	[Quantity] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[amount] [nvarchar](50) NULL,
	[Bill] [nvarchar](50) NULL,
	[shop_id] [int] NULL,
 CONSTRAINT [PK_buying_master] PRIMARY KEY CLUSTERED 
(
	[buy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[category_master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_master](
	[cat_id] [int] IDENTITY(1,1) NOT NULL,
	[category] [nvarchar](max) NULL,
 CONSTRAINT [PK_category_master] PRIMARY KEY CLUSTERED 
(
	[cat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer_master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_master](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[custname] [nvarchar](max) NULL,
	[custemail] [nvarchar](max) NULL,
	[custcontact] [nvarchar](max) NULL,
	[custage] [int] NULL,
	[custgender] [nvarchar](max) NULL,
	[custoccupation] [nvarchar](max) NULL,
 CONSTRAINT [PK_customer_master] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dataset]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dataset](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[Age] [nvarchar](50) NULL,
	[Occupation] [nvarchar](50) NULL,
	[History] [nvarchar](50) NULL,
	[Shop_Id] [nvarchar](50) NULL,
	[Season] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[offer_details]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[offer_details](
	[offer_id] [int] IDENTITY(1,1) NOT NULL,
	[vendor_id] [int] NULL,
	[cat_id] [int] NULL,
	[offname] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[offprice] [nvarchar](max) NULL,
	[offdescription] [nvarchar](max) NULL,
	[offstartdate] [date] NULL,
	[offlastdate] [date] NULL,
	[image] [nvarchar](max) NULL,
 CONSTRAINT [PK_offer_details] PRIMARY KEY CLUSTERED 
(
	[offer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_master](
	[P_id] [int] IDENTITY(1,1) NOT NULL,
	[cat_id] [int] NULL,
	[product_name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product_master] PRIMARY KEY CLUSTERED 
(
	[P_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Season_Master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season_Master](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Season] [nvarchar](50) NULL,
	[From_Date] [date] NULL,
	[To_Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shop_master]    Script Date: 31-01-2020 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shop_master](
	[shop_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[contact] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_vendor_master] PRIMARY KEY CLUSTERED 
(
	[shop_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([admin_id], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[buying_master] ON 

INSERT [dbo].[buying_master] ([buy_id], [Age], [Gender], [P_id], [Quantity], [user_id], [amount], [Bill], [shop_id]) VALUES (1, N'23', N'Male', 1, N'2', 1, N'100', N'200', 1)
INSERT [dbo].[buying_master] ([buy_id], [Age], [Gender], [P_id], [Quantity], [user_id], [amount], [Bill], [shop_id]) VALUES (2, N'21', N'Male', 1, N'3', 3, N'100', N'300', 1)
SET IDENTITY_INSERT [dbo].[buying_master] OFF
SET IDENTITY_INSERT [dbo].[category_master] ON 

INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (1, N'Shoes')
INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (2, N'Jeans')
INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (3, N'T-shirts')
INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (4, N'Shirts')
INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (5, N'Trousers')
INSERT [dbo].[category_master] ([cat_id], [category]) VALUES (6, N'Flip-Flops')
SET IDENTITY_INSERT [dbo].[category_master] OFF
SET IDENTITY_INSERT [dbo].[customer_master] ON 

INSERT [dbo].[customer_master] ([customer_id], [custname], [custemail], [custcontact], [custage], [custgender], [custoccupation]) VALUES (1, N'nipul', N'nipulgothal@gmail.com', N'9632587412', 23, N'Male', N'Student')
INSERT [dbo].[customer_master] ([customer_id], [custname], [custemail], [custcontact], [custage], [custgender], [custoccupation]) VALUES (3, N'ajay', N'ajay@gmail.com', N'7894561230', 21, N'Male', N'Work')
SET IDENTITY_INSERT [dbo].[customer_master] OFF
SET IDENTITY_INSERT [dbo].[Dataset] ON 

INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (1, 1, N'Male', N'25', N'Student', N'Shoes', N'1', N'Independent_day')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (2, 1, N'Male', N'25', N'Student', N'Jeans', N'1', N'Independent_day')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (3, 1, N'Male', N'25', N'Student', N'T-shirts', N'1', N'Independent_day')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (4, 1, N'Male', N'25', N'Student', N'Shoes', N'2', N'Christmas')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (5, 2, N'Female', N'24', N'Work', N'Dress', N'3', N'Christmas')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (6, 2, N'Female', N'24', N'Work', N'Top-Shirt', N'3', N'Christmas')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (7, 3, N'Male', N'18', N'Student', N'Shirts', N'2', N'Christmas')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (8, 3, N'Male', N'18', N'Student', N'Shirts', N'2', N'OFF')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (9, 1, N'Male', N'25', N'Work', N'Trousers', N'4', N'OFF')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (10, 3, N'Male', N'32', N'Work', N'Kurta', N'1', N'Diwali')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (11, 4, N'Male', N'32', N'Work', N'Flip-Flops', N'1', N'Diwali')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (12, 4, N'Male', N'32', N'Work', N'Shoes', N'5', N'Diwali')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (13, 4, N'Male', N'32', N'Work', N'Trousers', N'5', N'Diwali')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (14, 4, N'Male', N'32', N'Work', N'Shirts', N'3', N'Diwali')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (15, 3, N'Male', N'18', N'Student', N'T-Shirts', N'2', N'OFF')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (16, 3, N'Male', N'18', N'Student', N'Jeans', N'2', N'OFF')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (17, 1, N'Male', N'23', N'Student', N'Shoes', N'1', N'Christmas')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (18, 1, N'Male', N'20', N'Student', N'Flip-Flops', N'2', N'Independent_day')
INSERT [dbo].[Dataset] ([ID], [User_Id], [Gender], [Age], [Occupation], [History], [Shop_Id], [Season]) VALUES (19, 3, N'Male', N'21', N'Work', N'Shoes', N'1', N'Independent_day')
SET IDENTITY_INSERT [dbo].[Dataset] OFF
SET IDENTITY_INSERT [dbo].[offer_details] ON 

INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (1, 2, 1, N'get off ', N'100', N'90', N'get off 10 %', CAST(N'2019-12-23' AS Date), CAST(N'2020-01-19' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (2, 1, 1, N'50% flat', N'200', N'100', N'get off 50 %', CAST(N'2019-12-26' AS Date), CAST(N'2020-01-25' AS Date), N'img/splash.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (3, 1, 1, N'sale', N'150', N'120', N'buy one get one', CAST(N'2020-01-01' AS Date), CAST(N'2020-01-25' AS Date), N'img/splash.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (4, 2, 2, N'denim jeans', N'1200', N'1000', N'week off', CAST(N'2020-01-10' AS Date), CAST(N'2020-01-15' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (5, 1, 2, N'men jeans', N'1500', N'1300', N'get off', CAST(N'2020-01-25' AS Date), CAST(N'2020-01-30' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (6, 1, 4, N'mens shirt', N'1200', N'900', N'new offer ', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (7, 2, 4, N'mens shirt', N'1000', N'800', N'new offer1', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (8, 2, 3, N'men Tshirt', N'700', N'500', N'20% off', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (9, 1, 3, N'men Tshirt', N'900', N'700', N'20% off', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (10, 1, 5, N'weekly offer', N'1100', N'900', N'buy 1get 1', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (11, 2, 5, N'sunday offer', N'1500', N'1000', N'buy 1get 1', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (12, 1, 6, N'50 % FLAT', N'1200', N'600', N'50 % off', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
INSERT [dbo].[offer_details] ([offer_id], [vendor_id], [cat_id], [offname], [price], [offprice], [offdescription], [offstartdate], [offlastdate], [image]) VALUES (13, 2, 6, N'10 % off', N'1000', N'900', N'10 % off', CAST(N'2020-01-25' AS Date), CAST(N'2020-02-05' AS Date), N'img/img.jpg')
SET IDENTITY_INSERT [dbo].[offer_details] OFF
SET IDENTITY_INSERT [dbo].[Product_master] ON 

INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (1, 1, N'puma')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (2, 1, N'fila')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (3, 2, N'peter')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (4, 2, N'cooper')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (5, 3, N'denim')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (6, 3, N'topez')
INSERT [dbo].[Product_master] ([P_id], [cat_id], [product_name]) VALUES (7, 3, N'hrx')
SET IDENTITY_INSERT [dbo].[Product_master] OFF
SET IDENTITY_INSERT [dbo].[Season_Master] ON 

INSERT [dbo].[Season_Master] ([ID], [Season], [From_Date], [To_Date]) VALUES (1, N'Christmas', CAST(N'2019-12-20' AS Date), CAST(N'2019-12-31' AS Date))
INSERT [dbo].[Season_Master] ([ID], [Season], [From_Date], [To_Date]) VALUES (2, N'New_Year', CAST(N'2019-12-27' AS Date), CAST(N'2019-12-31' AS Date))
INSERT [dbo].[Season_Master] ([ID], [Season], [From_Date], [To_Date]) VALUES (3, N'Independent_day', CAST(N'2020-01-20' AS Date), CAST(N'2020-01-31' AS Date))
INSERT [dbo].[Season_Master] ([ID], [Season], [From_Date], [To_Date]) VALUES (4, N'Diwali', CAST(N'2019-10-20' AS Date), CAST(N'2019-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[Season_Master] OFF
SET IDENTITY_INSERT [dbo].[shop_master] ON 

INSERT [dbo].[shop_master] ([shop_id], [name], [contact], [description], [email], [password]) VALUES (1, N'Sai Textiles', N'9854117956', N'Mens & Womesns faishon Wears', N'sai_tex@gmail.comn', N'12345')
INSERT [dbo].[shop_master] ([shop_id], [name], [contact], [description], [email], [password]) VALUES (2, N'No 1 Collections', N'9632587410', N'All kinds of faishon wears', N'nb1_coll@gmail.com', N'12345')
INSERT [dbo].[shop_master] ([shop_id], [name], [contact], [description], [email], [password]) VALUES (3, N'Jeniva''s  Shop', N'9632587890', N'Ladies Wears', N'jen544@gmail.com', N'12345')
INSERT [dbo].[shop_master] ([shop_id], [name], [contact], [description], [email], [password]) VALUES (4, N'Andrew Collections', N'8864571509', N'Gents and Ladies Collections', N'acollections@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[shop_master] OFF
USE [master]
GO
ALTER DATABASE [Shopping_mall_prediction_db] SET  READ_WRITE 
GO
