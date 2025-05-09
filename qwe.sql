USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 21.04.2025 23:29:46 ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'D:\Новая папка (2)\MSSQL15.SQLEXPRESS\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'D:\Новая папка (2)\MSSQL15.SQLEXPRESS\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY FULL 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ХранительПРО] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ХранительПРО] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ХранительПРО] SET QUERY_STORE = OFF
GO
USE [ХранительПРО]
GO
/****** Object:  Table [dbo].[заявка]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[заявка](
	[id_заявки] [int] IDENTITY(1,1) NOT NULL,
	[id_пользователя] [int] NOT NULL,
	[тип_заявки] [nvarchar](50) NOT NULL,
	[id_статуса] [int] NOT NULL,
	[причина] [nvarchar](50) NULL,
	[дата_начала_срока_действия] [date] NOT NULL,
	[дата_окончания_окончания_срока_действия] [date] NOT NULL,
	[id_группы] [int] NULL,
	[id_подразделения] [int] NULL,
 CONSTRAINT [PK_заявка] PRIMARY KEY CLUSTERED 
(
	[id_заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[подразделение]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[подразделение](
	[Id_подразделения] [int] IDENTITY(1,1) NOT NULL,
	[инфо] [nvarchar](50) NULL,
 CONSTRAINT [PK_подразделение] PRIMARY KEY CLUSTERED 
(
	[Id_подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[пользователи]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[пользователи](
	[id_пользователя] [int] IDENTITY(1,1) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NULL,
	[телефон] [varchar](50) NOT NULL,
	[почта] [nvarchar](50) NOT NULL,
	[дата_рождения] [date] NOT NULL,
	[серия_паспорта] [nvarchar](50) NOT NULL,
	[номер_паспорта] [nvarchar](50) NOT NULL,
	[логин] [nvarchar](50) NOT NULL,
	[пароль] [nvarchar](50) NOT NULL,
	[примечание] [nvarchar](50) NULL,
	[организация] [nvarchar](50) NULL,
	[фотография] [varbinary](max) NULL,
 CONSTRAINT [PK_пользователи] PRIMARY KEY CLUSTERED 
(
	[id_пользователя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[посещение]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[посещение](
	[id_посещения] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [nvarchar](50) NULL,
	[имя] [nvarchar](50) NULL,
	[отчество] [nvarchar](50) NULL,
	[телефон] [nvarchar](50) NULL,
	[почта] [nvarchar](50) NULL,
	[дата_рождения] [date] NULL,
	[серия] [nvarchar](50) NULL,
	[номер] [nvarchar](50) NULL,
	[логин] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
	[группа] [nvarchar](100) NULL,
	[назначение] [nvarchar](50) NULL,
	[подразделение] [nvarchar](50) NULL,
	[id_сотрудника] [int] NULL,
	[срок_действия_заявки] [date] NULL,
	[по] [date] NULL,
	[цель_посещения] [nvarchar](50) NULL,
	[id_группы] [int] NULL,
 CONSTRAINT [PK_посещение_1] PRIMARY KEY CLUSTERED 
(
	[id_посещения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[сотрудник]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[сотрудник](
	[Код_сотрудника] [nvarchar](50) NULL,
	[фамилия] [nvarchar](50) NOT NULL,
	[имя] [nvarchar](50) NOT NULL,
	[отчество] [nvarchar](50) NOT NULL,
	[Подразделение] [nvarchar](50) NULL,
	[отдел] [nvarchar](50) NULL,
	[ID_сотрудника] [int] IDENTITY(1,1) NOT NULL,
	[id_подразделения] [int] NULL,
 CONSTRAINT [PK_сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[статус]    Script Date: 21.04.2025 23:29:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[статус](
	[id_статуса] [int] IDENTITY(1,1) NOT NULL,
	[Состояние] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_статус] PRIMARY KEY CLUSTERED 
(
	[id_статуса] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[заявка] ON 

INSERT [dbo].[заявка] ([id_заявки], [id_пользователя], [тип_заявки], [id_статуса], [причина], [дата_начала_срока_действия], [дата_окончания_окончания_срока_действия], [id_группы], [id_подразделения]) VALUES (1, 1, N'личная', 2, N'3авыа', CAST(N'2025-04-21' AS Date), CAST(N'2025-04-21' AS Date), NULL, NULL)
INSERT [dbo].[заявка] ([id_заявки], [id_пользователя], [тип_заявки], [id_статуса], [причина], [дата_начала_срока_действия], [дата_окончания_окончания_срока_действия], [id_группы], [id_подразделения]) VALUES (5, 1, N'групповая', 3, NULL, CAST(N'2025-04-21' AS Date), CAST(N'2025-04-21' AS Date), NULL, 1)
SET IDENTITY_INSERT [dbo].[заявка] OFF
GO
SET IDENTITY_INSERT [dbo].[подразделение] ON 

INSERT [dbo].[подразделение] ([Id_подразделения], [инфо]) VALUES (1, N'Производство
')
INSERT [dbo].[подразделение] ([Id_подразделения], [инфо]) VALUES (2, N'Сбыт
')
INSERT [dbo].[подразделение] ([Id_подразделения], [инфо]) VALUES (3, N'Администрация
')
INSERT [dbo].[подразделение] ([Id_подразделения], [инфо]) VALUES (4, N'Служба безопасности
')
INSERT [dbo].[подразделение] ([Id_подразделения], [инфо]) VALUES (5, N'Планирование
')
SET IDENTITY_INSERT [dbo].[подразделение] OFF
GO
SET IDENTITY_INSERT [dbo].[пользователи] ON 

INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (1, N'Радинка', N'Степанова', N'Власовна', N'+7 (613) 272-60-62', N'Radinka100@yandex.ru', CAST(N'1986-10-18' AS Date), N'0208', N'530509', N'Vlas86', N'b3uWS6#Thuvq', N'24/04/2023_9367788', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (2, N'Прохор', N'Шилов', N'Герасимович', N'+7 (615) 594-77-66', N'Prohor156@list.ru', CAST(N'1977-10-09' AS Date), N'3036', N'796488', N'Prohor156', N'zDdom}SIhWs?', N'24/04/2023_9788737', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (3, N'Юрин', N'Кононов', N'Романович', N'+7 (784) 673-51-91', N'YUrin155@gmail.com', CAST(N'1971-10-08' AS Date), N'2747', N'790512', N'YUrin155', N'u@m*~ACBCqNQ', N'24/04/2023_9736379', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (4, N'Альбина', N'Елисеева', N'Николаевна', N'+7 (654) 864-77-46', N'Aljbina33@lenta.ru', CAST(N'1983-02-15' AS Date), N'5241', N'213304', N'Aljbina33', N'Bu?BHCtwDFin', N'25/04/2023_9367788', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (5, N'Клавдия', N'Шарова', N'Макаровна', N'+7 (822) 525-82-40', N'Klavdiya113@live.com', CAST(N'1980-07-22' AS Date), N'8143', N'593309', N'Klavdiya113', N'FjC#hNIJori}', N'25/04/2023_9788737', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (6, N'Тамара', N'Сидорова', N'Григорьевна', N'+7 (334) 692-79-77', N'Tamara179@live.com', CAST(N'1995-11-22' AS Date), N'8143', N'905520', N'Tamara179', N'TJxVqMXrbesI', N'25/04/2023_9736379', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (7, N'Тарас', N'Петухов', N'Фадеевич', N'+7 (376) 220-62-51', N'Taras24@rambler.ru', CAST(N'1991-01-05' AS Date), N'1609', N'171096', N'Taras24', N'07m5yspn3K~K', N'26/04/2023_9367788', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (8, N'Аркадий', N'Родионов', N'Власович', N'+7 (491) 696-17-11', N'Arkadij123@inbox.ru', CAST(N'1993-08-11' AS Date), N'3841', N'642594', N'Arkadij123', N'vk2N7lxX}ck%', N'26/04/2023_9788737', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (9, N'Глафира', N'Горшкова', N'Валентиновна', N'+7 (553) 343-38-82', N'Glafira73@outlook.com', CAST(N'1978-05-25' AS Date), N'9170', N'402601', N'Glafira73', N'Zz8POQlP}M4~', N'26/04/2023_9736379', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (10, N'Гавриила', N'Кириллова', N'Яковна', N'+7 (648) 700-43-34', N'Gavriila68@msn.com', CAST(N'1992-04-26' AS Date), N'9438', N'379667', N'Gavriila68', N'x4K5WthEe8ua', N'27/04/2023_9367788', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (11, N'Кузьма', N'Овчинников', N'Ефимович', N'+7 (562) 866-15-27', N'Kuzjma124@yandex.ru', CAST(N'1993-08-02' AS Date), N'0766', N'647226', N'Kuzjma124', N'OsByQJ}vYznW', N'27/04/2023_9788737', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (12, N'Роман', N'Беляков', N'Викторович', N'+7 (595) 196-56-28', N'Roman89@gmail.com', CAST(N'1991-06-07' AS Date), N'2411', N'478305', N'Roman89', N'Xd?xP$2yICcG', N'27/04/2023_9736379', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (13, N'Алексей', N'Лыткин', N'Максимович', N'+7 (994) 353-29-52', N'Aleksej43@gmail.com', CAST(N'1996-03-07' AS Date), N'2383', N'259825', N'Aleksej43', N'~c%PlTY0?qgl', N'28/04/2023_9367788', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (14, N'Надежда', N'Шубина', N'Викторовна', N'+7 (736) 488-66-95', N'Nadezhda137@outlook.com', CAST(N'1981-09-24' AS Date), N'8844', N'708476', N'Nadezhda137', N'QQ~0q~rXHb?p', N'28/04/2023_9788737', NULL, NULL)
INSERT [dbo].[пользователи] ([id_пользователя], [Имя], [Фамилия], [Отчество], [телефон], [почта], [дата_рождения], [серия_паспорта], [номер_паспорта], [логин], [пароль], [примечание], [организация], [фотография]) VALUES (15, N'Бронислава', N'Зиновьева', N'Викторовна', N'+7 (778) 565-12-18', N'Bronislava56@yahoo.com', CAST(N'1981-03-19' AS Date), N'6736', N'319423', N'Bronislava56', N'LO}xyC~1S4l6', N'28/04/2023_9736379', NULL, NULL)
SET IDENTITY_INSERT [dbo].[пользователи] OFF
GO
SET IDENTITY_INSERT [dbo].[посещение] ON 

INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (1, N'Самойлова', N'Таисия', N'Гермоновна', N'+7 (891) 555-81-44', N'Taisiya177@lenta.ru', CAST(N'1979-11-14' AS Date), N'5193', N'897719', N'Taisiya177', N'R94YGT3XFjgD', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (2, N'Ситникова', N'Аделаида', N'Гермоновна', N'+7 (793) 736-70-31', N'Adelaida20@hotmail.com', CAST(N'1979-01-21' AS Date), N'7561', N'148016', N'Adelaida20', N'LCY*{L*fEGYB', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (3, N'Исаев', N'Лев', N'Юлианович', N'+7 (675) 593-89-30', N'Lev131@rambler.ru', CAST(N'1994-08-05' AS Date), N'1860', N'680004', N'Lev131', N'~?oj2Lh@S7*T', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (4, N'Никифоров', N'Даниил', N'Степанович', N'+7 (384) 358-77-82', N'Daniil198@bk.ru', CAST(N'1970-12-13' AS Date), N'4557', N'999958', N'lzaihtvkdn', N'L2W#uo7z{EsO', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (5, N'Титова', N'Людмила', N'Якововна', N'+7 (221) 729-16-84', N'Lyudmila123@hotmail.com', CAST(N'1976-08-21' AS Date), N'7715', N'639425', N'Lyudmila123', N'@8mk9M?NBAGj', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (6, N'Абрамова', N'Таисия', N'Дмитриевна', N'+7 (528) 312-18-20', N'Taisiya176@hotmail.com', CAST(N'1982-11-20' AS Date), N'7310', N'893510', N'Taisiya176', N'~rIWfsnXA~7C', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (7, N'Кузьмина', N'Вера', N'Максимовна', N'+7 (598) 583-53-45', N'Vera195@list.ru', CAST(N'1989-12-10' AS Date), N'3537', N'982933', N'Vera195', N'B|5v$2r$7luL', N'24/04/2023_Производство_Фомичева_9367788_ГР1', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (8, N'Мартынов', N'Яков', N'Ростиславович', N'+7 (546) 159-67-33', N'YAkov196@rambler.ru', CAST(N'1976-12-05' AS Date), N'1793', N'986063', N'YAkov196', N'$6s5bggKP7aw', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (9, N'Евсеева', N'Нина', N'Павловна', N'+7 (833) 521-31-50', N'Nina145@msn.com', CAST(N'1994-09-26' AS Date), N'9323', N'745717', N'Nina145', N'Uxy6RtBXIcpT', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (10, N'Голубев', N'Леонтий', N'Вячеславович', N'+7 (160) 527-57-41', N'Leontij161@mail.ru', CAST(N'1990-10-03' AS Date), N'1059', N'822077', N'Leontij161', N'KkMY8yKw@oCa', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (11, N'Карпова', N'Серафима', N'Михаиловна', N'+7 (459) 930-91-70', N'Serafima169@yahoo.com', CAST(N'1989-11-19' AS Date), N'7034', N'858987', N'Serafima169', N'gNe3I9}8J3Z@', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (12, N'Орехов', N'Сергей', N'Емельянович', N'+7 (669) 603-29-87', N'Sergej35@inbox.ru', CAST(N'1972-02-11' AS Date), N'3844', N'223682', N'Sergej35', N'$39vc%ljqN%r', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (13, N'Исаев', N'Георгий', N'Павлович', N'+7 (678) 516-36-86', N'Georgij121@inbox.ru', CAST(N'1987-08-11' AS Date), N'4076', N'629809', N'Georgij121', N'bbx5H}f*BC?w', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (14, N'Богданов', N'Елизар', N'Артемович', N'+7 (165) 768-30-97', N'Elizar30@yandex.ru', CAST(N'1978-02-02' AS Date), N'573', N'198559', N'Elizar30', N'wJs1~r3RS~dr', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[посещение] ([id_посещения], [фамилия], [имя], [отчество], [телефон], [почта], [дата_рождения], [серия], [номер], [логин], [пароль], [группа], [назначение], [подразделение], [id_сотрудника], [срок_действия_заявки], [по], [цель_посещения], [id_группы]) VALUES (15, N'Тихонова', N'Лана', N'Семеновна', N'+7 (478) 467-75-15', N'Lana117@outlook.com', CAST(N'1990-07-24' AS Date), N'8761', N'609740', N'Lana117', N'mFoG$jcS3c4~', N'24/04/2023_Производство_Фомичева_9367788_ГР2', N'24/04/2023_9367788', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[посещение] OFF
GO
SET IDENTITY_INSERT [dbo].[сотрудник] ON 

INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9367788', N'Фомичева', N'Авдотья', N'Трофимовна', N'Производство', N'-', 1, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9788737', N'Гаврилова', N'Римма', N'Ефимовна', N'Сбыт', N'-', 2, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9736379', N'Носкова', N'Наталия', N'Прохоровна', N'Администрация', N'-', 3, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9362832', N'Архипов', N'Тимофей', N'Васильевич', N'Служба безопасности', N'-', 4, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9737848', N'Орехова', N'Вероника', N'Артемовна', N'Планирование', N'-', 5, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9768239', N'Савельев', N'Павел', N'Степанович', N'-', N'Общий отдел', 6, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (N'9404040', N'Чернов', N'Всеволод', N'Наумович', N'-', N'Охрана', 7, NULL)
INSERT [dbo].[сотрудник] ([Код_сотрудника], [фамилия], [имя], [отчество], [Подразделение], [отдел], [ID_сотрудника], [id_подразделения]) VALUES (NULL, N'Марков', N'Юрий', N'Романович', N'-', N'', 8, NULL)
SET IDENTITY_INSERT [dbo].[сотрудник] OFF
GO
SET IDENTITY_INSERT [dbo].[статус] ON 

INSERT [dbo].[статус] ([id_статуса], [Состояние]) VALUES (1, N'одобрено')
INSERT [dbo].[статус] ([id_статуса], [Состояние]) VALUES (2, N'отказ')
INSERT [dbo].[статус] ([id_статуса], [Состояние]) VALUES (3, N'в обработке')
SET IDENTITY_INSERT [dbo].[статус] OFF
GO
ALTER TABLE [dbo].[заявка] ADD  CONSTRAINT [DF_заявка_id_статуса]  DEFAULT ((3)) FOR [id_статуса]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_подразделение] FOREIGN KEY([id_подразделения])
REFERENCES [dbo].[подразделение] ([Id_подразделения])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_подразделение]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_пользователи] FOREIGN KEY([id_пользователя])
REFERENCES [dbo].[пользователи] ([id_пользователя])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_пользователи]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_посещение] FOREIGN KEY([id_группы])
REFERENCES [dbo].[посещение] ([id_посещения])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_посещение]
GO
ALTER TABLE [dbo].[заявка]  WITH CHECK ADD  CONSTRAINT [FK_заявка_статус] FOREIGN KEY([id_статуса])
REFERENCES [dbo].[статус] ([id_статуса])
GO
ALTER TABLE [dbo].[заявка] CHECK CONSTRAINT [FK_заявка_статус]
GO
ALTER TABLE [dbo].[сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_сотрудник_подразделение] FOREIGN KEY([id_подразделения])
REFERENCES [dbo].[подразделение] ([Id_подразделения])
GO
ALTER TABLE [dbo].[сотрудник] CHECK CONSTRAINT [FK_сотрудник_подразделение]
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
