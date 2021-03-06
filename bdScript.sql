USE [master]
GO
/****** Object:  Database [laprisionbd]    Script Date: 27/04/2016 10:30:26 ******/
CREATE DATABASE [laprisionbd]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'laprisionbd', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\laprisionbd.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'laprisionbd_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\laprisionbd_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [laprisionbd] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [laprisionbd].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [laprisionbd] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [laprisionbd] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [laprisionbd] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [laprisionbd] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [laprisionbd] SET ARITHABORT OFF 
GO
ALTER DATABASE [laprisionbd] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [laprisionbd] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [laprisionbd] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [laprisionbd] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [laprisionbd] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [laprisionbd] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [laprisionbd] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [laprisionbd] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [laprisionbd] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [laprisionbd] SET  DISABLE_BROKER 
GO
ALTER DATABASE [laprisionbd] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [laprisionbd] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [laprisionbd] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [laprisionbd] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [laprisionbd] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [laprisionbd] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [laprisionbd] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [laprisionbd] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [laprisionbd] SET  MULTI_USER 
GO
ALTER DATABASE [laprisionbd] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [laprisionbd] SET DB_CHAINING OFF 
GO
ALTER DATABASE [laprisionbd] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [laprisionbd] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [laprisionbd] SET DELAYED_DURABILITY = DISABLED 
GO
USE [laprisionbd]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumnos](
	[LetraCarrera] [char](1) NOT NULL,
	[Numero] [int] IDENTITY(1,1) NOT NULL,
	[CodigoAlumno]  AS (([LetraCarrera]+'-')+right('0000000000'+CONVERT([varchar](12),[Numero]),(10))),
	[NombreAlumno] [varchar](100) NOT NULL,
	[ApellidosAlumno] [varchar](200) NOT NULL,
	[DireccionAlumno] [varchar](100) NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[LetraCarrera] ASC,
	[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ambiente]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ambiente](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ambiente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Apuesta]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apuesta](
	[id] [int] NOT NULL,
	[idPelea] [int] NOT NULL,
	[suma] [money] NOT NULL,
 CONSTRAINT [PK_Apuesta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Apuesta/Apostador]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Apuesta/Apostador](
	[idApuesta] [int] NOT NULL,
	[idApostador] [int] NOT NULL,
	[idLuchador] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Arma]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arma](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Arma] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Celda]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Celda](
	[id] [int] NOT NULL,
	[idDimensiones] [int] NOT NULL,
	[capacidad] [int] NOT NULL,
 CONSTRAINT [PK_Celda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Celda/Comodidad]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Celda/Comodidad](
	[idCelda] [int] NOT NULL,
	[idComodidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comodidad]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comodidad](
	[idComodidad] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Comodidad] PRIMARY KEY CLUSTERED 
