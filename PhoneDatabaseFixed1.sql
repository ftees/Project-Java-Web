USE [master]
GO
/****** Object:  Database [PhoneDB]    Script Date: 11/12/2019 7:47:50 PM ******/
CREATE DATABASE [PhoneDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PhoneDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FTEES\MSSQL\DATA\PhoneDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PhoneDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.FTEES\MSSQL\DATA\PhoneDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PhoneDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PhoneDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PhoneDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PhoneDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PhoneDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PhoneDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PhoneDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PhoneDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PhoneDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PhoneDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PhoneDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PhoneDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PhoneDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PhoneDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PhoneDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PhoneDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PhoneDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PhoneDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PhoneDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PhoneDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PhoneDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PhoneDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PhoneDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PhoneDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PhoneDB] SET RECOVERY FULL 
GO
ALTER DATABASE [PhoneDB] SET  MULTI_USER 
GO
ALTER DATABASE [PhoneDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PhoneDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PhoneDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PhoneDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PhoneDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PhoneDB', N'ON'
GO
ALTER DATABASE [PhoneDB] SET QUERY_STORE = OFF
GO
USE [PhoneDB]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/12/2019 7:47:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/12/2019 7:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandID] [nvarchar](50) NOT NULL,
	[Made] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/12/2019 7:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CusID] [nvarchar](10) NOT NULL,
	[Usename] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[Gmail] [nvarchar](150) NOT NULL,
	[PhoneNumber] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/12/2019 7:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[cusID] [nvarchar](10) NOT NULL,
	[orderID] [nvarchar](10) NOT NULL,
	[productID] [nvarchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[totalPrice] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 11/12/2019 7:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[ID] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Brand] [nvarchar](50) NOT NULL,
	[img] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[addDate] [nvarchar](50) NOT NULL,
	[describe] [nvarchar](1500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneDeals]    Script Date: 11/12/2019 7:47:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneDeals](
	[PhoneID] [nvarchar](10) NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_PhoneDeals] PRIMARY KEY CLUSTERED 
