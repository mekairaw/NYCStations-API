USE [master]
GO
/****** Object:  Database [NYCStations]    Script Date: 22/06/2022 9:25:40 AM ******/
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
/****** Object:  Table [dbo].[FavoriteStations]    Script Date: 22/06/2022 9:25:41 AM ******/
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
/****** Object:  Table [dbo].[Stations]    Script Date: 22/06/2022 9:25:41 AM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 22/06/2022 9:25:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 22/06/2022 9:25:41 AM ******/
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
/****** Object:  StoredProcedure [dbo].[LogDistanceRequest]    Script Date: 22/06/2022 9:25:41 AM ******/
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
