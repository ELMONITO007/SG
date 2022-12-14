USE [master]
GO
/****** Object:  Database [SG]    Script Date: 18/9/2022 8:01:23 p. m. ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Codigo]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Codigo](
	[ID_Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[id_tipoHerramienta] [int] NOT NULL,
 CONSTRAINT [PK_Codigo] PRIMARY KEY CLUSTERED 
(
	[ID_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoOrdenEnsayo]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoOrdenEnsayo](
	[Id_EstadoOrdenEnsayo] [int] IDENTITY(1,1) NOT NULL,
	[Controlador] [nvarchar](50) NOT NULL,
	[Pagina] [nvarchar](50) NOT NULL,
	[EstadoInicial] [nvarchar](150) NOT NULL,
	[orden] [int] NOT NULL,
	[Responsable] [nvarchar](50) NOT NULL,
	[Texto] [nvarchar](150) NULL,
	[EstadoFinal] [nvarchar](150) NULL,
	[tarea] [nvarchar](50) NULL,
 CONSTRAINT [PK_EstadoOrdenEnsayo] PRIMARY KEY CLUSTERED 
(
	[Id_EstadoOrdenEnsayo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Herramienta]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Herramienta_item]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Instrumento]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instrumento](
	[ID_Instrumento] [int] IDENTITY(1,1) NOT NULL,
	[ID_Laboratorio] [int] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[NumeroSerie] [varchar](50) NOT NULL,
	[Vencimiento] [varchar](50) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Activo] [bit] NULL,
	[Tipo] [nvarchar](250) NULL,
	[Certificado] [nvarchar](50) NULL,
	[TipoUso] [nvarchar](50) NULL,
	[TipoEnsayo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Instrumento] PRIMARY KEY CLUSTERED 
(
	[ID_Instrumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstrumentoTipo]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstrumentoTipo](
	[Id_TipoHerramienta] [int] NOT NULL,
	[ID_Instrumento] [int] NOT NULL,
 CONSTRAINT [PK_InstrumentoTipo] PRIMARY KEY CLUSTERED 
(
	[Id_TipoHerramienta] ASC,
	[ID_Instrumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemHerramienta]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[LaboratorioUsuario]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LaboratorioUsuario](
	[id_Laboratorio] [int] NULL,
	[id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListadoNorma]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Norma]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[norma_ListadoNorma]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[norma_ListadoNorma](
	[id_norma] [int] NOT NULL,
	[id_ListadoNorma] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenTrabajo]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenTrabajo](
	[ID_OrdenTrabajo] [int] IDENTITY(1,1) NOT NULL,
	[id_Estado] [int] NULL,
	[Fecha] [nvarchar](50) NULL,
	[ID_Labotatorio] [int] NULL,
	[Id] [int] NULL,
	[cantidadEquipos] [int] NULL,
	[Activo] [bit] NULL,
	[Guia] [nvarchar](50) NULL,
	[Transporte] [nvarchar](50) NULL,
	[GuiaRecepcion] [nvarchar](50) NULL,
	[TransporteRecepcion] [nvarchar](50) NULL,
	[Observaciones] [nvarchar](max) NULL,
	[Asignado] [int] NULL,
 CONSTRAINT [PK_OrdenTrabajo] PRIMARY KEY CLUSTERED 
(
	[ID_OrdenTrabajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenTrabajo_Estado]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenTrabajo_Estado](
	[Id_estado] [int] IDENTITY(1,1) NOT NULL,
	[ID_OrdenTrabajo] [int] NULL,
	[Id_EstadoOrdenEnsayo] [int] NULL,
	[Fecha] [nvarchar](50) NULL,
	[Id] [int] NULL,
	[Observaciones] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrdenTrabajo_Estado] PRIMARY KEY CLUSTERED 
(
	[Id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocolo]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocolo](
	[id_protocolo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[fechaEnsayo] [nvarchar](50) NOT NULL,
	[observaciones] [nvarchar](max) NULL,
	[temperatura] [int] NULL,
	[humedad] [int] NULL,
	[conclusion] [nvarchar](max) NOT NULL,
	[Activo] [bit] NOT NULL,
	[ID_herramienta] [int] NULL,
	[Id_usuario] [int] NULL,
	[Id_Laboratorio] [int] NULL,
 CONSTRAINT [PK_Protocolo] PRIMARY KEY CLUSTERED 
(
	[id_protocolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocolo_Item]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocolo_Item](
	[Id_Protocolo] [int] NOT NULL,
	[Id_ListadoNorma] [int] NOT NULL,
	[Valor] [nvarchar](50) NOT NULL,
	[ID_Protocolo_item] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Protocolo_Item] PRIMARY KEY CLUSTERED 
(
	[ID_Protocolo_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProtocoloDetalle]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtocoloDetalle](
	[id_ProtocoloDetalle] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NOT NULL,
	[Tipo] [nvarchar](50) NOT NULL,
	[NumeroSerie] [nvarchar](50) NOT NULL,
	[Certificado] [nvarchar](50) NOT NULL,
	[Vencimiento] [nvarchar](50) NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Id_Protocolo] [int] NOT NULL,
 CONSTRAINT [PK_ProtocoloDetalle] PRIMARY KEY CLUSTERED 
(
	[id_ProtocoloDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProtocoloOE]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProtocoloOE](
	[Id_ordenTrabajo] [int] NOT NULL,
	[id_Protocolo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[temp_OrdenHerramienta]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_OrdenHerramienta](
	[Id_orden] [int] NOT NULL,
	[id_Herramienta] [int] NOT NULL,
	[existe] [bit] NOT NULL,
	[Codigo] [nvarchar](50) NULL,
	[id_CargaInicialHerramienta] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_temp_OrdenHerramienta] PRIMARY KEY CLUSTERED 
(
	[id_CargaInicialHerramienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHerramienta]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 18/9/2022 8:01:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[ID_Turno] [int] IDENTITY(1,1) NOT NULL,
	[FechaRecepcionMateriales] [varchar](50) NOT NULL,
	[FechaComienzoDeEnsayo] [varchar](50) NULL,
	[FechaFinDeEnsayo] [varchar](50) NULL,
	[ID_OrdenTrabajo] [int] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[ID_Turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/9/2022 8:01:24 p. m. ******/
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
SET IDENTITY_INSERT [dbo].[Codigo] ON 

INSERT [dbo].[Codigo] ([ID_Codigo], [Codigo], [id_tipoHerramienta]) VALUES (1, N'PEB', 19)
INSERT [dbo].[Codigo] ([ID_Codigo], [Codigo], [id_tipoHerramienta]) VALUES (2, N'PET', 20)
INSERT [dbo].[Codigo] ([ID_Codigo], [Codigo], [id_tipoHerramienta]) VALUES (3, N'PEU', 21)
INSERT [dbo].[Codigo] ([ID_Codigo], [Codigo], [id_tipoHerramienta]) VALUES (4, N'PES', 1016)
SET IDENTITY_INSERT [dbo].[Codigo] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoOrdenEnsayo] ON 

INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (12, N'ordentrabajo', N'create', N'Orden de Ensayo Creado', 1, N'Supervisor/Laboratorio', N'Se ha creado la Orden de Ensayo - el dia - por el usuario ', N'Esperando Turno para envio de herramientas', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (13, N'turno', N'create', N'Esperando Turno para envio de herramientas', 2, N'Laboratorio', N' ha asignado los turnos. Turno para envio de herramientas: - ,Turno para retirar materiales: ', N'Turno Asignado. Enviar Herramientas', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (16, N'ordentrabajo', N'enviarherramienta', N'Turno Asignado. Enviar Herramientas', 3, N'Supervisor', N'El usuario: - ha enviado las herramientas el -, Atravez del transporte: -, Guia: ', N'Herramientas enviadas', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (19, N'ordentrabajo', N'recepcion', N'Herramientas enviadas', 4, N'Laboratorio', N' ha Recepcionado las herramientas el dia:', N'Herramientas recibidas', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (20, N'ordentrabajo', N'ensayar', N'Herramientas recibidas', 6, N'Laboratorio', N' ha ensayado las herramientas el dia ', N'Ensayado', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (21, N'turno', N'editarRecepcion', N'Ensayado', 7, N'Laboratorio', N'Fecha de retiro de equipos confrmada para el', N'Retiro confirmado', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (22, N'OrdenTrabajo', N'cierre', N'Retiro confirmado', 8, N'Supervisor', N'Se cierra la orden de ensayo el dia', N'Cerrado', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (25, N'OrdenTrabajo', N'ModificarLaboratorio', N'Esperando Turno para envio de herramientas', 0, N'Laboratorio', N'Se ha modificado el laboratorio, debes enviarlo a', N'Esperando Turno para envio de herramientas', NULL)
INSERT [dbo].[EstadoOrdenEnsayo] ([Id_EstadoOrdenEnsayo], [Controlador], [Pagina], [EstadoInicial], [orden], [Responsable], [Texto], [EstadoFinal], [tarea]) VALUES (27, N'turno', N'EditarTurnoEnsayo', N'Herramienta recibida', 5, N'Laboratorio', N' ha confirmado la fecha de comienzo de ensayo para el: - y la fecha de retiro para el: -', N'Ensayar', NULL)
SET IDENTITY_INSERT [dbo].[EstadoOrdenEnsayo] OFF
GO
SET IDENTITY_INSERT [dbo].[Herramienta] ON 

INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (1, N'PEU', N'223', N'NULL', N'Por123', N'Activo', N'123456', 24, 1, 2, N'12112022', N'PEU223', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (4, N'PEU', N'1', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU001A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (5, N'PEU', N'1', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU001A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (6, N'PEU', N'2', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU001B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (7, N'PEU', N'3', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU001C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (8, N'PEU', N'4', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU01A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (9, N'PEU', N'5', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU01B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (10, N'PEU', N'6', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU01B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (11, N'PEU', N'7', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU002A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (12, N'PEU', N'8', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU002B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (13, N'PEU', N'9', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU002C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (14, N'PEU', N'10', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU02A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (15, N'PEU', N'11', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU02A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (16, N'PEU', N'12', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU02B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (17, N'PEU', N'13', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU02B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (18, N'PEU', N'14', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU02C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (19, N'PEU', N'15', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU02C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (20, N'PEU', N'16', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU003A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (21, N'PEU', N'17', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU003B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (22, N'PEU', N'18', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU003C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (23, N'PEU', N'19', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU03A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (24, N'PEU', N'20', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU03C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (25, N'PEU', N'21', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU004A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (26, N'PEU', N'22', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU004B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (27, N'PEU', N'23', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU004C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (28, N'PEU', N'24', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'20240918', N'PEU04A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (29, N'PEU', N'25', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU04C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (30, N'PEU', N'26', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU005A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (31, N'PEU', N'27', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU005B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (32, N'PEU', N'28', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU006', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (33, N'PEU', N'29', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU007', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (34, N'PEU', N'30', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU008', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (35, N'PEU', N'31', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU009', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (36, N'PEU', N'32', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU010A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (37, N'PEU', N'33', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU010C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (38, N'PEU', N'34', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU010D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (39, N'PEU', N'35', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU011A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (40, N'PEU', N'36', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU011C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (41, N'PEU', N'37', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU011C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (42, N'PEU', N'38', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU011D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (43, N'PEU', N'39', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU012A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (44, N'PEU', N'40', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU012C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (45, N'PEU', N'41', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU013A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (46, N'PEU', N'42', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU013B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (47, N'PEU', N'43', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU014', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (48, N'PEU', N'44', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU015', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (49, N'PEU', N'45', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU016', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (50, N'PEU', N'46', N'', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU017', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (51, N'PEU', N'47', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU018A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (52, N'PEU', N'48', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU018B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (53, N'PEU', N'49', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU18A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (54, N'PEU', N'50', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU18B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (55, N'PEU', N'51', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU019', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (56, N'PEU', N'52', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU19', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (57, N'PEU', N'53', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU020A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (58, N'PEU', N'54', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU020A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (59, N'PEU', N'55', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU020A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (60, N'PEU', N'56', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU020B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (61, N'PEU', N'57', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU020B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (62, N'PEU', N'58', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU020B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (63, N'PEU', N'59', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU021', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (64, N'PEU', N'60', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU021', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (65, N'PEU', N'61', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU021', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (66, N'PEU', N'62', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU022A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (67, N'PEU', N'63', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU022C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (68, N'PEU', N'64', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 1, 2, N'12112022', N'PEU023', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (69, N'PEU', N'65', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU024A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (70, N'PEU', N'66', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU024C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (71, N'PEU', N'68', N'', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU026', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (72, N'PEU', N'69', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU027', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (73, N'PEU', N'70', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU028C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (74, N'PEU', N'71', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU028C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (75, N'PEU', N'72', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (76, N'PEU', N'74', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (77, N'PEU', N'75', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (78, N'PEU', N'77', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (79, N'PEU', N'78', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (80, N'PEU', N'80', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (81, N'PEU', N'81', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (82, N'PEU', N'83', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU029D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (83, N'PEU', N'84', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (84, N'PEU', N'86', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (85, N'PEU', N'87', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (86, N'PEU', N'89', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (87, N'PEU', N'90', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (88, N'PEU', N'92', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (89, N'PEU', N'93', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (90, N'PEU', N'95', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU030D', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (91, N'PEU', N'105', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU34A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (92, N'PEU', N'106', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU34B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (93, N'PEU', N'107', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU34C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (94, N'PEU', N'142', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU048', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (95, N'PEU', N'145', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU049A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (96, N'PEU', N'148', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU50A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (97, N'PEU', N'154', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU052A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (98, N'PEU', N'155', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU52A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (99, N'PEU', N'157', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU52C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (100, N'PEU', N'159', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU53A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (101, N'PEU', N'160', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU53C', 3)
GO
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (102, N'PEU', N'161', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU054A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (103, N'PEU', N'163', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU054C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (104, N'PEU', N'164', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU54A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (105, N'PEU', N'168', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU55A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (106, N'PEU', N'171', N'Liat', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU55C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (107, N'PEU', N'182', N'Chance', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU58', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (108, N'PEU', N'183', N'Chance', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU58', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (109, N'PEU', N'184', N'Chance', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU59', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (110, N'PEU', N'185', N'Chance', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU59', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (111, N'PEU', N'188', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU060', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (112, N'PEU', N'189', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU060', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (113, N'PEU', N'190', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU061B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (114, N'PEU', N'191', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU061B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (115, N'PEU', N'192', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU061C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (116, N'PEU', N'193', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU061C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (117, N'PEU', N'194', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU062A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (118, N'PEU', N'195', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU062A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (119, N'PEU', N'196', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU062B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (120, N'PEU', N'197', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU062B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (121, N'PEU', N'198', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU063A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (122, N'PEU', N'199', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU063A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (123, N'PEU', N'200', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU063B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (124, N'PEU', N'201', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU063B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (125, N'PEU', N'202', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU064A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (126, N'PEU', N'203', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU064B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (127, N'PEU', N'204', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU064B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (128, N'PEU', N'205', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU065A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (129, N'PEU', N'206', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU065A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (130, N'PEU', N'207', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU065B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (131, N'PEU', N'208', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU065B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (132, N'PEU', N'210', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU066B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (133, N'PEU', N'211', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU066B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (134, N'PEU', N'212', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU067A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (135, N'PEU', N'213', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU067A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (136, N'PEU', N'214', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU067C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (137, N'PEU', N'215', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU067C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (138, N'PEU', N'218', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU068C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (139, N'PEU', N'219', N'LIAT', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU068C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (140, N'PEU', N'220', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU069A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (141, N'PEU', N'221', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU069A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (142, N'PEU', N'222', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU069C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (143, N'PEU', N'223', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU069C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (144, N'PEU', N'224', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (145, N'PEU', N'225', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (146, N'PEU', N'226', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (147, N'PEU', N'227', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (148, N'PEU', N'228', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (149, N'PEU', N'229', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (150, N'PEU', N'230', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (151, N'PEU', N'231', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070B', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (152, N'PEU', N'232', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (153, N'PEU', N'233', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (154, N'PEU', N'234', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (155, N'PEU', N'235', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU070C', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (156, N'PEU', N'236', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU071A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (157, N'PEU', N'237', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU071A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (158, N'PEU', N'238', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU071A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (159, N'PEU', N'239', N'CHANCE', N'NULL', N'Activo', N'NULL', 24, 0, 2, N'12112022', N'PEU071A', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (160, N'PEU', N'999', N'Fasten', N'Por123', N'Activo', N'123456', 24, 0, 2, N'2022-09-17', N'PEU999', 3)
INSERT [dbo].[Herramienta] ([id_Herramienta], [codigo], [numero], [marca], [modelo], [Estado], [numeroSerie], [tiempoMantenimiento], [vencida], [id_TipoHerrramienta], [proximaActualizacion], [CodigoViejo], [Id_usuario]) VALUES (161, N'PEU', N'998', N'Fasten', N'Por123', N'Activo', N'12345679936', 24, 0, 2, N'2022-10-08', N'PEU998', 3)
SET IDENTITY_INSERT [dbo].[Herramienta] OFF
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (4, 3, N'1')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (4, 4, N'2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (4, 1, N'3')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (4, 2, N'4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (4, 5, NULL)
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (5, 3, N'1')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (5, 4, N'1')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (6, 3, N'4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (6, 4, N'44')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (6, 1, N'44')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (6, 2, N'52')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (6, 5, N'No')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (7, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (7, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (7, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (7, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (7, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (9, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (5, 1, N'2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (5, 2, N'No')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (5, 5, NULL)
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (10, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (11, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (12, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (13, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (14, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (15, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (16, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (17, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (18, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (19, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (20, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (21, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (22, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (23, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (24, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (25, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (26, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (27, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (28, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (29, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (30, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (31, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (32, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (33, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (34, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (35, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (36, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (37, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (38, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (39, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (40, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (41, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (42, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (43, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (44, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (45, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (46, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (47, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (48, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (49, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (50, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (51, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (52, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (53, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (54, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (55, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (56, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (57, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (58, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (59, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (60, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (61, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (62, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (63, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (64, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (65, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (66, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (67, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (68, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (69, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (70, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (71, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (72, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (73, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (74, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (75, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (76, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (77, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (78, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (79, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (80, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (81, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (82, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (83, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (84, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (85, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (86, 1, N'1 1/4"')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (87, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (88, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (89, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (90, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (91, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (92, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (93, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (94, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (95, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (96, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (97, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (98, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (99, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (100, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (101, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (102, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (103, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (104, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (105, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (106, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (107, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (108, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (109, 1, N'1 1/2')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (110, 1, N'1 1/4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (111, 1, N'1 1/4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (112, 1, N'1 1/4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (113, 1, N'1 1/4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (114, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (115, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (116, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (117, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (118, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (119, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (120, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (121, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (122, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (123, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (124, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (125, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (126, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (127, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (128, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (129, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (130, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (131, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (132, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (133, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (134, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (135, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (136, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (137, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (138, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (139, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (140, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (141, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (142, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (143, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (144, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (149, 1, N'2 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (150, 1, N'2 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (151, 1, N'3 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (152, 1, N'1 1/2"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (153, 1, N'3 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (154, 1, N'3 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (155, 1, N'4 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (156, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (157, 1, N'4 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (158, 1, N'4 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (159, 1, N'5 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 1/4"')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 ¼')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 1, N'1 1/4')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (9, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (10, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (11, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (12, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (13, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (14, 3, N'')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (15, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (16, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (17, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (18, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (19, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (20, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (21, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (22, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (23, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (24, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (25, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (26, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (27, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (28, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (29, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (30, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (31, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (32, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (33, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (34, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (35, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (36, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (37, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (38, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (39, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (40, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (41, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (42, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (43, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (44, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (45, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (46, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (47, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (48, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (49, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (50, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (51, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (52, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (53, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (54, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (55, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (56, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (57, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (58, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (59, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (60, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (61, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (62, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (63, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (64, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (65, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (66, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (67, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (68, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (69, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (70, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (71, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (72, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (73, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (74, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (75, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (76, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (77, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (78, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (79, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (80, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (81, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (82, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (83, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (84, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (85, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (86, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (87, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (88, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (89, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (90, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (91, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (92, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (93, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (94, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (95, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (96, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (97, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (98, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (99, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (100, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (101, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (102, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (103, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (104, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (105, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (106, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (107, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (108, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (109, 3, N'')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (110, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (111, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (112, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (113, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (114, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (115, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (116, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (117, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (118, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (119, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (120, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (121, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (122, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (123, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (124, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (125, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (126, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (127, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (128, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (129, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (130, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (131, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (132, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (133, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (134, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (135, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (136, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (137, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (138, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (139, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (140, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (141, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (142, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (143, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (144, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (149, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (150, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (151, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (152, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (153, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (154, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (155, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (156, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (157, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (158, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (159, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 3, N'hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (9, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (10, 2, N'1290')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (11, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (12, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (13, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (14, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (15, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (16, 2, N'1290')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (17, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (18, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (19, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (20, 2, N'1350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (21, 2, N'1290')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (22, 2, N'1290')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (23, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (24, 2, N'2310')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (25, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (26, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (27, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (28, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (29, 2, N'2310')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (30, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (31, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (32, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (33, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (34, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (35, 2, N'3600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (36, 2, N'2940')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (37, 2, N'2940')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (38, 2, N'2335')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (39, 2, N'3000')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (40, 2, N'1360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (41, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (42, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (43, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (44, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (45, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (46, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (47, 2, N'3560')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (48, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (49, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (50, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (51, 2, N'3560')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (52, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (53, 2, N'150')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (54, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (55, 2, N'1670')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (56, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (57, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (58, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (59, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (60, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (61, 2, N'2310')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (62, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (63, 2, N'2980')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (64, 2, N'2225')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (65, 2, N'2980')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (66, 2, N'1490')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (67, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (68, 2, N'1490')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (69, 2, N'2236')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (70, 2, N'1090')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (71, 2, N'1690')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (72, 2, N'1690')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (73, 2, N'1850')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'4150')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (74, 2, N'4730')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (75, 2, N'1200')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (76, 2, N'2400')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (77, 2, N'2400')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (78, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (79, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (80, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1355')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (81, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (82, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3560')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (83, 2, N'2260')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (84, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (85, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (86, 2, N'2300')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (87, 2, N'2300')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (88, 2, N'1100')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (89, 2, N'1100')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (90, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (91, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (92, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (93, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (94, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (95, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (96, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2930')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1640')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2240')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2300')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2170')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2230')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1690')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2900')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (97, 2, N'1000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (98, 2, N'1955')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1955')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (99, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (100, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (101, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (102, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (103, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (104, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (105, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (106, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (107, 2, N'2500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (108, 2, N'2500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2550')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (109, 2, N'2500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (110, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (111, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (112, 2, N'3520')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (113, 2, N'3520')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (114, 2, N'1700')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (115, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (116, 2, N'1000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (117, 2, N'1000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (118, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (119, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (120, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (121, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (122, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (123, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (124, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (125, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (126, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (127, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (128, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (129, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (130, 2, N'2360')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (131, 2, N'1860')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (132, 2, N'1860')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (133, 2, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (134, 2, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2850')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (135, 2, N'1860')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (136, 2, N'1860')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (137, 2, N'2610')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (138, 2, N'2610')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (139, 2, N'2800')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (140, 2, N'2800')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2595')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (141, 2, N'2595')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (142, 2, N'2595')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (143, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (144, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (149, 2, N'2670')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (150, 2, N'2670')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (151, 2, N'2330')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (152, 2, N'2300')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (153, 2, N'2330')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (154, 2, N'2330')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (155, 2, N'2610')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (156, 2, N'2310')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (157, 2, N'2610')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (158, 2, N'2610')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (159, 2, N'2670')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2300')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2326')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2311')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2320')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2350')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2400')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2340')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1400')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2500')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'600')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'800')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2310')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3010')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3700')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3450')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1730')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1680')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'880')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2450')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'2270')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'1750')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3000')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 2, N'3510')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (9, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (10, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (11, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (12, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (13, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (14, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (15, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (16, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (17, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (18, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (19, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (20, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (21, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (22, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (23, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (24, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (25, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (26, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (27, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (28, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (29, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (30, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (31, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (32, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (33, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (34, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (35, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (36, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (37, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (38, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (39, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (40, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (41, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (42, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (43, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (44, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (45, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (46, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (47, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (48, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (49, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (50, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (51, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (52, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (53, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (54, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (55, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (56, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (57, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (58, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (59, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (60, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (61, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (62, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (63, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (64, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (65, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (66, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (67, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (68, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (69, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (70, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (71, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (72, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (73, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (74, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (75, 4, N'Macho')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (76, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (77, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (78, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (79, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (80, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (81, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (82, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (83, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (84, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (85, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (86, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'Baston')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (87, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (88, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (89, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (90, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (91, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (92, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (93, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (94, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (95, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (96, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (97, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (98, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (99, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (100, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (101, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (102, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (103, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (104, 4, N'')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (105, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (106, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (107, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (108, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (109, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (110, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (111, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (112, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (113, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (114, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (115, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (116, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (117, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (118, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (119, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (120, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (121, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (122, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (123, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (124, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (125, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (126, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (127, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (128, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (129, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (130, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (131, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (132, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (133, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (134, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (135, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (136, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (137, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (138, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (139, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (140, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (141, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (142, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (143, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (144, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (149, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (150, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (151, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (152, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (153, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (154, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (155, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (156, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (157, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (158, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (159, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'Rosca')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (9, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (10, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (11, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (12, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (13, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (14, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (15, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (16, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (17, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (18, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (19, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (20, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (21, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (22, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (23, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (24, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (25, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (26, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (27, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (28, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (29, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (30, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (31, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (32, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (33, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (34, 5, N'SI')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (35, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (36, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (37, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (38, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (39, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (40, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (41, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (42, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (43, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (44, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (45, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (46, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (47, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (48, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (49, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (50, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (51, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (52, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (53, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (54, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (55, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (56, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (57, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (58, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (59, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (60, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (61, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (62, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (63, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (64, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (65, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (66, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (67, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (68, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (69, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (70, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (71, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (72, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (73, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (74, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (75, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (76, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (77, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (78, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (79, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (80, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (81, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (82, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (83, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (84, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (85, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (86, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (87, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (88, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (89, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (90, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (91, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (92, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (93, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (94, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (95, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (96, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (97, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (98, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (99, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (100, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (101, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (102, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (103, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (104, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (105, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (106, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (107, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (108, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (109, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (110, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (111, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (112, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (113, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (114, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (115, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (116, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (117, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (118, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (119, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (120, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (121, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (122, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (123, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (124, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (125, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (126, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (127, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (128, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (129, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (130, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (131, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (132, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (133, 5, N'NO')
GO
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (134, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (135, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (136, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (137, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (138, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (139, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (140, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (141, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (142, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (143, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (144, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (149, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (150, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (151, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (152, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (153, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (154, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (155, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (156, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (157, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (158, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (159, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 5, N'SI')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (NULL, 5, N'')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (160, 1, N'25')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (160, 2, N'25')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (160, 3, N'Base')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (160, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (160, 5, N'NO')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (161, 1, N'25')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (161, 2, N'30')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (161, 3, N'Base')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (161, 4, N'Hexagonal')
INSERT [dbo].[Herramienta_item] ([Id_Herramienta], [id_itemHerramienta], [Valor]) VALUES (161, 5, N'NO')
GO
SET IDENTITY_INSERT [dbo].[Instrumento] ON 

INSERT [dbo].[Instrumento] ([ID_Instrumento], [ID_Laboratorio], [Marca], [NumeroSerie], [Vencimiento], [Codigo], [Activo], [Tipo], [Certificado], [TipoUso], [TipoEnsayo]) VALUES (1, 1, N'Tillquist', N'9526-2190', N'20230716', N'TT0001', 1, N'Transductor de Tensión', N'2492', N'Fijo', N'Eléctrico')
INSERT [dbo].[Instrumento] ([ID_Instrumento], [ID_Laboratorio], [Marca], [NumeroSerie], [Vencimiento], [Codigo], [Activo], [Tipo], [Certificado], [TipoUso], [TipoEnsayo]) VALUES (4, 1, N'Tillquist', N'9526-2193', N'20230717', N'TT0002', 1, N'Transductor de Tensión', N'2491', N'Fijo', N'Eléctrico')
INSERT [dbo].[Instrumento] ([ID_Instrumento], [ID_Laboratorio], [Marca], [NumeroSerie], [Vencimiento], [Codigo], [Activo], [Tipo], [Certificado], [TipoUso], [TipoEnsayo]) VALUES (6, 2, N'CIFIC', N'98506', N'20201002', N'DET001', 1, N'Anillo dinamométrico para tracción', N'F-2236', N'Portatil', N'Mecánico')
INSERT [dbo].[Instrumento] ([ID_Instrumento], [ID_Laboratorio], [Marca], [NumeroSerie], [Vencimiento], [Codigo], [Activo], [Tipo], [Certificado], [TipoUso], [TipoEnsayo]) VALUES (8, 2, N'CIFIC', N'98505', N'20201002', N'DET002', 1, N'Anillo dinamométrico para tracción', N'F-2237', N'Portatil', N'Mecanico')
SET IDENTITY_INSERT [dbo].[Instrumento] OFF
GO
INSERT [dbo].[InstrumentoTipo] ([Id_TipoHerramienta], [ID_Instrumento]) VALUES (2, 1)
INSERT [dbo].[InstrumentoTipo] ([Id_TipoHerramienta], [ID_Instrumento]) VALUES (2, 4)
GO
SET IDENTITY_INSERT [dbo].[ItemHerramienta] ON 

INSERT [dbo].[ItemHerramienta] ([Id_ItemHerramienta], [nombre], [activo], [ID_TipoHerramienta], [tipo], [Ayuda], [Maximo], [Minimo]) VALUES (1, N'Diametro', 1, 2, N'Number', N'Ingrese el diametro en mm', 10000, 1)
INSERT [dbo].[ItemHerramienta] ([Id_ItemHerramienta], [nombre], [activo], [ID_TipoHerramienta], [tipo], [Ayuda], [Maximo], [Minimo]) VALUES (2, N'Largo aislante', 1, 2, N'Number', N'Ingrese el largo en mm', 10000, 1)
INSERT [dbo].[ItemHerramienta] ([Id_ItemHerramienta], [nombre], [activo], [ID_TipoHerramienta], [tipo], [Ayuda], [Maximo], [Minimo]) VALUES (3, N'Acople Hembra', 1, 2, N'Text', N'Ingrese el acople Hembra (ej Base)', 50, 3)
INSERT [dbo].[ItemHerramienta] ([Id_ItemHerramienta], [nombre], [activo], [ID_TipoHerramienta], [tipo], [Ayuda], [Maximo], [Minimo]) VALUES (4, N'Acople Macho', 1, 2, N'Text', N'Ingrese el acople Macho(ej Hexagonal macho)', 50, 3)
INSERT [dbo].[ItemHerramienta] ([Id_ItemHerramienta], [nombre], [activo], [ID_TipoHerramienta], [tipo], [Ayuda], [Maximo], [Minimo]) VALUES (5, N'Restaurada', 1, 2, N'Text', N'Ingrese SI o NO', 2, 2)
SET IDENTITY_INSERT [dbo].[ItemHerramienta] OFF
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
SET IDENTITY_INSERT [dbo].[OrdenTrabajo] ON 

INSERT [dbo].[OrdenTrabajo] ([ID_OrdenTrabajo], [id_Estado], [Fecha], [ID_Labotatorio], [Id], [cantidadEquipos], [Activo], [Guia], [Transporte], [GuiaRecepcion], [TransporteRecepcion], [Observaciones], [Asignado]) VALUES (3, 6, N'20220915', 1, 1, 10, 1, N'A Asignar', N'A Asignar', N'1233', N'Cruz del sur', N'10', 1)
INSERT [dbo].[OrdenTrabajo] ([ID_OrdenTrabajo], [id_Estado], [Fecha], [ID_Labotatorio], [Id], [cantidadEquipos], [Activo], [Guia], [Transporte], [GuiaRecepcion], [TransporteRecepcion], [Observaciones], [Asignado]) VALUES (4, 11, N'20220918', 1, 1, 50, 1, N'A Asignar', N'A Asignar', N'1233', N'Cruz del sur', N'50 pertigas', 1)
SET IDENTITY_INSERT [dbo].[OrdenTrabajo] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdenTrabajo_Estado] ON 

INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (1, 3, 12, N'20220915', 1, N'Se ha creado la Orden de Ensayo 3 el dia 15-09-2022 por el usuario andres.benitez@transener.com.ar')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (2, 3, 13, N'20220915', 1, N'andres.benitez@transener.com.ar ha asignado los turnos. Turno para envio de herramientas: 16-09-2022 ,Turno para retirar materiales: 23-09-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (3, 3, 16, N'20220915', 1, N'El usuario: andres.benitez@transener.com.ar ha enviado las herramientas el 15-54-2022, Atravez del transporte: Cruz del sur, Guia: 1233')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (4, 3, 19, N'20220915', 1, N'andres.benitez@transener.com.ar ha Recepcionado las herramientas el dia:15-55-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (5, 3, 27, N'20220915', 1, N'andres.benitez@transener.com.ar ha confirmado la fecha de comienzo de ensayo para el: 19-09-2022 y la fecha de retiro para el: 23-09-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (6, 3, 20, N'20220918', 1, N'andres.benitez@transener.com.ar ha ensayado las herramientas el dia 19-09-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (7, 4, 12, N'20220918', 1, N'Se ha creado la Orden de Ensayo 4 el dia 18-09-2022 por el usuario andres.benitez@transener.com.ar')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (8, 4, 13, N'20220918', 1, N'andres.benitez@transener.com.ar ha asignado los turnos. Turno para envio de herramientas: 19-09-2022 ,Turno para retirar materiales: 22-09-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (9, 4, 16, N'20220918', 1, N'El usuario: andres.benitez@transener.com.ar ha enviado las herramientas el 18-48-2022, Atravez del transporte: Cruz del sur, Guia: 1233')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (10, 4, 19, N'20220918', 1, N'andres.benitez@transener.com.ar ha Recepcionado las herramientas el dia:18-48-2022')
INSERT [dbo].[OrdenTrabajo_Estado] ([Id_estado], [ID_OrdenTrabajo], [Id_EstadoOrdenEnsayo], [Fecha], [Id], [Observaciones]) VALUES (11, 4, 27, N'20220918', 1, N'andres.benitez@transener.com.ar ha confirmado la fecha de comienzo de ensayo para el: 20-09-2022 y la fecha de retiro para el: 22-09-2022')
SET IDENTITY_INSERT [dbo].[OrdenTrabajo_Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Protocolo] ON 

INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (4, N'RM-OE3-0', N'20220918', NULL, 20, 20, N'OK', 1, 5, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (5, N'RM-OE3-1', N'20220918', NULL, 20, 20, N'OK', 1, 5, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (6, N'RM-OE3-2', N'20220918', NULL, 20, 20, N'OK', 1, 6, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (7, N'RM-OE3-3', N'20220918', NULL, 20, 20, N'OK', 1, 7, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (8, N'RM-OE3-4', N'20220918', NULL, 20, 20, N'OK', 1, 8, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (9, N'RM-OE3-5', N'20220918', NULL, 20, 20, N'OK', 1, 10, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (10, N'RM-OE3-6', N'20220918', NULL, 20, 20, N'OK', 1, 10, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (11, N'RM-OE3-7', N'20220918', NULL, 20, 20, N'OK', 1, 11, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (12, N'RM-OE3-8', N'20220918', NULL, 20, 20, N'OK', 1, 12, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (13, N'RM-OE3-9', N'20220918', NULL, 20, 20, N'OK', 1, 13, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (14, N'RM-OE3-10', N'20220918', NULL, 20, 20, N'OK', 1, 15, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (15, N'RM-OE3-11', N'20220918', NULL, 20, 20, N'OK', 1, 15, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (16, N'RM-OE3-12', N'20220918', NULL, 20, 20, N'OK', 1, 17, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (17, N'RM-OE3-13', N'20220918', NULL, 20, 20, N'OK', 1, 17, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (18, N'RM-OE3-14', N'20220918', NULL, 20, 20, N'OK', 1, 19, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (19, N'RM-OE3-15', N'20220918', NULL, 20, 20, N'OK', 1, 19, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (20, N'RM-OE3-16', N'20220918', NULL, 20, 20, N'OK', 1, 20, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (21, N'RM-OE3-17', N'20220918', NULL, 20, 20, N'OK', 1, 21, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (22, N'RM-OE3-18', N'20220918', NULL, 20, 20, N'OK', 1, 22, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (23, N'RM-OE3-19', N'20220918', NULL, 20, 20, N'OK', 1, 23, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (24, N'RM-OE3-20', N'20220918', NULL, 20, 20, N'OK', 1, 24, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (25, N'RM-OE3-21', N'20220918', NULL, 20, 20, N'OK', 1, 25, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (26, N'RM-OE3-22', N'20220918', NULL, 20, 20, N'OK', 1, 26, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (27, N'RM-OE3-23', N'20220918', NULL, 20, 20, N'OK', 1, 27, 1, 1)
INSERT [dbo].[Protocolo] ([id_protocolo], [Codigo], [fechaEnsayo], [observaciones], [temperatura], [humedad], [conclusion], [Activo], [ID_herramienta], [Id_usuario], [Id_Laboratorio]) VALUES (28, N'RM-OE3-24', N'20220918', NULL, 20, 20, N'OK', 1, 28, 1, 1)
SET IDENTITY_INSERT [dbo].[Protocolo] OFF
GO
SET IDENTITY_INSERT [dbo].[Protocolo_Item] ON 

INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (4, 1, N'OK', 5)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (4, 2, N'OK', 6)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (4, 3, N'OK', 7)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (4, 4, N'OK', 8)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (5, 1, N'OK', 9)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (5, 2, N'OK', 10)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (5, 3, N'OK', 11)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (5, 4, N'OK', 12)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (6, 1, N'OK', 13)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (6, 2, N'OK', 14)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (6, 3, N'OK', 15)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (6, 4, N'OK', 16)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (7, 1, N'OK', 17)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (7, 2, N'OK', 18)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (7, 3, N'OK', 19)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (7, 4, N'OK', 20)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (8, 1, N'OK', 21)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (8, 2, N'OK', 22)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (8, 3, N'OK', 23)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (8, 4, N'OK', 24)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (9, 1, N'OK', 25)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (9, 2, N'OK', 26)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (9, 3, N'OK', 27)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (9, 4, N'OK', 28)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (10, 1, N'OK', 29)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (10, 2, N'OK', 30)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (10, 3, N'OK', 31)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (10, 4, N'OK', 32)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (11, 1, N'OK', 33)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (11, 2, N'OK', 34)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (11, 3, N'OK', 35)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (11, 4, N'OK', 36)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (12, 1, N'OK', 37)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (12, 2, N'OK', 38)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (12, 3, N'OK', 39)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (12, 4, N'OK', 40)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (13, 1, N'OK', 41)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (13, 2, N'OK', 42)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (13, 3, N'OK', 43)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (13, 4, N'OK', 44)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (14, 1, N'OK', 45)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (14, 2, N'OK', 46)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (14, 3, N'OK', 47)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (14, 4, N'OK', 48)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (15, 1, N'OK', 49)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (15, 2, N'OK', 50)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (15, 3, N'OK', 51)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (15, 4, N'OK', 52)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (16, 1, N'OK', 53)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (16, 2, N'OK', 54)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (16, 3, N'OK', 55)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (16, 4, N'OK', 56)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (17, 1, N'OK', 57)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (17, 2, N'OK', 58)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (17, 3, N'OK', 59)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (17, 4, N'OK', 60)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (18, 1, N'OK', 61)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (18, 2, N'OK', 62)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (18, 3, N'OK', 63)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (18, 4, N'OK', 64)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (19, 1, N'OK', 65)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (19, 2, N'OK', 66)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (19, 3, N'OK', 67)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (19, 4, N'OK', 68)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (20, 1, N'OK', 69)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (20, 2, N'OK', 70)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (20, 3, N'OK', 71)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (20, 4, N'OK', 72)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (21, 1, N'OK', 73)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (21, 2, N'OK', 74)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (21, 3, N'OK', 75)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (21, 4, N'OK', 76)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (22, 1, N'OK', 77)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (22, 2, N'OK', 78)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (22, 3, N'OK', 79)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (22, 4, N'OK', 80)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (23, 1, N'OK', 81)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (23, 2, N'OK', 82)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (23, 3, N'OK', 83)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (23, 4, N'OK', 84)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (24, 1, N'OK', 85)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (24, 2, N'OK', 86)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (24, 3, N'OK', 87)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (24, 4, N'OK', 88)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (25, 1, N'OK', 89)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (25, 2, N'OK', 90)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (25, 3, N'OK', 91)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (25, 4, N'OK', 92)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (26, 1, N'OK', 93)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (26, 2, N'OK', 94)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (26, 3, N'OK', 95)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (26, 4, N'OK', 96)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (27, 1, N'OK', 97)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (27, 2, N'OK', 98)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (27, 3, N'OK', 99)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (27, 4, N'OK', 100)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (28, 1, N'OK', 101)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (28, 2, N'OK', 102)
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (28, 3, N'OK', 103)
GO
INSERT [dbo].[Protocolo_Item] ([Id_Protocolo], [Id_ListadoNorma], [Valor], [ID_Protocolo_item]) VALUES (28, 4, N'OK', 104)
SET IDENTITY_INSERT [dbo].[Protocolo_Item] OFF
GO
SET IDENTITY_INSERT [dbo].[ProtocoloDetalle] ON 

INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (1, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 4)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (2, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 5)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (3, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 6)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (4, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 7)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (5, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 8)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (6, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 9)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (7, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 10)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (8, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 11)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (9, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 12)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (10, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 13)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (11, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 14)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (12, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 15)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (13, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 16)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (14, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 17)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (15, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 18)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (16, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 19)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (17, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 20)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (18, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 21)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (19, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 22)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (20, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 23)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (21, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 24)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (22, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 25)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (23, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 26)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (24, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 27)
INSERT [dbo].[ProtocoloDetalle] ([id_ProtocoloDetalle], [Marca], [Tipo], [NumeroSerie], [Certificado], [Vencimiento], [Codigo], [Id_Protocolo]) VALUES (25, N'Tillquist', N'Transductor de Tensión', N'9526-2190', N'2492', N'16-07-2023', N'TT0001', 28)
SET IDENTITY_INSERT [dbo].[ProtocoloDetalle] OFF
GO
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 4)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 5)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 6)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 7)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 8)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 9)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 10)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 11)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 12)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 13)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 14)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 15)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 16)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 17)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 18)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 19)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 20)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 21)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 22)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 23)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 24)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 25)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 26)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 27)
INSERT [dbo].[ProtocoloOE] ([Id_ordenTrabajo], [id_Protocolo]) VALUES (3, 28)
GO
SET IDENTITY_INSERT [dbo].[temp_OrdenHerramienta] ON 

INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 5, 1, N'PEU001A', 1)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 5, 1, N'PEU001A', 2)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 6, 1, N'PEU001B', 3)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 7, 1, N'PEU001C', 4)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 8, 1, N'PEU01A', 5)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 10, 1, N'PEU01B', 6)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 10, 1, N'PEU01B', 7)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 11, 1, N'PEU002A', 8)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 12, 1, N'PEU002B', 9)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 13, 1, N'PEU002C', 10)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 15, 1, N'PEU02A', 11)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 15, 1, N'PEU02A', 12)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 17, 1, N'PEU02B', 13)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 17, 1, N'PEU02B', 14)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 19, 1, N'PEU02C', 15)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 19, 1, N'PEU02C', 16)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 20, 1, N'PEU003A', 17)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 21, 1, N'PEU003B', 18)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 22, 1, N'PEU003C', 19)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 23, 1, N'PEU03A', 20)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 24, 1, N'PEU03C', 21)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 25, 1, N'PEU004A', 22)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 26, 1, N'PEU004B', 23)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 27, 1, N'PEU004C', 24)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 28, 1, N'PEU04A', 25)
INSERT [dbo].[temp_OrdenHerramienta] ([Id_orden], [id_Herramienta], [existe], [Codigo], [id_CargaInicialHerramienta]) VALUES (3, 29, 1, N'PEU04C', 26)
SET IDENTITY_INSERT [dbo].[temp_OrdenHerramienta] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoHerramienta] ON 

INSERT [dbo].[TipoHerramienta] ([ID_tipoHerramienta], [tipoHerramienta], [SubTipo], [TipoEnsayo], [TipoUso], [ID_Norma], [Activo]) VALUES (2, N'Pertiga Universal', N'Herramienta', N'Eléctrico', N'Portatil', 1, 1)
SET IDENTITY_INSERT [dbo].[TipoHerramienta] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([ID_Turno], [FechaRecepcionMateriales], [FechaComienzoDeEnsayo], [FechaFinDeEnsayo], [ID_OrdenTrabajo]) VALUES (1, N'20220916', N'20220919', N'20220923', 3)
INSERT [dbo].[Turno] ([ID_Turno], [FechaRecepcionMateriales], [FechaComienzoDeEnsayo], [FechaFinDeEnsayo], [ID_OrdenTrabajo]) VALUES (2, N'20220919', N'20220920', N'20220922', 4)
SET IDENTITY_INSERT [dbo].[Turno] OFF
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
ALTER TABLE [dbo].[Instrumento]  WITH CHECK ADD  CONSTRAINT [FK_Instrumento_Herramienta] FOREIGN KEY([ID_Instrumento])
REFERENCES [dbo].[Herramienta] ([id_Herramienta])
GO
ALTER TABLE [dbo].[Instrumento] CHECK CONSTRAINT [FK_Instrumento_Herramienta]
GO
ALTER TABLE [dbo].[Instrumento]  WITH CHECK ADD  CONSTRAINT [FK_Instrumento_Laboratorio] FOREIGN KEY([ID_Laboratorio])
REFERENCES [dbo].[Laboratorio] ([id_Laboratorio])
GO
ALTER TABLE [dbo].[Instrumento] CHECK CONSTRAINT [FK_Instrumento_Laboratorio]
GO
ALTER TABLE [dbo].[InstrumentoTipo]  WITH CHECK ADD  CONSTRAINT [FK_InstrumentoTipo_Instrumento] FOREIGN KEY([ID_Instrumento])
REFERENCES [dbo].[Instrumento] ([ID_Instrumento])
GO
ALTER TABLE [dbo].[InstrumentoTipo] CHECK CONSTRAINT [FK_InstrumentoTipo_Instrumento]
GO
ALTER TABLE [dbo].[InstrumentoTipo]  WITH CHECK ADD  CONSTRAINT [FK_InstrumentoTipo_TipoHerramienta] FOREIGN KEY([Id_TipoHerramienta])
REFERENCES [dbo].[TipoHerramienta] ([ID_tipoHerramienta])
GO
ALTER TABLE [dbo].[InstrumentoTipo] CHECK CONSTRAINT [FK_InstrumentoTipo_TipoHerramienta]
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
ALTER TABLE [dbo].[OrdenTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenTrabajo_Laboratorio] FOREIGN KEY([ID_Labotatorio])
REFERENCES [dbo].[Laboratorio] ([id_Laboratorio])
GO
ALTER TABLE [dbo].[OrdenTrabajo] CHECK CONSTRAINT [FK_OrdenTrabajo_Laboratorio]
GO
ALTER TABLE [dbo].[OrdenTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenTrabajo_OrdenTrabajo_Estado] FOREIGN KEY([id_Estado])
REFERENCES [dbo].[OrdenTrabajo_Estado] ([Id_estado])
GO
ALTER TABLE [dbo].[OrdenTrabajo] CHECK CONSTRAINT [FK_OrdenTrabajo_OrdenTrabajo_Estado]
GO
ALTER TABLE [dbo].[OrdenTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenTrabajo_Usuario] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajo] CHECK CONSTRAINT [FK_OrdenTrabajo_Usuario]
GO
ALTER TABLE [dbo].[OrdenTrabajo]  WITH CHECK ADD  CONSTRAINT [FK_OrdenTrabajo_Usuario1] FOREIGN KEY([Asignado])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajo] CHECK CONSTRAINT [FK_OrdenTrabajo_Usuario1]
GO
ALTER TABLE [dbo].[OrdenTrabajo_Estado]  WITH CHECK ADD  CONSTRAINT [FK_OrdenTrabajo_Estado_Usuario] FOREIGN KEY([Id])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[OrdenTrabajo_Estado] CHECK CONSTRAINT [FK_OrdenTrabajo_Estado_Usuario]
GO
ALTER TABLE [dbo].[Protocolo_Item]  WITH CHECK ADD  CONSTRAINT [FK_Protocolo_Item_ListadoNorma] FOREIGN KEY([Id_ListadoNorma])
REFERENCES [dbo].[ListadoNorma] ([id_ListadoNorma])
GO
ALTER TABLE [dbo].[Protocolo_Item] CHECK CONSTRAINT [FK_Protocolo_Item_ListadoNorma]
GO
ALTER TABLE [dbo].[Protocolo_Item]  WITH CHECK ADD  CONSTRAINT [FK_Protocolo_Item_Protocolo] FOREIGN KEY([Id_Protocolo])
REFERENCES [dbo].[Protocolo] ([id_protocolo])
GO
ALTER TABLE [dbo].[Protocolo_Item] CHECK CONSTRAINT [FK_Protocolo_Item_Protocolo]
GO
ALTER TABLE [dbo].[ProtocoloDetalle]  WITH CHECK ADD  CONSTRAINT [FK_ProtocoloDetalle_Protocolo] FOREIGN KEY([Id_Protocolo])
REFERENCES [dbo].[Protocolo] ([id_protocolo])
GO
ALTER TABLE [dbo].[ProtocoloDetalle] CHECK CONSTRAINT [FK_ProtocoloDetalle_Protocolo]
GO
ALTER TABLE [dbo].[ProtocoloOE]  WITH CHECK ADD  CONSTRAINT [FK_ProtocoloOE_OrdenTrabajo1] FOREIGN KEY([Id_ordenTrabajo])
REFERENCES [dbo].[OrdenTrabajo] ([ID_OrdenTrabajo])
GO
ALTER TABLE [dbo].[ProtocoloOE] CHECK CONSTRAINT [FK_ProtocoloOE_OrdenTrabajo1]
GO
ALTER TABLE [dbo].[ProtocoloOE]  WITH CHECK ADD  CONSTRAINT [FK_ProtocoloOE_Protocolo] FOREIGN KEY([id_Protocolo])
REFERENCES [dbo].[Protocolo] ([id_protocolo])
GO
ALTER TABLE [dbo].[ProtocoloOE] CHECK CONSTRAINT [FK_ProtocoloOE_Protocolo]
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
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_OrdenTrabajo] FOREIGN KEY([ID_OrdenTrabajo])
REFERENCES [dbo].[OrdenTrabajo] ([ID_OrdenTrabajo])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_OrdenTrabajo]
GO
USE [master]
GO
ALTER DATABASE [SG] SET  READ_WRITE 
GO
