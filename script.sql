USE [master]
GO
/****** Object:  Database [SG]    Script Date: 5/9/2022 3:51:54 p. m. ******/
CREATE DATABASE [SG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SG.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SG_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SG] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SG] SET ARITHABORT OFF 
GO
ALTER DATABASE [SG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SG] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SG] SET  MULTI_USER 
GO
ALTER DATABASE [SG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SG] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SG] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SG] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SG] SET QUERY_STORE = OFF
GO
USE [SG]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Activo] [bit] NULL,
	[Tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Herramienta]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Herramienta](
	[id_Herramienta] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nvarchar](50) NULL,
	[numero] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
	[modelo] [nvarchar](50) NULL,
	[Estado] [nvarchar](50) NULL,
	[numeroSerie] [nvarchar](50) NULL,
	[tiempoMantenimiento] [int] NULL,
	[vencida] [bit] NULL,
	[id_TipoHerrramienta] [int] NULL,
	[proximaActualizacion] [nvarchar](50) NULL,
	[CodigoViejo] [nvarchar](50) NULL,
	[Id_usuario] [int] NULL,
 CONSTRAINT [PK_Herramienta] PRIMARY KEY CLUSTERED 
(
	[id_Herramienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Herramienta_item]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Herramienta_item](
	[Id_Herramienta] [int] NULL,
	[id_itemHerramienta] [int] NULL,
	[Valor] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instrumento]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrumento](
	[ID_TipoHerramienta] [int] NOT NULL,
	[ID_TipoInstrumento] [int] NOT NULL,
	[ID_Laboratorio] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemHerramienta]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemHerramienta](
	[Id_ItemHerramienta] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](70) NOT NULL,
	[activo] [bit] NOT NULL,
	[ID_TipoHerramienta] [int] NULL,
	[tipo] [nvarchar](50) NULL,
	[Ayuda] [varchar](150) NULL,
	[Maximo] [int] NULL,
	[Minimo] [int] NULL,
 CONSTRAINT [PK_ItemHerramienta] PRIMARY KEY CLUSTERED 
(
	[Id_ItemHerramienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Laboratorio](
	[id_Laboratorio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](150) NOT NULL,
	[piePagina] [nvarchar](250) NOT NULL,
	[activo] [int] NULL,
	[Codigo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Laboratorio] PRIMARY KEY CLUSTERED 
(
	[id_Laboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LaboratorioUsuario]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaboratorioUsuario](
	[id_Laboratorio] [int] NULL,
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListadoNorma]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListadoNorma](
	[id_ListadoNorma] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_ListadoNorma] PRIMARY KEY CLUSTERED 
(
	[id_ListadoNorma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Norma]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Norma](
	[id_Norma] [int] IDENTITY(1,1) NOT NULL,
	[codigoNorma] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[protocolo] [nvarchar](max) NOT NULL,
	[pathFoto] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_Norma] PRIMARY KEY CLUSTERED 
(
	[id_Norma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[norma_ListadoNorma]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[norma_ListadoNorma](
	[id_norma] [int] NOT NULL,
	[id_ListadoNorma] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[Id_Sector] [int] IDENTITY(1,1) NOT NULL,
	[Sector] [nvarchar](100) NULL,
	[Activo] [bit] NULL,
	[Estacion] [nvarchar](50) NULL,
	[id_gerencia] [int] NULL,
	[Id_Laboratario] [int] NULL,
	[Empresa] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[Id_Sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHerramienta]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHerramienta](
	[ID_tipoHerramienta] [int] IDENTITY(1,1) NOT NULL,
	[tipoHerramienta] [nvarchar](50) NOT NULL,
	[SubTipo] [nvarchar](50) NULL,
	[TipoEnsayo] [nvarchar](50) NULL,
	[TipoUso] [nvarchar](50) NULL,
	[ID_Norma] [int] NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK_TipoHerramienta] PRIMARY KEY CLUSTERED 
(
	[ID_tipoHerramienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/9/2022 3:51:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](max) NULL,
	[Activo] [bit] NULL,
	[Bloqueado] [bit] NULL,
	[CantidadIntentos] [int] NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Tipo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [Activo], [Tipo]) VALUES (1, N'TCT_Laboratorio', 1, N'Permiso')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Activo], [Tipo]) VALUES (2, N'Tecnico', 1, N'Permiso')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1002, 2)
GO
SET IDENTITY_INSERT [dbo].[Laboratorio] ON 

