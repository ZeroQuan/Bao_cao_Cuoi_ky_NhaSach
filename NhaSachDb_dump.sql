/****** Object:  Database [NhaSachDb]    Script Date: 8/25/25 1:24:10AM ******/
CREATE DATABASE [NhaSachDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NhaSachDb', FILENAME = N'/var/opt/mssql/data/NhaSachDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NhaSachDb_log', FILENAME = N'/var/opt/mssql/data/NhaSachDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NhaSachDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NhaSachDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NhaSachDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NhaSachDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NhaSachDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NhaSachDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [NhaSachDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NhaSachDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NhaSachDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NhaSachDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NhaSachDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NhaSachDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NhaSachDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NhaSachDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NhaSachDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NhaSachDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NhaSachDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NhaSachDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NhaSachDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NhaSachDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NhaSachDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NhaSachDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [NhaSachDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NhaSachDb] SET RECOVERY FULL 
GO
ALTER DATABASE [NhaSachDb] SET  MULTI_USER 
GO
ALTER DATABASE [NhaSachDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NhaSachDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NhaSachDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NhaSachDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NhaSachDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NhaSachDb', N'ON'
GO
ALTER DATABASE [NhaSachDb] SET QUERY_STORE = OFF
GO
USE [NhaSachDb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Baiviet]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baiviet](
	[Baiviet_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tieude_Baiviet] [nvarchar](250) NOT NULL,
	[Tomtat_Baiviet] [nvarchar](400) NULL,
	[Noidung_Baiviet] [nvarchar](max) NULL,
	[Slug_Baiviet] [nvarchar](200) NULL,
	[TacGia_Baiviet] [nvarchar](100) NULL,
	[Ngay_Tao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Baiviet] PRIMARY KEY CLUSTERED 
(
	[Baiviet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Baiviet_Tag]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baiviet_Tag](
	[Baiviet_Id] [int] NOT NULL,
	[Tag_Id] [int] NOT NULL,
 CONSTRAINT [PK_Baiviet_Tag] PRIMARY KEY CLUSTERED 
(
	[Baiviet_Id] ASC,
	[Tag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Danhmuc]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Danhmuc](
	[Danhmuc_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Danhmuc] [nvarchar](200) NOT NULL,
	[MoTa_Danhmuc] [nvarchar](max) NULL,
	[Slug_Danhmuc] [nvarchar](200) NULL,
 CONSTRAINT [PK_Danhmuc] PRIMARY KEY CLUSTERED 
(
	[Danhmuc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donhang]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhang](
	[Donhang_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ma_Don] [nvarchar](30) NOT NULL,
	[User_Id] [nvarchar](450) NULL,
	[Ho_Ten] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[DienThoai] [nvarchar](30) NOT NULL,
	[Dia_Chi] [nvarchar](400) NOT NULL,
	[Tong_Tien] [decimal](18, 2) NOT NULL,
	[TrangThai_Don] [nvarchar](30) NOT NULL,
	[Ngay_Dat] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Donhang] PRIMARY KEY CLUSTERED 
(
	[Donhang_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donhang_Chitiet]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhang_Chitiet](
	[Donhang_Chitiet_Id] [int] IDENTITY(1,1) NOT NULL,
	[Donhang_Id] [int] NOT NULL,
	[Sanpham_Id] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Donhang_Chitiet] PRIMARY KEY CLUSTERED 
(
	[Donhang_Chitiet_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Giohang_Item]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giohang_Item](
	[Giohang_Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Session_Id] [nvarchar](64) NOT NULL,
	[User_Id] [nvarchar](max) NULL,
	[Sanpham_Id] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia_LucThem] [decimal](18, 2) NOT NULL,
	[Ngay_Tao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Giohang_Item] PRIMARY KEY CLUSTERED 
(
	[Giohang_Item_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[Sanpham_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Sanpham] [nvarchar](250) NOT NULL,
	[MoTaNgan_Sanpham] [nvarchar](400) NULL,
	[MoTa_Sanpham] [nvarchar](max) NULL,
	[Gia_Ban] [decimal](18, 2) NOT NULL,
	[Gia_KhuyenMai] [decimal](18, 2) NULL,
	[SKU_Sanpham] [nvarchar](50) NULL,
	[SoLuong_Ton] [int] NOT NULL,
	[HinhAnh_Chinh] [nvarchar](500) NULL,
	[Con_Hang] [bit] NOT NULL,
	[Ngay_Tao] [datetime2](7) NOT NULL,
	[TacGia] [nvarchar](150) NULL,
	[NhaXuatBan] [nvarchar](150) NULL,
	[NamXuatBan] [int] NULL,
	[ISBN] [nvarchar](20) NULL,
	[Danhmuc_Id] [int] NOT NULL,
 CONSTRAINT [PK_Sanpham] PRIMARY KEY CLUSTERED 
(
	[Sanpham_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sukien]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sukien](
	[Sukien_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tieude_Sukien] [nvarchar](250) NOT NULL,
	[Mota_Sukien] [nvarchar](max) NULL,
	[BatDau_Sukien] [datetime2](7) NOT NULL,
	[KetThuc_Sukien] [datetime2](7) NOT NULL,
	[Diadiem_Sukien] [nvarchar](200) NULL,
	[Slug_Sukien] [nvarchar](200) NULL,
	[Banner_Sukien] [nvarchar](500) NULL,
 CONSTRAINT [PK_Sukien] PRIMARY KEY CLUSTERED 
(
	[Sukien_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[Tag_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten_Tag] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[Tag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [nvarchar](450) NOT NULL,
	[Ho_Ten] [nvarchar](max) NULL,
	[Dia_Chi] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trang]    Script Date: 8/25/25 1:24:11AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trang](
	[Trang_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tieude_Trang] [nvarchar](250) NOT NULL,
	[Noidung_Trang] [nvarchar](max) NULL,
	[Slug_Trang] [nvarchar](200) NULL,
	[HienThi_Menu] [bit] NOT NULL,
	[Ngay_Tao] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Trang] PRIMARY KEY CLUSTERED 
(
	[Trang_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250823095933_Drop_Unused_Tables', N'8.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250823113721_Baseline', N'8.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250823114033_Db_Cleanup_And_Fixes', N'8.0.0')
SET IDENTITY_INSERT [dbo].[Danhmuc] ON 

INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (1, N'Kinh tế – Quản trị', N'Sách kinh doanh, marketing, tài chính, quản trị nhân sự, khởi nghiệp.', N'kinh-te-quan-tri')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (2, N'Tâm lý – Sống đẹp', N'Phát triển bản thân, tâm lý ứng dụng, mindfulness, hạnh phúc.', N'tam-ly-song-dep')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (3, N'Công nghệ – Lập trình', N'Sách công nghệ, lập trình, dữ liệu, AI/ML dành cho người đi làm.', N'cong-nghe-lap-trinh')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (4, N'Lịch sử – Văn minh', N'Lịch sử thế giới, Việt Nam, các nền văn minh và nhân vật lịch sử.', N'lich-su-van-minh')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (5, N'Triết học – Tôn giáo', N'Triết học cổ điển/hiện đại, tôn giáo học, văn bản gốc & bình giải.', N'triet-hoc-ton-giao')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (6, N'Nghệ thuật – Nhiếp ảnh', N'Hội họa, kiến trúc, thiết kế, nhạc, điện ảnh, nhiếp ảnh.', N'nghe-thuat-nhiep-anh')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (7, N'Du lịch – Ẩm thực', N'Cẩm nang du lịch, văn hoá vùng miền, công thức nấu ăn.', N'du-lich-am-thuc')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (8, N'Y học – Sức khỏe', N'Sức khoẻ thể chất/tinh thần, dinh dưỡng, y học thường thức.', N'y-hoc-suc-khoe')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (9, N'Nông nghiệp – Làm vườn', N'Kỹ thuật trồng trọt, chăn nuôi, bonsai, chăm sóc cây.', N'nong-nghiep-lam-vuon')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (10, N'Học ngoại ngữ', N'Anh/ Nhật/ Hàn/ Trung… ngữ pháp, từ vựng, luyện thi chứng chỉ.', N'hoc-ngoai-ngu')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (11, N'Trinh thám', N'Tiểu thuyết trinh thám, suy luận, hình sự.', N'trinh-tham')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (12, N'Tiểu Thuyết', N'Văn học hư cấu: hiện đại, cổ điển, light novel…', N'tieu-thuyet')
INSERT [dbo].[Danhmuc] ([Danhmuc_Id], [Ten_Danhmuc], [MoTa_Danhmuc], [Slug_Danhmuc]) VALUES (13, N'Truyện tranh', N'Truyện tranh dành cho mọi lứa tuổi với kho tựa phong phú: manga, manhwa, manhua và comic. Dễ tìm các dòng shounen, shoujo, isekai, slice-of-life, trinh thám. Sách in đẹp, cập nhật liên tục, nhiều ưu đãi.', N'truyen-tranh')
SET IDENTITY_INSERT [dbo].[Danhmuc] OFF
SET IDENTITY_INSERT [dbo].[Donhang] ON 

INSERT [dbo].[Donhang] ([Donhang_Id], [Ma_Don], [User_Id], [Ho_Ten], [Email], [DienThoai], [Dia_Chi], [Tong_Tien], [TrangThai_Don], [Ngay_Dat]) VALUES (1, N'DH20250824015848', N'5c5074a5-74db-4f49-ad20-7c1482208db2', N'Hoang Quan', N'qdq322@gmail.com', N'0961618600', N'458 Nguyễn Hữu Thọ, P. Tân Hưng, Quận 7, TP. HCM', CAST(1122000.00 AS Decimal(18, 2)), N'Chờ Xử Lý', CAST(N'2025-08-24T01:58:48.2237640' AS DateTime2))
INSERT [dbo].[Donhang] ([Donhang_Id], [Ma_Don], [User_Id], [Ho_Ten], [Email], [DienThoai], [Dia_Chi], [Tong_Tien], [TrangThai_Don], [Ngay_Dat]) VALUES (2, N'DH20250824084442', N'5c5074a5-74db-4f49-ad20-7c1482208db2', N'Hoang Quan', N'quanquan2250@gmail.com', N'0961618600', N'300 Nguyễn Tất Thành, Quận 4, TP. HCM', CAST(972000.00 AS Decimal(18, 2)), N'Chờ Xử Lý', CAST(N'2025-08-24T08:44:42.3612620' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Donhang] OFF
SET IDENTITY_INSERT [dbo].[Donhang_Chitiet] ON 

INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (1, 1, 26, 2, CAST(399000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (2, 1, 39, 1, CAST(195000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (3, 1, 30, 1, CAST(129000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (4, 2, 39, 2, CAST(195000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (5, 2, 38, 2, CAST(159000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (6, 2, 37, 1, CAST(135000.00 AS Decimal(18, 2)))
INSERT [dbo].[Donhang_Chitiet] ([Donhang_Chitiet_Id], [Donhang_Id], [Sanpham_Id], [SoLuong], [DonGia]) VALUES (7, 2, 30, 1, CAST(129000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Donhang_Chitiet] OFF
SET IDENTITY_INSERT [dbo].[Giohang_Item] ON 

INSERT [dbo].[Giohang_Item] ([Giohang_Item_Id], [Session_Id], [User_Id], [Sanpham_Id], [SoLuong], [DonGia_LucThem], [Ngay_Tao]) VALUES (1, N'7dd8fc01473e4e2b9705f159f8fbbdba', NULL, 38, 1, CAST(159000.00 AS Decimal(18, 2)), CAST(N'2025-08-23T13:21:50.1109450' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Giohang_Item] OFF
SET IDENTITY_INSERT [dbo].[Sanpham] ON 

INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (3, N'An toàn thông tin', N'OWASP, recon, exploit lab, phòng thủ cơ bản.', N'Giáo trình Chính sách an toàn thông tin cho doanh nghiệp được biên soạn hướng đến không chỉ dành cho sinh viên cao đẳng, đại học, sau đại học, mà còn cho cả nhà quản trị các doanh nghiệp.

Nhóm tác giả hy vọng thông qua giáo trình này sẽ cung cấp cho người đọc một cái nhìn tổng quan đến chi tiết các vấn đề xung quanh việc xây dựng và vận hành các chính sách để bảo vệ các hệ thống công nghệ thông tin và tài sản thông tin doanh nghiệp. ', CAST(225000.00 AS Decimal(18, 2)), NULL, N'BK0003', 40, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/4e0c1b98c68a424581cc2ea4c10c741e.jpg', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N'Lê Kim Hùng, Tô Nguyễn Nhật Quang, Trần Thị Dung, Bùi Thị Thanh Bình,', N'NXB Đại học Quốc gia TP.HCM', 2019, N'9786040000003', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (5, N'Phân tích dữ liệu', N'Làm sạch, transform, visualize; notebook thực hành.', N'Python for Data Analysis: Data Wrangling with Pandas là cuốn sách "gối đầu giường" cho mọi nhà khoa học dữ liệu, kỹ sư dữ liệu và nhà phân tích muốn làm chủ việc xử lý và phân tích dữ liệu bằng Python. Được viết bởi chính người tạo ra thư viện Pandas, Wes McKinney, cuốn sách này cung cấp hướng dẫn thực tế về cách thao tác, làm sạch, biến đổi và phân tích dữ liệu hiệu quả, giúp bạn khai thác tối đa sức mạnh của dữ liệu.', CAST(310000.00 AS Decimal(18, 2)), NULL, N'BK0005', 45, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/4c3624aa6b4e431d94ef4865131a3c91.webp', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N' Wes McKinney', N'NXB CNTT', 2024, N'9786040000005', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (7, N'Còn Chút Gì Để Nhớ', N'Dường như khi trở thành một chàng trai mười tám tuổi, không chú bé nào là không phấn khởi. Đối với tôi cũng vậy, đó là một ngày kỳ diệu vô cùng.', N'Tôi còn nhớ trước đó hai năm, khi một đứa bạn cùng lớp hí hửng khoe: "Thế là năm nay tao mười tám tuổi", tôi đã ghen tị một cách khổ sở với hạnh phúc của nó. Mặc dù lớn xác như nó, đi học trễ hơn bạn bè hai, ba năm, chẳng được cái vinh dự gì ngoài mỗi "ưu điểm" to con nên được cô chủ nhiệm phân làm lớp trưởng. Tuy nhiên mười tám tuổi vẫn cứ là mười tám tuổi, vẫn cứ là cái tuổi oai vệ, đáng ao ước và đầy bí mật đối với bọn nhóc tì như tôi. Lúc đó, tôi đã cay đắng vô cùng khi nhận ra rằng mình phải phấn đấu đến hai năm đằng đẵng nữa mới được như nó.', CAST(50000.00 AS Decimal(18, 2)), NULL, N'BK0007', 35, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/3a2a88dc40bb482ca39a8d727cc822bc.jpg', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N'Nguyễn Nhật Ánh', N'NXB Trẻ', 2007, N'9786040000007', 12)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (11, N'Docker & Kubernetes từ cơ bản đến nâng cao', N'Container, image, helm, CI/CD, vận hành cluster.', N'Cuốn sách này sẽ bắt đầu bằng việc giới thiệu Docker và đi sâu vào các khái niệm về mạng và lưu trữ liên tục. Sau đó, bạn sẽ học cách tái cấu trúc ứng dụng monolith thành các dịch vụ riêng biệt bằng cách xây dựng ứng dụng và đóng gói nó vào các container Docker. Tiếp theo, bạn sẽ tạo một image chứa Ứng dụng Java Enterprise và sau đó chạy nó bằng Docker. Tiếp theo, cuốn sách sẽ tập trung vào Kubernetes và các tính năng của nó, đồng thời bạn sẽ học cách triển khai ứng dụng Java lên Kubernetes bằng Maven và giám sát ứng dụng Java trong môi trường production. Cuối sách, bạn sẽ được thực hành với một số chủ đề nâng cao hơn để mở rộng kiến ​​thức về Docker và Kubernetes.
', CAST(245000.00 AS Decimal(18, 2)), NULL, N'BK0011', 50, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/2541dac96d8b45f1b704fb8bc33f59cf.jpg', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N'Lâm Nhật Huy', N'NXB Tổng hợp', 2024, N'9786040001006', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (13, N'Hệ quản trị cơ sở dữ liệu SQL Server', N'Giáo trình Hệ quản trị CSDL SQL server là một trong những giáo trình mô đun đào tạo chuyên ngành được biên soạn theo nội dung chương trình khung được Bộ Lao động Thưotìg binh Xã hội và Tông cục Dạy Nghê phê duyệt.', N'Để thực hiện biên soạn giáo trình đào tạo nghề Tin Học Văn Phòng ở trình độ cao đăng nghề, giáo trình Hệ quản trị CSDL SQL server là một trong những giáo trình mô đun đào tạo chuyên ngành được biên soạn theo nội dung chương trình khung được Bộ Lao động Thưotìg binh Xã hội và Tông cục Dạy Nghê phê duyệt. Nội dung biên soạn ngăn gọn, dê hiẻu, tích hợp kiên thức và kỹ năng chặt chẽ logic.

Ngày nay, với sự phát triển mạnh mẽ cua khoa học công nghệ trong hầu hết mọi lĩnh vực nói chung, và lĩnh vực điêu khiển công nghiệp nói riêng. Chính vì vậy, việc hiẻu biết và năm băt kiên thức vê Hệ quan trị cơ sở dữ liêu SQL server là một nhu cầu kiên thức cần thiết cho cán bộ kỹ thuật ngành Tin học văn phòng, Công nghệ thông tin.', CAST(170000.00 AS Decimal(18, 2)), NULL, N'BK0013', 30, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/3e5d224cf614403a905932eb1eec4100.png', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N'Trường Cao Đẳng Công Nghệ Quốc Tế Lilama2', N'NXB Xây dựng', 2024, N'9786048283490', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (15, N'One Piece Film: Red', N'Sân khấu âm nhạc rực rỡ của diva Uta—bạn thuở nhỏ của Luffy—kéo băng Mũ Rơm vào một bí mật chấn động quá khứ.', N'Red khác biệt ở cảm giác “live concert” bùng nổ: mỗi chương/tiết đoạn như một bản hit, đẩy cảm xúc lên cao rồi bất ngờ bẻ lái bằng mảnh ghép quá khứ. Ấn phẩm chuyển thể giữ tốc độ tiết tấu đặc trưng One Piece—vui nhộn, cảm động và quyết liệt—đồng thời làm rõ hơn mối liên hệ giữa Uta, Shanks và Luffy. Hệ thống nhân vật quen thuộc xuất hiện đúng “đất diễn”, fan dễ dàng bắt nhịp mà độc giả mới cũng không bị lạc. Dành cho ai muốn gom đủ bộ sưu tập One Piece hoặc tìm một câu chuyện độc lập giàu năng lượng, dễ đọc trong một–hai buổi tối.
Gợi ý danh mục: Truyện tranh / Kinh tế—Quản trị (nếu là photobook âm nhạc thì để Nghệ thuật).', CAST(120000.00 AS Decimal(18, 2)), CAST(99000.00 AS Decimal(18, 2)), N'BK-OPRED-2023-01', 30, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/540544d3bd584727991ec992c2805f3c.jpeg', 1, CAST(N'2025-08-23T12:01:39.6165010' AS DateTime2), N'Eiichiro Oda', N'NXB Kim Đồng', 2019, N'9786042468107', 13)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (16, N'Spirited Away', N'Cùng Chihiro bước vào thế giới linh giới: kỳ ảo, nhân ái và rực rỡ sắc màu—một hành trình trưởng thành không bao giờ cũ.', N'Vùng đất linh hồn là bản giao hưởng của trí tưởng tượng và sự tử tế. Theo chân Chihiro—từ cô bé nhút nhát đến người dám chịu trách nhiệm—độc giả khám phá thị trấn tắm của các linh thể, nơi mọi chi tiết nhỏ đều có linh hồn: biển đèn, toa tàu lướt qua mặt nước, món ăn bốc khói… Ấn phẩm tái hiện câu chuyện bằng hình/đoạn văn cô đọng, kèm những ghi chú hậu trường (nhân vật, bối cảnh, biểu tượng) giúp hiểu hơn thông điệp về lao động, ký ức và lòng biết ơn. Dù là người đọc mới hay người đã yêu Ghibli, đây là cuốn sách dễ chạm tim và đáng để lưu giữ lâu dài trên kệ.
Gợi ý danh mục: Truyện tranh / Nghệ thuật – Nhiếp ảnh (artbook) / Văn học thiếu nhi.', CAST(250000.00 AS Decimal(18, 2)), CAST(219000.00 AS Decimal(18, 2)), N'ART-SPA-2020-01', 40, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/5565be30540b44fda75372e3d2bd0ae5.webp', 1, CAST(N'2025-08-23T12:01:39.6221148' AS DateTime2), N'Hayao Miyazaki, Studio Ghibli', N'NXB Kim Đồng', 2020, N'9786049876547', 13)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (17, N'Suzume no Tojimari', N'Hành trình Suzume cùng chàng trai bí ẩn đi “khóa cửa” thảm họa khắp Nhật Bản—một câu chuyện trưởng thành dịu dàng và giàu chất thơ.', N'Suzume mở ra như một chuyến đi đường dài kỳ lạ: cô bé trung học tình cờ gặp chàng trai chuyên “niêm phong” những cánh cửa dẫn tới hỗn loạn. Từ Kyushu đến Tokyo, mỗi cánh cửa là một ký ức, một miền đất và một lần lựa chọn can đảm. Bản chuyển thể giữ trọn tinh thần nên thơ, nhịp kể mạch lạc, xen kẽ những khung tranh/đoạn văn giàu cảm xúc về gia đình, mất mát và sự trưởng thành. Tác phẩm phù hợp độc giả yêu câu chuyện chữa lành, phong cảnh Nhật Bản và chất trữ tình đặc trưng—đọc một mạch vẫn thấy nhẹ nhàng, dư vị ấm áp còn lại rất lâu sau trang cuối.
Gợi ý danh mục: Truyện tranh / Tâm lý – Sống đẹp / Văn học Nhật.', CAST(165000.00 AS Decimal(18, 2)), CAST(139000.00 AS Decimal(18, 2)), N'BK-SUZ-2023-01', 90, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/f4a2498514fa4fcdab51a411bb5ee4c8.webp', 1, CAST(N'2025-08-23T12:01:39.6221148' AS DateTime2), N'Makoto Shinkai', N'NXB Trẻ', 2023, N'9786041234567', 13)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (21, N'Tư duy nhanh và chậm', N'Cuốn sách kinh điển về hai hệ thống tư duy của con người.', NULL, CAST(180000.00 AS Decimal(18, 2)), CAST(149000.00 AS Decimal(18, 2)), N'BK0001', 60, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/7c692d2523a44e41a5504140c61adcca.webp', 1, CAST(N'2025-08-23T12:04:07.2453269' AS DateTime2), N'Hương Lan, Xuân Thanh', N'NXB Khoa học', 2022, N'9786040000001', 2)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (22, N'Atomic Habits', N'Xây dựng thói quen tốt, loại bỏ thói quen xấu bằng các thay đổi nhỏ.', N'Ông gọi chúng là thói quen nguyên tử.

Trong cuốn sách đột phá này, Clears tiết lộ chính xác cách những thay đổi nhỏ bé này có thể phát triển thành những kết quả thay đổi cuộc sống to lớn như thế nào. Ông khám phá một số mẹo vặt cuộc sống đơn giản (nghệ thuật xếp chồng thói quen bị lãng quên, sức mạnh bất ngờ của Quy tắc Hai phút, hay bí quyết để bước vào Vùng Goldilocks), đồng thời đi sâu vào tâm lý học và khoa học thần kinh tiên tiến để giải thích tại sao chúng quan trọng. Trên hành trình khám phá, ông kể những câu chuyện đầy cảm hứng về những vận động viên giành huy chương vàng Olympic, các CEO hàng đầu và các nhà khoa học lỗi lạc, những người đã vận dụng khoa học về những thói quen nhỏ bé để duy trì năng suất, động lực và hạnh phúc.', CAST(165000.00 AS Decimal(18, 2)), CAST(135000.00 AS Decimal(18, 2)), N'BK0002', 80, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/aecccad4835e4deba8921279be98a76f.jpg', 1, CAST(N'2025-08-23T12:04:07.2453269' AS DateTime2), N'James Clear', N'NXB Trẻ', 2021, N'9786040000002', 2)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (23, N'Dẫn dắt – Leadership', N'Nguyên tắc lãnh đạo hiện đại cho nhà quản lý.', N'Cuốn sách này dành cho những con người giàu khát vọng, mong muốn tạo ra sự khác biệt to lớn trong thế giới tuyệt vời mà chúng ta đang sống – những người muốn truyền cảm hứng và giúp đỡ mọi người xung quanh. Cho những người muốn sống một cuộc sống đam mê và đạt được những kết quả lớn lao trên chặng đường đi. Cho những người muốn tách khỏi đám đông và vươn đến đỉnh cao cuộc chơi. Cho những người đã chán ngấy những vị lãnh đạo yếu kém, chuyên quyền, vị kỉ hay đơn giản những lãnh đạo tầm thường, và thay vào đó những người muốn nâng cao tiêu chuẩn và nâng tầm bản thân.  ', CAST(195000.00 AS Decimal(18, 2)), NULL, N'BK0003', 40, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/c8e1709bebd14cd78ead106d25ac5896.jpg', 1, CAST(N'2025-08-23T12:04:07.2453269' AS DateTime2), N'J. Maxwell', N'NXB Hồng Đức', 2019, N'9786040000003', 1)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (24, N'Marketing 4.0: Dịch chuyển từ truyền thống sang Công nghệ số', N'Tư duy marketing trong kỷ nguyên số.', N'Quyển cẩm nang vô cùng cần thiết cho những người làm tiếp thị trong thời đại số. Được viết bởi cha đẻ ngành tiếp thị hiện đại, cùng hai đồng tác giả là lãnh đạo của công ty MarkPlus, quyển sách sẽ giúp bạn lèo lái thế giới không ngừng kết nối và khách hàng không ngừng thay đổi để có được nhiều khách hàng hơn, xây dựng thương hiệu hiệu quả hơn, và cuối cùng kinh doanh thành công hơn. Ngày nay khách hàng không có nhiều thời gian và sự chú ý dành cho thương hiệu của bạn – và họ còn bị bao quanh bởi vô số các chọn lựa. Bạn phải tách khỏi đám đông, phải nổi trội, để gây sự chú ý và truyền đạt thông điệp mà khách hàng muốn nghe. “Tiếp thị 4.0” tận dụng tâm lý thay đổi của khách hàng để tiếp cận nhiều khách hàng hơn và khiến họ gắn bó với thương hiệu hơn bao giờ hết.  Quyển sách cho bạn kiến thức sâu rộng để bạn thành công trong thế giới tiếp thị ngày nay: Khám phá những nguyên tắc mới trong tiếp thị; Nổi bật và tạo ra những khoảnh khắc WOW; Xây dựng nền tảng khách hàng trung thành và có tiếng nói; và Biết ai sẽ là người định hình tương lai của các chọn lựa của khách hàng…
Quyển sách gồm ba phần, với các nội dung:', CAST(175000.00 AS Decimal(18, 2)), CAST(149000.00 AS Decimal(18, 2)), N'BK0004', 55, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/6f02f20c11194aa7befb6373728015a6.jpg', 1, CAST(N'2025-08-23T12:04:07.2453269' AS DateTime2), N'Philip Kotler, Hermawan Kartajaya, Iwan Setiawan', N'NXB Tổng hợp', 2017, N'9786040000004', 1)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (25, N'Cấu trúc dữ liệu & thuật toán', N'Giải thuật cơ bản minh hoạ bằng C#.', N'Cuốn sách Cấu trúc dữ liệu và thuật toán được biên soạn dựa trên nội dung các bài giảng mà tác giả sử dụng để giảng dạy cho sinh viên ngành Công nghệ Thông tin, Đại học Bách Khoa Hà Nội. 

Với thời lượng để giảng dạy trong 60 tiết, cuốn sách chỉ đề cập được một số vấn đề cơ bản trong lĩnh vực “Cấu trúc dữ liệu và Thuật toán” – một môn học có ý nghĩa quan trọng trong hành trang kiến thức của sinh viên ngành Công nghệ Thông tin. ', CAST(210000.00 AS Decimal(18, 2)), NULL, N'BK0005', 45, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/44bd17d7282e4121982af9bcdb6651e3.jpg', 1, CAST(N'2025-08-23T12:04:07.2453269' AS DateTime2), N' Nguyễn Đức Nghĩa', N'NXB Bách Khoa Hà Nội', 2023, N'9786040000005', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (26, N'Nhập môn Machine Learning', N'Khái niệm, thuật toán và ví dụ bằng Python.', N'Học máy đã trở thành một phần không thể thiếu trong nhiều ứng dụng thương mại và dự án nghiên cứu, nhưng lĩnh vực này không chỉ dành riêng cho các công ty lớn với đội ngũ nghiên cứu hùng hậu. Nếu bạn sử dụng Python, ngay cả khi mới bắt đầu, cuốn sách này sẽ hướng dẫn bạn những cách thực tế để xây dựng các giải pháp học máy của riêng mình. Với tất cả dữ liệu hiện có, các ứng dụng học máy chỉ bị giới hạn bởi trí tưởng tượng của bạn.', CAST(435000.00 AS Decimal(18, 2)), CAST(399000.00 AS Decimal(18, 2)), N'BK0006', 48, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/aa70096f0df04ec6ae9e37b082aaef4d.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Andreas Mueller, Sarah Guido', N'NXB Khoa học', 2024, N'9786040000006', 3)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (27, N'Lịch sử Việt Nam Truyền thống và Hiện đại', N'Tổng quan các giai đoạn lịch sử VN thế kỷ XX.', N'Lịch sử là tất cả những gì đã diễn ra còn những gì được trình bày bởi các nhà sử học chỉ là nhận thức lịch sử. Như vậy, lịch sử là thực thể bất biến, khách quan, hoàn toàn không phụ thuộc vào ý muốn của con người hiện tại. Tìm tòi, khám phá những bí ẩn của quá khứ để nhận thức ngày càng sâu sắc thêm lịch sử, qua đó phát hiện ra những quy luật của những sự kiện, hiện tượng đã xảy ra, góp phần lý giải hiện tại, dự báo tương lai là sứ mệnh của khoa học lịch sử. Công việc này có điểm dừng vì một lẽ giản dị: nhận thức khoa học luôn mang tính tương đối và không bao giờ chúng ta có thể biết được toàn bộ bí ẩn của lịch sử. Việt Nam là đất nước có lịch sử lâu dài với một diễn trình cực kỳ phong phú và hết sức phức tạp.', CAST(360000.00 AS Decimal(18, 2)), CAST(290000.00 AS Decimal(18, 2)), N'BK0007', 35, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/33bbb8ba8dd2485dac30c9a77fec33a3.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'GS. TSKH. NGND Vũ Minh Giang', N'NXB Tri Thức', 2025, N'9786040000007', 4)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (28, N'Lược Sử Loài Người - Sapiens', N'Hành trình phát triển của nhân loại.', N'Sapiens là một câu chuyện lịch sử lớn về nền văn minh nhân loại – cách chúng ta phát triển từ xã hội săn bắt hái lượm thuở sơ khai đến cách chúng ta tổ chức xã hội và nền kinh tế ngày nay.

Trong ấn bản mới này của cuốn Sapiens - Lược sử loài người, chúng tôi đã có một số hiệu chỉnh về nội dung với sự tham gia, đóng góp của các thành viên Cộng đồng đọc sách Tinh hoa. Xin trân trọng cảm ơn ý kiến đóng góp tận tâm của các quý độc giả, đặc biệt là ông Nguyễn Hoàng Giang, ông Nguyễn Việt Long, ông Đặng Trọng Hiếu cùng những người khác. Mong tiếp tục nhận được sự quan tâm và góp ý từ độc giả.
', CAST(290000.00 AS Decimal(18, 2)), CAST(199000.00 AS Decimal(18, 2)), N'BK0008', 70, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/16bfa7eb6e1340e895f0cfb0bb4c8116.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Yuval Noah Harari', N'NXB Thế giới', 2019, N'9786040000008', 4)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (29, N'Đường Vào Nghệ Thuật Nhiếp Ảnh - Ngôn Ngữ Hình Ảnh', N'Kỹ thuật chụp, ánh sáng và hậu kỳ cơ bản.', N'Là một cuốn sách tác giả đã thai nghén khá lâu, tích lũy những kiến thức, kinh nghiệm qua quá trình lăn lộn cùng nghệ thuật nhiếp ảnh, nay được tinh lược lại dựa trên phương thức lý thuyết ứng dụng và trực quan thị giác, đó là một ấn phẩm đẹp và dễ hiểu, đóng góp một phần nhỏ cho sự phát triển của phong trào nhiếp ảnh nghệ thuật và sẻ chia cùng những độc giả yêu thích nhiếp ảnh ờ khắp mọi nơi.', CAST(145000.00 AS Decimal(18, 2)), NULL, N'BK0009', 30, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/2861ba049b7440a4a3a921d42825b7dc.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Bùi Mính Sơn', N'NXB Hồng Đức', 2018, N'9786040000009', 6)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (30, N'Vẽ minh hoạ cơ bản', N'Kỹ năng sketch, màu nước và bố cục.', N'Cuốn sách cung cấp hướng dẫn chi tiết từ việc lựa chọn bút chì và giấy vẽ cho đến cách phân chia bố cục, dựng hình, luật phối cảnh, và cách thể hiện các loại chất liệu khác nhau. Nội dung sách gồm 4 chương kiến thức và 7 bài tập thực hành với 7 chủ đề đa dạng như tô bóng mờ trong vẽ viền, tô bóng chéo trên bảng khắc,…', CAST(150000.00 AS Decimal(18, 2)), CAST(129000.00 AS Decimal(18, 2)), N'BK0010', 34, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/6ac69e3e1f7d4cda9bc5b09defb67cdb.png', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Robert Capitolo', N'NXB Mỹ thuật', 2021, N'9786040000010', 6)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (31, N'Cẩm Nang Du Lịch Nhật Bản', N'Lịch trình mẫu, kinh nghiệm, văn hoá & chi phí.', N'Cuốn cẩm nang này sẽ giúp bạn có được những trải nghiệm tuyệt vời nhất trong chuyến du lịch Nhật Bản với hàng loạt thông tin thực tiễn và gợi ý từ các chuyên gia. Phần Giới thiệu đất nước Nhật Bản sẽ vẽ ra cho bạn một hình dung về nước Nhật gắn với bối cảnh lịch sử và văn hóa. Tiếp theo, các phần về Tokyo và 8 vùng địa lí sẽ miêu tả cụ thể các điểm tham quan quan trọng kèm bản đồ, hình ảnh và tranh minh họa. Hướng dẫn về nhà hàng và khách sạn nằm ở phần Hành trang du khách, cùng với nhiều lời khuyên chung về các loại hình nhà nghỉ và ẩm thực Nhật Bản. Phần Những điều cần biết cung cấp nhiều thông tin thiết thực về mọi vấn đề, từ giao thông cho tới các phép tắc cư xử, xã giao.', CAST(140000.00 AS Decimal(18, 2)), NULL, N'BK0011', 48, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/0eba8cbfdef04ef38ad90429a4c42469.webp', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Dorling Kindersley Limited', N'NXB Dân Trí', 2018, N'9786040000011', 7)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (32, N'Khám Phá Ẩm Thực Truyền Thống Việt Nam', N'Món ngon ba miền và câu chuyện phía sau.', N'Ẩm thực Việt Nam, dù là những món ăn gia đình hay những món ăn đặc trưng của ẩm thực đường phố thì vẫn mang những giá trị to lớn trong đời sống của người Việt. Ẩm thực Việt ngày nay đã vượt qua khỏi những biên giới và được chào đón ở nhiều nơi trên thế giới. Chúng ta có quyền tự hào về điều đó. Thưởng thức ẩm thực cũng giống như dấn thân vào một cuộc hành trình mà mỗi người đều có cảm nhận riêng.', CAST(155000.00 AS Decimal(18, 2)), CAST(129000.00 AS Decimal(18, 2)), N'BK0012', 52, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/fe39d96722bd4938914166fe4a20ce60.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'GS. TS. Ngô Đức Thịnh', N'NXB Tri Thức', 2024, N'9786040000012', 7)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (33, N'Thực Dưỡng Tiện Dụng Cho Người Bận Rộn', N'Nguyên tắc ăn uống lành mạnh, thực đơn 15 phút.', N'Thực Dưỡng Tiện Dụng Cho Người Bận Rộn', CAST(170000.00 AS Decimal(18, 2)), NULL, N'BK0013', 58, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/88ff074e599649648aac7a855fbd3559.webp', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Minh Thanh, Thanh Nguyên', N'NXB Phụ Nữ', 2019, N'9786040000013', 8)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (34, N'Yoga cho người mới bắt đầu', N'Chuỗi bài tập nhẹ nhàng và an toàn.', N'– Những ai mới tiếp xúc với yoga, muốn có một lộ trình hướng dẫn cụ thể từ cơ bản
– Đã và đang tập luyện yoga muốn có bài tập hằng ngày nâng cao sức khỏe
– Các HLV Yoga quan tâm đến các bài tập cho người mới tập luyện
– Những ai không có thời gian đến phòng tập, tập luyện online tại nhà.', CAST(145000.00 AS Decimal(18, 2)), CAST(119000.00 AS Decimal(18, 2)), N'BK0014', 44, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/eef053d0ce394fecac810d8808cb9634.png', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Lan Chi', N'NXB Thể dục', 2020, N'9786040000014', 8)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (35, N'Kỹ thuật trồng rau sạch tại nhà', N'Rau gia vị, thủy canh cơ bản, mẹo chăm sóc.', N'Cuốn sách giới thiệu kĩ thuật trồng 12 loại rau của vụ Xuân - Hè: cải bắp, cải bao, cải bẹ, su hào, súp lơ, cà chua, khao tây, cà tím, ớt ngọt, hành tây, đậu Hà Lan, cà rốt.

Kỹ thuật trồng rau sạch theo vụ Xuân – hè được PGS. TS  Tạ Thu Cúc – Nguyên giảng viên Trường Đại học Nông nghiệp Việt Nam biên soạn. Cuốn sách cung cấp thông tin về những biện pháp kĩ thuật chủ yếu để trồng rau sạch theo mùa vụ từ: công dụng, đặc điểm sinh học, kĩ thuật trồng trọt (thời vụ, đất và phân bón, khoảng cách và mật độ, chăm sóc) đến thu hoạch.', CAST(120000.00 AS Decimal(18, 2)), NULL, N'BK0015', 62, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/7705664491eb458d8d28c8be6416bddc.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'PGS TS Tạ Thu Cúc', N'NXB Phụ Nữ Việt Nam', 2019, N'9786040000015', 9)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (36, N'Bonsai cơ bản', N'Kỹ thuật tạo dáng, cắt tỉa và chăm sóc bonsai.', N'Quyển sách này thích hợp với mọi đối tượng độc giả, là người đam mê bonsai hay có thể chưa từng biết bonsai, những người yêu thích cây cảnh thiên nhiên, yêu thích cái đẹp, thích tự tay tạo nên một tác phẩm “sống" để hàng ngày quan sát sự phát triển của tác phẩm, sẽ thấy rằng trồng và chăm sóc bonsai thực sự dễ dàng và thú vị.

Sách giải thích những kỹ thuật để giữ cho bonsai sống và có được dáng thế đẹp. Cách diễn giải rõ ràng giúp cho những người mới cũng như những người đã từng nghiên cứu về bonsai có thể tự chăm sóc cây bonsai của mình đạt được các kỹ năng cần thiết cho việc giữ và tạo dáng. Tất cả các kỹ thuật như cắt tỉa rễ và cành, vặt chồi, và tạo dáng cho cành giống như những cách thức được các bậc thầy về bonsai của Nhật Bản áp dụng. Khi đã tìm hiểu cặn kẽ, bạn sẽ không bao giờ quên và những kỹ thuật này sẽ giúp bạn tiến bộ trong thú chơi bonsai theo ý bạn.', CAST(165000.00 AS Decimal(18, 2)), CAST(139000.00 AS Decimal(18, 2)), N'BK0016', 33, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/c220a32620534abf96e22a940b9cf2fb.webp', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Trần Thị Thúy', N'NXB Thông Tin Và Truyền Thông', 2022, N'9786040000016', 9)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (37, N'Ngữ pháp tiếng Anh căn bản', N'Hệ thống ngữ pháp, bài tập và đáp án.', N'Tổng hợp những kiến thức ngữ pháp tiếng Anh thông dụng nhất

Qua 128 bài học, các bạn sẽ được ôn tập 128 chủ điểm ngữ pháp tiếng Anh thông dụng nhất. Đây đều là những kiến thức trọng tâm và thường xuất hiện nhất trong các kỳ thi cũng như trong giao tiếp hằng ngày.

Giải thích chi tiết đi kèm ví dụ minh họa sinh động

Với lượng kiến thức đầy đủ, kèm theo đó là phần giải thích chi tiết giúp người học nắm chắc kiến thức nhanh nhất. Mỗi bài học đều có hệ thống ví dụ minh họa sinh động. Ví dụ được giải thích bằng cả tiếng Việt và tiếng Anh, đây đều là những ví dụ gần gũi với cuộc sống. Các bạn có thể học và ứng dụng ngay lập tức vào thực tế. Bên cạnh đó còn có những hình ảnh minh họa cho ví dụ rất sinh động, khơi gợi được sự hứng thú các người học.

Phương pháp trình bày khoa học

Với mỗi chủ điểm ngữ pháp tác giả đi từ lý thuyết đến ví dụ và những lưu ý với những trường hợp đặc biệt. Trọng tâm bài học được nhấn mạnh, phần kiến thức hay gây nhầm lẫn được bôi đậm và cho vào ví dụ để người học dễ nhận biết. Phương pháp trình bày khoa học của cuốn sách sẽ giúp người học vận dụng được những kiến thức trọng tâm một cách tích cực, chủ động và hiệu quả.

Sở hữu cuốn sách các bạn sẽ có cơ hội nhận được ebook học tiếng Anh cực kỳ giá trị. Để nhận được quà tặng hãy truy cập vào ứng dụng Mcplatform và làm theo hướng dẫn.

Hy vọng cuốn sách sẽ giúp cho các bạn học tiếng Anh có cơ hội trau dồi, củng cố và nâng cao vốn kiến thức tiếng Anh của mình. Để nâng cao trình độ tiếng Anh trong thời gian ngắn nhất, hãy mua ngay cuốn sách “Ngữ pháp tiếng Anh căn bản” nhé!', CAST(135000.00 AS Decimal(18, 2)), NULL, N'BK0017', 89, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/2724571820c445a484a88d495974d20b.webp', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'The Windy', N'NXB Hồng Đức', 2018, N'9786040000017', 10)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (38, N'Luyện thi TOEIC 700+', N'Chiến lược làm bài, đề mẫu và giải chi tiết.', N'New TOEIC 700 là cuốn sách nhằm mục đích giúp người học luyện thi, do vậy, phần lớn gồm những bài Actual Test bám sát với đề thi thật được cập nhật theo format mới kể từ tháng 6 năm 2019. ', CAST(185000.00 AS Decimal(18, 2)), CAST(159000.00 AS Decimal(18, 2)), N'BK0018', 83, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/09dfc3d79571495bb91f8c6d15806dc3.jpg', 1, CAST(N'2025-08-23T12:04:07.2513167' AS DateTime2), N'Stephen Poirier, Tony Covello, & Michael A Putlack', N'NXB Giáo dục', 2019, N'9786040000018', 10)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (39, N'Khoa Học Khám Phá - Mật Mã Từ Cổ Điển Đến Lượng Tử', N'Tiểu thuyết trinh thám kịch tính xoay quanh bản thảo thất lạc.', N'Trong hàng ngàn năm, vua chúa cũng như các tướng lĩnh đều dựa vào mạng lưới thông tin liên lạc hiệu quả để cai trị đất nước và chỉ huy quân đội của mình. Đồng thời, tất cả họ đều ý thức được những hậu quả của việc để lọt thông tin vào tay đối phương, để lộ những bí mật quý giá cho các nước thù địch. Chính nỗi lo sợ bị kẻ thù xem trộm đã thúc đẩy sự ra đời và phát triển của mật mã: đó là những kỹ thuật nhằm che giấu, ngụy trang thông tin, khiến cho chỉ những người cần nhận mới có thể đọc được. Mong muốn giữ bí mật đã khiến các quốc gia thiết lập những cơ quan mật mã, có nhiệm vụ đảm bảo an toàn cho thông tin liên lạc bằng việc phát minh và sử dụng những mật mã tốt nhất có thể được. Trong khi đó, những người phá mã của đối phương cũng lại cố gắng để giải mã và đánh cắp bí mật. Người giải mã là những nhà “giả kim thuật” về ngôn ngữ, một nhóm người bí ẩn chuyên tìm cách phỏng đoán những từ ngữ có nghĩa từ những ký hiệu vô nghĩa. Lịch sử của mật mã là câu chuyện về cuộc chiến kéo dài hàng thế kỷ giữa người lập mã và người giải mã, cuộc chạy đua vũ khí trí tuệ đã có tác động rất to lớn đến tiến trình của lịch sử.

Khi viết cuốn sách này, tác giả muốn phác họa sự tiến hóa của mật mã và những hệ quả kèm theo.

Cuộc chiến liên miên giữa người lập mã và người phá mã đã thúc đẩy hàng loạt những đột phá khoa học đáng kể. Người lập mật mã liên tục xây dựng những loại mã mạnh hơn bao giờ hết để bảo vệ thông tin, trong khi những người phá mã cũng lại kiên trì tìm ra những phương pháp mạnh hơn nữa để phá vỡ chúng. Trong những cố gắng nhằm phá vỡ và bảo vệ thông tin bí mật, cả hai phía đã phải huy động nhiều lĩnh vực chuyên môn và công nghệ khác nhau, từ toán học cho tới ngôn ngữ học, từ lý thuyết thông tin cho đến lý thuyết lượng tử. Đổi lại, những người lập mã và phá mã cũng đã làm giàu thêm cho những lĩnh vực này và thành quả của họ đã đẩy nhanh tốc độ phát triển công nghệ, mà đáng kể nhất là trong lĩnh vực máy tính hiện đại…

', CAST(250000.00 AS Decimal(18, 2)), CAST(195000.00 AS Decimal(18, 2)), N'BK0019', 47, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/2b93ee8586c34d68bd0853f55f2ad163.jpg', 1, CAST(N'2025-08-23T12:04:07.2573215' AS DateTime2), N'Simon Singh', N'NXB Văn học', 2008, N'9786040000019', 11)
INSERT [dbo].[Sanpham] ([Sanpham_Id], [Ten_Sanpham], [MoTaNgan_Sanpham], [MoTa_Sanpham], [Gia_Ban], [Gia_KhuyenMai], [SKU_Sanpham], [SoLuong_Ton], [HinhAnh_Chinh], [Con_Hang], [Ngay_Tao], [TacGia], [NhaXuatBan], [NamXuatBan], [ISBN], [Danhmuc_Id]) VALUES (40, N'Học Viện Ma Thuật Scholomance', N'Light Novel phiêu lưu tại học viện ma pháp.', N'Học viện Scholomance là một ngôi trường ma thuật không giống bất kỳ ngôi trường nào bạn từng gặp. Không có giáo viên, không có ngày nghỉ, tình bạn chỉ rặt sự tính toán và tỷ lệ sống – chết không bao giờ bằng nhau.

Một khi đã bước chân vào Scholomance, chỉ có hai cách để thoát ra: tốt nghiệp hoặc chết.

Học viện ma thuật Scholomance là câu chuyện về El - một nữ phù thủy hắc ám bất đắc dĩ có sứ mệnh viết lại các quy tắc phép thuật. Cô nàng không có bạn bè nhưng lại sở hữu một sức mạnh hắc ám đủ lớn để san bằng các ngọn núi và quét sạch hàng triệu người. Ngoại trừ việc có thể vô tình giết chết các học sinh khác. Cô nàng luôn cố gắng không sử dụng sức mạnh của mình, trừ phi không còn sự lựa chọn nào khác.

Hãy luôn nhớ rằng, ở Scholomance, đừng bao giờ đi một mình trong hành lang, cũng như phải luôn cảnh giác lũ quái vật ẩn nấp rình rập khắp nơi…

Thông tin tác giả:

Là tác giả nổi tiếng của bộ truyện Temeraire và có các tác phẩm từng đoạt giải thưởng Uprooted and Spinning Silver. Bà là người sáng lập của the Organization for Transformative Works and the Archive of Our Own.

Những đánh giá về cuốn sách:

“Scholomance là ngôi trường ma thuật hắc ám nhất mà tôi hằng mong đợi. Nữ anh hùng sáng suốt, dí dỏm và kỳ quái là nhân vật tôi vui vẻ theo dõi ở mọi nơi – thậm chí ngay trong một ngôi trường đầy rẫy quái vật.” - KATHERINE ARDEN, tác giả của The Bear and the Nightingale

“Ở trường Scholomance, lũ quái vật có ở khắp mọi nơi và một bữa sáng có thể giết chết bạn, nhưng dàn nhân vật tuyệt vời sẽ chiếm trọn trái tim bạn và bạn sẽ không bao giờ muốn rời khỏi ngôi trường chết chóc này. Naomi Novik khéo léo xen lẫn sự hài hước sắc sảo vào những lớp trí tưởng tượng để xây dựng một bộ phim giả tưởng thú vị ở mọi cấp độ. Tôi mê đắm cuốn sách tuyệt vời này.” - STEPHANE GARBER, tác giả của loạt truyện Carawel.

“Hoàn toàn thoả mãn. Không cần nói nhiều, Novik là một cây bút thiên tài.” – KIERSTEN WHITE, tác giả của And I Darken

“Vui nhộn và hoang dã. Bắt đầu với ngôi trường ma thuật hư cấu, làm cho nó trở nên càng nguy hiểm càng tốt, tập trung vào đó với một loạt các thanh thiếu niên lém lỉnh; một niềm vui thuần tuý nảy sinh.” – N. K. JEMISIN, tác giả của The City We became.', CAST(145000.00 AS Decimal(18, 2)), NULL, N'BK0020', 75, N'https://nhasachstorage.blob.core.windows.net/sanpham/sanpham/9d2ea195da484f70aa91c157323866fd.webp', 1, CAST(N'2025-08-23T12:04:07.2573215' AS DateTime2), N'Naomi Novik', N'NXB Thanh Niên', 2021, N'9786040000020', 12)
SET IDENTITY_INSERT [dbo].[Sanpham] OFF
INSERT [dbo].[TaiKhoan] ([Id], [Ho_Ten], [Dia_Chi], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5c5074a5-74db-4f49-ad20-7c1482208db2', N'Hoàng Quân', NULL, N'qdq322@gmail.com', N'QDQ322@GMAIL.COM', N'qdq322@gmail.com', N'QDQ322@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEA+HBHb+x7ofkiLfDKW9qhC0iZterk1ZIx0gcz87GzIsL77KiuZJ7YKzKmei/a+QlQ==', N'EEC6DCI775NM3GN27NBLQXTIMR5JHA3V', N'9c2f79c2-2f9e-4541-b77a-c9374a1f5534', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Trang] ON 

INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (1, N'Giới thiệu', N'<h3>Về Nhà Sách</h3><p>Chúng tôi mang đến sách chọn lọc, giao nhanh, nhiều ưu đãi mỗi tuần.</p>', N'gioi-thieu', 1, CAST(N'2025-08-24T02:02:42.3655045' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (2, N'Liên hệ', N'<p>Email: support@nha-sach.vn<br/>Điện thoại: 0900 000 000<br/>Giờ làm việc: 8:00–21:00</p>', N'lien-he', 1, CAST(N'2025-08-24T02:02:42.3703425' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (3, N'Hướng dẫn đặt hàng', N'<ol><li>Chọn sản phẩm</li><li>Thêm vào giỏ</li><li>Thanh toán & xác nhận</li></ol>', N'huong-dan-dat-hang', 1, CAST(N'2025-08-24T02:02:42.3703425' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (4, N'Vận chuyển & Thanh toán', N'<p>Freeship nội thành với đơn &ge; 300.000đ. Hỗ trợ COD, chuyển khoản, ví điện tử.</p>', N'van-chuyen-thanh-toan', 1, CAST(N'2025-08-24T02:02:42.3703425' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (5, N'Đổi trả & Hoàn tiền', N'<p>Đổi sản phẩm lỗi trong 7 ngày. Hoàn tiền theo phương thức đã thanh toán.</p>', N'doi-tra-hoan-tien', 1, CAST(N'2025-08-24T02:02:42.3703425' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (6, N'Chính sách bảo mật', N'<p>Chúng tôi tôn trọng quyền riêng tư và bảo vệ dữ liệu khách hàng theo quy định hiện hành.</p>', N'bao-mat-thong-tin', 0, CAST(N'2025-08-24T02:02:42.3756620' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (7, N'Điều khoản sử dụng', N'<p>Vui lòng đọc kỹ điều khoản trước khi sử dụng dịch vụ của chúng tôi.</p>', N'dieu-khoan-su-dung', 0, CAST(N'2025-08-24T02:02:42.3756620' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (8, N'Câu hỏi thường gặp (FAQ)', N'<p>Các câu hỏi về đặt hàng, giao nhận, đổi trả, tài khoản…</p>', N'faq', 1, CAST(N'2025-08-24T02:02:42.3756620' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (9, N'Tuyển dụng', N'<p>Gia nhập đội ngũ đam mê sách. Gửi CV về hr@nha-sach.vn</p>', N'tuyen-dung', 0, CAST(N'2025-08-24T02:02:42.3800155' AS DateTime2))
INSERT [dbo].[Trang] ([Trang_Id], [Tieude_Trang], [Noidung_Trang], [Slug_Trang], [HienThi_Menu], [Ngay_Tao]) VALUES (10, N'Đối tác/Đại lý', N'<p>Hợp tác phân phối, đặt sỉ, sự kiện ra mắt sách.</p>', N'dai-ly-lien-ket', 0, CAST(N'2025-08-24T02:02:42.3800155' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Trang] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Baiviet_Slug_Baiviet]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Baiviet_Slug_Baiviet] ON [dbo].[Baiviet]
(
	[Slug_Baiviet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Danhmuc_Slug_Danhmuc]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Danhmuc_Slug_Danhmuc] ON [dbo].[Danhmuc]
(
	[Slug_Danhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Donhang_Chitiet_Donhang_Id]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Donhang_Chitiet_Donhang_Id] ON [dbo].[Donhang_Chitiet]
(
	[Donhang_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Donhang_Chitiet_Sanpham_Id]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Donhang_Chitiet_Sanpham_Id] ON [dbo].[Donhang_Chitiet]
(
	[Sanpham_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_Giohang_Session_Sanpham]    Script Date: 8/25/25 1:24:11AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_Giohang_Session_Sanpham] ON [dbo].[Giohang_Item]
(
	[Session_Id] ASC,
	[Sanpham_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sanpham_Danhmuc_Id]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Sanpham_Danhmuc_Id] ON [dbo].[Sanpham]
(
	[Danhmuc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Sanpham_SKU_Sanpham]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Sanpham_SKU_Sanpham] ON [dbo].[Sanpham]
(
	[SKU_Sanpham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Sukien_Slug_Sukien]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Sukien_Slug_Sukien] ON [dbo].[Sukien]
(
	[Slug_Sukien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[TaiKhoan]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 8/25/25 1:24:11AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[TaiKhoan]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Trang_Slug_Trang]    Script Date: 8/25/25 1:24:11AM ******/
CREATE NONCLUSTERED INDEX [IX_Trang_Slug_Trang] ON [dbo].[Trang]
(
	[Slug_Trang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_TaiKhoan_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TaiKhoan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_TaiKhoan_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_TaiKhoan_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TaiKhoan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_TaiKhoan_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_TaiKhoan_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[TaiKhoan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_TaiKhoan_UserId]
GO
ALTER TABLE [dbo].[Baiviet_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Baiviet_Tag_Baiviet] FOREIGN KEY([Baiviet_Id])
REFERENCES [dbo].[Baiviet] ([Baiviet_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Baiviet_Tag] CHECK CONSTRAINT [FK_Baiviet_Tag_Baiviet]
GO
ALTER TABLE [dbo].[Baiviet_Tag]  WITH CHECK ADD  CONSTRAINT [FK_Baiviet_Tag_Tag] FOREIGN KEY([Tag_Id])
REFERENCES [dbo].[Tag] ([Tag_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Baiviet_Tag] CHECK CONSTRAINT [FK_Baiviet_Tag_Tag]
GO
ALTER TABLE [dbo].[Donhang_Chitiet]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Chitiet_Donhang_Donhang_Id] FOREIGN KEY([Donhang_Id])
REFERENCES [dbo].[Donhang] ([Donhang_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Donhang_Chitiet] CHECK CONSTRAINT [FK_Donhang_Chitiet_Donhang_Donhang_Id]
GO
ALTER TABLE [dbo].[Donhang_Chitiet]  WITH CHECK ADD  CONSTRAINT [FK_Donhang_Chitiet_Sanpham_Sanpham_Id] FOREIGN KEY([Sanpham_Id])
REFERENCES [dbo].[Sanpham] ([Sanpham_Id])
GO
ALTER TABLE [dbo].[Donhang_Chitiet] CHECK CONSTRAINT [FK_Donhang_Chitiet_Sanpham_Sanpham_Id]
GO
ALTER TABLE [dbo].[Giohang_Item]  WITH CHECK ADD  CONSTRAINT [FK_Giohang_Item_Sanpham] FOREIGN KEY([Sanpham_Id])
REFERENCES [dbo].[Sanpham] ([Sanpham_Id])
GO
ALTER TABLE [dbo].[Giohang_Item] CHECK CONSTRAINT [FK_Giohang_Item_Sanpham]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Danhmuc_Danhmuc_Id] FOREIGN KEY([Danhmuc_Id])
REFERENCES [dbo].[Danhmuc] ([Danhmuc_Id])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Danhmuc_Danhmuc_Id]
GO
ALTER DATABASE [NhaSachDb] SET  READ_WRITE 
GO
