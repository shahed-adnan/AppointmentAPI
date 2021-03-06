USE [master]
GO
/****** Object:  Database [NSAppointmentDB]    Script Date: 11/2/2020 6:55:47 PM ******/
CREATE DATABASE [NSAppointmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NSAppointmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NSAppointmentDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NSAppointmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\NSAppointmentDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NSAppointmentDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NSAppointmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NSAppointmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NSAppointmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NSAppointmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NSAppointmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NSAppointmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NSAppointmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NSAppointmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [NSAppointmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NSAppointmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NSAppointmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NSAppointmentDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [NSAppointmentDB]
GO
/****** Object:  Table [dbo].[Tbl_Appointment]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ACId] [int] NULL,
	[TimeFrom] [time](7) NULL,
	[TimeTo] [time](7) NULL,
	[IsAvailable] [int] NULL,
	[Date] [date] NULL,
	[AppointmentNumber] [int] NULL,
	[AppointmentGroup] [int] NULL,
 CONSTRAINT [PK_Tbl_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_AvailabilityCalendar]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AvailabilityCalendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NULL,
	[Year] [int] NULL,
	[Month] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_AvailabilityCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Clinic]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Clinic](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicName] [nvarchar](max) NULL,
	[ClinicAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Clinic] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Department]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [int] NULL,
	[DeptName] [nvarchar](max) NULL,
	[DeptAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Doctor]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Doctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NULL,
	[DoctorName] [nvarchar](200) NULL,
	[DoctorAddress] [nvarchar](max) NULL,
	[DoctorPhoneNo] [nvarchar](50) NULL,
	[DoctorMobileNo] [nvarchar](50) NULL,
	[OtherInfo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Doctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_DPA]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_DPA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DoctorId] [int] NULL,
	[PatientId] [int] NULL,
	[AppointmentId] [int] NULL,
	[EntryDate] [datetime] NULL,
 CONSTRAINT [PK_Tbl_DPA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_Patient]    Script Date: 11/2/2020 6:55:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](200) NULL,
	[PatientMobileNo] [nvarchar](50) NULL,
	[PatientEmail] [nvarchar](50) NULL,
	[PatientAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Tbl_Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Appointment_Tbl_AvailabilityCalendar] FOREIGN KEY([ACId])
REFERENCES [dbo].[Tbl_AvailabilityCalendar] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Appointment] CHECK CONSTRAINT [FK_Tbl_Appointment_Tbl_AvailabilityCalendar]
GO
ALTER TABLE [dbo].[Tbl_AvailabilityCalendar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AvailabilityCalendar_Tbl_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Tbl_Doctor] ([Id])
GO
ALTER TABLE [dbo].[Tbl_AvailabilityCalendar] CHECK CONSTRAINT [FK_Tbl_AvailabilityCalendar_Tbl_Doctor]
GO
ALTER TABLE [dbo].[Tbl_Department]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Department_Tbl_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Tbl_Clinic] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Department] CHECK CONSTRAINT [FK_Tbl_Department_Tbl_Clinic]
GO
ALTER TABLE [dbo].[Tbl_Doctor]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Doctor_Tbl_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Tbl_Department] ([Id])
GO
ALTER TABLE [dbo].[Tbl_Doctor] CHECK CONSTRAINT [FK_Tbl_Doctor_Tbl_Department]
GO
ALTER TABLE [dbo].[Tbl_DPA]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DPA_Tbl_Appointment] FOREIGN KEY([AppointmentId])
REFERENCES [dbo].[Tbl_Appointment] ([Id])
GO
ALTER TABLE [dbo].[Tbl_DPA] CHECK CONSTRAINT [FK_Tbl_DPA_Tbl_Appointment]
GO
ALTER TABLE [dbo].[Tbl_DPA]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DPA_Tbl_Doctor] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[Tbl_Doctor] ([Id])
GO
ALTER TABLE [dbo].[Tbl_DPA] CHECK CONSTRAINT [FK_Tbl_DPA_Tbl_Doctor]
GO
ALTER TABLE [dbo].[Tbl_DPA]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_DPA_Tbl_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Tbl_Patient] ([Id])
GO
ALTER TABLE [dbo].[Tbl_DPA] CHECK CONSTRAINT [FK_Tbl_DPA_Tbl_Patient]
GO
USE [master]
GO
ALTER DATABASE [NSAppointmentDB] SET  READ_WRITE 
GO
