USE [master]
GO
/****** Object:  Database [SP]    Script Date: 5/9/2022 3:45:33 p. m. ******/
CREATE DATABASE [SP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SP] SET ARITHABORT OFF 
GO
ALTER DATABASE [SP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SP] SET  MULTI_USER 
GO
ALTER DATABASE [SP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SP] SET QUERY_STORE = OFF
GO
USE [SP]
GO
/****** Object:  Table [dbo].[Accion]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accion](
	[id_Accion] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionAccion] [varchar](max) NOT NULL,
	[FechaCreacion] [varchar](50) NOT NULL,
	[Zona] [varchar](50) NOT NULL,
	[ResponsableSP] [int] NOT NULL,
	[Usuario] [int] NOT NULL,
	[TomaConocimiento] [varchar](max) NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
	[DescripcionProblema] [varchar](max) NOT NULL,
	[Origen] [varchar](max) NOT NULL,
	[Motivo] [varchar](max) NOT NULL,
	[ID_Sector] [int] NOT NULL,
	[id_codigo] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Accion] PRIMARY KEY CLUSTERED 
(
	[id_Accion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccionPredeterminada]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccionPredeterminada](
	[ID_AccionPredeterminada] [int] IDENTITY(1,1) NOT NULL,
	[Origen] [varchar](150) NOT NULL,
	[Activo] [int] NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
 CONSTRAINT [PK_AccionPredeterminada] PRIMARY KEY CLUSTERED 
(
	[ID_AccionPredeterminada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Codigo]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Codigo](
	[ID_Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Letra] [nvarchar](50) NOT NULL,
	[Numero] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Titulo] [nvarchar](50) NULL,
	[Sector] [nvarchar](50) NULL,
 CONSTRAINT [PK_Codigo] PRIMARY KEY CLUSTERED 
(
	[ID_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColaboradoresAccion]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColaboradoresAccion](
	[ID_Usuario] [int] NOT NULL,
	[ID_Accion] [int] NOT NULL,
	[FechaAgregado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colaboradores] PRIMARY KEY CLUSTERED 
(
	[ID_Usuario] ASC,
	[ID_Accion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColaboradorTarea]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColaboradorTarea](
	[id_Usuario] [int] NOT NULL,
	[id_Tarea] [int] NOT NULL,
	[FechaAgregado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ColaboradorTarea] PRIMARY KEY CLUSTERED 
(
	[id_Usuario] ASC,
	[id_Tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoAccion]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoAccion](
	[Id_EstadoAccion] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](max) NOT NULL,
	[Texto] [varchar](max) NOT NULL,
	[Orden] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[ID_Accion] [int] NOT NULL,
 CONSTRAINT [PK_EstadoAccion] PRIMARY KEY CLUSTERED 
(
	[Id_EstadoAccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoAccionPredeterminado]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoAccionPredeterminado](
	[Id_EstadoAccionPredeterminado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](150) NOT NULL,
	[orden] [int] NOT NULL,
	[Texto] [nvarchar](150) NULL,
 CONSTRAINT [PK_EstadoOrdenEnsayo] PRIMARY KEY CLUSTERED 
(
	[Id_EstadoAccionPredeterminado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoTarea]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoTarea](
	[Id_EstadoTarea] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](max) NOT NULL,
	[Texto] [varchar](max) NOT NULL,
	[Orden] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Id_Tarea] [int] NOT NULL,
 CONSTRAINT [PK_EstadoTarea] PRIMARY KEY CLUSTERED 
(
	[Id_EstadoTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstadoTareaPredeterminado]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoTareaPredeterminado](
	[Id_EstadoTareaPredeterminado] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](150) NOT NULL,
	[orden] [int] NOT NULL,
	[Texto] [nvarchar](150) NULL,
 CONSTRAINT [PK_EstadoTareaPredeterminado] PRIMARY KEY CLUSTERED 
(
	[Id_EstadoTareaPredeterminado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormularioAccidente]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormularioAccidente](
	[id_FormularioAccidente] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[ID_Accion] [int] NOT NULL,
 CONSTRAINT [PK_FormularioAccidente] PRIMARY KEY CLUSTERED 
(
	[id_FormularioAccidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormularioAccidenteDetalle]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormularioAccidenteDetalle](
	[id_FormularioAccidenteDetalle] [int] NOT NULL,
	[Item] [varchar](max) NOT NULL,
	[Orden] [int] NOT NULL,
	[Valor] [varchar](max) NOT NULL,
	[Activo] [bit] NOT NULL,
	[ID_FormularioAccidente] [int] NOT NULL,
 CONSTRAINT [PK_FormularioAccidenteDetalle] PRIMARY KEY CLUSTERED 
(
	[id_FormularioAccidenteDetalle] ASC,
	[ID_FormularioAccidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemFormularioAccidente]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemFormularioAccidente](
	[ID_itemFormularioAccidente] [int] IDENTITY(1,1) NOT NULL,
	[Item] [varchar](max) NOT NULL,
	[Titulo] [bit] NOT NULL,
	[Orden] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_ItemFormularioAccidente] PRIMARY KEY CLUSTERED 
(
	[ID_itemFormularioAccidente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MensajeAccion]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MensajeAccion](
	[id_MensajeAccion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Accion] [int] NOT NULL,
	[Usuario] [int] NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Leido] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_MensajeAccion] PRIMARY KEY CLUSTERED 
(
	[id_MensajeAccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MensajeTarea]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MensajeTarea](
	[id_MensajeTarea] [int] IDENTITY(1,1) NOT NULL,
	[Id_Tarea] [int] NOT NULL,
	[Usuario] [int] NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Leido] [bit] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_MensajeTarea] PRIMARY KEY CLUSTERED 
(
	[id_MensajeTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motivo]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motivo](
	[id_Motivo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Motivo] PRIMARY KEY CLUSTERED 
(
	[id_Motivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id_Region] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[Empresa] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id_Region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReprogramacionAccion]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReprogramacionAccion](
	[Id_ReprogramacionAccion] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [nvarchar](50) NOT NULL,
	[fechaReprogramacion] [nvarchar](50) NOT NULL,
	[Motivo] [nvarchar](50) NOT NULL,
	[Id_usuario] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[ID_Accion] [int] NULL,
	[Aprobado] [bit] NULL,
 CONSTRAINT [PK_Reprogramacion] PRIMARY KEY CLUSTERED 
(
	[Id_ReprogramacionAccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sector]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sector](
	[ID_Sector] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](50) NOT NULL,
	[ID_Region] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Auditoria] [bit] NULL,
	[ResponsableSP] [int] NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[ID_Sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectorUsuario]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectorUsuario](
	[ID_Usuario] [int] NOT NULL,
	[ID_Sector] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[ID_Tarea] [int] IDENTITY(1,1) NOT NULL,
	[Id_Accion] [int] NOT NULL,
	[Responsable] [int] NOT NULL,
	[Tarea] [varchar](max) NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
	[TiempoHs] [int] NOT NULL,
	[FechaInicio] [varchar](50) NOT NULL,
	[fechaCierre] [varchar](50) NOT NULL,
	[fechaVencimiento] [varchar](50) NOT NULL,
	[horaInicio] [varchar](50) NOT NULL,
	[horaVencimiento] [varchar](50) NOT NULL,
	[horaCierre] [varchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Tarea_1] PRIMARY KEY CLUSTERED 
(
	[ID_Tarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TareaPredeterminada]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TareaPredeterminada](
	[ID_TareaPredeterminada] [int] IDENTITY(1,1) NOT NULL,
	[ID_AccionPredeterminada] [int] NOT NULL,
	[Responsable] [varchar](max) NOT NULL,
	[Observaciones] [varchar](max) NOT NULL,
	[TiempoHs] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
	[Tarea] [varchar](max) NOT NULL,
	[EstadoInicial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TareaPredeterminada] PRIMARY KEY CLUSTERED 
(
	[ID_TareaPredeterminada] ASC,
	[ID_AccionPredeterminada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[Celular] [nvarchar](50) NULL,
	[CodigoPostal] [nvarchar](50) NULL,
	[Direccion] [nvarchar](50) NULL,
	[DNI] [nvarchar](50) NULL,
	[Localidad] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[TipoDni] [nvarchar](50) NULL,
	[Interno] [bit] NULL,
	[Firma] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[ResponsableSP] [bit] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkFlow]    Script Date: 5/9/2022 3:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkFlow](
	[ID_WorkFlow] [int] IDENTITY(1,1) NOT NULL,
	[ID_Accion] [int] NOT NULL,
	[Fecha] [int] NOT NULL,
	[AprobadorN1] [int] NULL,
	[AprobadorN2] [int] NULL,
	[AprobadoN1] [bit] NULL,
	[AprobadoN2] [bit] NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_WorkFlow] PRIMARY KEY CLUSTERED 
(
	[ID_WorkFlow] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccionPredeterminada] ON 

INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (1, N'Accidentes internos de Seguridad Publica', 1, N'Accidentes graves generados por descargas eléctrica de Alta Tensión al PERSONAL DE LA COMPAÑIA)')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (2, N'Accidentes externos de Seguridad Publica', 1, N'Accidentes graves con las instalaciones de la compañia que generaron muertos, heridos graves y/o daños a terceros')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (3, N'Incidente', 1, N'Caida parcial o total de conductores,y/o partes objetos materiales, explosiones en equipos dentro de EETT,incendios')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (4, N'Intrusiones criticas', 1, N'Intrusiones donde hay personas, viviendas, construcciones, canchas de futbol, etc dentro de la Franja de Seguridad)')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (5, N'Intrusiones no critícas', 1, N'Existencia de  carteles, arboles, otras plantaciones, maquinas abandonadas,etc en zona de franja de seguridad')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (6, N'Otras situaciones de riesgo Eventual Generada por terceros', 1, N'Nuevas urbanizaciones, loteos, cambios de zonificación en inmuebles afectados a servidumbre ')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (7, N'Vandalismo', 1, N'El hecho disparador es un acto vandálico bienes de la Compañia,que ocasionó daño a nuestras instalaciones')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (8, N'Fenomeno Natural', 1, N'Acontecimiento de la naturaleza que afectó nuestras instalaciones, ej tornado')
INSERT [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada], [Origen], [Activo], [Observaciones]) VALUES (9, N' Acciones de Terceros', 1, N'Autopistas, cañerias, zanjeos para Gas, Agua,etc')
SET IDENTITY_INSERT [dbo].[AccionPredeterminada] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoAccionPredeterminado] ON 

INSERT [dbo].[EstadoAccionPredeterminado] ([Id_EstadoAccionPredeterminado], [Estado], [orden], [Texto]) VALUES (1, N'Creado', 1, N'El - Usuario - creado la accion N° - el dia ')
INSERT [dbo].[EstadoAccionPredeterminado] ([Id_EstadoAccionPredeterminado], [Estado], [orden], [Texto]) VALUES (2, N'Reprogramado', 0, N'El - Usuario - ha reprogamado la accion N° - el dia -. De el dia - al dia')
INSERT [dbo].[EstadoAccionPredeterminado] ([Id_EstadoAccionPredeterminado], [Estado], [orden], [Texto]) VALUES (3, N'No Reprogramado', 0, N'El - Usuario - no aprobo la reprogramacion de la accion N° -.De el dia - al dia')
SET IDENTITY_INSERT [dbo].[EstadoAccionPredeterminado] OFF
GO
SET IDENTITY_INSERT [dbo].[EstadoTareaPredeterminado] ON 

INSERT [dbo].[EstadoTareaPredeterminado] ([Id_EstadoTareaPredeterminado], [Estado], [orden], [Texto]) VALUES (1, N'Creado', 1, N'El - Usuario - creado la tarea N° - el dia ')
INSERT [dbo].[EstadoTareaPredeterminado] ([Id_EstadoTareaPredeterminado], [Estado], [orden], [Texto]) VALUES (2, N'Reprogramado', 0, N'El - Usuario - ha reprogamado la tarea N° - el dia -. De el dia - al dia')
INSERT [dbo].[EstadoTareaPredeterminado] ([Id_EstadoTareaPredeterminado], [Estado], [orden], [Texto]) VALUES (3, N'No Reprogramado', 0, N'El - Usuario - no aprobo la reprogramacion de la tarea N° -.De el dia - al dia')
SET IDENTITY_INSERT [dbo].[EstadoTareaPredeterminado] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemFormularioAccidente] ON 

INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (1, N'Ubicación del evento ( calle y N° o ruta y Km.)', 0, 2, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (2, N'Región', 1, 3, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (3, N'Partido', 0, 4, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (4, N'Zona', 0, 5, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (5, N'Fecha evento', 0, 6, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (6, N'Forma y Hora de toma de conocimiento', 0, 7, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (7, N'Nomina del Personal actuante de TRANSENER SA', 1, 8, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (8, N'Nombre del personal de TRANSENER SA', 0, 9, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (9, N'Número de legajo', 0, 10, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (10, N'Datos del contratista', 1, 11, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (11, N'Nombre de la Empresa', 0, 12, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (12, N'Dirección', 0, 13, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (13, N'Teléfono', 0, 14, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (14, N'CUIT', 0, 15, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (15, N'Nombre del personal', 0, 16, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (16, N'N°de legajo', 0, 17, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (17, N'Designación de las instalaciones afectadas', 0, 18, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (18, N'Ubicación de las instalaciones afectadas', 0, 19, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (19, N'Anomalía causante de la falla', 0, 20, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (20, N'Duración de la Interrupción del suministro', 0, 21, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (21, N'Existió acción de terceros sobre las instalaciones', 0, 22, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (22, N'Descripción del evento', 0, 23, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (23, N'Descripción de la falla', 0, 24, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (24, N'Causa y fundamentos técnicos de la falla', 0, 25, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (25, N'Datos personales de la persona lesionada', 1, 28, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (26, N'Nombre y apellido', 0, 29, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (27, N'N° de documento', 0, 30, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (28, N'Domicilio', 0, 31, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (29, N'Teléfono', 0, 32, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (30, N'Judicial', 0, 34, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (31, N'Policial', 0, 35, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (32, N'Bomberos', 0, 36, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (33, N'Hospital', 0, 37, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (34, N'Otros', 0, 38, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (35, N'Otros datos de interes', 0, 39, 1)
INSERT [dbo].[ItemFormularioAccidente] ([ID_itemFormularioAccidente], [Item], [Titulo], [Orden], [Activo]) VALUES (36, N'Hora Evento', 0, 6, 1)
SET IDENTITY_INSERT [dbo].[ItemFormularioAccidente] OFF
GO
SET IDENTITY_INSERT [dbo].[Motivo] ON 

INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (1, N'Aisladores rotos', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (2, N'Altura libre del conductor al suelo insuficiente por causas naturales', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (3, N'Altura libre en cruces de rutas, caminos o FFCC insuficiente', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (4, N'Altura libre del conductor al suelo insuficiente causada por terceros', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (5, N'Antiescaladores - Falta', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (6, N'Arboles debajo de la línea y distancia a otros obstáculos insuficiente', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (7, N'Balizamiento diurno y nocturno - Falta -', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (8, N'Cadena doble de aislación - Falta-', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (9, N'Cartel de Peligro en cerco perimetral - Falta -', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (11, N'Cartel de Peligro - Falta', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (12, N'Cerco Perimetral dañado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (13, N'Conductor dañado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (14, N'Conductor Doble en cruce de FFCC - Falta', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (15, N'Distancia a autopistas, rutas y caminos insuficiente', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (16, N'Distancia a construcciones insuficientes', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (17, N'Distancia a otras líneas o servicios insuficiente', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (18, N'Existe vegetación natural con riesgo de incendio, basural, desechos, otros obstáculos', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (19, N'Fundaciones descalzadas o fisuradas por causas naturales', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (20, N'Fundaciones descalzadas o fisuradas causadas por terceros', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (21, N'Hilo de guardia dañado o con corrosión', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (22, N'Ménsulas o crucetas en mal estado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (23, N'Morsetería y accesorios en mal estado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (24, N'Perfiles faltantes en torre o ern mal estado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (26, N'Poste fisurado o inclinado', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (27, N'Riendas destensadas o con avanzado estado de corrosión', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (29, N'Seguridad de acceso inadecuada', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (30, N'Tensiones de paso y de contacto elevadas', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (31, N'Tierra cortada o desconectada', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (33, N'Torre o poste utilizados por tercetos', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (34, N'Veredas públicas inadecuadas', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (35, N'De Gestión', 1)
INSERT [dbo].[Motivo] ([id_Motivo], [Nombre], [Activo]) VALUES (36, N'Caída de soportes y/o partes involucradas', 1)
SET IDENTITY_INSERT [dbo].[Motivo] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (8, N'GRM', N'Metropolitana', N'Transener', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (10, N'GRNTB', N'Norte', N'Transba', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (11, N'GRNTR', N'Norte', N'Transener', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (12, N'GRSTB', N'Sur', N'Transba', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (13, N'GRSTR', N'Sur', N'Transener', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (15, N'OtrosTR', N'Otros', N'Transener', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (17, N'OtrosTB', N'Otros', N'Transba', 1)
INSERT [dbo].[Region] ([Id_Region], [Codigo], [Descripcion], [Empresa], [Activo]) VALUES (18, N'1066', N'Codigo Postal', N'Transener', 0)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
SET IDENTITY_INSERT [dbo].[Sector] ON 

INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (1, N'DAFTB', N'Dirección de Administración y Finanzas', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (3, N'DAFTR', N'Dirección de Administración y Finanzas', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (4, N'DB', N'Distrito Bragado', 10, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (5, N'DBB', N'Laboratorio GRS', 12, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (6, N'DGTB', N'Dirección General', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (7, N'DGTR', N'Dirección General', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (10, N'DIRTB', N'Dirección de Ingeniería Regulatoria', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (11, N'DIRTR', N'Dirección de Ingeniería Regulatoria', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (12, N'DM', N'Distrito Madariaga', 12, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (13, N'DO', N'Distrito Olavarria', 12, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (15, N'DRHTB', N'Dirección de Recursos Humanos', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (16, N'DRHTR', N'Dirección de Recursos Humanos', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (17, N'DSN', N'Distrito San Nicolás', 10, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (18, N'DTTB', N'Dirección Técnica', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (19, N'DTTR', N'Dirección Técnica', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (20, N'GCTB', N'Gestión de la Calidad', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (21, N'GCTR', N'Gestión de la Calidad', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (22, N'GE', N'Gerencia de Obras', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (23, N'GITR', N'Gerencia de Ingeniería', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (24, N'GITB', N'Gerencia de Ingeniería', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (25, N'GMTB', N'Gerencia de Mantenimiento', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (26, N'GMTR', N'Gerencia de Mantenimiento', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (27, N'GPORTB', N'Gerencia de Planif. y Operación de la Red', 17, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (28, N'GPORTR', N'Gerencia de Planif. y Operación de la Red', 15, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (29, N'GRA', N'Base de Mantenimiento Necochea', 12, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (30, N'GRM', N'Gerencia Regional Metropolitana', 8, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (31, N'GRNTR', N'Gerencia Regional Norte', 11, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (32, N'GRSTR', N'Gerencia Regional Sur', 13, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (34, N'GRS1', N'Distrito Bahía Blanca', 12, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (35, N'LRN', N'Laboratorio Mercedes', 10, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (36, N'RSPTR', N'Representante del Sist. de Seguridad Pública', 15, 1, 0, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (37, N'RSPTB', N'Representante del Sist. de Seguridad Pública', 17, 1, 0, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (38, N'TIEM', N'Tierras Metro', 8, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (41, N'TIENTB', N'Tierras Norte', 10, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (42, N'TIENTR', N'Tierras Norte', 11, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (44, N'TIESTR', N'Tierras Sur', 13, 1, 1, 4)
INSERT [dbo].[Sector] ([ID_Sector], [Codigo], [Descripcion], [ID_Region], [Activo], [Auditoria], [ResponsableSP]) VALUES (45, N'TIESTB', N'Tierras Sur', 12, 1, 1, 4)
SET IDENTITY_INSERT [dbo].[Sector] OFF
GO
INSERT [dbo].[SectorUsuario] ([ID_Usuario], [ID_Sector]) VALUES (1, 41)
INSERT [dbo].[SectorUsuario] ([ID_Usuario], [ID_Sector]) VALUES (4, 37)
GO
SET IDENTITY_INSERT [dbo].[TareaPredeterminada] ON 

INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (1, 1, N'Gerente Regional', N'Es una comunicación abreviada, inmediata, a Seguridad Pública para que esta comunique al ENRE dentro de las 3 hs', 3, 1, N' Aviso urgente a Seguridad Pública', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (2, 1, N'Seguridad Pública', N'Presentación sintética con datos abreviados', 3, 1, N' Aviso urgente al ENRE dentro de las 3 horas', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (3, 1, N'Gerencia de Seguridad, Higiene y Medioambiente', N'Se envía a Seg Pública, quien envia al ENRE dentro de las 48 hs', 48, 1, N' Completar Formulario Informe accidentes', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (4, 1, N'Sector técnico correspondiente', N'Confección de la AC en el Sistema de Seguridad Pública', 48, 1, N' Confección de la Acción Correctiva', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (5, 1, N'Seguridad Pública', N'Es una nota más detallada, adjuntando Formulario de Informe de Accidentes mencionado antes', 48, 1, N' Aviso detallado al Enre dentro de las 48 hs', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (6, 1, N'Seguridad Pública', N'Se realiza una visita a la instalación para verficar que el accidente no puede repetirse hacia un tercero, en tal caso gestiona necesidades para que la aplique la GGRR', 200, 1, N' Confección formulario Causa Efecto. Visita a la instalación post accidente', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (7, 2, N'Gerente Regional', N'Es una comunicación abreviada, inmediata, a Seguridad Pública para que esta comunique al ENRE dentro de las 3 hs', 3, 1, N' Aviso urgente a Seguridad Pública', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (8, 2, N'Seguridad Pública', N'Informar a DG, DIR y DAL', 3, 1, N' Informar accidente internamente', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (9, 2, N'Seguridad Pública', N'Presentación sintética con datos abreviados', 3, 1, N' Aviso urgente al ENRE dentro de las 3 horas', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (10, 2, N'El sector técnico correspondiente', N'Se envía a Seg Pública, quien envia al ENRE dentro de las 48 hs', 48, 1, N' Completar Formulario Informe accidentes', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (11, 2, N'Sector técnico correspondiente', N'Caso de lesiones o muertes. Se envía a Seg Pública, quien envia al ENRE dentro de las 48 hs', 48, 1, N' Aviso y/o denuncia a autoridad Policial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (12, 2, N'Sector técnico correspondiente', N'Se envía a Seg Pública, quien envia al ENRE dentro de las 48 hs', 48, 1, N' Realizar constatación notarial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (13, 2, N'Sector técnico correspondiente', N'Tomar fotografias de la zona, y/o cualquier tipo de evidencia y documentación relevante', 48, 1, N' Generar documentación respaldatoria', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (14, 2, N'Sector técnico correspondiente', N'Solamente en caso de incendios', 3, 1, N' Aviso a Bomberos', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (15, 2, N'DALEI', N'En caso de que corresponda. Dependiendo del caso DAL debera definir si corresponde o no', 120, 1, N' Aviso a autoridad Judicial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (16, 2, N'Seguridad Pública', N'Es una nota más detallada, adjuntando Formulario de Informe de Accidentes mencionado en la fila 30. Esta nota ademas debe contener fotografias, la denuncia policial y/o notarial', 48, 1, N' Aviso detallado al ENRE dentro de las 48 hs', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (17, 2, N'Sector técnico correspondiente', N'Se envía a Seg Pública', 96, 1, N' Recabar notas periodísticas y otros antecedentes relacionados con el hecho', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (18, 2, N'Sector técnico correspondiente', N'Confección de la AC en el Sistema de Seguridad Pública', 48, 1, N' Confección de la Acción Correctiva', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (19, 2, N'Seguridad Pública', N'Se realiza una visita a la instalación para verficar que el accidente no puede repetirse hacia un tercero, en tal caso gestiona necesidades para que la aplique la GGRR', 200, 1, N' Confección formulario Causa Efecto. Visita a la instalación post accidente', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (20, 3, N'Gerente Regional', N'Es una comunicación abreviada, inmediata, a Seguridad Pública y GALyT', 200, 1, N' Aviso urgente a Seguridad Pública y GALyT', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (21, 3, N'Sector Técnico correspondiente', N'En caso de Incendios, caida de elementos de la línea, explosiones dentro de las instalaciones de la empresa o cuando un tercero tiene un contacto accidental con alguna parte viva de las instalaciones sin resultar heridos ni muertos', 200, 1, N' Aviso a autoridad Policial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (22, 3, N'Sector Técnico correspondiente', N'Solamente en caso de incendios', 200, 1, N' Aviso a Bomberos', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (23, 3, N'Sector técnico correspondiente', N'En caso de incendios, caida de elementos de la línea, explosiones dentro de las instalaciones de la empresa o cuando un tercero tiene un contacto accidental con alguna parte viva de las instalaciones sin resultar heridos ni muertos', 200, 1, N' Realizar constatación notarial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (24, 3, N'Sector técnico correspondiente', N'Tomar fotografias de la zona, y/o cualquier tipo de evidencia y documentación rellevante y enviar a Seguridad Pública', 200, 1, N' Generar documentación respaldatoria', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (25, 3, N'Sector técnico correspondiente', N'En todos los casos de incidentes se debe cargar una acción correctiva', 200, 1, N' Confección de AC', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (26, 3, N'Seguridad Pública', N'Es un documento enviado por Seguridad Pública donde se detallan todos los incidentes ocurridos en el semestre', 200, 1, N' Informe Semestral al ENRE', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (27, 3, N'Mto. de Líneas / Tierras.', N'Casos de problemas surgidos por acción de un Tercero, por ejemplo tala de arboles que al caer invaden la franja de seguridad, retiro de PaT en viñedos, etc.', 200, 1, N' Concientización a Propietarios / Terceros. Difusión de postulados de Seg, Pública y entrega de folleteria.', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (28, 4, N'Gerente Regional y/o Sector Técnico correspondiente', N'Es una comunicación abreviada que se realiza a Seguridad Pública y GALyT', 2000, 1, N' Aviso a Seguridad Pública y GALyT', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (29, 4, N'Sector técnico correspondiente-GALyT', N'Tomar fotografias de la zona, y/o cualquier tipo de evidencia y documentación relevante y enviar a Seguridad Pública', 2000, 1, N' Generar documentación respaldatoria', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (30, 4, N'Sector técnico correspondiente-Tierras', N'Actuación notarial con escribano en la zona de invasión crítica', 2000, 1, N' Realizar gestiones para actuación notarial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (31, 4, N'Sector técnico correspondiente-Tierras', N'En caso de intrusiones criticas GALyT realiza la denuncia ante al autoridad policial de la zona', 2000, 1, N' Denuncia ante autoridad Policial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (32, 4, N'GALyT', N'En caso de intrusiones criticas GALyT realiza la denuncia ante al autoridad Judicial competente y gestiones posteriores tendientes a la normalización', 2000, 1, N' Denuncia ante autoridad Judicial', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (33, 4, N'Gerente Regional-Sector Técnico correspondiente o G Mto/SP?', N'En todos los casos de incidentes se debe cargar una acción correctiva', 2000, 1, N' Confección de AC', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (34, 4, N'Seguridad Pública', N'Seguridad Pública envia nota solicitando la intervención del Municipio para resolver la intrusión', 2000, 1, N' Envío nota al Municipio', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (35, 4, N'Sector técnico correspondiente', N'Refuerzo de carteleria, verificar necesidades de retensado de conductores, colocación de aislación doble, verificación de correcta PaTs etc', 2000, 1, N' Verificaciones técnicas en la zona de la invasión critica', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (36, 4, N'Sector técnico correspondiente-Seguridad Pública', N'Aumento de frecuencia de recorridas en la zona. Verificación de alturas libres, medición de distancias, etc. Debe colaborar también Seguridad Pública.', 2000, 1, N' Aumento de recorridas en la zona', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (37, 4, N'Seguridad Pública', N'Informe semestral de incidentes se eleva al ENRE', 2000, 1, N' Informe semestral a ENRE', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (38, 4, N'GALyT-Seguridad Pública', N'Entregarle folletos, tomar datos que permitan notificar, etc', 2000, 1, N' Hablar con el ocupante,', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (39, 4, N'Seguridad Pública-GALyT-Sector técnico correspondiente', N'Concientización', 2000, 1, N' primera notificación por nota o verbal,', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (40, 4, N'GALyT', N'Carta Documento en caso que la instrucción persista', 2000, 1, N' Enviar Carta Documento', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (41, 4, N'DALEI', N'Inicio y realización de acciones legales, de persistir', 2000, 1, N' Inicio y realización de acciones legales, de persistir', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (42, 5, N'Gerente Regional y/o Sector Técnico correspondiente', N'Es una comunicación abreviada que se realiza a Seguridad Pública y GALyT', 2000, 1, N' Aviso a Seguridad Pública y GALyT', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (43, 5, N'GALyT', N'Tomar fotografias de la zona, y/o cualquier tipo de evidencia y documentación rellevante y enviar a Seguridad Pública', 2000, 1, N' Generar documentación respaldatoria', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (44, 5, N'GALyT', N'A los efectos que retire cartel, máquina, árboles', 2000, 1, N' Comunicación con el propietario o responsable de la plantación, cartel, maquinaria', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (45, 5, N'Sector técnico correspondiente / GALyT', N'En los casos en que no se pudo solucionar en corto plazo', 2000, 1, N' Confección de AC/AP', N'Cerrado')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (46, 5, N'Sector técnico correspondiente/tierras', N'Refuerzo de carteleria, verificar necesidades de retensado de conductores, alturas libres, etc', 2000, 1, N' Verificaciones técnicas en la zona de la invasión', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (47, 5, N'Sector técnico correspondiente/ GALyT/ Seguridad Pública', N'Aumento de frecuencia de recorridas en la zona', 2000, 1, N' Aumento de recorridas en la zona', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (48, 5, N'Seguridad Pública', N'Informe semestral de incidentes se eleva al ENRE', 2000, 1, N' Informe semestral a ENRE', N'Abierto')
INSERT [dbo].[TareaPredeterminada] ([ID_TareaPredeterminada], [ID_AccionPredeterminada], [Responsable], [Observaciones], [TiempoHs], [Activo], [Tarea], [EstadoInicial]) VALUES (49, 5, N'DAL', N'Envio de CD y en caso de persistir, inicio acciones legales', 2000, 1, N' Envio de carta documento y en caso de persistir, inicio acciones legales', N'Abierto')
SET IDENTITY_INSERT [dbo].[TareaPredeterminada] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id_usuario], [Apellido], [Nombre], [Email], [Activo], [Celular], [CodigoPostal], [Direccion], [DNI], [Localidad], [Telefono], [TipoDni], [Interno], [Firma], [Username], [ResponsableSP]) VALUES (1, N'Benitez', N'Andres', N'andres.benitez@transener.com.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, N'benitand', 1)
INSERT [dbo].[Usuario] ([Id_usuario], [Apellido], [Nombre], [Email], [Activo], [Celular], [CodigoPostal], [Direccion], [DNI], [Localidad], [Telefono], [TipoDni], [Interno], [Firma], [Username], [ResponsableSP]) VALUES (4, N'Caorsi', N'Patricio', N'patricio.caorsi@transba.com.ar', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, N'caorspat', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Accion]  WITH CHECK ADD  CONSTRAINT [FK_Accion_Codigo] FOREIGN KEY([id_codigo])
REFERENCES [dbo].[Codigo] ([ID_Codigo])
GO
ALTER TABLE [dbo].[Accion] CHECK CONSTRAINT [FK_Accion_Codigo]
GO
ALTER TABLE [dbo].[Accion]  WITH CHECK ADD  CONSTRAINT [FK_Accion_Sector] FOREIGN KEY([ID_Sector])
REFERENCES [dbo].[Sector] ([ID_Sector])
GO
ALTER TABLE [dbo].[Accion] CHECK CONSTRAINT [FK_Accion_Sector]
GO
ALTER TABLE [dbo].[ColaboradoresAccion]  WITH CHECK ADD  CONSTRAINT [FK_Colaboradores_Accion] FOREIGN KEY([ID_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[ColaboradoresAccion] CHECK CONSTRAINT [FK_Colaboradores_Accion]
GO
ALTER TABLE [dbo].[ColaboradoresAccion]  WITH CHECK ADD  CONSTRAINT [FK_Colaboradores_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[ColaboradoresAccion] CHECK CONSTRAINT [FK_Colaboradores_Usuario]
GO
ALTER TABLE [dbo].[ColaboradorTarea]  WITH CHECK ADD  CONSTRAINT [FK_ColaboradorTarea_Tarea] FOREIGN KEY([id_Tarea])
REFERENCES [dbo].[Tarea] ([ID_Tarea])
GO
ALTER TABLE [dbo].[ColaboradorTarea] CHECK CONSTRAINT [FK_ColaboradorTarea_Tarea]
GO
ALTER TABLE [dbo].[ColaboradorTarea]  WITH CHECK ADD  CONSTRAINT [FK_ColaboradorTarea_Usuario] FOREIGN KEY([id_Usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[ColaboradorTarea] CHECK CONSTRAINT [FK_ColaboradorTarea_Usuario]
GO
ALTER TABLE [dbo].[EstadoAccion]  WITH CHECK ADD  CONSTRAINT [FK_EstadoAccion_Accion] FOREIGN KEY([ID_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[EstadoAccion] CHECK CONSTRAINT [FK_EstadoAccion_Accion]
GO
ALTER TABLE [dbo].[EstadoTarea]  WITH CHECK ADD  CONSTRAINT [FK_EstadoTarea_Tarea] FOREIGN KEY([Id_Tarea])
REFERENCES [dbo].[Tarea] ([ID_Tarea])
GO
ALTER TABLE [dbo].[EstadoTarea] CHECK CONSTRAINT [FK_EstadoTarea_Tarea]
GO
ALTER TABLE [dbo].[FormularioAccidente]  WITH CHECK ADD  CONSTRAINT [FK_FormularioAccidente_Accion] FOREIGN KEY([ID_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[FormularioAccidente] CHECK CONSTRAINT [FK_FormularioAccidente_Accion]
GO
ALTER TABLE [dbo].[FormularioAccidenteDetalle]  WITH CHECK ADD  CONSTRAINT [FK_FormularioAccidenteDetalle_FormularioAccidente] FOREIGN KEY([ID_FormularioAccidente])
REFERENCES [dbo].[FormularioAccidente] ([id_FormularioAccidente])
GO
ALTER TABLE [dbo].[FormularioAccidenteDetalle] CHECK CONSTRAINT [FK_FormularioAccidenteDetalle_FormularioAccidente]
GO
ALTER TABLE [dbo].[MensajeAccion]  WITH CHECK ADD  CONSTRAINT [FK_MensajeAccion_Accion] FOREIGN KEY([Id_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[MensajeAccion] CHECK CONSTRAINT [FK_MensajeAccion_Accion]
GO
ALTER TABLE [dbo].[MensajeTarea]  WITH CHECK ADD  CONSTRAINT [FK_MensajeTarea_Tarea] FOREIGN KEY([Id_Tarea])
REFERENCES [dbo].[Tarea] ([ID_Tarea])
GO
ALTER TABLE [dbo].[MensajeTarea] CHECK CONSTRAINT [FK_MensajeTarea_Tarea]
GO
ALTER TABLE [dbo].[ReprogramacionAccion]  WITH CHECK ADD  CONSTRAINT [FK_ReprogramacionAccion_Accion] FOREIGN KEY([ID_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[ReprogramacionAccion] CHECK CONSTRAINT [FK_ReprogramacionAccion_Accion]
GO
ALTER TABLE [dbo].[ReprogramacionAccion]  WITH CHECK ADD  CONSTRAINT [FK_ReprogramacionAccion_Usuario] FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[ReprogramacionAccion] CHECK CONSTRAINT [FK_ReprogramacionAccion_Usuario]
GO
ALTER TABLE [dbo].[Sector]  WITH CHECK ADD  CONSTRAINT [FK_Sector_Region] FOREIGN KEY([ID_Region])
REFERENCES [dbo].[Region] ([Id_Region])
GO
ALTER TABLE [dbo].[Sector] CHECK CONSTRAINT [FK_Sector_Region]
GO
ALTER TABLE [dbo].[SectorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_SectorUsuario_Sector] FOREIGN KEY([ID_Sector])
REFERENCES [dbo].[Sector] ([ID_Sector])
GO
ALTER TABLE [dbo].[SectorUsuario] CHECK CONSTRAINT [FK_SectorUsuario_Sector]
GO
ALTER TABLE [dbo].[SectorUsuario]  WITH CHECK ADD  CONSTRAINT [FK_SectorUsuario_Usuario] FOREIGN KEY([ID_Usuario])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[SectorUsuario] CHECK CONSTRAINT [FK_SectorUsuario_Usuario]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Accion] FOREIGN KEY([Id_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Accion]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Usuario] FOREIGN KEY([Responsable])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Usuario]
GO
ALTER TABLE [dbo].[TareaPredeterminada]  WITH CHECK ADD  CONSTRAINT [FK_TareaPredeterminada_AccionPredeterminada] FOREIGN KEY([ID_AccionPredeterminada])
REFERENCES [dbo].[AccionPredeterminada] ([ID_AccionPredeterminada])
GO
ALTER TABLE [dbo].[TareaPredeterminada] CHECK CONSTRAINT [FK_TareaPredeterminada_AccionPredeterminada]
GO
ALTER TABLE [dbo].[WorkFlow]  WITH CHECK ADD  CONSTRAINT [FK_WorkFlow_Accion] FOREIGN KEY([ID_Accion])
REFERENCES [dbo].[Accion] ([id_Accion])
GO
ALTER TABLE [dbo].[WorkFlow] CHECK CONSTRAINT [FK_WorkFlow_Accion]
GO
ALTER TABLE [dbo].[WorkFlow]  WITH CHECK ADD  CONSTRAINT [FK_WorkFlow_Usuario] FOREIGN KEY([AprobadorN1])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[WorkFlow] CHECK CONSTRAINT [FK_WorkFlow_Usuario]
GO
ALTER TABLE [dbo].[WorkFlow]  WITH CHECK ADD  CONSTRAINT [FK_WorkFlow_Usuario1] FOREIGN KEY([AprobadorN2])
REFERENCES [dbo].[Usuario] ([Id_usuario])
GO
ALTER TABLE [dbo].[WorkFlow] CHECK CONSTRAINT [FK_WorkFlow_Usuario1]
GO
USE [master]
GO
ALTER DATABASE [SP] SET  READ_WRITE 
GO
