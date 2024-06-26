USE [master]
GO
/****** Object:  Database [GameDB]    Script Date: 26/10/2023 18:48:17 ******/
CREATE DATABASE [GameDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Games', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Games.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Games_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Games_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GameDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GameDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameDB] SET  MULTI_USER 
GO
ALTER DATABASE [GameDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GameDB] SET QUERY_STORE = OFF
GO
USE [GameDB]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[EstadoNome] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventoLogs]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventoLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TipoEvento] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genero]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genero](
	[GeneroID] [int] IDENTITY(1,1) NOT NULL,
	[Genero] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[GeneroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DataHora] [datetime] NULL,
	[TipoEvento] [int] NULL,
	[Mensagem] [nvarchar](300) NULL,
	[Exception] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[N3DS]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[N3DS](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](150) NULL,
	[Serial] [varchar](25) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroId] [int] NULL,
	[Lancamento] [date] NULL,
	[Tamanho] [float] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [varchar](150) NULL,
	[Observacoes] [varchar](300) NULL,
	[Suporte3D] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plataforma](
	[PlataformaId] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [nvarchar](50) NULL,
	[Console] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlataformaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS2]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS2](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](250) NULL,
	[Serial] [varchar](25) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroId] [int] NULL,
	[Lancamento] [datetime] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [datetime] NULL,
	[LocalAdq] [varchar](30) NULL,
	[Observacoes] [varchar](max) NULL,
	[Widescreen] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS3]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS3](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](350) NULL,
	[Serial] [nvarchar](15) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroID] [int] NULL,
	[Lancamento] [date] NULL,
	[Preco] [decimal](5, 2) NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [nvarchar](100) NULL,
	[Observacoes] [nvarchar](300) NULL,
	[Instalacao] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS4]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS4](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](350) NULL,
	[Serial] [nvarchar](25) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroID] [int] NULL,
	[Lancamento] [date] NULL,
	[Tamanho] [float] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [nvarchar](100) NULL,
	[Observacoes] [nvarchar](300) NULL,
	[PS4Pro] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS5]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS5](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](350) NULL,
	[Serial] [nvarchar](25) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroID] [int] NULL,
	[Lancamento] [date] NULL,
	[Tamanho] [float] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [nvarchar](100) NULL,
	[Observacoes] [nvarchar](300) NULL,
	[Dualsense] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regiao]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regiao](
	[RegiaoId] [int] IDENTITY(1,1) NOT NULL,
	[Regiao] [nvarchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegiaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xbox360]    Script Date: 26/10/2023 18:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Xbox360](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](350) NULL,
	[Serial] [nvarchar](25) NULL,
	[RegiaoId] [int] NULL,
	[PlataformaId] [int] NULL,
	[GeneroID] [int] NULL,
	[Lancamento] [date] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [nvarchar](100) NULL,
	[Observacoes] [nvarchar](300) NULL,
	[Kinect] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (1, N'Jogando')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (2, N'Na Fila')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (3, N'Na Lista')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (4, N'Casual')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (5, N'Replay')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (6, N'Congelado')
INSERT [dbo].[Estado] ([estadoID], [EstadoNome]) VALUES (8, N'Restrito')
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[EventoLogs] ON 

INSERT [dbo].[EventoLogs] ([ID], [TipoEvento]) VALUES (1, N'Erro')
INSERT [dbo].[EventoLogs] ([ID], [TipoEvento]) VALUES (2, N'Informação')
SET IDENTITY_INSERT [dbo].[EventoLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Genero] ON 

INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (2, N'Ação')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (3, N'Aventura')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (4, N'Corrida')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (5, N'RPG')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (6, N'Compilação')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (7, N'Luta')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (8, N'Simulador')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (9, N'Survivor Horror')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (10, N'Rítimico')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (11, N'Plataforma')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (12, N'Esporte')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (13, N'FPS')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (14, N'TPS')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (15, N'Estrategia')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (16, N'Indie')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (19, N'Hack N'' Slash')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (27, N'Misc')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[N3DS] ON 

INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (1, N'Mario Party - Island Tour', N'CTR-ATSE', 1, 3, 27, CAST(N'2013-11-22' AS Date), 175.5, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital, Versão Nintendo Select', 1, 4)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (2, N'Super Mario 3D Land', N'CTR-AREE', 1, 3, 3, CAST(N'2013-11-03' AS Date), 222.9, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital', 1, 8)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (3, N'Super Mario Maker For 3DS', N'CTR-AJHE', 1, 3, 27, CAST(N'2015-09-10' AS Date), 221, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital', 0, 4)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (4, N'The Legend Of Zelda - Ocarina Of Time 3D', N'CTR-AQEE', 1, 3, 3, CAST(N'2011-11-16' AS Date), 454.57, 147.38, CAST(N'2023-06-09' AS Date), N'Shopee', N'Completo com Manual', 1, 3)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (5, N'Hot Wheels - World''s Best Driver', N'CTR-AEAE', 1, 3, 4, CAST(N'2013-09-17' AS Date), 654.57, 49.84, CAST(N'2023-07-10' AS Date), N'Shopee', N'Completo com Manual', 1, 5)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (6, N'Beyblade Evolution', N'CTR-ARXE', 2, 3, 27, CAST(N'2013-10-29' AS Date), 179, 62.68, CAST(N'2023-08-08' AS Date), N'Shopee', N'Completo com Manual', 1, 2)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (7, N'Teste', N'CTR-TEST', 1, 3, 5, CAST(N'2012-02-15' AS Date), 435, 150, CAST(N'2023-10-26' AS Date), N'Teste', N'Teste Truncate', 1, 3)
SET IDENTITY_INSERT [dbo].[N3DS] OFF
GO
SET IDENTITY_INSERT [dbo].[Plataforma] ON 

INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (1, N'Sony', N'Playstation 3')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (2, N'Sony', N'Playstation 4')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (3, N'Nintendo', N'New 3DS XL')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (5, N'Sony', N'Playstation 5')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (6, N'Microsoft', N'Xbox 360')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (7, N'Sony', N'Playstation 2')
SET IDENTITY_INSERT [dbo].[Plataforma] OFF
GO
SET IDENTITY_INSERT [dbo].[PS2] ON 

INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (1, N'Guitar Hero I', N'SLUS-21224', 1, 7, 10, CAST(N'2005-11-08T00:00:00.000' AS DateTime), 176.94, CAST(N'2023-06-26T00:00:00.000' AS DateTime), N'Ebay (USA)', N'Completo', 1, 5)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (2, N'Socom US Navy Seals 1', N'SCUS-97230', 1, 7, 14, CAST(N'2002-08-27T00:00:00.000' AS DateTime), 43.44, CAST(N'2023-10-10T00:00:00.000' AS DateTime), N'Shopee', N'Completo, Versão Greatest hits', 0, 1)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (3, N'Guitar Hero II', N'SLUS-21447', 1, 7, 10, CAST(N'2006-11-07T00:00:00.000' AS DateTime), 141.36, CAST(N'2023-10-26T00:00:00.000' AS DateTime), N'Shopee', N'Completo', 1, 5)
SET IDENTITY_INSERT [dbo].[PS2] OFF
GO
SET IDENTITY_INSERT [dbo].[PS3] ON 

INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (2, N'Alice - Madness Return', N'BLAS-50467', 5, 1, 3, CAST(N'2011-06-14' AS Date), CAST(197.49 AS Decimal(5, 2)), CAST(N'2023-02-23' AS Date), N'Shopee', N'Completo, Versão Chinesa', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (3, N'Assassin''s Creed 1 ', N'BLUS-30089SA ', 1, 1, 2, CAST(N'2007-11-13' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo, Versão Greatest Hits', 1, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (4, N'Battlefield - Bad Company 1', N'BLUS-30118', 1, 1, 13, CAST(N'2008-06-23' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-10' AS Date), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (6, N'Bioshock 1', N'BLES-00316', 3, 1, 13, CAST(N'2007-08-27' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2022-07-04' AS Date), N'Shopee', N'Versão especial com luva foil', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (7, N'Brütal Legend', N'BLUS-30330', 1, 1, 3, CAST(N'2009-10-13' AS Date), CAST(69.90 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Completo', 1, 2)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (8, N'Castlevania - Lords Of Shadows 1', N'BLUS-30339S', 1, 1, 19, CAST(N'2010-10-05' AS Date), CAST(54.99 AS Decimal(5, 2)), CAST(N'2023-01-06' AS Date), N'Shopee', N'Completo', NULL, 2)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (9, N'Demon''s Souls', N'BLUS-30443GH', 1, 1, 5, CAST(N'2009-02-05' AS Date), CAST(105.96 AS Decimal(5, 2)), CAST(N'2022-08-17' AS Date), N'Shopee', N'Versão Greatest Hits, Completo', NULL, 2)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (10, N'Diablo III Ultimate Evil Edition', N'BLUS-31438', 2, 1, 5, CAST(N'2014-08-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (11, N'F1 2010', N'BLUS-30379', 1, 1, 4, CAST(N'2010-09-22' AS Date), CAST(38.27 AS Decimal(5, 2)), CAST(N'2022-09-29' AS Date), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (12, N'God of War: Ascension', N'BCUS-98232', 2, 1, 19, CAST(N'2013-03-12' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2021-01-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (13, N'God Of War III', N'BCUS-98111', 1, 1, 19, CAST(N'2010-03-16' AS Date), CAST(62.71 AS Decimal(5, 2)), CAST(N'2022-11-08' AS Date), N'Shopee', N'Completo', 0, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (14, N'Gran turismo 5 XL', N'BCUS-98394', 2, 1, 4, CAST(N'2010-11-24' AS Date), CAST(60.00 AS Decimal(5, 2)), CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (15, N'Gran turismo 6', N'BCUS-99247', 2, 1, 4, CAST(N'2013-12-06' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2021-07-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (16, N'Grid 1', N'BLUS-30142', 2, 1, 4, CAST(N'2008-05-30' AS Date), CAST(43.27 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Versão Brasileira Relançada, completo', NULL, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (17, N'Guitar Hero 6 - Warriors Of Rock', N'BLUS-30487', 1, 1, 10, CAST(N'2010-09-28' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-02-08' AS Date), N'Shopee', N'Completo, Bundle com a Guitarra', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (18, N'Mass Effect 1 (Mass Effect Colletion)', N'BLUS-31139P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(128.97 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (19, N'Metal Gear 4 - Guns Of the Patriots', N'BLUS-30109GHL', 1, 1, 2, CAST(N'2008-06-12' AS Date), CAST(29.90 AS Decimal(5, 2)), CAST(N'2022-06-08' AS Date), N'Shopee', N'Completo, Versão Greatest hits', 1, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (20, N'Metal Gear Rising - Revengeance', N'BLUS-31045S', 1, 1, 19, CAST(N'2013-02-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (21, N'Need For Speed Carbon', N'BLES-00020', 3, 1, 4, CAST(N'2006-10-30' AS Date), CAST(129.90 AS Decimal(5, 2)), CAST(N'2022-07-05' AS Date), N'Shopee', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (22, N'The Last Of Us', N'BCUS-98174', 2, 1, 2, CAST(N'2013-06-16' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (23, N'Tom Clancy''s Splinter Cell Trilogy', N'BLUS-30761', 1, 1, 6, CAST(N'2011-09-27' AS Date), CAST(35.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', NULL, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (24, N'White Knight Chronicles 1', N'BCUS-98146', 1, 1, 5, CAST(N'2010-02-02' AS Date), CAST(77.59 AS Decimal(5, 2)), CAST(N'2022-05-15' AS Date), N'Shopee', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (25, N'Xcom: enemy Within', N'BLUS-31180', 2, 1, 15, CAST(N'2013-11-12' AS Date), CAST(39.90 AS Decimal(5, 2)), CAST(N'2022-05-08' AS Date), N'Livraria Leitura', N'Completo Novo e Lacrado', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (26, N'Mass Effect 2 (Mass Effect Colletion)', N'BLUS-30650P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(128.97 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (27, N'Mass Effect 3 (Mass Effect Collection)', N'BLUS-30853P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(128.97 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (28, N'Resistance 1 - Fall Of Man', N'BCUS-98107', 1, 1, 13, CAST(N'2006-11-17' AS Date), CAST(47.59 AS Decimal(5, 2)), CAST(N'2023-04-11' AS Date), N'Shopee', N'Versão Greatest Hits, Completo', 1, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (29, N'Red Dead Redemption 1', N'BLUS-30418', 1, 1, 2, CAST(N'2010-05-18' AS Date), CAST(77.69 AS Decimal(5, 2)), CAST(N'2023-04-12' AS Date), N'Shopee', N'Completo Com Mapa', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (30, N'Final Fantasy XIII', N'BLUS-30416', 1, 1, 5, CAST(N'2010-03-09' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-06-08' AS Date), N'Joana', N'Completo, Capa Foil', 0, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (31, N'Uncharted 1 - Drake''s Fortune', N'BCUS-90083', 1, 1, 2, CAST(N'2007-11-19' AS Date), CAST(48.69 AS Decimal(5, 2)), CAST(N'2023-06-09' AS Date), N'Shopee', N'Copmleto, versão greatest Hits', 0, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (32, N'Darksiders 1', N'BLES-00705', 3, 1, 19, CAST(N'2010-01-05' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-06-14' AS Date), N'Dubai Games', N'Completo', 0, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (33, N'Band Hero', N'BLUS-30372L', 1, 1, 10, CAST(N'2009-11-03' AS Date), CAST(45.00 AS Decimal(5, 2)), CAST(N'2023-07-20' AS Date), N'RetroTeka Live', N'Completo', 0, 2)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (34, N'Midnight Club - Los Angeles Complete Edition', N'BLES-00652P', 3, 1, 4, CAST(N'2013-05-20' AS Date), CAST(59.90 AS Decimal(5, 2)), CAST(N'2023-07-21' AS Date), N'Shopee', N'Completo, Edição Platinum', 0, 2)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (36, N'Dead Island - Game Of the Year Edition', N'BLUS-31026GH', 1, 1, 9, CAST(N'2012-06-26' AS Date), CAST(30.90 AS Decimal(5, 2)), CAST(N'2023-09-05' AS Date), N'Shopee', N'Versão completa com todas as DLC', 0, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (37, N'Colin McRae Dirt 1', N'BLES-00095/P', 3, 1, 4, CAST(N'2007-07-15' AS Date), CAST(63.45 AS Decimal(5, 2)), CAST(N'2023-10-10' AS Date), N'Shopee', N'Completo. Manual em Alemão', 0, 3)
SET IDENTITY_INSERT [dbo].[PS3] OFF
GO
SET IDENTITY_INSERT [dbo].[PS4] ON 

INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (2, N'Call Of Duty - Infinite Warfare', N'CUSA-06443', 2, 2, 13, CAST(N'2016-04-11' AS Date), 70, 60, CAST(N'2022-08-13' AS Date), N'Marcos Gunner', N'Completo', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (3, N'Dark Souls 1 (Dark Souls Trilogy)', N'CUSA-08495', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 103.24, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Edição de Colecionador, lacrado', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (4, N'Gran Turismo Sport', N'CUSA-03220', 2, 2, 4, CAST(N'2017-10-17' AS Date), 60, 50, CAST(N'2022-08-02' AS Date), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (5, N'Dark Souls 2 (Dark Souls Trilogy)', N'CUSA-01589', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 103.24, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Edição de Colecionador, lacrado', 1, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (6, N'Dark Souls 3 (Dark Souls Trilogy)', N'CUSA-07439', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 103.24, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Edição de Colecionador, lacrado', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (7, N'God Of War 2018', N'CUSA-07408', 2, 2, 19, CAST(N'2018-04-20' AS Date), 55, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Veio com o Videogame', 1, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (8, N'Grand Theft Auto V', N'CUSA-00419SA', 2, 2, 2, CAST(N'2014-11-18' AS Date), 59, 120, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo com Mapa', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (9, N'Gravity Rush 2 ', N'CUSA-03694', 2, 2, 11, CAST(N'2017-01-18' AS Date), 17, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (10, N'Horizon - Zero Dawn Complete Edition', N'CUSA-10237', 2, 2, 3, CAST(N'2017-02-28' AS Date), 49, 60, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo, Greatest Hits', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (11, N'Killzone - Shadow''s Fall', N'CUSA-00190', 1, 2, 13, CAST(N'2013-11-15' AS Date), 40, 40, CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (12, N'Medievil', N'CUSA-11227', 2, 2, 3, CAST(N'2019-10-25' AS Date), 25, 68, CAST(N'2022-06-08' AS Date), N'Shopee', N'Lacrado', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (13, N'Middle Earth - Shadow Of Mordor', N'CUSA-00053', 6, 2, 19, CAST(N'2014-09-30' AS Date), 29, 60, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (14, N'Need For Speed - Payback', N'CUSA-05999', 2, 2, 4, CAST(N'2017-09-10' AS Date), 45, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Veio com o Videogame', 1, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (15, N'Need For Speed - Rivals', N'PLAS-05007', 5, 2, 4, CAST(N'2013-11-15' AS Date), 25, 55.45, CAST(N'2022-10-06' AS Date), N'Meu Game Usado', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (17, N'Red Dead Redemption II', N'CUSA-11081/CUSA-03041', 2, 2, 2, CAST(N'2018-10-26' AS Date), 105, 100, CAST(N'2022-08-13' AS Date), N'Marcos Gunner', N'Copmleto com mapa', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (18, N'Resident Evil - Origins Collection', N'CUSA-02882', 6, 2, 9, CAST(N'2016-01-19' AS Date), 27, 120, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (19, N'Resident Evil 4', N'CUSA-04885', 2, 2, 9, CAST(N'2016-08-30' AS Date), 6.5, 120, CAST(N'2022-12-30' AS Date), N'Fox Games', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (20, N'Shadow Of The Colossus', N'CUSA-08034', 2, 2, 3, CAST(N'2018-02-06' AS Date), 14, 74, CAST(N'2022-12-09' AS Date), N'Shopee', N'Completo', 1, 1)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (21, N'Spider-Man', N'CUSA-02299', 2, 2, 3, CAST(N'2018-09-07' AS Date), 45, 100, CAST(N'2022-08-20' AS Date), N'Marcos Gunner', N'Completo', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (22, N'Spyro Reignited Trilogy', N'CUSA-12125', 2, 2, 11, CAST(N'2018-11-13' AS Date), 55, 79, CAST(N'2022-07-06' AS Date), N'Shopee', N'Completo', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (23, N'Star Wars - Jedi Fallen Order', N'CUSA-12539', 2, 2, 19, CAST(N'2019-11-10' AS Date), 55, 60, CAST(N'2022-05-08' AS Date), N'Lucas Santana', N'Completo', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (24, N'Grand Theft Auto The Trilogy Remastered', N'CUSA-29728', 2, 2, 2, CAST(N'2021-11-11' AS Date), 43, 100, CAST(N'2023-11-07' AS Date), N'JP Games', N'Completo', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (25, N'CyberPunk 2077', N'CUSA-16596/CUSA-16597', 2, 2, 5, CAST(N'2020-10-12' AS Date), 70, 60, CAST(N'2023-11-07' AS Date), N'JP Games', N'Edição Especial com Luva e Mapa', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (26, N'The Order 1886', N'CUSA-00785', 2, 2, 2, CAST(N'2015-02-20' AS Date), 50, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (27, N'Tomb Raider Definitive Edition', N'CUSA-00109', 3, 2, 3, CAST(N'2014-01-18' AS Date), 23, 80, CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (28, N'Watch_Dogs 2', N'CUSA-04459', 2, 2, 2, CAST(N'2016-11-15' AS Date), 30, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (29, N'Murdered - Soul Suspect', N'CUSA-00343', 1, 2, 9, CAST(N'2014-06-03' AS Date), 11, 50, CAST(N'2022-12-13' AS Date), N'Shopee', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (30, N'Watch_Dogs 1', N'CUSA-00021', 1, 2, 2, CAST(N'2014-05-26' AS Date), 21, 55, CAST(N'2022-04-06' AS Date), N'Shopee', N'Completo', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (31, N'Aragami - Collectors Edition', N'CUSA-06168', 2, 2, 16, CAST(N'2016-10-04' AS Date), 10, 127.69, CAST(N'2023-05-08' AS Date), N'Shopee', N'Completo, Edição de colecionador', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (32, N'Sniper Elite III - Afrika', N'CUSA-00378', 1, 2, 14, CAST(N'2014-06-26' AS Date), 26, 80, CAST(N'2023-06-07' AS Date), N'Shopee', N'Completo', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (33, N'Mortal Kombat XL', N'CUSA-03589', 2, 2, 7, CAST(N'2016-01-03' AS Date), 45, 60, CAST(N'2023-11-07' AS Date), N'JP Games', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (34, N'TESTE09042023-14.22', N'CUSA-00000', 3, 2, 11, CAST(N'2020-04-09' AS Date), 118, 92.57, CAST(N'2023-06-09' AS Date), N'TESTE', N'TEsteEndpoint', 1, 6)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (35, N'TESTE09042023-14.23', N'CUSA-00000', 4, 2, 10, CAST(N'2013-12-14' AS Date), 97, 140.79, CAST(N'2023-06-09' AS Date), N'TESTE', N'TEsteEndpoint', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (38, N'TesteProduto', N'CUSA-00000', 1, 2, 28, CAST(N'2023-08-21' AS Date), 50, 200, CAST(N'2023-08-29' AS Date), N'MercadoLivre', N'Completo', 1, 8)
SET IDENTITY_INSERT [dbo].[PS4] OFF
GO
SET IDENTITY_INSERT [dbo].[PS5] ON 

INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (2, N'Kena And The Bridge Of Spirits', N'PPSA-01746', 1, 5, 3, CAST(N'2021-09-21' AS Date), 19, 189.9, CAST(N'2023-08-21' AS Date), N'Shopee', N'Completo, Lacrado', 1, 3)
SET IDENTITY_INSERT [dbo].[PS5] OFF
GO
SET IDENTITY_INSERT [dbo].[Regiao] ON 

INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (1, N'EUA')
INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (2, N'BRA')
INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (3, N'EUR')
INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (4, N'JPN')
INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (5, N'CHN')
INSERT [dbo].[Regiao] ([RegiaoId], [Regiao]) VALUES (6, N'AUS')
SET IDENTITY_INSERT [dbo].[Regiao] OFF
GO
SET IDENTITY_INSERT [dbo].[Xbox360] ON 

INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (1, N'Kinect Adventures', N'J7D-00030', 1, 6, 27, CAST(N'2010-11-04' AS Date), 0, CAST(N'2023-07-03' AS Date), N'Shopee', N'Encarte reimpresso, Bundle com o Kinect', 1, 4)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (2, N'Devil May Cry HD Collection', N'01338893101-9', 1, 6, 19, CAST(N'2012-03-22' AS Date), 124.48, CAST(N'2023-07-08' AS Date), N'Shopee', N'Completo com Manual', 0, 3)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (3, N'Dragon Age Origins', N'0146331580-6', 1, 6, 5, CAST(N'2009-11-02' AS Date), 62.3, CAST(N'2023-10-04' AS Date), N'Shopee', N'Completo com Manual', 0, 3)
SET IDENTITY_INSERT [dbo].[Xbox360] OFF
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([TipoEvento])
REFERENCES [dbo].[EventoLogs] ([ID])
GO
ALTER TABLE [dbo].[N3DS]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[N3DS]  WITH CHECK ADD FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[N3DS]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[N3DS]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[PS2]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[PS2]  WITH CHECK ADD FOREIGN KEY([GeneroId])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[PS2]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[PS2]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[PS4]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[PS4]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[PS4]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[PS4]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[PS5]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[PS5]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[PS5]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[PS5]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[Xbox360]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[Xbox360]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[Xbox360]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[Xbox360]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_N3DS]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--convert (varchar, [Tamanho]) as Tamanho
CREATE PROCEDURE [dbo].[Listar_Jogos_N3DS]
AS
BEGIN
	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
      ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,convert(varchar, [Lancamento], 103) as Lancamento
	  ,case
	  when convert (float, convert (varchar, [Tamanho])) < 9 then (Select concat(convert (varchar, [Tamanho]),'GB'))
	  when convert (float, convert (varchar, [Tamanho])) > 9 then (Select concat(convert (varchar, [Tamanho]),'MB'))
	  end as Tamanho
      ,format ([Preco], 'C') as Preco
      ,convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,case
	  when Suporte3D = 0 then 'Não'
	  when Suporte3D = 1 then 'Sim'
	  end as Suporte3D
	  ,[Estado].[EstadoNome] as Estado
  FROM N3DS
  inner join Regiao on Regiao.RegiaoId = N3DS.RegiaoId
  inner join Plataforma on Plataforma.PlataformaId = N3ds.PlataformaId
  inner join Genero on Genero.GeneroID = N3DS.GeneroId
  inner join Estado on Estado.estadoID = N3DS.EstadoID
  order by Nome 
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS2]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_PS2]
AS
BEGIN
	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
      ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,convert(varchar, [Lancamento], 103) as Lancamento
      ,format ([Preco], 'C') as Preco
      ,convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,case 
	  When Widescreen = 0 then 'Não'
	  when Widescreen = 1 then 'Sim'
	  else 'Sem informação'
	  end as Widescreen
	  ,[Estado].[EstadoNome] as Estado
  FROM [GameDB].[dbo].[PS2]
	  inner join Regiao on Regiao.RegiaoId = PS2.RegiaoId
	  inner join Plataforma on Plataforma.PlataformaId = PS2.PlataformaId
	  inner join Genero on Genero.GeneroID = PS2.GeneroID
	  inner join Estado on Estado.estadoID = PS2.EstadoID	 
  order by Nome 
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS3]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_PS3]
AS
BEGIN
	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
      ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,convert(varchar, [Lancamento], 103) as Lancamento
      ,format ([Preco], 'C') as Preco
      ,convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,case 
	  When Instalacao = 0 then 'Não'
	  when Instalacao = 1 then 'Sim'
	  else 'Sem informação'
	  end as Instalacao
	  ,[Estado].[EstadoNome] as Estado
  FROM [GameDB].[dbo].[PS3]
	  inner join Regiao on Regiao.RegiaoId = PS3.RegiaoId
	  inner join Plataforma on Plataforma.PlataformaId = PS3.PlataformaId
	  inner join Genero on Genero.GeneroID = PS3.GeneroID
	  inner join Estado on Estado.estadoID = PS3.EstadoID	 
  order by Nome 
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Listar_Jogos_PS4]
AS
BEGIN

	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
	  ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,Convert (varchar, [Lancamento], 103) as Lancamento
      ,(select Concat(Convert (varchar, [Tamanho] ),'GB')) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,Convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,Case
	  when PS4Pro = 0 then 'PS4Pro: Não'
	  when PS4Pro = 1 then 'PS4Pro: Sim'
	  end as Extras
	  ,[Estado].[EstadoNome] as Estado
  FROM [GameDB].[dbo].[PS4]
  inner join Regiao on Regiao.RegiaoId = PS4.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS4.PlataformaId
  inner join Genero on Genero.GeneroID = PS4.GeneroID
  inner join Estado on Estado.estadoID = PS4.EstadoID
  order by Nome
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4_E_PS5]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_PS4_E_PS5]
AS
BEGIN

	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
	  ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,Convert (varchar, [Lancamento], 103) as Lancamento
      ,(select Concat(Convert (varchar, [Tamanho] ),'GB')) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,Convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,Case
	  when PS4Pro = 0 then 'PS4Pro: Não'
	  when PS4Pro = 1 then 'PS4Pro: Sim'
	  end as Extras
	  ,[Estado].[EstadoNome] as Estado
  FROM [GameDB].[dbo].[PS4]
  inner join Regiao on Regiao.RegiaoId = PS4.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS4.PlataformaId
  inner join Genero on Genero.GeneroID = PS4.GeneroID
  inner join Estado on Estado.estadoID = PS4.EstadoID
  union
  SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
	  ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,Convert (varchar, [Lancamento], 103) as Lancamento
      ,(select Concat(Convert (varchar, [Tamanho] ),'GB')) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,Convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,Case
	  when Dualsense = 0 then 'Dualsense: Não'
	  when Dualsense = 1 then 'Dualsense: Sim'
	  end as Extras
	  ,[Estado].[EstadoNome] as Estado
  FROM PS5 With(NOLOCK)
  inner join Regiao on Regiao.RegiaoId = PS5.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS5.PlataformaId
  inner join Genero on Genero.GeneroID = PS5.GeneroID
  inner join Estado on Estado.estadoID = PS5.EstadoID
  order by Nome
  end

GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS5]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_PS5]
AS
BEGIN

	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
	  ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,Convert (varchar, [Lancamento], 103) as Lancamento
      ,(select Concat(Convert (varchar, [Tamanho] ),'GB')) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,Convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,Case
	  when Dualsense = 0 then 'Dualsense: Não'
	  when Dualsense = 1 then 'Dualsense: Sim'
	  end as Extras
	  ,[Estado].[EstadoNome] as Estado
  FROM PS5 With(NOLOCK)
  inner join Regiao on Regiao.RegiaoId = PS5.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS5.PlataformaId
  inner join Genero on Genero.GeneroID = PS5.GeneroID
  inner join Estado on Estado.estadoID = PS5.EstadoID
  order by Nome
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_Xbox360]    Script Date: 26/10/2023 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_Xbox360]
AS
BEGIN
	SELECT
	   [GameID]
      ,[Nome]
      ,[Serial]
      ,[Regiao].[Regiao]
      ,[Plataforma].[Console]
      ,[Genero].[Genero]
      ,convert(varchar, [Lancamento], 103) as Lancamento
      ,format ([Preco], 'C') as Preco
      ,convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,case 
	  When Kinect = 0 then 'Não'
	  when Kinect = 1 then 'Sim'
	  end as Kinect
	  ,[Estado].[EstadoNome] as Estado
  FROM Xbox360
	  inner join Regiao on Regiao.RegiaoId = Xbox360.RegiaoId
	  inner join Plataforma on Plataforma.PlataformaId = Xbox360.PlataformaId
	  inner join Genero on Genero.GeneroID = Xbox360.GeneroID
	  inner join Estado on Estado.estadoID = Xbox360.EstadoID	 
  order by Nome 
END


GO
USE [master]
GO
ALTER DATABASE [GameDB] SET  READ_WRITE 
GO
