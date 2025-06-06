USE [master]
GO
/****** Object:  Database [pubs]    Script Date: 02/06/2025 07:08:37 p. m. ******/
CREATE DATABASE [pubs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pubs', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\pubs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pubs_log', FILENAME = N'D:\SQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\pubs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pubs] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pubs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pubs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pubs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pubs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pubs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pubs] SET ARITHABORT OFF 
GO
ALTER DATABASE [pubs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pubs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pubs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pubs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pubs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pubs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pubs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pubs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pubs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pubs] SET  ENABLE_BROKER 
GO
ALTER DATABASE [pubs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pubs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pubs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pubs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pubs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pubs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pubs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pubs] SET RECOVERY FULL 
GO
ALTER DATABASE [pubs] SET  MULTI_USER 
GO
ALTER DATABASE [pubs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pubs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pubs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pubs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pubs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pubs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'pubs', N'ON'
GO
ALTER DATABASE [pubs] SET QUERY_STORE = ON
GO
ALTER DATABASE [pubs] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pubs]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[au_id] [char](11) NOT NULL,
	[au_lname] [varchar](40) NOT NULL,
	[au_fname] [varchar](20) NOT NULL,
	[phone] [char](12) NULL,
	[address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[au_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publishers]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publishers](
	[pub_id] [char](4) NOT NULL,
	[pub_name] [varchar](40) NOT NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[country] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[pub_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sales]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sales](
	[stor_id] [char](4) NOT NULL,
	[ord_num] [int] NOT NULL,
	[ord_date] [datetime] NULL,
	[title_id] [char](6) NOT NULL,
	[qty] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[stor_id] ASC,
	[ord_num] ASC,
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores](
	[stor_id] [char](4) NOT NULL,
	[stor_name] [varchar](40) NOT NULL,
	[stor_address] [varchar](40) NULL,
	[city] [varchar](20) NULL,
	[state] [char](2) NULL,
	[zip] [char](5) NULL,
	[phone] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[stor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titleauthors]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titleauthors](
	[au_id] [char](11) NOT NULL,
	[title_id] [char](6) NOT NULL,
	[au_ord] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[au_id] ASC,
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[titles]    Script Date: 02/06/2025 07:08:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[titles](
	[title_id] [char](6) NOT NULL,
	[title] [varchar](80) NOT NULL,
	[type] [varchar](12) NULL,
	[pub_id] [char](4) NOT NULL,
	[price] [money] NULL,
	[advance] [money] NULL,
	[royalty] [int] NULL,
	[ytd_sales] [int] NULL,
	[notes] [varchar](200) NULL,
	[pubdate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[title_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (N'172-32-1176', N'Ralls', N'Kim', N'408 555-5831', N'140 Old Town Road', N'Sunnyvale', N'CA', N'94086')
INSERT [dbo].[authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (N'173-46-9857', N'Fakhouri', N'Sana', N'408 555-4100', N'1098 Forest Avenue', N'Sunnyvale', N'CA', N'94086')
INSERT [dbo].[authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (N'174-29-5123', N'Candless', N'Roger', N'408 555-9162', N'122 Ebony Street', N'Sunnyvale', N'CA', N'94086')
INSERT [dbo].[authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (N'175-32-9250', N'Zarnecki', N'Laura', N'415 555-5937', N'2151 Pine Lane', N'Palo Alto', N'CA', N'94301')
INSERT [dbo].[authors] ([au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (N'176-34-2335', N'Olsen', N'Gary', N'415 555-1982', N'1480 Maple Drive', N'Palo Alto', N'CA', N'94301')
GO
INSERT [dbo].[publishers] ([pub_id], [pub_name], [city], [state], [country]) VALUES (N'0736', N'Wrox Press', N'Birmingham', N'AL', N'USA')
INSERT [dbo].[publishers] ([pub_id], [pub_name], [city], [state], [country]) VALUES (N'0737', N'Apress', N'Boston', N'MA', N'USA')
INSERT [dbo].[publishers] ([pub_id], [pub_name], [city], [state], [country]) VALUES (N'0738', N'Microsoft Press', N'Redmond', N'WA', N'USA')
INSERT [dbo].[publishers] ([pub_id], [pub_name], [city], [state], [country]) VALUES (N'0739', N'Addison-Wesley', N'Boston', N'MA', N'USA')
INSERT [dbo].[publishers] ([pub_id], [pub_name], [city], [state], [country]) VALUES (N'0740', N'Manning', N'Shelter Island', N'NY', N'USA')
GO
INSERT [dbo].[sales] ([stor_id], [ord_num], [ord_date], [title_id], [qty]) VALUES (N'STR1', 1001, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'BU1032', 10)
INSERT [dbo].[sales] ([stor_id], [ord_num], [ord_date], [title_id], [qty]) VALUES (N'STR1', 1002, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'BU2045', 5)
INSERT [dbo].[sales] ([stor_id], [ord_num], [ord_date], [title_id], [qty]) VALUES (N'STR2', 1003, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'BU3001', 7)
INSERT [dbo].[sales] ([stor_id], [ord_num], [ord_date], [title_id], [qty]) VALUES (N'STR3', 1004, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'BU4003', 3)
INSERT [dbo].[sales] ([stor_id], [ord_num], [ord_date], [title_id], [qty]) VALUES (N'STR3', 1005, CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'BU5007', 8)
GO
INSERT [dbo].[stores] ([stor_id], [stor_name], [stor_address], [city], [state], [zip], [phone]) VALUES (N'STR1', N'Downtown Books', N'123 Main St', N'Seattle', N'WA', N'98101', N'206 555-1212')
INSERT [dbo].[stores] ([stor_id], [stor_name], [stor_address], [city], [state], [zip], [phone]) VALUES (N'STR2', N'City Lights', N'456 Market St', N'San Francisco', N'CA', N'94105', N'415 555-1234')
INSERT [dbo].[stores] ([stor_id], [stor_name], [stor_address], [city], [state], [zip], [phone]) VALUES (N'STR3', N'Campus Books', N'789 College Ave', N'Berkeley', N'CA', N'94704', N'510 555-5678')
GO
INSERT [dbo].[titleauthors] ([au_id], [title_id], [au_ord]) VALUES (N'172-32-1176', N'BU1032', 1)
INSERT [dbo].[titleauthors] ([au_id], [title_id], [au_ord]) VALUES (N'173-46-9857', N'BU2045', 1)
INSERT [dbo].[titleauthors] ([au_id], [title_id], [au_ord]) VALUES (N'174-29-5123', N'BU3001', 1)
INSERT [dbo].[titleauthors] ([au_id], [title_id], [au_ord]) VALUES (N'175-32-9250', N'BU4003', 1)
INSERT [dbo].[titleauthors] ([au_id], [title_id], [au_ord]) VALUES (N'176-34-2335', N'BU5007', 1)
GO
INSERT [dbo].[titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (N'BU1032', N'Visual Basic: How to Program', N'Programming', N'0736', 39.9900, 5000.0000, 10, 500, N'An introduction to VB.', CAST(N'1999-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (N'BU2045', N'Advanced Visual Basic', N'Programming', N'0737', 49.9900, 6000.0000, 12, 350, N'Advanced topics in VB.', CAST(N'2001-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (N'BU3001', N'SQL Server Programming', N'Database', N'0738', 59.9900, 7000.0000, 15, 450, N'Working with SQL Server.', CAST(N'2000-09-20T00:00:00.000' AS DateTime))
INSERT [dbo].[titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (N'BU4003', N'C# in Depth', N'Programming', N'0739', 69.9900, 10000.0000, 20, 700, N'Deep dive into C#.', CAST(N'2002-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[titles] ([title_id], [title], [type], [pub_id], [price], [advance], [royalty], [ytd_sales], [notes], [pubdate]) VALUES (N'BU5007', N'Java Fundamentals', N'Programming', N'0740', 55.9900, 8000.0000, 18, 400, N'Basics of Java.', CAST(N'2003-08-05T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[sales]  WITH CHECK ADD  CONSTRAINT [fk_sales_title] FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[sales] CHECK CONSTRAINT [fk_sales_title]
GO
ALTER TABLE [dbo].[titleauthors]  WITH CHECK ADD  CONSTRAINT [fk_titleauthors_au] FOREIGN KEY([au_id])
REFERENCES [dbo].[authors] ([au_id])
GO
ALTER TABLE [dbo].[titleauthors] CHECK CONSTRAINT [fk_titleauthors_au]
GO
ALTER TABLE [dbo].[titleauthors]  WITH CHECK ADD  CONSTRAINT [fk_titleauthors_title] FOREIGN KEY([title_id])
REFERENCES [dbo].[titles] ([title_id])
GO
ALTER TABLE [dbo].[titleauthors] CHECK CONSTRAINT [fk_titleauthors_title]
GO
ALTER TABLE [dbo].[titles]  WITH CHECK ADD  CONSTRAINT [fk_titles_pub] FOREIGN KEY([pub_id])
REFERENCES [dbo].[publishers] ([pub_id])
GO
ALTER TABLE [dbo].[titles] CHECK CONSTRAINT [fk_titles_pub]
GO
USE [master]
GO
ALTER DATABASE [pubs] SET  READ_WRITE 
GO