(
	[idComodidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Condena]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condena](
	[id] [int] NOT NULL,
	[numero_dias] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[fecha_fin] [date] NOT NULL,
	[idJuez] [int] NOT NULL,
	[idDelito] [int] NOT NULL,
 CONSTRAINT [PK_Condena] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delito]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delito](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Delito] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimensiones]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimensiones](
	[id] [int] NOT NULL,
	[ancho] [numeric](18, 0) NOT NULL,
	[largo] [numeric](18, 0) NOT NULL,
	[alto] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Dimensiones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guardia]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardia](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[salario] [money] NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
 CONSTRAINT [PK_Guardia] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guardia/Celda]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guardia/Celda](
	[idGuardia] [int] NOT NULL,
	[idCelda] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Juez]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juez](
	[id] [int] NOT NULL,
 CONSTRAINT [PK_Juez] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pelea]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pelea](
	[id] [int] NOT NULL,
	[idLuchador_1] [int] NOT NULL,
	[idLuchador_2] [int] NOT NULL,
	[idArma_l1] [int] NOT NULL,
	[idArma_l2] [int] NOT NULL,
	[idAmbiente] [int] NOT NULL,
 CONSTRAINT [PK_Pelea] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prisionero]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisionero](
	[id] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[fecha_nac] [date] NOT NULL,
	[sexo] [int] NOT NULL,
	[raza] [int] NOT NULL,
 CONSTRAINT [PK_Prisionero] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prisionero/Celda]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisionero/Celda](
	[idPrisionero] [int] NOT NULL,
	[idCelda] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Prisionero/Condena]    Script Date: 27/04/2016 10:30:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prisionero/Condena](
	[idCondena] [int] NOT NULL,
	[idPrisionero] [int] NOT NULL
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Apuesta]  WITH CHECK ADD  CONSTRAINT [FK_Apuesta_Pelea] FOREIGN KEY([idPelea])
REFERENCES [dbo].[Pelea] ([id])
GO
ALTER TABLE [dbo].[Apuesta] CHECK CONSTRAINT [FK_Apuesta_Pelea]
GO
ALTER TABLE [dbo].[Apuesta/Apostador]  WITH CHECK ADD  CONSTRAINT [FK_Apuesta/Apostador_Apuesta] FOREIGN KEY([idApuesta])
REFERENCES [dbo].[Apuesta] ([id])
GO
ALTER TABLE [dbo].[Apuesta/Apostador] CHECK CONSTRAINT [FK_Apuesta/Apostador_Apuesta]
GO
ALTER TABLE [dbo].[Celda]  WITH CHECK ADD  CONSTRAINT [FK_Celda_Dimensiones] FOREIGN KEY([idDimensiones])
REFERENCES [dbo].[Dimensiones] ([id])
GO
ALTER TABLE [dbo].[Celda] CHECK CONSTRAINT [FK_Celda_Dimensiones]
GO
ALTER TABLE [dbo].[Celda/Comodidad]  WITH CHECK ADD  CONSTRAINT [FK_Celda/Comodidad_Celda] FOREIGN KEY([idCelda])
REFERENCES [dbo].[Celda] ([id])
GO
ALTER TABLE [dbo].[Celda/Comodidad] CHECK CONSTRAINT [FK_Celda/Comodidad_Celda]
GO
ALTER TABLE [dbo].[Celda/Comodidad]  WITH CHECK ADD  CONSTRAINT [FK_Celda/Comodidad_Comodidad] FOREIGN KEY([idCelda])
REFERENCES [dbo].[Comodidad] ([idComodidad])
GO
ALTER TABLE [dbo].[Celda/Comodidad] CHECK CONSTRAINT [FK_Celda/Comodidad_Comodidad]
GO
ALTER TABLE [dbo].[Condena]  WITH CHECK ADD  CONSTRAINT [FK_Condena_Delito] FOREIGN KEY([idDelito])
REFERENCES [dbo].[Delito] ([id])
GO
ALTER TABLE [dbo].[Condena] CHECK CONSTRAINT [FK_Condena_Delito]
GO
ALTER TABLE [dbo].[Condena]  WITH CHECK ADD  CONSTRAINT [FK_Condena_Juez] FOREIGN KEY([idJuez])
REFERENCES [dbo].[Juez] ([id])
GO
ALTER TABLE [dbo].[Condena] CHECK CONSTRAINT [FK_Condena_Juez]
GO
ALTER TABLE [dbo].[Guardia/Celda]  WITH CHECK ADD  CONSTRAINT [FK_Guardia/Celda_Celda] FOREIGN KEY([idCelda])
REFERENCES [dbo].[Celda] ([id])
GO
ALTER TABLE [dbo].[Guardia/Celda] CHECK CONSTRAINT [FK_Guardia/Celda_Celda]
GO
ALTER TABLE [dbo].[Guardia/Celda]  WITH CHECK ADD  CONSTRAINT [FK_Guardia/Celda_Guardia] FOREIGN KEY([idGuardia])
REFERENCES [dbo].[Guardia] ([id])
GO
ALTER TABLE [dbo].[Guardia/Celda] CHECK CONSTRAINT [FK_Guardia/Celda_Guardia]
GO
ALTER TABLE [dbo].[Pelea]  WITH CHECK ADD  CONSTRAINT [FK_Pelea_Ambiente] FOREIGN KEY([idAmbiente])
REFERENCES [dbo].[Ambiente] ([id])
GO
ALTER TABLE [dbo].[Pelea] CHECK CONSTRAINT [FK_Pelea_Ambiente]
GO
ALTER TABLE [dbo].[Pelea]  WITH CHECK ADD  CONSTRAINT [FK_Pelea_Arma] FOREIGN KEY([idArma_l1])
REFERENCES [dbo].[Arma] ([id])
GO
ALTER TABLE [dbo].[Pelea] CHECK CONSTRAINT [FK_Pelea_Arma]
GO
ALTER TABLE [dbo].[Pelea]  WITH CHECK ADD  CONSTRAINT [FK_Pelea_Arma1] FOREIGN KEY([idArma_l2])
REFERENCES [dbo].[Arma] ([id])
GO
ALTER TABLE [dbo].[Pelea] CHECK CONSTRAINT [FK_Pelea_Arma1]
GO
ALTER TABLE [dbo].[Pelea]  WITH CHECK ADD  CONSTRAINT [FK_Pelea_Prisionero] FOREIGN KEY([idLuchador_1])
REFERENCES [dbo].[Prisionero] ([id])
GO
ALTER TABLE [dbo].[Pelea] CHECK CONSTRAINT [FK_Pelea_Prisionero]
GO
ALTER TABLE [dbo].[Pelea]  WITH CHECK ADD  CONSTRAINT [FK_Pelea_Prisionero1] FOREIGN KEY([idLuchador_2])
REFERENCES [dbo].[Prisionero] ([id])
GO
ALTER TABLE [dbo].[Pelea] CHECK CONSTRAINT [FK_Pelea_Prisionero1]
GO
ALTER TABLE [dbo].[Prisionero/Celda]  WITH CHECK ADD  CONSTRAINT [FK_Prisionero/Celda_Celda] FOREIGN KEY([idCelda])
REFERENCES [dbo].[Celda] ([id])
GO
ALTER TABLE [dbo].[Prisionero/Celda] CHECK CONSTRAINT [FK_Prisionero/Celda_Celda]
GO
ALTER TABLE [dbo].[Prisionero/Celda]  WITH CHECK ADD  CONSTRAINT [FK_Prisionero/Celda_Prisionero] FOREIGN KEY([idPrisionero])
REFERENCES [dbo].[Prisionero] ([id])
GO
ALTER TABLE [dbo].[Prisionero/Celda] CHECK CONSTRAINT [FK_Prisionero/Celda_Prisionero]
GO
ALTER TABLE [dbo].[Prisionero/Condena]  WITH CHECK ADD  CONSTRAINT [FK_Prisionero/Condena_Condena] FOREIGN KEY([idCondena])
REFERENCES [dbo].[Condena] ([id])
GO
ALTER TABLE [dbo].[Prisionero/Condena] CHECK CONSTRAINT [FK_Prisionero/Condena_Condena]
GO
ALTER TABLE [dbo].[Prisionero/Condena]  WITH CHECK ADD  CONSTRAINT [FK_Prisionero/Condena_Prisionero] FOREIGN KEY([idPrisionero])
REFERENCES [dbo].[Prisionero] ([id])
GO
ALTER TABLE [dbo].[Prisionero/Condena] CHECK CONSTRAINT [FK_Prisionero/Condena_Prisionero]
GO
USE [master]
GO
ALTER DATABASE [laprisionbd] SET  READ_WRITE 
GO
