USE [master]
GO
/****** Object:  Database [Poliklinika]    Script Date: 29.02.2024 9:37:40 ******/
CREATE DATABASE [Poliklinika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Poliklinika', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Poliklinika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Poliklinika_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Poliklinika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Poliklinika] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Poliklinika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Poliklinika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Poliklinika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Poliklinika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Poliklinika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Poliklinika] SET ARITHABORT OFF 
GO
ALTER DATABASE [Poliklinika] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Poliklinika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Poliklinika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Poliklinika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Poliklinika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Poliklinika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Poliklinika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Poliklinika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Poliklinika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Poliklinika] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Poliklinika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Poliklinika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Poliklinika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Poliklinika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Poliklinika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Poliklinika] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Poliklinika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Poliklinika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Poliklinika] SET  MULTI_USER 
GO
ALTER DATABASE [Poliklinika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Poliklinika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Poliklinika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Poliklinika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Poliklinika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Poliklinika] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Poliklinika] SET QUERY_STORE = OFF
GO
USE [Poliklinika]
GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 29.02.2024 9:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Simptoms] [nvarchar](max) NOT NULL,
	[TimeOfHeal] [nvarchar](255) NOT NULL,
	[Appointments] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Diagnoses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 29.02.2024 9:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Post] [nvarchar](100) NOT NULL,
	[WorkExp] [int] NOT NULL,
	[SienceRank] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Otdel_id] [int] NOT NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryOfDisease]    Script Date: 29.02.2024 9:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryOfDisease](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Id] [int] NOT NULL,
	[Doctor_Id] [int] NOT NULL,
	[Diagnoses_Id] [int] NOT NULL,
	[Heal] [nvarchar](max) NOT NULL,
	[DateOfDisease] [date] NOT NULL,
	[DateOfCloseDisease] [date] NULL,
	[TypeOfHeal] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HistoryOfDisease] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Otdel]    Script Date: 29.02.2024 9:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Otdel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Floor] [int] NOT NULL,
	[NumberOfRoom] [int] NOT NULL,
	[FSP] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Otdel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 29.02.2024 9:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Firstname] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [int] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Diagnoses] ON 

INSERT [dbo].[Diagnoses] ([id], [Name], [Simptoms], [TimeOfHeal], [Appointments]) VALUES (1, N'Поллиноз', N'Покраснение, отёк, зуд слизистых отделений', N'28 дней', N'2 раза в день после еды принимать Антиголопентомолин')
INSERT [dbo].[Diagnoses] ([id], [Name], [Simptoms], [TimeOfHeal], [Appointments]) VALUES (2, N'Бурсит', N'Воспаление синовиальной сумки, которое проявляется болью и отёчностью в области сустава и ограничивает его движения', N'35 дней', N'Теплый компресс и обезболивающие')
INSERT [dbo].[Diagnoses] ([id], [Name], [Simptoms], [TimeOfHeal], [Appointments]) VALUES (3, N'Миозит', N'Боль, покраснение кожи, припухлость, мышечная слабость, ограничение подвижности, повышение температуры тела и отдельная поражённость мышц', N'14 дней', N'Массаж 2 раза в неделю и припорат Вантомиропит колоть внутримышечно раз в сутки')
SET IDENTITY_INSERT [dbo].[Diagnoses] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctors] ON 

INSERT [dbo].[Doctors] ([id], [Surname], [Firstname], [Patronymic], [Post], [WorkExp], [SienceRank], [Address], [Otdel_id]) VALUES (1, N'Шемарулин', N'Александр', N'Константинович', N'Глав. врач', 13, N'Профессор', N'г. Лукоянов ул. Пушкина д.42', 1)
INSERT [dbo].[Doctors] ([id], [Surname], [Firstname], [Patronymic], [Post], [WorkExp], [SienceRank], [Address], [Otdel_id]) VALUES (2, N'Гудкова', N'Анастасия', N'Андреевна', N'Хирург', 6, N'Доцент', N'г. Лукоянов ул. Новошкольная д.32', 1)
INSERT [dbo].[Doctors] ([id], [Surname], [Firstname], [Patronymic], [Post], [WorkExp], [SienceRank], [Address], [Otdel_id]) VALUES (3, N'Калякин', N'Евгений', N'Владимирович', N'Врач', 2, N'Доцент', N'Лукояновский р-н с. Гагино ул. Западная д.3', 2)
INSERT [dbo].[Doctors] ([id], [Surname], [Firstname], [Patronymic], [Post], [WorkExp], [SienceRank], [Address], [Otdel_id]) VALUES (4, N'Перевезенцев', N'Владимир', N'Палыч', N'Мед брат', 0, N'Магистр', N'г. Лукоянов ул. Гагарина д.32', 3)
SET IDENTITY_INSERT [dbo].[Doctors] OFF
GO
SET IDENTITY_INSERT [dbo].[HistoryOfDisease] ON 

