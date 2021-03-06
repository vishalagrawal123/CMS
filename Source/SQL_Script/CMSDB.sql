USE [master]
GO
/****** Object:  Database [ECMS]    Script Date: 02/21/2014 15:19:04 ******/
CREATE DATABASE [ECMS] ON  PRIMARY 
( NAME = N'ECMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ECMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ECMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\ECMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ECMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ECMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ECMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ECMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ECMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ECMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ECMS] SET ARITHABORT OFF
GO
ALTER DATABASE [ECMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ECMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ECMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ECMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ECMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ECMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ECMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ECMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ECMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ECMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ECMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [ECMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ECMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ECMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ECMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ECMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ECMS] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ECMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ECMS] SET  READ_WRITE
GO
ALTER DATABASE [ECMS] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ECMS] SET  MULTI_USER
GO
ALTER DATABASE [ECMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ECMS] SET DB_CHAINING OFF
GO
USE [ECMS]
GO
/****** Object:  Table [dbo].[TblEmployee]    Script Date: 02/21/2014 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmployee](
	[EmpId] [int] IDENTITY(1,1) NOT NULL,
	[MID] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Competency] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Vertical] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[ProjectName] [nvarchar](50) NULL,
	[DeliveryManager] [nvarchar](50) NULL,
	[AccountCategory] [nvarchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmpId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblCertificationMaster]    Script Date: 02/21/2014 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCertificationMaster](
	[CertificationID] [int] IDENTITY(1,1) NOT NULL,
	[CertificationCode] [nvarchar](50) NULL,
	[CertificationCategory] [nvarchar](50) NULL,
	[CertifyingBody] [nvarchar](50) NULL,
	[CertificationName] [nvarchar](50) NULL,
	[CLevel] [nvarchar](50) NULL,
	[IsActive] [int] NULL,
 CONSTRAINT [PK_TblCertificationMaster] PRIMARY KEY CLUSTERED 
(
	[CertificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbllog]    Script Date: 02/21/2014 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbllog](
	[Logid] [int] IDENTITY(1,1) NOT NULL,
	[Logdatetime] [datetime] NULL,
	[created_by] [nvarchar](50) NULL,
	[Action] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbllog] PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmployeeCertification]    Script Date: 02/21/2014 15:19:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmployeeCertification](
	[EmpCert_ID] [int] IDENTITY(1,1) NOT NULL,
	[CertificationID] [int] NULL,
	[EmpID] [int] NULL,
	[DateofCertification] [date] NULL,
 CONSTRAINT [PK_TblEmployeeCertification] PRIMARY KEY CLUSTERED 
(
	[EmpCert_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetEmplyee_SP]    Script Date: 02/21/2014 15:19:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetEmplyee_SP]
as
begin
select * from TblEmployee
end
GO
/****** Object:  ForeignKey [FK_TblEmployeeCertification_TblCertificationMaster]    Script Date: 02/21/2014 15:19:07 ******/
ALTER TABLE [dbo].[TblEmployeeCertification]  WITH CHECK ADD  CONSTRAINT [FK_TblEmployeeCertification_TblCertificationMaster] FOREIGN KEY([CertificationID])
REFERENCES [dbo].[TblCertificationMaster] ([CertificationID])
GO
ALTER TABLE [dbo].[TblEmployeeCertification] CHECK CONSTRAINT [FK_TblEmployeeCertification_TblCertificationMaster]
GO
/****** Object:  ForeignKey [FK_TblEmployeeCertification_TblEmployee]    Script Date: 02/21/2014 15:19:07 ******/
ALTER TABLE [dbo].[TblEmployeeCertification]  WITH CHECK ADD  CONSTRAINT [FK_TblEmployeeCertification_TblEmployee] FOREIGN KEY([EmpID])
REFERENCES [dbo].[TblEmployee] ([EmpId])
GO
ALTER TABLE [dbo].[TblEmployeeCertification] CHECK CONSTRAINT [FK_TblEmployeeCertification_TblEmployee]
GO
