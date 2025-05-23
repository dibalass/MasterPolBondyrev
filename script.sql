USE [master]
GO
/****** Object:  Database [MasterPol]    Script Date: 30.04.2025 9:34:21 ******/
CREATE DATABASE [MasterPol]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MasterPol', FILENAME = N'C:\Users\st310-02\MasterPol.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MasterPol_log', FILENAME = N'C:\Users\st310-02\MasterPol_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MasterPol] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MasterPol].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MasterPol] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MasterPol] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MasterPol] SET ARITHABORT OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MasterPol] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MasterPol] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MasterPol] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MasterPol] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MasterPol] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MasterPol] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MasterPol] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MasterPol] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MasterPol] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MasterPol] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MasterPol] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MasterPol] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MasterPol] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MasterPol] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MasterPol] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MasterPol] SET  MULTI_USER 
GO
ALTER DATABASE [MasterPol] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MasterPol] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MasterPol] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MasterPol] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MasterPol] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MasterPol] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MasterPol] SET QUERY_STORE = OFF
GO
USE [MasterPol]
GO
/****** Object:  Table [dbo].[Material_type_import]    Script Date: 30.04.2025 9:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material_type_import](
	[Тип_материала] [nvarchar](50) NOT NULL,
	[Процент_брака_материала] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Material_type_import] PRIMARY KEY CLUSTERED 
(
	[Тип_материала] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partner_products_import]    Script Date: 30.04.2025 9:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partner_products_import](
	[id] [int] NOT NULL,
	[Продукция] [nvarchar](max) NOT NULL,
	[Наименование_партнера] [nvarchar](max) NOT NULL,
	[Количество_продукции] [int] NOT NULL,
	[Дата_продажи] [date] NOT NULL,
 CONSTRAINT [PK_Partner_products_import] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners_import]    Script Date: 30.04.2025 9:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners_import](
	[Тип_партнера] [nvarchar](max) NOT NULL,
	[Наименование_партнера] [nvarchar](50) NOT NULL,
	[Директор] [nvarchar](max) NOT NULL,
	[Электронная_почта_партнера] [nvarchar](max) NOT NULL,
	[Телефон_партнера] [nvarchar](max) NOT NULL,
	[Юридический_адрес_партнера] [nvarchar](max) NOT NULL,
	[ИНН] [numeric](18, 0) NOT NULL,
	[Рейтинг] [int] NOT NULL,
 CONSTRAINT [PK_Partners_import] PRIMARY KEY CLUSTERED 
(
	[Наименование_партнера] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_type_import]    Script Date: 30.04.2025 9:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_type_import](
	[Тип_продукции] [nvarchar](50) NOT NULL,
	[Коэффициент_типа_продукции] [decimal](18, 2) NULL,
 CONSTRAINT [PK_dbo.Product_type_import] PRIMARY KEY CLUSTERED 
(
	[Тип_продукции] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_import]    Script Date: 30.04.2025 9:34:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_import](
	[Тип_продукции] [nvarchar](max) NOT NULL,
	[Наименование_продукции] [nvarchar](max) NOT NULL,
	[Артикул] [int] NOT NULL,
	[Минимальная_стоимость_для_партнера] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Products_import] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [MasterPol] SET  READ_WRITE 
GO