INSERT [dbo].[HistoryOfDisease] ([id], [Patient_Id], [Doctor_Id], [Diagnoses_Id], [Heal], [DateOfDisease], [DateOfCloseDisease], [TypeOfHeal]) VALUES (1, 1, 2, 2, N'Теплый компресс и обезболивающие', CAST(N'2024-02-24' AS Date), NULL, N'Амбулаторно')
INSERT [dbo].[HistoryOfDisease] ([id], [Patient_Id], [Doctor_Id], [Diagnoses_Id], [Heal], [DateOfDisease], [DateOfCloseDisease], [TypeOfHeal]) VALUES (2, 2, 3, 1, N'2 раза в день после еды принимать Антиголопентомолин', CAST(N'2023-11-05' AS Date), CAST(N'2023-12-03' AS Date), N'Стационарно')
SET IDENTITY_INSERT [dbo].[HistoryOfDisease] OFF
GO
SET IDENTITY_INSERT [dbo].[Otdel] ON 

INSERT [dbo].[Otdel] ([id], [Name], [Floor], [NumberOfRoom], [FSP]) VALUES (1, N'Хирургия', 2, 43, N'Федорчук Максим Александрович')
INSERT [dbo].[Otdel] ([id], [Name], [Floor], [NumberOfRoom], [FSP]) VALUES (2, N'Терапия', 1, 32, N'Голубева Татьяна Александровна')
INSERT [dbo].[Otdel] ([id], [Name], [Floor], [NumberOfRoom], [FSP]) VALUES (3, N'Нервология', 3, 51, N'Крылов Никита Александрович')
SET IDENTITY_INSERT [dbo].[Otdel] OFF
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([id], [Surname], [Firstname], [Patronymic], [Address], [City], [Age], [Gender]) VALUES (1, N'Кириллова', N'Ангелина', N'Никитична', N'г. Лукоянов ул. Новошкольная', N'Лукоянов', 26, 0)
INSERT [dbo].[Patients] ([id], [Surname], [Firstname], [Patronymic], [Address], [City], [Age], [Gender]) VALUES (2, N'Власова', N'Алиса', N'Платонова', N'г. Лукоянов ул. Пушкина', N'Лукоянов', 33, 0)
INSERT [dbo].[Patients] ([id], [Surname], [Firstname], [Patronymic], [Address], [City], [Age], [Gender]) VALUES (3, N'Владимирова', N'Стефания', N'Николаевна', N'г. Сочи', N'Сочи', 65, 0)
INSERT [dbo].[Patients] ([id], [Surname], [Firstname], [Patronymic], [Address], [City], [Age], [Gender]) VALUES (4, N'Краснов', N'Алексей', N'Львович', N'г. Лукоянов ул. Пушкина', N'Лукоянов', 19, 1)
INSERT [dbo].[Patients] ([id], [Surname], [Firstname], [Patronymic], [Address], [City], [Age], [Gender]) VALUES (5, N'Макаров', N'Александр', N'Николаевич', N'г. Лукоянов ул. Западная', N'Лукоянов', 42, 1)
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_Otdel] FOREIGN KEY([Otdel_id])
REFERENCES [dbo].[Otdel] ([id])
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_Otdel]
GO
ALTER TABLE [dbo].[HistoryOfDisease]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOfDisease_Diagnoses] FOREIGN KEY([Diagnoses_Id])
REFERENCES [dbo].[Diagnoses] ([id])
GO
ALTER TABLE [dbo].[HistoryOfDisease] CHECK CONSTRAINT [FK_HistoryOfDisease_Diagnoses]
GO
ALTER TABLE [dbo].[HistoryOfDisease]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOfDisease_Doctors] FOREIGN KEY([Doctor_Id])
REFERENCES [dbo].[Doctors] ([id])
GO
ALTER TABLE [dbo].[HistoryOfDisease] CHECK CONSTRAINT [FK_HistoryOfDisease_Doctors]
GO
ALTER TABLE [dbo].[HistoryOfDisease]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOfDisease_Patients] FOREIGN KEY([Patient_Id])
REFERENCES [dbo].[Patients] ([id])
GO
ALTER TABLE [dbo].[HistoryOfDisease] CHECK CONSTRAINT [FK_HistoryOfDisease_Patients]
GO
USE [master]
GO
ALTER DATABASE [Poliklinika] SET  READ_WRITE 
GO