INSERT [dbo].[Laboratorio] ([id_Laboratorio], [nombre], [piePagina], [activo], [Codigo]) VALUES (1, N'Ramos Mejia', N'Laboratorio de ensayos de Ramos Mejoa', 1, N'RM')
INSERT [dbo].[Laboratorio] ([id_Laboratorio], [nombre], [piePagina], [activo], [Codigo]) VALUES (2, N'Ituzaingo', N'Laboratorio principal de ensayos de Ituzaingo', 1, NULL)
SET IDENTITY_INSERT [dbo].[Laboratorio] OFF
GO
INSERT [dbo].[LaboratorioUsuario] ([id_Laboratorio], [id]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[ListadoNorma] ON 

INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (1, N'InpeccionVisual', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (2, N'Aumento de Temparatura', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (3, N'Cambio de Coloracion', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (4, N'Contorneo', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (1002, N'Apto', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (1003, N'Golpeado', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (1004, N'Pintura', 1)
INSERT [dbo].[ListadoNorma] ([id_ListadoNorma], [nombre], [activo]) VALUES (1005, N'Falta pieza', 0)
SET IDENTITY_INSERT [dbo].[ListadoNorma] OFF
GO
SET IDENTITY_INSERT [dbo].[Norma] ON 

INSERT [dbo].[Norma] ([id_Norma], [codigoNorma], [nombre], [protocolo], [pathFoto], [Activo]) VALUES (1, N'IEC N° 60855/60832', N'INYECCIÓN DE TENSIÓN REGULADA EN PÓRTICO', N'Inspección Visual:
De acuerdo a lo establecido en la normativa de referencia y a las exigencias de procedimientos internos, se realiza una inspección visual exhaustiva, verificando: defectos superficiales sobre el tubo aislante, estado de cabezales metálicos, buloneria en general, accesorios de goma, existencia de codificación y oblea con vencimiento.   
Ensayo Eléctrico: 
Bajo condiciones ambientales se coloca la pértiga en un dispositivo normalizado y se la somete a  tensión alterna de 100 kV eficaces cada 30 cm a frecuencia industrial, durante 1 min. La tensión alterna se aplica inicialmente a un valor bajo y debe aumentar gradualmente de forma constante hasta alcanzar el nivel de tensión de ensayo. 
La inmersión en agua se lleva a cabo en pértigas restauradas o según el grado de defecto superficial que presenten. 
', NULL, 1)
INSERT [dbo].[Norma] ([id_Norma], [codigoNorma], [nombre], [protocolo], [pathFoto], [Activo]) VALUES (3, N'IEC 9822', N'Ensayo Yugos', N'Protocolo ensayo de yugo', NULL, 1)
SET IDENTITY_INSERT [dbo].[Norma] OFF
GO
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (1, 1)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (1, 2)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (1, 3)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (1, 4)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (3, 1003)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (3, 1004)
INSERT [dbo].[norma_ListadoNorma] ([id_norma], [id_ListadoNorma]) VALUES (3, 1005)
GO
SET IDENTITY_INSERT [dbo].[TipoHerramienta] ON 

INSERT [dbo].[TipoHerramienta] ([ID_tipoHerramienta], [tipoHerramienta], [SubTipo], [TipoEnsayo], [TipoUso], [ID_Norma], [Activo]) VALUES (2, N'Pertiga', N'Herramienta', N'Eléctrico', N'Portatil', 1, 1)
SET IDENTITY_INSERT [dbo].[TipoHerramienta] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [UserName], [Email], [Password], [Activo], [Bloqueado], [CantidadIntentos], [Nombre], [Apellido], [Tipo]) VALUES (1, N'andres.benitez@transener.com.ar', N'andres.benitez@transener.com.ar', N'FC78F43E1AA478259790215C1253E197095A17DE01D688E5361B8D5702455A11691C1A05F961D51F661E2A59A484121F39F44E9A1B147DD55EA7FEC6BC1C94B5', 1, 0, 0, N'Andres', N'Benitez', N'Ensayista')
INSERT [dbo].[Usuario] ([Id], [UserName], [Email], [Password], [Activo], [Bloqueado], [CantidadIntentos], [Nombre], [Apellido], [Tipo]) VALUES (3, N'tecnico1@green.net', N'tecnico1@green.net', N'FC78F43E1AA478259790215C1253E197095A17DE01D688E5361B8D5702455A11691C1A05F961D51F661E2A59A484121F39F44E9A1B147DD55EA7FEC6BC1C94B5', 1, 0, 0, N'Juan', N'Perez', NULL)
INSERT [dbo].[Usuario] ([Id], [UserName], [Email], [Password], [Activo], [Bloqueado], [CantidadIntentos], [Nombre], [Apellido], [Tipo]) VALUES (1002, N'auditor1@green.com', N'auditor1@green.com', N'FC78F43E1AA478259790215C1253E197095A17DE01D688E5361B8D5702455A11691C1A05F961D51F661E2A59A484121F39F44E9A1B147DD55EA7FEC6BC1C94B5', 1, 0, 0, N'Jose', N'Soto', NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_Usuario1] FOREIGN KEY([UserId])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_Usuario1]
GO
ALTER TABLE [dbo].[Herramienta]  WITH CHECK ADD  CONSTRAINT [FK_Herramienta_TipoHerramienta] FOREIGN KEY([id_TipoHerrramienta])
REFERENCES [dbo].[TipoHerramienta] ([ID_tipoHerramienta])
GO
ALTER TABLE [dbo].[Herramienta] CHECK CONSTRAINT [FK_Herramienta_TipoHerramienta]
GO
ALTER TABLE [dbo].[Herramienta_item]  WITH CHECK ADD  CONSTRAINT [FK_Herramienta_item_Herramienta] FOREIGN KEY([Id_Herramienta])
REFERENCES [dbo].[Herramienta] ([id_Herramienta])
GO
ALTER TABLE [dbo].[Herramienta_item] CHECK CONSTRAINT [FK_Herramienta_item_Herramienta]
GO
ALTER TABLE [dbo].[Herramienta_item]  WITH CHECK ADD  CONSTRAINT [FK_Herramienta_item_ItemHerramienta] FOREIGN KEY([id_itemHerramienta])
REFERENCES [dbo].[ItemHerramienta] ([Id_ItemHerramienta])
GO
ALTER TABLE [dbo].[Herramienta_item] CHECK CONSTRAINT [FK_Herramienta_item_ItemHerramienta]
GO
ALTER TABLE [dbo].[Instrumento]  WITH CHECK ADD  CONSTRAINT [FK_Instrumento_Herramienta] FOREIGN KEY([ID_TipoInstrumento])
REFERENCES [dbo].[Herramienta] ([id_Herramienta])
GO
ALTER TABLE [dbo].[Instrumento] CHECK CONSTRAINT [FK_Instrumento_Herramienta]
GO
ALTER TABLE [dbo].[Instrumento]  WITH CHECK ADD  CONSTRAINT [FK_Instrumento_Laboratorio1] FOREIGN KEY([ID_Laboratorio])
REFERENCES [dbo].[Laboratorio] ([id_Laboratorio])
GO
ALTER TABLE [dbo].[Instrumento] CHECK CONSTRAINT [FK_Instrumento_Laboratorio1]
GO
ALTER TABLE [dbo].[Instrumento]  WITH CHECK ADD  CONSTRAINT [FK_Instrumento_TipoHerramienta] FOREIGN KEY([ID_TipoHerramienta])
REFERENCES [dbo].[TipoHerramienta] ([ID_tipoHerramienta])
GO
ALTER TABLE [dbo].[Instrumento] CHECK CONSTRAINT [FK_Instrumento_TipoHerramienta]
GO
ALTER TABLE [dbo].[ItemHerramienta]  WITH CHECK ADD  CONSTRAINT [FK_ItemHerramienta_TipoHerramienta] FOREIGN KEY([ID_TipoHerramienta])
REFERENCES [dbo].[TipoHerramienta] ([ID_tipoHerramienta])
GO
ALTER TABLE [dbo].[ItemHerramienta] CHECK CONSTRAINT [FK_ItemHerramienta_TipoHerramienta]
GO
ALTER TABLE [dbo].[LaboratorioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_LaboaratorioUsuario_Laboratorio] FOREIGN KEY([id_Laboratorio])
REFERENCES [dbo].[Laboratorio] ([id_Laboratorio])
GO
ALTER TABLE [dbo].[LaboratorioUsuario] CHECK CONSTRAINT [FK_LaboaratorioUsuario_Laboratorio]
GO
ALTER TABLE [dbo].[LaboratorioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_LaboaratorioUsuario_Usuario] FOREIGN KEY([id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[LaboratorioUsuario] CHECK CONSTRAINT [FK_LaboaratorioUsuario_Usuario]
GO
ALTER TABLE [dbo].[norma_ListadoNorma]  WITH CHECK ADD  CONSTRAINT [FK_norma_ListadoNorma_ListadoNorma] FOREIGN KEY([id_ListadoNorma])
REFERENCES [dbo].[ListadoNorma] ([id_ListadoNorma])
GO
ALTER TABLE [dbo].[norma_ListadoNorma] CHECK CONSTRAINT [FK_norma_ListadoNorma_ListadoNorma]
GO
ALTER TABLE [dbo].[norma_ListadoNorma]  WITH CHECK ADD  CONSTRAINT [FK_norma_ListadoNorma_Norma] FOREIGN KEY([id_norma])
REFERENCES [dbo].[Norma] ([id_Norma])
GO
ALTER TABLE [dbo].[norma_ListadoNorma] CHECK CONSTRAINT [FK_norma_ListadoNorma_Norma]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_Laboratorio] FOREIGN KEY([Id_Laboratario])
REFERENCES [dbo].[Laboratorio] ([id_Laboratorio])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_Laboratorio]
GO
ALTER TABLE [dbo].[TipoHerramienta]  WITH CHECK ADD  CONSTRAINT [FK_TipoHerramienta_Norma1] FOREIGN KEY([ID_Norma])
REFERENCES [dbo].[Norma] ([id_Norma])
GO
ALTER TABLE [dbo].[TipoHerramienta] CHECK CONSTRAINT [FK_TipoHerramienta_Norma1]
GO
USE [master]
GO
ALTER DATABASE [SG] SET  READ_WRITE 
GO
