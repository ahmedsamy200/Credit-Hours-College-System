USE [master]
GO
/****** Object:  Database [University]    Script Date: 8/30/2023 8:48:46 AM ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\University.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\University_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY FULL 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'University', N'ON'
GO
USE [University]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 8/30/2023 8:48:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[depID] [int] IDENTITY(1,1) NOT NULL,
	[deptName] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[head] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[depID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gender]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[genderID] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nvarchar](10) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[genderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[levelID] [int] IDENTITY(1,1) NOT NULL,
	[levelName] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[levelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[genderID] [int] NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorSubjects]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorSubjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[professorID] [int] NULL,
	[subjectID] [int] NULL,
 CONSTRAINT [PK_ProfessorSubjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[studentID] [int] IDENTITY(1,1) NOT NULL,
	[nationalID] [decimal](14, 0) NULL,
	[password] [nvarchar](max) NULL,
	[firstName] [nvarchar](50) NULL,
	[midName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[deptId] [int] NULL,
	[image] [nvarchar](max) NULL,
	[mobile] [nvarchar](13) NULL,
	[genderID] [int] NULL,
	[levelID] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[studentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentSubjects]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentID] [int] NULL,
	[subjectID] [int] NULL,
	[isPassed] [bit] NULL,
	[professorSubjectID] [int] NULL,
	[registrationEnd] [bit] NULL,
 CONSTRAINT [PK_StudentSubject] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subID] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](max) NULL,
	[deptID] [int] NULL,
	[code] [nvarchar](10) NULL,
	[creditHours] [float] NULL,
	[preSubject] [int] NULL,
	[day] [nvarchar](10) NULL,
	[timeFrom] [time](0) NULL,
	[timeTo] [time](0) NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([depID], [deptName], [isActive], [head]) VALUES (2, N'Computer Science', 1, 1)
INSERT [dbo].[Department] ([depID], [deptName], [isActive], [head]) VALUES (3, N'Physics ', 1, 2)
INSERT [dbo].[Department] ([depID], [deptName], [isActive], [head]) VALUES (4, N'Chemistry', 1, 3)
INSERT [dbo].[Department] ([depID], [deptName], [isActive], [head]) VALUES (5, N'Geology', 1, 4)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Gender] ON 

INSERT [dbo].[Gender] ([genderID], [gender], [isActive]) VALUES (1, N'Male', 1)
INSERT [dbo].[Gender] ([genderID], [gender], [isActive]) VALUES (2, N'Female', 1)
SET IDENTITY_INSERT [dbo].[Gender] OFF
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([levelID], [levelName], [isActive]) VALUES (1, N'Level 1', 1)
INSERT [dbo].[Level] ([levelID], [levelName], [isActive]) VALUES (2, N'Level 2', 1)
INSERT [dbo].[Level] ([levelID], [levelName], [isActive]) VALUES (3, N'Level 3', 1)
INSERT [dbo].[Level] ([levelID], [levelName], [isActive]) VALUES (4, N'Level 4', 1)
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (1, N'Mohamed Saleh', N'mohamed.jpg', 1, 1)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (2, N'Ali Elsayed', N'ali.jpg', 1, 1)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (3, N'Salma Mohamed', N'salma.jpg', 1, 2)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (4, N'Ahmed Saber', N'saber.jpg', 1, 1)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (5, N'Fathy Mohamed', N'fathy.jpg', 1, 1)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (6, N'Amgad Mohamed', N'am.jpg', 1, 1)
INSERT [dbo].[Professors] ([id], [name], [image], [isActive], [genderID]) VALUES (7, N'Said Nasser', N'sa.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[Professors] OFF
SET IDENTITY_INSERT [dbo].[ProfessorSubjects] ON 

INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1002, 1, 6)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1003, 1, 7)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1004, 1, 8)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1005, 1, 9)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1006, 2, 1008)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1007, 2, 1009)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1008, 2, 1010)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1009, 2, 1012)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1010, 3, 1013)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1011, 3, 1014)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1012, 3, 1015)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1013, 4, 10)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1014, 4, 11)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1015, 4, 12)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1016, 4, 13)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1017, 1, 14)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1018, 1, 15)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1019, 5, 16)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1020, 5, 17)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1021, 5, 18)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1022, 6, 1002)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1023, 6, 1003)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1024, 6, 1004)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1025, 6, 1005)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1026, 5, 1006)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1028, 7, 1008)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (1029, 7, 1009)
INSERT [dbo].[ProfessorSubjects] ([id], [professorID], [subjectID]) VALUES (2005, 5, 6)
SET IDENTITY_INSERT [dbo].[ProfessorSubjects] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (5, CAST(30001234567891 AS Decimal(14, 0)), N'30001234567891', N'Ahmed', N'Mohamed', N'Ali', 2, N'ahmed.jpg', N'01234567891', 1, 1, 1)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (6, CAST(30004578532457 AS Decimal(14, 0)), N'30004578532457', N'Said', N'Nasser', N'Mohamed', 3, N'sa.jpg', N'01145789654', 1, 2, 1)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (7, CAST(30003245712457 AS Decimal(14, 0)), N'30003245712457', N'Ahmed', N'Fawzy', N'Fathy', 2, N'fa.jpg', N'01025746895', 1, 3, 1)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (18, CAST(30004521358789 AS Decimal(14, 0)), N'30004521358789', N'Manar', N'Ahmed', N'Said', 4, N'ma.jpg', N'01024578965', 2, 1, 1)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (19, CAST(30009874236514 AS Decimal(14, 0)), N'30009874236514', N'Faten', N'Mohamed', N'Saleh', 5, N'ft.jpg', N'01245368987', 2, 4, 1)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (2006, CAST(123 AS Decimal(14, 0)), N'123', N'a', N'a', N'a', 2, NULL, N'0123456789', 1, 3, NULL)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (4006, CAST(3000123456789 AS Decimal(14, 0)), N'3000123456789', N'ahmed', N'samy', N'hendy', 3, NULL, N'0102745787878', 1, 1, NULL)
INSERT [dbo].[Student] ([studentID], [nationalID], [password], [firstName], [midName], [lastName], [deptId], [image], [mobile], [genderID], [levelID], [isActive]) VALUES (4007, CAST(30007051700233 AS Decimal(14, 0)), N'30007051700233', N'ahmed', N'samy', N'hendy', 2, NULL, N'01029405663', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentSubjects] ON 

INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7265, 6, 7, 0, 1003, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7266, 6, 1009, 0, 1007, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7267, 6, 1010, 0, 1008, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7268, 6, 1015, 0, 1012, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7269, 6, 8, 0, 1004, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (7270, 6, 1012, 0, 1009, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8264, 4006, 1009, 0, 1007, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8265, 4006, 1014, 0, 1011, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8266, 4006, 8, 0, 1004, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8267, 4006, 6, 0, 1002, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8268, 4006, 7, 0, 1003, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8269, 4006, 1015, 0, 1012, NULL)
INSERT [dbo].[StudentSubjects] ([id], [studentID], [subjectID], [isPassed], [professorSubjectID], [registrationEnd]) VALUES (8270, 6, 1014, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[StudentSubjects] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (6, N'Thermodynamics (1)', 3, N'P 122', 3, NULL, N'Monday', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (7, N'Atomic physics
 (1)', 3, N'P 133', 2.5, NULL, N'Wednesday', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (8, N'Mathematical physics
', 3, N'P 177', 3, NULL, N'Monday', CAST(N'10:30:00' AS Time), CAST(N'12:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (9, N'Relative mechanics
', 3, N'P 178', 3, 8, N'Sunday', CAST(N'12:00:00' AS Time), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (10, N'Mathematical analysis (1)
', 2, N'M111', 3, NULL, N'Wednesday', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (11, N'Mathematical analysis (2)', 2, N'M114', 4, 10, N'Thursday', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (12, N'algebra
', 2, N'M113', 2, NULL, N'Sunday', CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (13, N'Linear algebra
', 2, N'M117', 3, 12, N'Wednesday', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (14, N'Article properties
', 5, N'P 111', 2, NULL, N'Saturday', CAST(N'11:00:00' AS Time), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (15, N'physical chemistry
', 4, N'CH111', 4, NULL, N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'02:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (16, N'Inorganic chemistry
', 4, N'CH122', 3, NULL, N'Thursday', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (17, N'Thermodynamics ', 4, N'CH211', 2, 15, N'Monday', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (18, N'analytical chemistry
', 4, N'CH134', 4, 16, N'Thursday', CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1002, N'Crystallography
', 5, N'G111', 2, NULL, N'Sunday', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1003, N'Metallurgy', 5, N'G112', 3, 1002, N'Monday', CAST(N'11:00:00' AS Time), CAST(N'01:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1004, N'Historical geology
', 5, N'G121', 2, NULL, N'Sunday', CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1005, N'Natural geology
', 5, N'G141', 3, NULL, N'Thursday', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1006, N'Metal optics
', 5, N'G211', 4, 1003, N'Wednesday', CAST(N'11:30:00' AS Time), CAST(N'01:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1007, N'Minerals made of rocks', 5, N'G214', 4, 1006, N'Thursday', CAST(N'12:00:00' AS Time), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1008, N'Waves and acoustics
', 3, N'P 144', 2, NULL, N'Wednesday', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1009, N'Electromagnetic', 3, N'P 145', 2, NULL, N'Wednesday', CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1010, N'Alternating current
', 3, N'P 146', 3, NULL, N'Monday', CAST(N'10:00:00' AS Time), CAST(N'01:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1012, N'Applied physics
', 3, N'P 189', 2, NULL, N'Thursday', CAST(N'01:00:00' AS Time), CAST(N'03:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1013, N'Solid state physics
 (1)', 3, N'P 211', 3, 14, N'Monday', CAST(N'09:30:00' AS Time), CAST(N'11:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1014, N'Electronic optics
', 3, N'P 233', 1, NULL, N'Thursday', CAST(N'10:30:00' AS Time), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1015, N'Partial spectrum
', 3, N'P 433', 2, NULL, N'Wednesday', CAST(N'11:00:00' AS Time), CAST(N'12:30:00' AS Time))
INSERT [dbo].[Subject] ([subID], [subjectName], [deptID], [code], [creditHours], [preSubject], [day], [timeFrom], [timeTo]) VALUES (1016, N'x', 3, N'P 222', 2, NULL, N'Thursday', CAST(N'09:00:00' AS Time), CAST(N'11:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Subject] OFF
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Professors] FOREIGN KEY([head])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Professors]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Gender] FOREIGN KEY([genderID])
REFERENCES [dbo].[Gender] ([genderID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Gender]
GO
ALTER TABLE [dbo].[ProfessorSubjects]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubjects_Professors] FOREIGN KEY([professorID])
REFERENCES [dbo].[Professors] ([id])
GO
ALTER TABLE [dbo].[ProfessorSubjects] CHECK CONSTRAINT [FK_ProfessorSubjects_Professors]
GO
ALTER TABLE [dbo].[ProfessorSubjects]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorSubjects_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subID])
GO
ALTER TABLE [dbo].[ProfessorSubjects] CHECK CONSTRAINT [FK_ProfessorSubjects_Subject]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([deptId])
REFERENCES [dbo].[Department] ([depID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Gender] FOREIGN KEY([genderID])
REFERENCES [dbo].[Gender] ([genderID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Gender]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Level] FOREIGN KEY([levelID])
REFERENCES [dbo].[Level] ([levelID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Level]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_ProfessorSubjects] FOREIGN KEY([professorSubjectID])
REFERENCES [dbo].[ProfessorSubjects] ([id])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_ProfessorSubjects]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Student] FOREIGN KEY([studentID])
REFERENCES [dbo].[Student] ([studentID])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Student]
GO
ALTER TABLE [dbo].[StudentSubjects]  WITH CHECK ADD  CONSTRAINT [FK_StudentSubjects_Subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[Subject] ([subID])
GO
ALTER TABLE [dbo].[StudentSubjects] CHECK CONSTRAINT [FK_StudentSubjects_Subject]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Department] FOREIGN KEY([deptID])
REFERENCES [dbo].[Department] ([depID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Department]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Subject] FOREIGN KEY([preSubject])
REFERENCES [dbo].[Subject] ([subID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Subject]
GO
/****** Object:  StoredProcedure [dbo].[Registration_End]    Script Date: 8/30/2023 8:48:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Registration_End]
AS
Begin
UPDATE [dbo].[StudentSubjects]
SET registrationEnd= 1
End

GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO
