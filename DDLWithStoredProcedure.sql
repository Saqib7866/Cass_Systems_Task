USE [master]
GO
/****** Object:  Database [shipper_shipment_db]    Script Date: 12/03/2023 12:48:02 pm ******/
CREATE DATABASE [shipper_shipment_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shipper_shipment_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\shipper_shipment_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shipper_shipment_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\shipper_shipment_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [shipper_shipment_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shipper_shipment_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shipper_shipment_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shipper_shipment_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shipper_shipment_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [shipper_shipment_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shipper_shipment_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [shipper_shipment_db] SET  MULTI_USER 
GO
ALTER DATABASE [shipper_shipment_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shipper_shipment_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shipper_shipment_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shipper_shipment_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shipper_shipment_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shipper_shipment_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [shipper_shipment_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [shipper_shipment_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [shipper_shipment_db]
GO
/****** Object:  Table [dbo].[CARRIER]    Script Date: 12/03/2023 12:48:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRIER](
	[carrier_id] [int] NOT NULL,
	[carrier_name] [varchar](100) NOT NULL,
	[carrier_mode] [varchar](25) NOT NULL,
 CONSTRAINT [PK_CARRIER] PRIMARY KEY CLUSTERED 
(
	[carrier_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPMENT]    Script Date: 12/03/2023 12:48:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPMENT](
	[shipment_id] [int] NOT NULL,
	[shipper_id] [int] NOT NULL,
	[shipment_description] [varchar](100) NOT NULL,
	[shipment_weight] [numeric](18, 2) NOT NULL,
	[shipment_rate_id] [int] NOT NULL,
	[carrier_id] [int] NOT NULL,
 CONSTRAINT [PK_SHIPMENT] PRIMARY KEY CLUSTERED 
(
	[shipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPMENT_RATE]    Script Date: 12/03/2023 12:48:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPMENT_RATE](
	[shipment_rate_id] [int] NOT NULL,
	[shipment_rate_class] [varchar](10) NOT NULL,
	[shipment_rate_description] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SHIPMENT_RATE] PRIMARY KEY CLUSTERED 
(
	[shipment_rate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHIPPER]    Script Date: 12/03/2023 12:48:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SHIPPER](
	[shipper_id] [int] NOT NULL,
	[shipper_name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_SHIPPER] PRIMARY KEY CLUSTERED 
(
	[shipper_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SHIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_SHIPMENT_CARRIER] FOREIGN KEY([carrier_id])
REFERENCES [dbo].[CARRIER] ([carrier_id])
GO
ALTER TABLE [dbo].[SHIPMENT] CHECK CONSTRAINT [FK_SHIPMENT_CARRIER]
GO
ALTER TABLE [dbo].[SHIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_SHIPMENT_SHIPMENT_RATE] FOREIGN KEY([shipment_rate_id])
REFERENCES [dbo].[SHIPMENT_RATE] ([shipment_rate_id])
GO
ALTER TABLE [dbo].[SHIPMENT] CHECK CONSTRAINT [FK_SHIPMENT_SHIPMENT_RATE]
GO
ALTER TABLE [dbo].[SHIPMENT]  WITH CHECK ADD  CONSTRAINT [FK_SHIPMENT_SHIPPER] FOREIGN KEY([shipper_id])
REFERENCES [dbo].[SHIPPER] ([shipper_id])
GO
ALTER TABLE [dbo].[SHIPMENT] CHECK CONSTRAINT [FK_SHIPMENT_SHIPPER]
GO
/****** Object:  StoredProcedure [dbo].[Shipper_Shipment_Details]    Script Date: 12/03/2023 12:48:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Shipper_Shipment_Details]
    @shipper_id INT
AS
BEGIN
   SELECT s.shipment_id, sh.shipper_name, c.carrier_name, s.shipment_description, s.shipment_weight,sr.shipment_rate_description
    FROM SHIPMENT s
    JOIN SHIPPER sh ON s.shipper_id = sh.shipper_id
    JOIN CARRIER c ON s.carrier_id = c.carrier_id
	JOIN SHIPMENT_RATE sr ON s.shipment_rate_id= sr.shipment_rate_id
    WHERE sh.shipper_id = @shipper_id
END
GO
USE [master]
GO
ALTER DATABASE [shipper_shipment_db] SET  READ_WRITE 
GO
