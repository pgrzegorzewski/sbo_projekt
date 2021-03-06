USE [master]
GO
/****** Object:  Database [cars]    Script Date: 08.01.2019 23:48:09 ******/
CREATE DATABASE [cars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cars', FILENAME = N'C:\cars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cars_log', FILENAME = N'C:\cars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [cars] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cars] SET ARITHABORT OFF 
GO
ALTER DATABASE [cars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cars] SET  ENABLE_BROKER 
GO
ALTER DATABASE [cars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cars] SET RECOVERY FULL 
GO
ALTER DATABASE [cars] SET  MULTI_USER 
GO
ALTER DATABASE [cars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cars] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cars', N'ON'
GO
ALTER DATABASE [cars] SET QUERY_STORE = OFF
GO
USE [cars]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 08.01.2019 23:48:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[region] [nvarchar](150) NULL,
	[street] [nvarchar](150) NULL,
	[city] [nvarchar](150) NULL,
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[car_versions]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_versions](
	[version_id] [int] NOT NULL,
	[version_name] [varchar](255) NULL,
	[is_radio_available] [bit] NULL,
	[is_air_condition_available] [bit] NULL,
	[is_pearl_paint_available] [bit] NULL,
	[is_gps_available] [bit] NULL,
	[is_leather_available] [bit] NULL,
	[is_parking_support_avaible] [bit] NULL,
	[model_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cars]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cars](
	[car_id] [int] NOT NULL,
	[car_version] [int] NULL,
	[is_sold] [bit] NULL,
 CONSTRAINT [PK_cars] PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_addresses]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_addresses](
	[client_address_id] [int] IDENTITY(1,1) NOT NULL,
	[address_id] [int] NOT NULL,
 CONSTRAINT [PK_client_addresses] PRIMARY KEY CLUSTERED 
(
	[client_address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[client_id] [int] IDENTITY(1,1) NOT NULL,
	[client_first_name] [varchar](255) NULL,
	[client_last_name] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[client_sex] [varchar](1) NULL,
	[client_address_id] [int] NULL,
 CONSTRAINT [PK__client__BF21A424EC416234] PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[engines]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[engines](
	[engine_id] [int] NOT NULL,
	[engine_type] [varchar](255) NULL,
	[engine_size] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[engine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manufacturers]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manufacturers](
	[manufacturer_id] [int] NOT NULL,
	[manufacturer_name] [nchar](10) NULL,
 CONSTRAINT [PK_manufacturers] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[model]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[model](
	[model_id] [int] NOT NULL,
	[model_name] [varchar](255) NULL,
	[model_class] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[models]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[models](
	[model_id] [int] NOT NULL,
	[model_name] [varchar](255) NULL,
	[model_class] [varchar](255) NULL,
	[manufacturer_id] [int] NULL,
	[engine_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchases]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases](
	[purchase_id] [int] NOT NULL,
	[client_id] [int] NULL,
	[car_id] [int] NULL,
	[price] [bigint] NULL,
	[purchase_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[version]    Script Date: 08.01.2019 23:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version](
	[version_id] [int] NOT NULL,
	[version_name] [varchar](255) NULL,
	[is_radio_available] [bit] NULL,
	[is_air_condition_available] [bit] NULL,
	[is_pearl_paint_available] [bit] NULL,
	[is_gps_available] [bit] NULL,
	[is_leather_available] [bit] NULL,
	[is_parking_support_avaible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[car_versions]  WITH CHECK ADD  CONSTRAINT [FK_model_id] FOREIGN KEY([model_id])
REFERENCES [dbo].[models] ([model_id])
GO
ALTER TABLE [dbo].[car_versions] CHECK CONSTRAINT [FK_model_id]
GO
ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [FK_cars_version] FOREIGN KEY([car_version])
REFERENCES [dbo].[car_versions] ([version_id])
GO
ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [FK_cars_version]
GO
ALTER TABLE [dbo].[client_addresses]  WITH CHECK ADD  CONSTRAINT [FK_client_addresses_addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[addresses] ([address_id])
GO
ALTER TABLE [dbo].[client_addresses] CHECK CONSTRAINT [FK_client_addresses_addresses]
GO
ALTER TABLE [dbo].[models]  WITH CHECK ADD  CONSTRAINT [FK_engine_id] FOREIGN KEY([engine_id])
REFERENCES [dbo].[engines] ([engine_id])
GO
ALTER TABLE [dbo].[models] CHECK CONSTRAINT [FK_engine_id]
GO
ALTER TABLE [dbo].[models]  WITH CHECK ADD  CONSTRAINT [FK_manufacturer_id] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturers] ([manufacturer_id])
GO
ALTER TABLE [dbo].[models] CHECK CONSTRAINT [FK_manufacturer_id]
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD  CONSTRAINT [FK_purchase_car] FOREIGN KEY([car_id])
REFERENCES [dbo].[cars] ([car_id])
GO
ALTER TABLE [dbo].[purchases] CHECK CONSTRAINT [FK_purchase_car]
GO
USE [master]
GO
ALTER DATABASE [cars] SET  READ_WRITE 
GO