(
	[PhoneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'giang', N'123')
INSERT [dbo].[Admin] ([username], [password]) VALUES (N'tien', N'123')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Apple', N'America')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'LG ', N'Japan')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Nokia', N'NetherLand')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Oppo', N'China')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Samsung', N'Korea')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Sony', N'Japan')
INSERT [dbo].[Brand] ([BrandID], [Made]) VALUES (N'Xiaomi', N'China')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'1', N'gianghoang', N'123', N'gianghoang@gmial.com', N'0819169868')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'2', N'phamtien', N'123', N'phamtien@gmail.com', N'0987654321')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'3', N'admin', N'123', N'admin@gmial.com', N'0987654456')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'abcxyzzz', N'tien', N'123', N'tiennphe130789@fpt.edu.vn', N'1231231231231231')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'shang', N'FTees', N'123', N'oqoqoqo@gmail.com', N'13123132131')
INSERT [dbo].[Customer] ([CusID], [Usename], [Password], [Gmail], [PhoneNumber]) VALUES (N'xyz', N'Pham Tien', N'123', N'qqoqoqoo@gmail.com', N'212312312313')
INSERT [dbo].[Orders] ([cusID], [orderID], [productID], [quantity], [totalPrice]) VALUES (N'1         ', N'Or1       ', N'IP1       ', 1, 18000000)
INSERT [dbo].[Orders] ([cusID], [orderID], [productID], [quantity], [totalPrice]) VALUES (N'1         ', N'Or2       ', N'IP2       ', 1, 17000000)
INSERT [dbo].[Orders] ([cusID], [orderID], [productID], [quantity], [totalPrice]) VALUES (N'2         ', N'Or3       ', N'IP1       ', 1, 18000000)
INSERT [dbo].[Orders] ([cusID], [orderID], [productID], [quantity], [totalPrice]) VALUES (N'2         ', N'Or4       ', N'IP3       ', 1, 70000000)
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'IP1', N'Iphone 11 ', N'Apple', N'img/ip1.jpg', 21000000, 13, N'New', N'2019/10/21', N'Cùng với iPhone 11 Pro, iPhone 11 Pro Max thì chiếc iPhone 11 cũng gây được ấn tượng khi được trang bị nhiều phiên bản màu sắc độc đáo, camera và phần cứng cũng được nâng cấp so với người tiền nhiệm.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'IP2', N'Iphone 11 ProMax', N'Apple', N'img/ip2.jpg', 31009000, 6, N'New', N'2019/10/21', N'iPhone 11 Pro Max có thiết kế tương tự như iPhone 11 Pro nhưng kích thước thì to hơn với kích thước màn hình 6.5 inch và toàn bộ máy có kích thước 158 x 77.8 x 8.1 mm. Thiết kế không có nhiều thay đổi trừ hệ thống camera sau được nâng cấp thành 3 camera. Màn hình tai thỏ vẫn được giữ nguyên và chất liệu thép không gỉ giúp iPhone 11 Pro Max bền bỉ hơn.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'IP3', N'Iphone X Red', N'Apple', N'img/ip3.jpg', 19000000, 15, N'Old', N'2019/10/30', N'Được ra mắt cùng Apple iPhone XS và XS Max, iPhone XR 64GB không chỉ được thừa kế những tính năng đặc trưng nổi trội của người tiền nhiệm iPhone X được ra mắt một năm trước đó và còn có những cải tiến nhằm mang lại trải nghiệm mới lạ và thú vị cho người dùng.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'IP4', N'Iphone X', N'Apple', N'img/ip4.jpg', 18990000, 21, N'New, Used, Old', N'2019/10/21', N'iPhone XS 64GB - Mẫu điện thoại đầu bảng mang lại trải nghiệm tuyệt vời iPhone XS 64GB chính hãng VN/A là bản nâng cấp từ iPhone X, mang trong mình sức mạnh phần cứng vượt trội được tối ưu hóa bởi hệ điều hành iOS nhằm đem lại trải nghiệm mượt mà và tuyệt vời nhất cho người dùng.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'LG1', N'LG 1x', N'LG', N'img/lg1.jpg', 8499900, 12, N'New', N'2019/10/19', N'Sở hữu thiết kế cao cấp và đẹp mắt, từng đường nét được chăm chút tỉ mỉ cùng độ mỏng vừa phải càng làm tôn vẻ thẩm mỹ bên ngoài của chiếc máy. Với ý tưởng thiết kế mặt lưng chuyển màu sắc độc đáo ôm khít thân máy, các góc cạnh được bo tròn mềm mại giúp LG 1 Pro nằm gọn trong lòng bàn tay bạn.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'LG2', N'LG 2X', N'LG', N'img/lg2.jpg', 3099900, 4, N'New', N'03/04/2018', N'Thiết kế bên ngoài của Realme 3 đã có sự nâng cấp so với người tiền nhiệm LG 2. Với bộ khung nhựa được hoàn thiện đến từng chi tiết, mặt lưng không còn đường viền nối giữa phần lưng và màn hình, tạo cảm giác liền mạch, êm ái hơn khi cầm nắm, cũng như tạo sự đồng bộ trong màu sắc.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'LG3', N'LG Pro', N'LG', N'img/lg3.jpg', 6003000, 15, N'New', N'09/04/2019', N'Mặt lưng của LG 3 Pro lại được làm từ chất liệu nhựa đúc chất lượng kết hợp với nhiều lựa chọn màu gradient khác nhau mang đến ngoại hình bắt mắt. Điểm đặc biệt là hiệu ứng ánh sáng bên trên lớp màu gradient với những đường vân cong hình chữ S, khi bạn cầm máy dưới nắng thì sẽ rất là đẹp. ')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'LG4', N'LG Plus', N'LG', N'img/lg4.jpg', 3700099, 23, N'New,Old', N'2019/10/21', N'sở hữu thiết kế cao cấp với bộ khung kim loại nguyên khối. Tuy vậy LG4 rất mỏng chỉ 8.8mm và trọng lượng cực kì nhẹ 199 g. Với thiết kế cùng trọng lượng nhẹ như vậy chiếc smartphone cao cấp này có thể bỏ vừa mọi loại túi quần áo, theo chân người dùng đến mọi nơi.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA', N'Nokia Lumia 2', N'Nokia', N'img/nokia2.jpg', 6000320, 10, N'New', N'2019/10/21', N'Nokia 6.1 Plus được thay đổi hoàn toàn khi sử dụng kết hợp giữa khung kim loại và kính cao cấp đã tạo nên một dáng vẻ sang trọng và đem đến tính thẩm mỹ cũng như sự trẻ trung, năng động. Các viền góc của Nokia 6.1 Plus được bo tròn vô cùng tỉ mỉ, tạo cảm giác vừa chắc chắn vừa nhẹ nhàng khi cầm nắm. ')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA1', N'Nokia 6800', N'Nokia', N'img/nokia1.jpg', 1300000, 20, N'Old', N'12/03/2017', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA2', N'Nokia Lumia 1', N'Nokia ', N'img/nokia4.jpg', 4000999, 4, N'Used', N'2019/10/21', N'Điện thoại Nokia 6.1 Plus là smartphone tầm trung của Nokia sản xuất. Sản phẩm mang thiết kế phong cách tai thỏ với màn hình tràn viền cũng như hiệu năng được cải tiến vượt bậc, tiết kiệm điện năng. Sản phẩm hứa hẹn sẽ gây tiếng vang lớn trong phân khúc tầm trung.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA3', N'Nokia Lumia 3', N'Nokia', N'img/nokia3.jpg', 4500000, 25, N'New', N'2019/10/21', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA4', N'Nokia Lumia 4', N'Nokia', N'img/nokia5.jpg', 6900300, 12, N'New', N'2019/10/21', N'Thiết kế nguyên khối chắc chắn cùng màn hình giọt nước Là một sản phẩm thuộc phân khúc giá rẻ nhưng Nokia 3.2 vẫn mang trong mình một thiết kế nguyên khối sang trọng. Được làm từ nhựa Polycarbonate nhưng Nokia 3.2 trông vẫn bóng bẩy như những thiết bị kim loại nguyên khối. Bên cạnh đó, những chi tiết xung quanh máy được hoàn thiện tỉ mỉ hơn, nhờ đó Nokia 3.2 trông liền mạch hơn so với người anh 3.1 của mình.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'NKA5', N'Nokia Lumia 5', N'Nokia', N'img/nokia6.jpg', 7900000, 5, N'New', N'10/03/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP1', N'Oppo Silver 1', N'Oppo', N'img/op1.jpg', 2000000, 10, N'Old, Used', N'10/02/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP2', N'Oppo Pro 1', N'Oppo', N'img/op2.jpg', 2500000, 8, N'Old,Used', N'10/04/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP3', N'Oppo 1 Pink', N'Oppo', N'img/op3.jpg', 3200000, 12, N'New', N'09/06/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP4', N'Oppo 2 Blue Mint', N'Oppo', N'img/op4.jpg', 4100000, 3, N'New', N'12/09/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP5', N'Oppo 3 ', N'Oppo', N'img/op5.jpg', 6099000, 24, N'New', N'01/01/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'OP6 ', N'Oppo 3 Pink', N'Oppo', N'img/op6.jpg', 8500000, 12, N'New', N'11/02/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SN1', N'Sony A', N'Sony', N'img/sony1.jpg', 4000000, 13, N'New', N'13/05/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SN2', N'Sony B Black', N'Sony', N'img/sony2.jpg', 4500000, 9, N'New', N'17/05/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SN3', N'Sony Pro', N'Sony', N'img/sony3.jpg', 3900000, 9, N'New', N'12/08/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SN4', N'Sony A White', N'Sony', N'img/sony4.jpg', 5000000, 11, N'New', N'12/03/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS1', N'Samsung Galaxy s1', N'Samsung', N'img/ss1.jpg', 3900000, 4, N'Old, Used', N'08/09/2018', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS2', N'Samsung Galaxy s3', N'Samsung', N'img/ss2.jpg', 4500000, 4, N'Old, Used', N'09/10/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS3', N'Samsung Galaxy Note 1', N'Samsung', N'img/ss3.jpg', 6800000, 17, N'New', N'01/01/2019', N'Tổng quan bề ngoài của Samsung Note 1 đa phần khá giống với người tiền nhiệm Galaxy A50. Bộ khung máy là chất liệu nhựa nguyên khối, với màn hình được trang bị lớp kính cong 2.5D tạo nên cảm giác sang trọng nhưng không kém phần cứng cáp khi cầm nắm trên tay.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS4', N'Samsung Galaxy Note 2', N'Samsung', N'img/ss8.jpg', 8999999, 21, N'New', N'2019/10/19', N'Một lần nữa, hãng điện thoại Samsung đã khiến những fan hâm mộ và người dùng công nghệ phải mãn nhãn với thiết kế cũng như cấu hình đẳng cấp của thế hệ tiếp theo thuộc dòng sản phẩm Note – Samsung Galaxy Note 2. Galaxy Note 2 được thiết kế với ý nghĩa để phù hợp với cách con người chủ động trong làm việc và giải trí khi mà cuộc sống ngày càng phụ thuộc vào công nghệ tiên tiến hiện nay.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS5', N'Samsung Galaxy s6', N'Samsung', N'img/ss5.jpg', 12030000, 9, N'New', N'09/04/2019', N'Samsung Galaxy s6 2017 mang trong mình ngôn ngữ thiết kế truyền thống của Samsung. Thiết bị được thiết kế với bốn góc máy được bo tròn nhẹn vừa tạo nét tinh tế, thanh kịch, vừa hạn chế các va chạm trong quá trình sử dụng. Toàn bộ phần khung vỏ có độ hoàn thiện cao, mang đến cảm giác chắc chắn cho người dùng. Phần màn hình trước được điều chỉnh cân đối, các phím vật lý được tích hợp thông minh.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS6', N'Samsung Galaxy s10', N'Samsung', N'img/ss6.jpg', 20000000, 6, N'New', N'09/08/2019', N'Vẫn tiếp tục duy trì thiết kế màn hình tràn viền Infinity - O nhưng SamSung Galaxy S10e được trau truốt, tỉ mỉ hơn trong thiết kế so với Galaxy S9. Sở hữu kích thước 5.8 inch full HD, tỉ lệ 19:9 nhưng máy khá gọn nhẹ nhờ 4 viền siêu mỏng và camera chìm trong màn hình thông qua nốt ruồi được cắt laser chuẩn xác khéo léo. Nhờ đó mà tỉ lệ hiển thị trên Galaxy S10e gần như chiếm trọn màn hình, mở ra tầm nhìn mới đùng chuẩn vô cực.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'SS7 ', N'Samsung Galaxy s10+', N'Samsung', N'img/ss7.jpg', 23000000, 9, N'New', N'12/10/2019', N'Là một trong những sản phẩm cận cao cấp, không quá ngạc nhiên khi Samsung trang bị cho Galaxy A70 tấm nền Super AMOLED. Kích thước của màn hình là 6.7 inch cùng độ phân giải 1080 x 2340 pixel chắc chắn máy sẽ có khả năng hiển thị rất tốt, với màu sắc tươi tắn cùng màu đen sâu.')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'XM1', N'Xiaomi x1', N'Xiaomi', N'img/xm1.jpg', 4005000, 10, N'New', N'11/03/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'XM2', N'Xiaomi x2', N'Xiaomi', N'img/xm2.jpg', 5000000, 9, N'New, Used', N'07/04/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'XM3', N'Xiaomi a1 Pro', N'Xiaomi', N'img/xm3.jpg', 7899000, 9, N'New', N'09/09/2019', N'b')
INSERT [dbo].[Phone] ([ID], [Name], [Brand], [img], [price], [quantity], [status], [addDate], [describe]) VALUES (N'XM4', N'Xiaomi a1 ECO', N'Xiaomi', N'img/xm4.jpg', 6900000, 11, N'New', N'02/10/2019', N'b')
INSERT [dbo].[PhoneDeals] ([PhoneID], [Discount]) VALUES (N'IP1', 0.8)
INSERT [dbo].[PhoneDeals] ([PhoneID], [Discount]) VALUES (N'IP2', 0.5)
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customer] ([CusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Phone] FOREIGN KEY([productID])
REFERENCES [dbo].[Phone] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Phone]
GO
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Brand] FOREIGN KEY([Brand])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Phone] CHECK CONSTRAINT [FK_Phone_Brand]
GO
ALTER TABLE [dbo].[PhoneDeals]  WITH CHECK ADD  CONSTRAINT [FK_PhoneDeals_Phone] FOREIGN KEY([PhoneID])
REFERENCES [dbo].[Phone] ([ID])
GO
ALTER TABLE [dbo].[PhoneDeals] CHECK CONSTRAINT [FK_PhoneDeals_Phone]
GO
USE [master]
GO
ALTER DATABASE [PhoneDB] SET  READ_WRITE 
GO
