USE [master]
GO
/****** Object:  Database [NYCStations]    Script Date: 22/06/2022 10:03:26 AM ******/
CREATE DATABASE [NYCStations]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NYCStations', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NYCStations.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NYCStations_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NYCStations_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NYCStations] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NYCStations].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NYCStations] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NYCStations] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NYCStations] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NYCStations] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NYCStations] SET ARITHABORT OFF 
GO
ALTER DATABASE [NYCStations] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NYCStations] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NYCStations] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NYCStations] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NYCStations] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NYCStations] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NYCStations] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NYCStations] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NYCStations] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NYCStations] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NYCStations] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NYCStations] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NYCStations] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NYCStations] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NYCStations] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NYCStations] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NYCStations] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NYCStations] SET RECOVERY FULL 
GO
ALTER DATABASE [NYCStations] SET  MULTI_USER 
GO
ALTER DATABASE [NYCStations] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NYCStations] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NYCStations] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NYCStations] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NYCStations] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NYCStations', N'ON'
GO
ALTER DATABASE [NYCStations] SET QUERY_STORE = OFF
GO
USE [NYCStations]
GO
/****** Object:  Table [dbo].[FavoriteStations]    Script Date: 22/06/2022 10:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteStations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstStationId] [int] NOT NULL,
	[SecondStationId] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 22/06/2022 10:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Latitude] [varchar](max) NOT NULL,
	[Longitude] [varchar](max) NOT NULL,
	[Notes] [varchar](max) NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/06/2022 10:03:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](250) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[LastName] [varchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FavoriteStations] ON 

INSERT [dbo].[FavoriteStations] ([ID], [UserId], [FirstStationId], [SecondStationId], [CreationDate]) VALUES (1, 1, 3, 300, CAST(N'2022-06-20T21:03:14.173' AS DateTime))
INSERT [dbo].[FavoriteStations] ([ID], [UserId], [FirstStationId], [SecondStationId], [CreationDate]) VALUES (2, 1, 3, 300, CAST(N'2022-06-20T21:07:41.507' AS DateTime))
INSERT [dbo].[FavoriteStations] ([ID], [UserId], [FirstStationId], [SecondStationId], [CreationDate]) VALUES (3, 1, 3, 360, CAST(N'2022-06-20T21:08:49.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[FavoriteStations] OFF
SET IDENTITY_INSERT [dbo].[Stations] ON 

INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (1, N'Astor Pl', N'40.7300540002897', N'-73.9910699986196', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (2, N'Canal St', N'40.7188030010770', N'-74.0001929992732', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (3, N'50th St', N'40.7617279996141', N'-73.9838489998662', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (4, N'Bergen St', N'40.6808621368295', N'-73.9749991511680', N'"4-nights, 3-all other times, 2-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (5, N'Pennsylvania Ave', N'40.6647144514356', N'-73.8948859115406', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (6, N'238th St', N'40.8846670006497', N'-73.9008700001852', N'"1-all times, exit only northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (7, N'Cathedral Pkwy (110th St)', N'40.8005815581149', N'-73.9580667066136', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (8, N'Kingston - Throop Aves', N'40.6799189994160', N'-73.9408589987126', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (9, N'65th St', N'40.7497195293567', N'-73.8987883783301', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (10, N'36th St', N'40.7519600440107', N'-73.9290181846153', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (11, N'Delancey St - Essex St', N'40.7183060561861', N'-73.9874094020297', N'"J-all times, M-all times exc nights, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (12, N'Van Siclen Ave', N'40.6780282144778', N'-73.8916577270244', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (13, N'Norwood Ave', N'40.6815200004568', N'-73.8796259991078', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (14, N'104th-102nd Sts', N'40.6951659982337', N'-73.8444350002968', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (15, N'DeKalb Ave', N'40.6906481199697', N'-73.9817709444094', N'"B-weekdays and evenings, D-all other times, N-nights, R-all other times, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (16, N'Beach 105th St', N'40.5832684381028', N'-73.8275807503452', N'"A-rush hours AM northbound, PM southbound, S Broad Channel to Rockaway Park-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (17, N'Beach 90th St', N'40.5880915645732', N'-73.8136514041963', N'"A-rush hours AM northbound, PM southbound, S Broad Channel to Rockaway Park-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (18, N'Freeman St', N'40.8299874463841', N'-73.8917522534946', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (19, N'Intervale Ave', N'40.8221421311707', N'-73.8966173846164', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (20, N'182nd-183rd Sts', N'40.8560929988186', N'-73.9007409999896', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (21, N'174th-175th Sts', N'40.8458999998341', N'-73.9101360005007', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (22, N'167th St', N'40.8337689986279', N'-73.9184320008225', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (23, N'Mets - Willets Point', N'40.7546219988126', N'-73.8456249984179', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (24, N'Junction Blvd', N'40.7491449994883', N'-73.8695270010351', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (25, N'Flushing - Main St', N'40.7595999991501', N'-73.8300300026250', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (26, N'Buhre Ave', N'40.8468099988855', N'-73.8325690000374', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (27, N'3rd Ave - 138th St', N'40.8104760011726', N'-73.9261380001413', N'"6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (28, N'Castle Hill Ave', N'40.8342549982546', N'-73.8512219996147', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (29, N'Brooklyn Bridge - City Hall', N'40.7130649994331', N'-74.0041310005885', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (30, N'Zerega Ave', N'40.8364880006081', N'-73.8470359987544', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (31, N'Grand Central - 42nd St', N'40.7518074298163', N'-73.9767132992584', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (32, N'33rd St', N'40.7460809990914', N'-73.9820760014894', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (33, N'96th St', N'40.7856719999860', N'-73.9510700015425', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (34, N'77th St', N'40.7736200007461', N'-73.9598739988604', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (35, N'Chauncey St', N'40.6828513008780', N'-73.9103835703337', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (36, N'Union St', N'40.6773156673509', N'-73.9831099990967', N'"D,N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (37, N'Elmhurst Ave', N'40.7423700797216', N'-73.8820347465864', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (38, N'Ralph Ave', N'40.6788220008733', N'-73.9207859993330', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (39, N'Pelham Pkwy', N'40.8571924091606', N'-73.8674806785004', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (40, N'Gun Hill Rd', N'40.8778393851720', N'-73.8661341053870', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (41, N'Nereid Ave (238 St)', N'40.8982865155752', N'-73.8543153107622', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (42, N'Franklin Ave', N'40.6707651534489', N'-73.9580997367769', N'"2,4-all times, 3-all times exc nights, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (43, N'Simpson St', N'40.8239768412373', N'-73.8930663950790', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (44, N'Bronx Park East', N'40.8487686663389', N'-73.8683560917809', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (45, N'Winthrop St', N'40.6566593137607', N'-73.9500793459099', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (46, N'Van Siclen Ave', N'40.6655179630596', N'-73.8894049173010', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (47, N'149th St - Grand Concourse', N'40.8183034437231', N'-73.9273847542618', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (48, N'161st St - Yankee Stadium', N'40.8282303274216', N'-73.9256919950573', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (49, N'Lexington Ave - 59th St', N'40.7625260003045', N'-73.9679670004732', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (50, N'E 149th St', N'40.8121179982720', N'-73.9040979987594', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (51, N'Morrison Av - Soundview', N'40.8295210015674', N'-73.8745159992948', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (52, N'Whitlock Ave', N'40.8265250005590', N'-73.8862829985325', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (53, N'St Lawrence Ave', N'40.8315090005233', N'-73.8676179992367', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (54, N'Woodside - 61st St', N'40.7456300011383', N'-73.9029840017300', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (55, N'Far Rockaway - Mott Ave', N'40.6039950016875', N'-73.7554049992473', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (56, N'72nd St', N'40.7755193972925', N'-73.9763365752180', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (57, N'96th St', N'40.7916187976701', N'-73.9646024568716', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (58, N'168th St', N'40.8407189999079', N'-73.9395609998542', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (59, N'Kingsbridge Rd', N'40.8669779999994', N'-73.8935090000331', N'"B-rush hours, D-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (60, N'42nd St - Bryant Pk', N'40.7541840013125', N'-73.9845909990471', N'"B,M-weekdays and evenings, D,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (61, N'Prospect Park', N'40.6616334551018', N'-73.9620313042660', N'"B-weekdays and evenings, Q,S to Franklin Av-Fulton St-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (62, N'55th St', N'40.6314787609374', N'-73.9953488259574', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (63, N'Jamaica - Van Wyck', N'40.7028985528731', N'-73.8170128713540', N'E-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (64, N'Kew Gardens - Union Tpke', N'40.7140348195710', N'-73.8303702709878', N'"E,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (65, N'Sutphin Blvd - Archer Av', N'40.7003824242350', N'-73.8080047196383', N'"E,J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (66, N'Court Sq - 23rd St', N'40.7477681214143', N'-73.9460547026632', N'"E-all times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (67, N'67th Ave', N'40.7265054758130', N'-73.8528604843490', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (68, N'Grand Ave - Newtown', N'40.7368134181971', N'-73.8772208566918', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (69, N'Ditmas Ave', N'40.6361186666629', N'-73.9781719996516', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (70, N'Classon Ave', N'40.6888890002645', N'-73.9599900013721', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (71, N'Broadway', N'40.7061265762741', N'-73.9503122560662', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (72, N'Lorimer St', N'40.7140720006471', N'-73.9502479999697', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (73, N'Sutter Ave', N'40.6691450006139', N'-73.9019160004208', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (74, N'Wilson Ave', N'40.6888665424602', N'-73.9039586049186', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (75, N'Halsey St', N'40.6864152707043', N'-73.9166388842194', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (76, N'Lorimer St', N'40.7038440000420', N'-73.9473549988420', N'"J-all times, skips weekdays AM westbound, PM eastbound, M-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (77, N'8th Ave', N'40.6349709996471', N'-74.0115159977215', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (78, N'36th Ave', N'40.7564420005104', N'-73.9298619991180', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (79, N'Broadway', N'40.7614319988005', N'-73.9258229991990', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (80, N'Times Sq - 42nd St', N'40.7546119985154', N'-73.9867680015397', N'"N,Q-all times, R-all times exc nights, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (81, N'Grand Central - 42nd St', N'40.7527686667421', N'-73.9791889998910', N'"S to Times Sq-all times exc nights, closed nights-use 7"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (82, N'Park Pl', N'40.6747716668526', N'-73.9576240007463', N'S Franklin Av-Fulton St to Prospect Park-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (83, N'111th St', N'40.6843310000123', N'-73.8321629984538', N'"S Euclid Av to Ozone Park-Lefferts Blvd-nights, A-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (84, N'W 4th St - Washington Sq (Lower)', N'40.7322544933678', N'-74.0003081475597', N'"B,M-weekdays and evenings, D,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (85, N'51st St', N'40.7571069998931', N'-73.9719200006998', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (86, N'86th St', N'40.7886440007389', N'-73.9762179985932', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (87, N'233rd St', N'40.8931432413837', N'-73.8573623952154', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (88, N'66th St - Lincoln Ctr', N'40.7734400005203', N'-73.9822089999578', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (89, N'Hunts Point Ave', N'40.8209479985230', N'-73.8905490001734', N'"6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (90, N'Canal St', N'40.7228539977878', N'-74.0062770001748', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (91, N'Middletown Rd', N'40.8438630012838', N'-73.8363219975594', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (92, N'23rd St', N'40.7398640004746', N'-73.9865990020788', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (93, N'Court Sq', N'40.7470229988964', N'-73.9452640003967', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (94, N'59th St - Columbus Circle', N'40.7682470006368', N'-73.9819290023271', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (95, N'Hunters Point Ave', N'40.7422159998631', N'-73.9489160009391', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (96, N'23rd St', N'40.7440809998975', N'-73.9956570016487', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (97, N'Houston St', N'40.7282510007302', N'-74.0053670018058', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (98, N'104th St', N'40.6817110010911', N'-73.8376830006099', N'"S Euclid Av to Ozone Park-Lefferts Blvd-nights, A-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (99, N'Broad Channel', N'40.6084021806968', N'-73.8158326878296', N'"A,S to Rockaway Park-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
GO
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (100, N'Ocean Pkwy', N'40.5763116670809', N'-73.9685009997517', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (101, N'Vernon Blvd - Jackson Ave', N'40.7426259996974', N'-73.9535809987524', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (102, N'68th St - Hunter College', N'40.7681410004967', N'-73.9638700015804', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (103, N'Queensboro Plz', N'40.7506356510148', N'-73.9401635351909', N'"7,N-all times, 7 Express-rush hours AM westbound, PM eastbound, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (104, N'Rockaway Blvd', N'40.6804289995884', N'-73.8438529979573', N'"A-all times, S Euclid Av to Ozone Park-Lefferts Blvd-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (105, N'Union Sq - 14th St', N'40.7346730009961', N'-73.9899509988188', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (106, N'Bedford - Nostrand Aves', N'40.6896270015844', N'-73.9535220006402', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (107, N'15th St - Prospect Park', N'40.6600356881002', N'-73.9797358059287', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (108, N'7th Ave', N'40.6662446900198', N'-73.9802511790094', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (109, N'Ft Hamilton Pkwy', N'40.6507816680341', N'-73.9757759991747', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (110, N'Church Ave', N'40.6442720001299', N'-73.9797211622908', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (111, N'Beverly Rd', N'40.6439045986041', N'-73.9643577962312', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (112, N'Church Ave', N'40.6504932464648', N'-73.9628824619211', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (113, N'Newkirk Ave', N'40.6351419373378', N'-73.9626948683726', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (114, N'Parkside Ave', N'40.6550730416371', N'-73.9614534398764', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (115, N'Grand Army Plaza', N'40.6752946951032', N'-73.9709563319228', N'"4-nights, 3-all other times, 2-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (116, N'Atlantic Av - Barclay''s Center', N'40.6844201652676', N'-73.9775499353938', N'"2,4-all times, 3-all times exc nights, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (117, N'Rockaway Ave', N'40.6783399998835', N'-73.9119459972661', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (118, N'Fulton St', N'40.6871189995077', N'-73.9753749983314', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (119, N'Clinton - Washington Aves', N'40.6880940010605', N'-73.9667959986695', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (120, N'7th Ave', N'40.6771021798329', N'-73.9728527919102', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (121, N'Atlantic Av - Barclay''s Center', N'40.6844883234536', N'-73.9767834396316', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (122, N'Atlantic Av - Barclay''s Center', N'40.6836656672794', N'-73.9788099995676', N'"D,N-all times, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (123, N'Borough Hall', N'40.6924039999910', N'-73.9901510009053', N'"4-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (124, N'Aqueduct Racetrack', N'40.6720969991728', N'-73.8359189996516', N'"A-to Manhattan only, racing days only"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (125, N'Morris Park', N'40.8543639996642', N'-73.8604950011725', N'5-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (126, N'Pelham Pkwy', N'40.8589849998201', N'-73.8553590004356', N'5-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (127, N'Nostrand Ave', N'40.6804380000622', N'-73.9504260009968', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (128, N'Nevins St', N'40.6883105801902', N'-73.9804067987457', N'"2,4-all times, 3-all times exc nights, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (129, N'Eastern Pkwy - Bklyn Museum', N'40.6720322354592', N'-73.9642220374842', N'"4-nights, 3-all other times, 2-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (130, N'Beverly Rd', N'40.6451235189437', N'-73.9488479838170', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (131, N'Church Ave', N'40.6508606878022', N'-73.9494551403533', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (132, N'Newkirk Ave', N'40.6399912427531', N'-73.9482999082240', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (133, N'Brooklyn College - Flatbush Ave', N'40.6328424070074', N'-73.9475412073440', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (134, N'Sterling St', N'40.6627729934283', N'-73.9507289112493', N'"2-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (135, N'Crown Hts - Utica Ave', N'40.6689783110780', N'-73.9329325608185', N'"3-all times exc nights, 4-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (136, N'Kingston Ave', N'40.6694814486497', N'-73.9421597839296', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (137, N'Nassau Ave', N'40.7244799978082', N'-73.9511830001652', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (138, N'Greenpoint Ave', N'40.7312669997146', N'-73.9544250014623', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (139, N'Marcy Ave', N'40.7083830000179', N'-73.9578320007572', N'"J-all times, M-all times exc nights, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (140, N'Hewes St', N'40.7068899980540', N'-73.9534880003845', N'"J-all times, skips weekdays AM westbound, PM eastbound, M-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (141, N'138th St - Grand Concourse', N'40.8132239995890', N'-73.9298489993561', N'"4-all times, skips rush hours AM southbound, PM northbound, 5-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (142, N'5th Ave - 53rd St', N'40.7600868323132', N'-73.9752485052734', N'"E-all times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (143, N'Lexington Ave - 53rd St', N'40.7574683078286', N'-73.9690723749020', N'"E-all times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (144, N'28th St', N'40.7454539997995', N'-73.9886980012873', N'"N-all times, R-all times exc nights, part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (145, N'Herald Sq - 34th St', N'40.7496445600944', N'-73.9879368338264', N'"N,Q-all times, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (146, N'1st Ave', N'40.7309749758006', N'-73.9816808748912', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (147, N'Times Sq - 42nd St', N'40.7559830005700', N'-73.9862289995320', N'"S to Grand Central-all times exc nights, closed nights-use 7"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (148, N'Metropolitan Ave', N'40.7127740007342', N'-73.9514239994525', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (149, N'Grand St', N'40.7115760006482', N'-73.9404969987464', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (150, N'Graham Ave', N'40.7145759983636', N'-73.9439439986903', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (151, N'Bedford Ave', N'40.7171739985889', N'-73.9566649980652', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (152, N'Montrose Ave', N'40.7073910643845', N'-73.9397928471350', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (153, N'Long Island City - Court Sq', N'40.7463050335714', N'-73.9438155959783', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (154, N'21st St', N'40.7441286664954', N'-73.9495999997552', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (155, N'39th Ave', N'40.7527630614084', N'-73.9328513767959', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (156, N'145th St', N'40.8265509996219', N'-73.9503599987971', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (157, N'157th St', N'40.8340410001399', N'-73.9448899990104', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (158, N'96th St', N'40.7939190012147', N'-73.9723229991569', N'"1,2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (159, N'103rd St', N'40.7994460003348', N'-73.9683789996081', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (160, N'Central Park North (110th St)', N'40.7990749997732', N'-73.9518220017691', N'"2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (161, N'103rd St', N'40.7960607399045', N'-73.9613700826761', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (162, N'72nd St', N'40.7784530006861', N'-73.9819700015958', N'"1,2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (163, N'81st St', N'40.7813460841820', N'-73.9720979493720', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (164, N'75th Ave', N'40.7180446534874', N'-73.8369236938715', N'"E-evenings, weekends, nights, F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (165, N'86th St', N'40.7858230467855', N'-73.9688284942967', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (166, N'Cathedral Pkwy (110th St)', N'40.8039669996148', N'-73.9668470005456', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (167, N'116th St - Columbia University', N'40.8077220012308', N'-73.9641099975775', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (168, N'125th St', N'40.8077539991828', N'-73.9454950001141', N'"2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (169, N'135th St', N'40.8142290003391', N'-73.9407700010670', N'"2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (170, N'116th St', N'40.8020979991330', N'-73.9496250009690', N'"2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (171, N'Tremont Ave', N'40.8504099995102', N'-73.9052270012235', N'"B-rush hours, D-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (172, N'137th St - City College', N'40.8220079996847', N'-73.9536760008787', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (173, N'145th St', N'40.8204209996927', N'-73.9362449987329', N'"3-all times, exit only northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (174, N'176th St', N'40.8484800012369', N'-73.9117939988447', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (175, N'Burnside Ave', N'40.8534530015569', N'-73.9076840015997', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (176, N'170th St', N'40.8393059996415', N'-73.9133999984698', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (177, N'168th St', N'40.8405559991485', N'-73.9401329990725', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (178, N'181st St', N'40.8495049997406', N'-73.9335959996056', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (179, N'191st St', N'40.8552250017583', N'-73.9294119974203', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (180, N'175th St', N'40.8473910007240', N'-73.9397039976159', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (181, N'Beach 44th St', N'40.5929429990861', N'-73.7760129999950', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (182, N'Beach 60th St', N'40.5923740012123', N'-73.7885219980118', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (183, N'Beach 98th St', N'40.5853856913327', N'-73.8205205895952', N'"A-rush hours AM northbound, PM southbound, S Broad Channel to Rockaway Park-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (184, N'Rockaway Park - Beach 116 St', N'40.5809558655735', N'-73.8355900870123', N'"A-rush hours AM northbound, PM southbound, S to Broad Channel-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (185, N'Beach 36th St', N'40.5953980016687', N'-73.7681749993968', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (186, N'Beach 25th St', N'40.6000660010588', N'-73.7613529976207', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (187, N'Parsons Blvd', N'40.7075719996156', N'-73.8032890002188', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (188, N'169th St', N'40.7105175027840', N'-73.7934741992772', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (189, N'103rd St - Corona Plaza', N'40.7498650005555', N'-73.8626999983041', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (190, N'111th St', N'40.7517299994171', N'-73.8553339983488', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (191, N'63rd Dr - Rego Park', N'40.7297639724224', N'-73.8616182009720', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (192, N'Grant Ave', N'40.6770440005447', N'-73.8650499987770', N'"A-all times, S Euclid Av to Ozone Park-Lefferts Blvd-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (193, N'79th St', N'40.7839339995903', N'-73.9799170005613', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (194, N'Atlantic Ave', N'40.6753446664080', N'-73.9030969995401', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (195, N'Christopher St - Sheridan Sq', N'40.7334220010422', N'-74.0029059985523', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (196, N'Ozone Park - Lefferts Blvd', N'40.6859509987836', N'-73.8257979990661', N'"S to Euclid Av-nights, A-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (197, N'Times Sq - 42nd St', N'40.7554770019825', N'-73.9876909982515', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (198, N'W 8th St - NY Aquarium', N'40.5760338181036', N'-73.9759578741382', N'"F,Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (199, N'28th St', N'40.7472149991821', N'-73.9933650013432', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
GO
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (200, N'28th St', N'40.7430699992590', N'-73.9842640011040', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (201, N'Pelham Bay Park', N'40.8524619995166', N'-73.8281210005928', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (202, N'Westchester Sq - E Tremont Ave', N'40.8398920010139', N'-73.8429519992501', N'"6 Express-weekdays AM southbound, PM northbound, 6-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (203, N'18th St', N'40.7410399998021', N'-73.9978710006040', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (204, N'Grand Central - 42nd St', N'40.7514310002868', N'-73.9760410011150', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (205, N'Beach 67th St', N'40.5909270007813', N'-73.7969239998421', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (206, N'W 4th St - Washington Sq (Upper)', N'40.7323379977432', N'-74.0004950022543', N'"A,E-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (207, N'85th St - Forest Pky', N'40.6924269996610', N'-73.8600870000687', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (208, N'Woodhaven Blvd', N'40.6937039988010', N'-73.8520519974079', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (209, N'111th St', N'40.6971148106964', N'-73.8367933845469', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (210, N'121st St', N'40.7004819985153', N'-73.8283490001795', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (211, N'Halsey St', N'40.6955180011487', N'-73.9039340011863', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (212, N'Myrtle - Wyckoff Aves', N'40.6994710624271', N'-73.9109757182647', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (213, N'New Lots Ave', N'40.6663149325969', N'-73.8841107080032', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (214, N'Van Siclen Ave', N'40.6727099990610', N'-73.8903580002471', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (215, N'Cleveland St', N'40.6797779989611', N'-73.8851940021643', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (216, N'Livonia Ave', N'40.6640572709464', N'-73.9005623722605', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (217, N'Junius St', N'40.6635890018172', N'-73.9024486418356', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (218, N'Rockaway Ave', N'40.6626174881522', N'-73.9089583358444', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (219, N'Canarsie - Rockaway Pkwy', N'40.6466536673952', N'-73.9018500001728', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (220, N'E 105th St', N'40.6504687854469', N'-73.8995476938872', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (221, N'Saratoga Ave', N'40.6615297898075', N'-73.9163302500794', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (222, N'Sutter Ave - Rutland Road', N'40.6647667887749', N'-73.9225211853600', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (223, N'New Lots Ave', N'40.6589147736852', N'-73.8992779605714', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (224, N'Broadway Junction', N'40.6793660014736', N'-73.9042899974641', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (225, N'Alabama Ave', N'40.6769980000037', N'-73.8985260015965', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (226, N'Shepherd Ave', N'40.6741300014559', N'-73.8807499974726', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (227, N'Crescent St', N'40.6831526570773', N'-73.8739292521577', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (228, N'Cypress Hills', N'40.6896160008387', N'-73.8733219988299', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (229, N'75th St - Eldert Ln', N'40.6912900012467', N'-73.8672879994496', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (230, N'69th St', N'40.7463249994102', N'-73.8964029993185', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (231, N'74th St - Broadway', N'40.7468675738291', N'-73.8912051289911', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (232, N'Woodhaven Blvd - Queens Mall', N'40.7330973738097', N'-73.8694320861234', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (233, N'Myrtle - Wyckoff Aves', N'40.6994540009083', N'-73.9121789993960', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (234, N'Seneca Ave', N'40.7029189989490', N'-73.9075819988542', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (235, N'DeKalb Ave', N'40.7036929996164', N'-73.9182320021972', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (236, N'52nd St', N'40.7441490010215', N'-73.9125489989125', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (237, N'46th St', N'40.7563169526080', N'-73.9135217499553', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (238, N'Northern Blvd', N'40.7528248292360', N'-73.9060650805235', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (239, N'46th St', N'40.7431320006038', N'-73.9184350010397', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (240, N'82nd St - Jackson Hts', N'40.7476589995591', N'-73.8836970007188', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (241, N'90th St - Elmhurst Av', N'40.7484080006091', N'-73.8766129998698', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (242, N'Howard Beach - JFK Airport', N'40.6604760000495', N'-73.8303010007103', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (243, N'Aqueduct - North Conduit Av', N'40.6682340016998', N'-73.8340579994872', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (244, N'Briarwood - Van Wyck Blvd', N'40.7091618153694', N'-73.8206926363744', N'"E-evenings, weekends, nights, F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (245, N'Forest Hills - 71st Av', N'40.7215943095358', N'-73.8445167201266', N'"E,F-all times, M-weekdays and evenings, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (246, N'Sutphin Blvd', N'40.7054179990676', N'-73.8108329989723', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (247, N'Jamaica Ctr - Parsons / Archer', N'40.7020673762118', N'-73.8010963229892', N'"E,J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (248, N'225th St', N'40.8880282586378', N'-73.8602146177273', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (249, N'Elder Ave', N'40.8285840010892', N'-73.8791589987477', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (250, N'Longwood Ave', N'40.8161039999724', N'-73.8964349989741', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (251, N'Astoria Blvd', N'40.7700369994908', N'-73.9180950010923', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (252, N'Astoria - Ditmars Blvd', N'40.7750356665236', N'-73.9120340001031', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (253, N'Jackson Ave', N'40.8164374668639', N'-73.9077019387083', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (254, N'Prospect Ave', N'40.8194872648384', N'-73.9017777873091', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (255, N'Cypress Ave', N'40.8053680007636', N'-73.9140419999475', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (256, N'174th St', N'40.8371955501706', N'-73.8876935981288', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (257, N'Allerton Ave', N'40.8654833779392', N'-73.8672342285162', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (258, N'E 143rd St - St Mary''s St', N'40.8087190009014', N'-73.9076569993648', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (259, N'Kingsbridge Rd', N'40.8677600008857', N'-73.8971740010174', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (260, N'Bedford Park Blvd - Lehman College', N'40.8734119998012', N'-73.8900640006947', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (261, N'Harlem - 148 St', N'40.8238800008045', N'-73.9364700000555', N'3-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (262, N'Mt Eden Ave', N'40.8444340009267', N'-73.9146849986034', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (263, N'Fordham Rd', N'40.8612959986834', N'-73.8977490010240', N'"B-rush hours, D-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (264, N'170th St', N'40.8400749999300', N'-73.9177909974592', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (265, N'Bedford Park Blvd', N'40.8732439986164', N'-73.8871379988957', N'"B-rush hours, D-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (266, N'Marble Hill - 225th St', N'40.8745609994178', N'-73.9098309992355', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (267, N'231st St', N'40.8788559981793', N'-73.9048340010787', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (268, N'215th St', N'40.8694439994604', N'-73.9152789995435', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (269, N'207th St', N'40.8646140005258', N'-73.9188190013231', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (270, N'Inwood - 207th St', N'40.8680719999973', N'-73.9198990010046', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (271, N'Van Cortlandt Park - 242nd St', N'40.8892480001147', N'-73.8985830004964', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (272, N'West Farms Sq - E Tremont Av', N'40.8402076324179', N'-73.8799612787718', N'"2-all times, 5-all times exc nights, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (273, N'219th St', N'40.8838879746252', N'-73.8625097078866', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (274, N'Mosholu Pkwy', N'40.8797499994722', N'-73.8846549998873', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (275, N'Norwood - 205th St', N'40.8748110001118', N'-73.8788549991869', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (276, N'Burke Ave', N'40.8712588025477', N'-73.8670536174760', N'"2-all times, 5-rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (277, N'Baychester Ave', N'40.8786630003731', N'-73.8385909980215', N'5-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (278, N'Eastchester - Dyre Ave', N'40.8882999990100', N'-73.8308340021742', N'5-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (279, N'Jamaica - 179th St', N'40.7126456667440', N'-73.7838170017645', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (280, N'Wakefield - 241st St', N'40.9031250005412', N'-73.8506199987954', N'2-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (281, N'Botanic Garden', N'40.6703426665843', N'-73.9592449994569', N'S Franklin Av-Fulton St to Prospect Park-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (282, N'Bushwick - Aberdeen', N'40.6828606255118', N'-73.9052617630510', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (283, N'Broadway Junction', N'40.6784562484286', N'-73.9031175792068', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (284, N'Gun Hill Rd', N'40.8695259996267', N'-73.8463840015176', N'5-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (285, N'E 180th St', N'40.8418630412186', N'-73.8733460951088', N'"2,5-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (286, N'Dyckman St', N'40.8605310013879', N'-73.9255360000647', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (287, N'125th St', N'40.8155809999789', N'-73.9583720009704', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (288, N'Franklin Ave - Fulton St', N'40.6805956659826', N'-73.9558270011042', N'S to Prospect Park-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (289, N'149th St - Grand Concourse', N'40.8183301440974', N'-73.9267224743861', N'"2-all times, 5-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (290, N'3rd Ave - 149th St', N'40.8160292525100', N'-73.9177915276098', N'"2-all times, 5-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (291, N'167th St', N'40.8355369993367', N'-73.9213999978442', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (292, N'Brook Ave', N'40.8075659998769', N'-73.9192399990943', N'6-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (293, N'33rd St', N'40.7445869998399', N'-73.9309969995383', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (294, N'40th St', N'40.7437810014913', N'-73.9240159984882', N'7-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (295, N'145th St', N'40.8247663608719', N'-73.9440879282311', N'"A,D-all times, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (296, N'155th St', N'40.8301349999812', N'-73.9382089981162', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (297, N'161st St - Yankee Stadium', N'40.8279049988458', N'-73.9256509977547', N'"B-rush hours, D-all times, skips rush hours AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (298, N'Utica Ave', N'40.6793639995054', N'-73.9307289991402', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (299, N'Steinway St', N'40.7569873591257', N'-73.9205264716827', N'"E-nights, R-all other times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
GO
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (300, N'Kosciuszko St', N'40.6931720012920', N'-73.9285089992741', N'J-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (301, N'Gates Ave', N'40.6895839990139', N'-73.9221560015075', N'"Z-rush hours AM westbound, PM eastbound, J-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (302, N'Central Ave', N'40.6978730001183', N'-73.9272429990283', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (303, N'Knickerbocker Ave', N'40.6986600012380', N'-73.9197200018862', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (304, N'30th Ave', N'40.7667786667329', N'-73.9214790001739', N'"N-all times, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (305, N'Jefferson St', N'40.7066066659887', N'-73.9229130000312', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (306, N'Morgan Ave', N'40.7061516668072', N'-73.9331470002420', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (307, N'Queens Plz', N'40.7489177198632', N'-73.9371382396569', N'"E-all times, M-weekdays and evenings, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (308, N'18th Ave', N'40.6297546663858', N'-73.9769709996579', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (309, N'77th St', N'40.6297416668869', N'-74.0255099996266', N'R-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (310, N'Bay Ridge Ave', N'40.6349666668237', N'-74.0233769995072', N'R-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (311, N'50th St', N'40.6362608909613', N'-73.9946587805514', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (312, N'Ft Hamilton Pkwy', N'40.6313856672244', N'-74.0053510004627', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (313, N'25th Ave', N'40.5977036669585', N'-73.9868290001147', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (314, N'Bay Pky', N'40.6019504615723', N'-73.9936762000529', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (315, N'20th Ave', N'40.6171089998660', N'-73.9845219984611', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (316, N'18th Ave', N'40.6206869976800', N'-73.9904539986599', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (317, N'Bay Ridge - 95th St', N'40.6166216672595', N'-74.0308760008576', N'R-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (318, N'86th St', N'40.6226866671502', N'-74.0283979999864', N'R-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (319, N'79th St', N'40.6131589256951', N'-74.0005828743150', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (320, N'71st St', N'40.6192587097727', N'-73.9988409485068', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (321, N'20th Ave', N'40.6046769981693', N'-73.9981743215756', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (322, N'18th Ave', N'40.6077357317174', N'-74.0015925923940', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (323, N'62nd St', N'40.6262244629221', N'-73.9968572499486', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (324, N'New Utrecht Ave', N'40.6248416672588', N'-73.9963530002596', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (325, N'Ave U', N'40.5959248255174', N'-73.9733764197488', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (326, N'Kings Hwy', N'40.6032584051282', N'-73.9723553085244', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (327, N'Brighton Beach', N'40.5777101966424', N'-73.9613537859879', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (328, N'Sheepshead Bay', N'40.5865475470753', N'-73.9540579125790', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (329, N'Ave U', N'40.5993089509547', N'-73.9558112231630', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (330, N'Kings Hwy', N'40.6086386453960', N'-73.9576087353808', N'"B-weekdays and evenings, Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (331, N'Ave U', N'40.5972359999204', N'-73.9790840009942', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (332, N'Kings Hwy', N'40.6040589998049', N'-73.9803730022934', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (333, N'Neptune Ave', N'40.5807387584914', N'-73.9745927281880', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (334, N'Ave X', N'40.5894496666252', N'-73.9742659996890', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (335, N'Bay 50th St', N'40.5888406665193', N'-73.9837650004594', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (336, N'Gravesend - 86th St', N'40.5924650008885', N'-73.9781889993627', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (337, N'Ave P', N'40.6088428089499', N'-73.9730028152875', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (338, N'Ave N', N'40.6143567119088', N'-73.9740485087314', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (339, N'Bay Pky', N'40.6207316231678', N'-73.9752569782215', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (340, N'Ave M', N'40.6173977444437', N'-73.9592431052215', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (341, N'Bay Pky', N'40.6114557898900', N'-73.9817800106929', N'N-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (342, N'Ave I', N'40.6250174401914', N'-73.9760693317092', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (343, N'Ave J', N'40.6250228199151', N'-73.9606931624692', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (344, N'Ave H', N'40.6292083775896', N'-73.9615179394249', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (345, N'Neck Rd', N'40.5953216911169', N'-73.9550782749376', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (346, N'21st St - Queensbridge', N'40.7537392708755', N'-73.9419376145744', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (347, N'50th St', N'40.7624559992599', N'-73.9859840002640', N'"A-nights, C-all other times, E-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (348, N'7th Ave', N'40.7629701524562', N'-73.9816978234447', N'"D,E-all times, B-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (349, N'47th-50th Sts - Rockefeller Ctr', N'40.7586410015981', N'-73.9813310022770', N'"B,M-weekdays and evenings, D,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (350, N'57th St', N'40.7640850008171', N'-73.9773680008517', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (351, N'Lexington Ave - 63rd St', N'40.7646180944237', N'-73.9660896441324', N'"F-all times, Q all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (352, N'Roosevelt Island - Main St', N'40.7591719996710', N'-73.9532349997886', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (353, N'59th St - Columbus Circle', N'40.7682495317760', N'-73.9816487230139', N'"A,D-all times, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (354, N'49th St', N'40.7598019738706', N'-73.9842095659109', N'"N-all times, Q-all times exc weekends, R-all times exc nights, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (355, N'57th St', N'40.7645655250182', N'-73.9807297337212', N'"N,Q-all times, R-all times exc nights, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (356, N'5th Ave - 59th St', N'40.7648109997552', N'-73.9733470004704', N'"N-all times, R-all times exc nights, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (357, N'Lexington Ave - 59th St', N'40.7627088553945', N'-73.9673750171143', N'"N-all times, R-all times exc nights, W part time"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (358, N'34th St - Penn Station', N'40.7503730000394', N'-73.9910569991398', N'"1,2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (359, N'Times Sq - 42nd St', N'40.7552899999568', N'-73.9874950005188', N'"1,2,3-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (360, N'Fulton St', N'40.7101621653018', N'-74.0076230932399', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (361, N'Chambers St', N'40.7141110007740', N'-74.0085847357013', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (362, N'42nd St - Port Authority Bus Term', N'40.7573079985515', N'-73.9897350008585', N'"A,E-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (363, N'Myrtle-Willoughby Aves', N'40.6946189990376', N'-73.9490669989015', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (364, N'Flushing Ave', N'40.7003766662215', N'-73.9502340010257', N'G-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (365, N'23rd St', N'40.7429543178260', N'-73.9927650047138', N'"F-all times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (366, N'Herald Sq - 34th St', N'40.7497893999001', N'-73.9877718907291', N'"B,M-weekdays and evenings, D,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (367, N'Hoyt - Schermerhorn Sts', N'40.6884084758064', N'-73.9850362403413', N'"A,G-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (368, N'Jay St - MetroTech', N'40.6924706368470', N'-73.9872181526731', N'"A,F-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (369, N'East Broadway', N'40.7138550010204', N'-73.9901770012219', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (370, N'Delancey St - Essex St', N'40.7186807421945', N'-73.9880780680771', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (371, N'Lower East Side - 2nd Ave', N'40.7234016657491', N'-73.9899380000343', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (372, N'Flushing Ave', N'40.7004044029811', N'-73.9413773483836', N'"J-all times, skips weekdays AM westbound, PM eastbound, M-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (373, N'Myrtle Ave', N'40.6971950005145', N'-73.9356230012996', N'"J,M-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (374, N'4th Av - 9th St', N'40.6702716672849', N'-73.9897789993889', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (375, N'Smith - 9th Sts', N'40.6736410609041', N'-73.9958917279093', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (376, N'Bergen St', N'40.6861105472597', N'-73.9907564957356', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (377, N'Jay St - MetroTech', N'40.6922553964532', N'-73.9860566785461', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (378, N'Court St', N'40.6941964807769', N'-73.9918183090112', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (379, N'Union Sq - 14th St', N'40.7358722669981', N'-73.9905388618164', N'"N,Q-all times, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (380, N'23rd St', N'40.7413026672900', N'-73.9893440010290', N'"N-all times, Q-nights, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (381, N'Prospect Ave', N'40.6654136671297', N'-73.9928720006742', N'"D,N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (382, N'4th Av - 9th St', N'40.6708466668427', N'-73.9883019997451', N'"D,N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (383, N'3rd Ave', N'40.7326909997166', N'-73.9857500011209', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (384, N'Union Sq - 14th St', N'40.7347633121792', N'-73.9906697690181', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (385, N'Liberty Ave', N'40.6745419998708', N'-73.8965480010392', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (386, N'Broadway Junction', N'40.6783336660802', N'-73.9053160005534', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (387, N'59th St', N'40.6413616662838', N'-74.0178809995398', N'"N,R-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (388, N'45th St', N'40.6489386666128', N'-74.0100060007493', N'"N-nights, R-all times, skips nights northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (389, N'36th St', N'40.6551436663388', N'-74.0035489995180', N'"D,N,R-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (390, N'9th Ave', N'40.6464840772663', N'-73.9944487445120', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (391, N'53rd St', N'40.6450686673598', N'-74.0140339998631', N'"N-nights, R-all times, skips nights northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (392, N'Ft Hamilton Pkwy', N'40.6409127114446', N'-73.9942022375285', N'D-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (393, N'25th St', N'40.6603966669232', N'-73.9980909997429', N'"D,N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (394, N'Carroll St', N'40.6802733517017', N'-73.9949469799884', N'"F,G-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (395, N'Spring St', N'40.7262270012931', N'-74.0037389984376', N'"A-nights, C-all other times, E-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (396, N'181st St', N'40.8516949997446', N'-73.9379690020501', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (397, N'190th St', N'40.8590219989248', N'-73.9341799996433', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (398, N'116th St', N'40.8050581334421', N'-73.9547977805731', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (399, N'125th St', N'40.8110716729945', N'-73.9522479973477', N'"A,D-all times, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
GO
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (400, N'Prince St', N'40.7243286659757', N'-73.9977020004598', N'"N-all times, Q-nights, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (401, N'8th St - NYU', N'40.7304649985399', N'-73.9925079984914', N'"N-all times, Q-nights, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (402, N'Fulton St', N'40.7094159992586', N'-74.0065709997020', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (403, N'Park Pl', N'40.7130509990776', N'-74.0088109999735', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (404, N'Chambers St', N'40.7154780001132', N'-74.0092660017011', N'"1,2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (405, N'Hoyt St', N'40.6905441853547', N'-73.9850637957564', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (406, N'Borough Hall', N'40.6932189996110', N'-73.9899979996068', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (407, N'183rd St', N'40.8584070004084', N'-73.9038790015153', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (408, N'Fordham Rd', N'40.8628029998893', N'-73.9010339992169', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (409, N'World Trade Center', N'40.7125639268081', N'-74.0097446151770', N'E-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (410, N'Canal St - Holland Tunnel', N'40.7208240000711', N'-74.0052290023424', N'"A,E-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (411, N'155th St', N'40.8305179992925', N'-73.9415140008220', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (412, N'163rd St - Amsterdam Av', N'40.8360129992309', N'-73.9398920018834', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (413, N'Fulton St', N'40.7100226665842', N'-74.0079380011038', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (414, N'Chambers St', N'40.7132337896267', N'-74.0034067303133', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (415, N'Canal St', N'40.7181738769739', N'-73.9998263854593', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (416, N'City Hall', N'40.7132723311169', N'-74.0069858178033', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (417, N'Canal St', N'40.7194650010589', N'-74.0018260000577', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (418, N'South Ferry', N'40.7017305075744', N'-74.0131689591925', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (419, N'Bowling Green', N'40.7049139992807', N'-74.0140079980343', N'"4-all times, 5-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (420, N'Wall St', N'40.7075570008660', N'-74.0118619986011', N'"4-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (421, N'Whitehall St', N'40.7031423735991', N'-74.0130072374272', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (422, N'Rector St', N'40.7077447562944', N'-74.0129745625379', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (423, N'Fresh Pond Rd', N'40.7062259982304', N'-73.8958980017196', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (424, N'Middle Village - Metropolitan Ave', N'40.7114313050582', N'-73.8895772297809', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (425, N'Rector St', N'40.7075129995217', N'-74.0137830011974', N'1-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (426, N'Cortlandt St', N'40.7118350008202', N'-74.0121880011229', N'Temporarily closed', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (427, N'Fulton St', N'40.7103679988221', N'-74.0095089985646', N'"4-all times, 5-weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (428, N'Broad St', N'40.7064760011060', N'-74.0110559999175', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (429, N'Cortlandt St', N'40.7105129841524', N'-74.0111319647326', N'"N-nights, R-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (430, N'Wall St', N'40.7068209997533', N'-74.0090999984425', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (431, N'Dyckman St', N'40.8654909989689', N'-73.9272709996072', N'A-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (432, N'Grand St', N'40.7182669995499', N'-73.9937529991358', N'"B-weekdays and evenings, D-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (433, N'Broadway - Lafayette St', N'40.7252969987380', N'-73.9962039987605', N'"B,M-weekdays and evenings, D,F-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (434, N'Bowery', N'40.7202468831472', N'-73.9938069065423', N'"J-all times, Z-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (435, N'Canal St', N'40.7188142635871', N'-74.0010547130603', N'"N-all times, Q-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (436, N'23rd St', N'40.7459059993999', N'-73.9980410011720', N'"A-nights, C-all other times, E-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (437, N'34th St - Penn Station', N'40.7522870007758', N'-73.9933909997057', N'"A,E-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (438, N'Jackson Hts - Roosevelt Av', N'40.7465396911588', N'-73.8912986651969', N'"E,F-all times, M-weekdays and evenings, R-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (439, N'14th St', N'40.7378259997281', N'-74.0002010006349', N'"1,2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (440, N'135th St', N'40.8179055592126', N'-73.9475348087921', N'"A-nights, B-weekdays and evenings, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (441, N'14th St', N'40.7382279996951', N'-73.9962089992135', N'"F-all times, M-weekdays and evenings"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (442, N'6th Ave', N'40.7377414698105', N'-73.9977507887478', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (443, N'8th Ave', N'40.7397766663819', N'-74.0025780010476', N'L-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (444, N'14th St', N'40.7408930001932', N'-74.0016899993702', N'"A,E-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (445, N'Nostrand Ave', N'40.6699381509305', N'-73.9504262489579', N'"4-nights, 3-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (446, N'Clark St', N'40.6974659999646', N'-73.9930859982196', N'"2-all times, 3-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (447, N'Franklin Ave', N'40.6813796665874', N'-73.9568480001461', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (448, N'Clinton - Washington Aves', N'40.6832629991264', N'-73.9658379985727', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (449, N'Forest Ave', N'40.7044120008781', N'-73.9030750000595', N'M-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (450, N'110th St', N'40.7950200001131', N'-73.9442499968716', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (451, N'86th St', N'40.7794919982095', N'-73.9555889998513', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (452, N'York St', N'40.6997426676915', N'-73.9868849999367', N'F-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (453, N'High St', N'40.6993369997788', N'-73.9905310006545', N'"A-all times, C-all times exc nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (454, N'Lafayette Ave', N'40.6861130002056', N'-73.9739459984940', N'"A-nights, C-all other times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (455, N'President St', N'40.6678836035368', N'-73.9505892002220', N'"2-all times, 5 weekdays"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (456, N'Woodlawn', N'40.8860370002533', N'-73.8787509999093', N'4-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (457, N'Bleecker St', N'40.7259146668265', N'-73.9946590000633', N'"4 nights, 6-all times, 6 Express-weekdays PM"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (458, N'103rd St', N'40.7906000000845', N'-73.9474780015221', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (459, N'Euclid Ave', N'40.6753769982393', N'-73.8721060009967', N'"S to Ozone Park-Lefferts Blvd-nights, C-all other times, A-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (460, N'88th St', N'40.6798430013550', N'-73.8514700002608', N'"A-all times, S Euclid Av to Ozone Park-Lefferts Blvd-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (461, N'Cortelyou Rd', N'40.6409401651401', N'-73.9637900550549', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (462, N'116th St', N'40.7986290002001', N'-73.9416169983714', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (463, N'Parkchester', N'40.8332259992785', N'-73.8608160010839', N'"6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (464, N'Franklin St', N'40.7193180013021', N'-74.0068860027710', N'"1-all times, 2-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (465, N'80th St', N'40.6793710011543', N'-73.8589920020633', N'"A-all times, S Euclid Av to Ozone Park-Lefferts Blvd-nights"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (466, N'5th Ave - Bryant Pk', N'40.7538210006482', N'-73.9819629985670', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (467, N'Spring St', N'40.7223009999936', N'-73.9971410000667', N'"4 nights, 6-all times, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (468, N'125th St', N'40.8041380005872', N'-73.9375940005572', N'"4,6-all times, 5-all times exc nights, 6 Express-weekdays AM southbound, PM northbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (469, N'Coney Island - Stillwell Av', N'40.5772810000675', N'-73.9812359981396', N'"D,F,N,Q-all times"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (470, N'34th St - Hudson Yards', N'40.7554463596159', N'-74.0021970944220', N'"7-all times, 7 Express-rush hours AM westbound, PM eastbound"', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (471, N'72nd St', N'40.7688025101489', N'-73.9583617868224', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (472, N'86th St', N'40.7778610433316', N'-73.9517709096491', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
INSERT [dbo].[Stations] ([ID], [Name], [Latitude], [Longitude], [Notes], [CreationDate]) VALUES (473, N'96th St', N'40.7842366501776', N'-73.9470660219183', N'Q-all times', CAST(N'2022-06-20T16:24:42.093' AS DateTime))
SET IDENTITY_INSERT [dbo].[Stations] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [UserName], [Name], [LastName], [Email], [Password], [CreationDate]) VALUES (1, N'dustinespinoza', N'Dustin', N'Espinoza', N'dustinespinozahernandez@gmail.com', N'0b47c69b1033498d5f33f5f7d97bb6a3126134751629f4d0185c115db44c094e', CAST(N'2022-06-20T18:22:34.117' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[FavoriteStations] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Stations] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[FavoriteStations]  WITH CHECK ADD FOREIGN KEY([FirstStationId])
REFERENCES [dbo].[Stations] ([ID])
GO
ALTER TABLE [dbo].[FavoriteStations]  WITH CHECK ADD FOREIGN KEY([SecondStationId])
REFERENCES [dbo].[Stations] ([ID])
GO
ALTER TABLE [dbo].[FavoriteStations]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 22/06/2022 10:03:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser] 
	-- Add the parameters for the stored procedure here
	@Name varchar(255),
	@LastName varchar(255),
	@UserName varchar(255),
	@Email varchar(255),
	@Password varchar (max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [NYCStations].[dbo].[Users] (Name, LastName, UserName, Email, Password) VALUES (@Name, @LastName, @UserName, @Email, @Password);
END
GO
/****** Object:  StoredProcedure [dbo].[LogDistanceRequest]    Script Date: 22/06/2022 10:03:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LogDistanceRequest] 
	-- Add the parameters for the stored procedure here
	@StationA int,
	@StationB int,
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [NYCStations].[dbo].[FavoriteStations] (UserId, FirstStationId, SecondStationId) VALUES (@UserId, @StationA, @StationB);
END
GO
USE [master]
GO
ALTER DATABASE [NYCStations] SET  READ_WRITE 
GO
