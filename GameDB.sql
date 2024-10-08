USE [master]
GO
/****** Object:  Database [GameDB]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[Estado]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[EventoLogs]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[N3DS]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[Plataforma]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[PS2]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[PS3]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[PS4]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[PS5]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[Regiao]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  Table [dbo].[WiiU]    Script Date: 30/08/2024 15:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WiiU](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NULL,
	[Serial] [varchar](20) NULL,
	[RegiaoID] [int] NULL,
	[PlataformaID] [int] NULL,
	[GeneroID] [int] NULL,
	[Lancamento] [datetime] NULL,
	[Preco] [float] NULL,
	[Aquisicao] [datetime] NULL,
	[LocalAdq] [varchar](70) NULL,
	[Observacoes] [varchar](255) NULL,
	[WiiMote] [bit] NULL,
	[EstadoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Xbox360]    Script Date: 30/08/2024 15:22:45 ******/
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
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (28, N'Teste')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1, CAST(N'2023-10-26T23:50:36.677' AS DateTime), 2, N'O Jogo de PS5 Kena And The Bridge Of Spirits foi adicionado ao banco, custo de R$189,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (2, CAST(N'2023-10-29T10:01:08.173' AS DateTime), 2, N'O Jogo de PS3 Grid 1 foi adicionado ao banco, custo de R$39,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (3, CAST(N'2023-10-29T10:04:12.163' AS DateTime), 2, N'O Jogo de PS3 DarkSiders 1  foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (4, CAST(N'2023-10-29T10:08:21.483' AS DateTime), 2, N'O Jogo de PS3 Soul Calibur IV foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (5, CAST(N'2023-10-29T10:12:47.453' AS DateTime), 2, N'O Jogo de PS3 Mass Effect 1 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (6, CAST(N'2023-10-29T10:14:55.357' AS DateTime), 2, N'O Jogo de PS3 Mass Effect 2 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (7, CAST(N'2023-10-29T10:15:40.663' AS DateTime), 2, N'O Jogo de PS3 Mass Effect 3 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (8, CAST(N'2023-10-29T10:19:51.743' AS DateTime), 2, N'O Jogo de PS3 Dead Island Game Of The Year Edition foi adicionado ao banco, custo de R$30,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (9, CAST(N'2023-10-29T11:31:46.957' AS DateTime), 2, N'O Jogo de PS3 X-Com - Enemy Within foi adicionado ao banco, custo de R$39,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (10, CAST(N'2023-10-29T11:34:50.977' AS DateTime), 2, N'O Jogo de PS3 Midnight Club Los Angeles foi adicionado ao banco, custo de R$59,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (11, CAST(N'2023-10-29T11:36:59.413' AS DateTime), 2, N'O Jogo de PS3 Demon''s Souls foi adicionado ao banco, custo de R$99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (12, CAST(N'2023-10-29T11:43:30.883' AS DateTime), 2, N'O Jogo de PS3 Bioshock 1 foi adicionado ao banco, custo de R$48,13', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (13, CAST(N'2023-10-29T11:45:25.657' AS DateTime), 2, N'O Jogo de PS3 F1 2010 foi adicionado ao banco, custo de R$38,27', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (14, CAST(N'2023-10-29T11:47:29.447' AS DateTime), 2, N'O Jogo de PS3 Dirt 1 foi adicionado ao banco, custo de R$63,45', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (15, CAST(N'2023-10-29T11:49:40.897' AS DateTime), 2, N'O Jogo de PS3 Splinter Cell Trilogy foi adicionado ao banco, custo de R$35', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (16, CAST(N'2023-10-29T11:51:49.267' AS DateTime), 2, N'O Jogo de PS3 Final Fantasy XIII foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (17, CAST(N'2023-10-29T11:53:48.653' AS DateTime), 2, N'O Jogo de PS3 Need For Speed Carbon foi adicionado ao banco, custo de R$129,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (18, CAST(N'2023-10-29T11:55:20.433' AS DateTime), 2, N'O Jogo de PS3 God Of War Ascension foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (19, CAST(N'2023-10-29T11:57:15.597' AS DateTime), 2, N'O Jogo de PS3 White Knight Chronicles 1 foi adicionado ao banco, custo de R$77,59', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (20, CAST(N'2023-10-29T11:59:00.120' AS DateTime), 2, N'O Jogo de PS3 God Of War III foi adicionado ao banco, custo de R$62,71', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (21, CAST(N'2023-10-29T12:00:13.373' AS DateTime), 2, N'O Jogo de PS3 The Last Of Us foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (22, CAST(N'2023-10-29T12:01:53.390' AS DateTime), 2, N'O Jogo de PS3 Metal Gear 4 - Guns Of The Patriots foi adicionado ao banco, custo de R$29,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (23, CAST(N'2023-10-29T12:03:09.663' AS DateTime), 2, N'O Jogo de PS3 Guitar Hero - Warriors Of Rock foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (24, CAST(N'2023-10-29T12:05:03.773' AS DateTime), 2, N'O Jogo de PS3 Resisteance - Fall Of Man foi adicionado ao banco, custo de R$47,59', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (25, CAST(N'2023-10-29T12:06:27.050' AS DateTime), 2, N'O Jogo de PS3 Uncharted - Drake''s Fortune foi adicionado ao banco, custo de R$48,69', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (26, CAST(N'2023-10-29T12:07:43.187' AS DateTime), 2, N'O Jogo de PS3 Gran turismo 5 foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (27, CAST(N'2023-10-29T12:09:17.210' AS DateTime), 2, N'O Jogo de PS3 Assassin''s Creed 1 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (28, CAST(N'2023-10-29T12:10:20.673' AS DateTime), 2, N'O Jogo de PS3 Diablo III - Reaper Of Souls foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (29, CAST(N'2023-10-29T12:12:17.643' AS DateTime), 2, N'O Jogo de PS3 Brutal Legend foi adicionado ao banco, custo de R$74,17', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (30, CAST(N'2023-10-29T12:13:50.300' AS DateTime), 2, N'O Jogo de PS3 Red Dead Redemption foi adicionado ao banco, custo de R$77,69', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (31, CAST(N'2023-10-29T12:15:02.927' AS DateTime), 2, N'O Jogo de PS3 Gran Turismo 6 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (32, CAST(N'2023-10-29T12:17:26.320' AS DateTime), 2, N'O Jogo de PS3 Spider Man 3 foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (33, CAST(N'2023-10-29T12:18:31.680' AS DateTime), 2, N'O Jogo de PS3 Mortal Kombat foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (34, CAST(N'2023-10-29T12:20:27.653' AS DateTime), 2, N'O Jogo de PS3 Band Hero foi adicionado ao banco, custo de R$45', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (35, CAST(N'2023-10-29T12:21:41.243' AS DateTime), 2, N'O Jogo de PS3 Castlevania - Lords Of Shadows 1 foi adicionado ao banco, custo de R$54,99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (36, CAST(N'2023-10-29T12:22:51.497' AS DateTime), 2, N'O Jogo de PS3 Metal Gear Rising - Revengeance foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (37, CAST(N'2023-10-29T12:24:39.280' AS DateTime), 2, N'O Jogo de PS3 Alice - Madness Return foi adicionado ao banco, custo de R$197,49', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (38, CAST(N'2023-10-29T12:25:30.283' AS DateTime), 2, N'O Jogo de PS3 Battlefield - Bad Company foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (39, CAST(N'2023-10-29T12:38:50.490' AS DateTime), 2, N'O Jogo de PS4 TESTE09042023-14.22 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (40, CAST(N'2023-10-29T12:38:54.107' AS DateTime), 2, N'O Jogo de PS4 TESTE09042023-14.22 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (41, CAST(N'2023-10-29T12:38:54.680' AS DateTime), 2, N'O Jogo de PS4 TESTE09042023-14.22 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (42, CAST(N'2023-10-29T12:40:13.263' AS DateTime), 2, N'O Jogo de PS4 TESTE09042023-14.22 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (43, CAST(N'2023-10-29T12:40:13.643' AS DateTime), 2, N'O Jogo de PS4 TESTE09042023-14.22 foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (44, CAST(N'2023-10-29T14:23:51.493' AS DateTime), 2, N'O Jogo de PS4 Dark Souls II - Scholar Of The First Sin foi adicionado ao banco, custo de R$103,24', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (45, CAST(N'2023-10-29T14:26:06.297' AS DateTime), 2, N'O Jogo de PS4 Horizon Zero Dawn - Complete Edition foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (46, CAST(N'2023-10-29T14:28:38.330' AS DateTime), 2, N'O Jogo de PS4 Spider-Man  foi adicionado ao banco, custo de R$100', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (47, CAST(N'2023-10-29T14:31:46.640' AS DateTime), 2, N'O Jogo de PS4 Aragami - Collector''s Edition foi adicionado ao banco, custo de R$127,69', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (48, CAST(N'2023-10-29T14:33:05.460' AS DateTime), 2, N'O Jogo de PS4 Killzone - Shadow Fall foi adicionado ao banco, custo de R$40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (49, CAST(N'2023-10-29T14:35:03.790' AS DateTime), 2, N'O Jogo de PS4 Call Of Duty - Infinite Warfare foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (50, CAST(N'2023-10-29T14:37:11.620' AS DateTime), 2, N'O Jogo de PS4 Murdered - Soul Suspect foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (51, CAST(N'2023-10-29T14:38:44.180' AS DateTime), 2, N'O Jogo de PS4 Grand Theft Auto V foi adicionado ao banco, custo de R$120', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (52, CAST(N'2023-10-29T14:42:05.917' AS DateTime), 2, N'O Jogo de PS4 Middle Earth - Shadow Of Mordor foi adicionado ao banco, custo de R$65,71', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (53, CAST(N'2023-10-29T14:43:42.133' AS DateTime), 2, N'O Jogo de PS4 Resident Evil - Origins Collection foi adicionado ao banco, custo de R$125,71', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (54, CAST(N'2023-10-29T14:45:11.747' AS DateTime), 2, N'O Jogo de PS4 Grand Theft Auto - The Trilogy Remastered foi adicionado ao banco, custo de R$100', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (55, CAST(N'2023-10-29T14:48:19.453' AS DateTime), 2, N'O Jogo de PS4 Need For Speed - Payback foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (56, CAST(N'2023-10-29T14:50:31.653' AS DateTime), 2, N'O Jogo de PS4 CyberPunk 2077 foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (57, CAST(N'2023-10-29T15:45:17.873' AS DateTime), 2, N'O Jogo de PS4 Gran Turismo Sport foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (58, CAST(N'2023-10-29T15:48:34.353' AS DateTime), 2, N'O Jogo de PS4 Red Dead Redemption II foi adicionado ao banco, custo de R$100', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (59, CAST(N'2023-10-29T15:50:02.647' AS DateTime), 2, N'O Jogo de PS4 God Of War foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (60, CAST(N'2023-10-29T15:52:05.200' AS DateTime), 2, N'O Jogo de PS4 Resident Evil 4 foi adicionado ao banco, custo de R$120', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (61, CAST(N'2023-10-29T15:53:40.100' AS DateTime), 2, N'O Jogo de PS4 Watch Dogs foi adicionado ao banco, custo de R$55', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (62, CAST(N'2023-10-29T15:55:45.860' AS DateTime), 2, N'O Jogo de PS4 Need For Speed Rivals foi adicionado ao banco, custo de R$55,45', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (63, CAST(N'2023-10-29T15:56:45.313' AS DateTime), 2, N'O Jogo de PS4 Shadow Of The Colossus foi adicionado ao banco, custo de R$74', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (64, CAST(N'2023-10-29T15:58:09.550' AS DateTime), 2, N'O Jogo de PS4 The Order 1886 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (65, CAST(N'2023-10-29T15:59:57.577' AS DateTime), 2, N'O Jogo de PS4 Dark Souls Remastered foi adicionado ao banco, custo de R$103,24', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (66, CAST(N'2023-10-29T16:04:05.733' AS DateTime), 2, N'O Jogo de PS4 Medievil foi adicionado ao banco, custo de R$66', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (67, CAST(N'2023-10-29T16:18:08.257' AS DateTime), 2, N'O Jogo de PS4 Star Wars - Jedi Fallen Order foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (68, CAST(N'2023-10-29T16:20:12.777' AS DateTime), 2, N'O Jogo de PS4 Dark Souls III - The Fire Fades Edition foi adicionado ao banco, custo de R$103,24', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (69, CAST(N'2023-10-29T16:22:23.697' AS DateTime), 2, N'O Jogo de PS4 Tomb Raider - Definitive Edition foi adicionado ao banco, custo de R$80', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (70, CAST(N'2023-10-29T16:23:45.957' AS DateTime), 2, N'O Jogo de PS4 Spyro - Reignited Trilogy foi adicionado ao banco, custo de R$79', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (71, CAST(N'2023-10-29T16:24:46.973' AS DateTime), 2, N'O Jogo de PS4 Sniper Elite III - Afrika foi adicionado ao banco, custo de R$80', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (72, CAST(N'2023-10-29T16:26:33.483' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (73, CAST(N'2023-10-29T16:26:50.980' AS DateTime), 2, N'O Jogo de PS4 Mortal Kombat XL  foi adicionado ao banco, custo de R$60', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (74, CAST(N'2023-10-29T16:28:16.577' AS DateTime), 2, N'O Jogo de PS4 Gravity Rush 2 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (75, CAST(N'2023-10-29T16:29:26.137' AS DateTime), 2, N'O Jogo de PS4 Watch Dogs 2 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (76, CAST(N'2023-11-06T11:05:07.600' AS DateTime), 2, N'O Jogo de PS4 de ID 1 foi editado para Crash Bandicoot - N.Sane Trilogy', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (77, CAST(N'2023-11-29T14:31:11.583' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (78, CAST(N'2023-11-29T14:32:09.710' AS DateTime), 2, N'a Plataforma WiiU da Nintendo  Foi registrado no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (79, CAST(N'2023-11-29T14:34:30.223' AS DateTime), 2, N'O Jogo de WiiU teste foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (80, CAST(N'2023-11-29T14:38:26.400' AS DateTime), 2, N'O Jogo de PS2 de ID 1 foi editado para Teste2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (81, CAST(N'2023-11-29T14:39:10.323' AS DateTime), 2, N'O Jogo de WiiU Teste Edit foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (82, CAST(N'2023-11-29T14:39:21.287' AS DateTime), 2, N'O Jogo de WiiU Teste Edit foi Removido do banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (83, CAST(N'2023-11-29T14:46:58.247' AS DateTime), 2, N'O Jogo de WiiU Bayonetta 1 foi adicionado ao banco, custo de R$123,32', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (84, CAST(N'2023-11-29T14:48:37.863' AS DateTime), 2, N'O Jogo de WiiU Bayonetta 2 foi adicionado ao banco, custo de R$123,32', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (85, CAST(N'2023-11-29T14:50:33.150' AS DateTime), 2, N'O Jogo de WiiU Super Mario 3D World foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (86, CAST(N'2023-12-23T03:11:54.797' AS DateTime), 2, N'O Jogo de PS4 de ID 2 foi editado para NiOh 1', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (87, CAST(N'2023-12-23T03:15:52.343' AS DateTime), 2, N'O Jogo de PS4 de ID 3 foi editado para Shadow Warrior 1', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (88, CAST(N'2024-01-18T21:10:36.277' AS DateTime), 2, N'O Jogo de PS4 de ID 4 foi editado para Metal Gear Solid V - The Definitive Experience', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (89, CAST(N'2024-01-18T21:11:25.780' AS DateTime), 2, N'O Jogo de PS4 de ID 4 foi editado para Metal Gear Solid V - The Definitive Experience', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (90, CAST(N'2024-01-29T23:47:08.387' AS DateTime), 2, N'O Jogo de PS4 de ID 5 foi editado para Call Of Duty - Modern Warfare', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (91, CAST(N'2024-03-09T01:32:39.810' AS DateTime), 2, N'O Jogo de PS3 Hitman Absolution foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (92, CAST(N'2024-03-09T01:38:10.187' AS DateTime), 2, N'O Jogo de PS3 Dead Space 1 foi adicionado ao banco, custo de R$137,24', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (93, CAST(N'2024-03-09T01:44:29.517' AS DateTime), 2, N'O Jogo de PS4 The Wticher 3 Edição Completa foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (94, CAST(N'2024-03-09T01:46:22.973' AS DateTime), 2, N'O Jogo de PS4 Mad Max foi adicionado ao banco, custo de R$50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (95, CAST(N'2024-04-20T19:42:21.963' AS DateTime), 2, N'O Jogo de PS4 de ID 34 foi editado para Knack', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (96, CAST(N'2024-06-06T11:50:56.323' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (97, CAST(N'2024-06-06T11:51:11.830' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (98, CAST(N'2024-06-06T11:53:08.243' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (99, CAST(N'2024-06-06T11:54:27.500' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
GO
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (100, CAST(N'2024-06-06T11:55:28.410' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (101, CAST(N'2024-06-06T11:57:20.263' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (102, CAST(N'2024-06-06T11:58:38.510' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (103, CAST(N'2024-06-06T12:02:57.160' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (104, CAST(N'2024-06-06T12:06:04.223' AS DateTime), 1, N'Um Erro foi encontrado', N'The key value at position 0 of the call to ''DbSet<Ps3>.Find'' was of type ''double'', which does not match the property type of ''int''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (105, CAST(N'2024-06-06T12:07:15.677' AS DateTime), 1, N'Um Erro foi encontrado', N'The key value at position 0 of the call to ''DbSet<Ps3>.Find'' was of type ''double'', which does not match the property type of ''int''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (106, CAST(N'2024-06-06T12:13:44.230' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (107, CAST(N'2024-06-06T12:15:33.007' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (108, CAST(N'2024-06-06T12:16:52.253' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (109, CAST(N'2024-06-06T14:25:13.000' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (110, CAST(N'2024-06-06T14:27:53.310' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (111, CAST(N'2024-06-06T14:28:36.037' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (112, CAST(N'2024-06-06T14:30:04.757' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (113, CAST(N'2024-06-06T14:34:17.110' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''System.Decimal'' to type ''System.Double''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (114, CAST(N'2024-06-06T14:45:04.950' AS DateTime), 2, N'O Jogo de PS3 de ID 32 foi editado para tesgdgd', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (115, CAST(N'2024-06-06T14:46:56.780' AS DateTime), 2, N'O Jogo de PS3 de ID 32 foi editado para F1 2011', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (116, CAST(N'2024-06-06T14:51:34.777' AS DateTime), 2, N'O Jogo de 3DS TESTE06-06-2024:01 foi adicionado ao banco, custo de R$150,09', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (117, CAST(N'2024-06-06T14:52:11.443' AS DateTime), 2, N'O Jogo de 3DS TESTE06-06-2024:02 foi adicionado ao banco, custo de R$150,09', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (118, CAST(N'2024-06-06T14:52:32.717' AS DateTime), 2, N'O Jogo de 3DS TESTE06-06-2024:03 foi adicionado ao banco, custo de R$150,09', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (119, CAST(N'2024-06-06T14:54:20.640' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:01 foi adicionado ao banco, custo de R$140,45', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (120, CAST(N'2024-06-06T14:55:17.703' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:02 foi adicionado ao banco, custo de R$98,5', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (121, CAST(N'2024-06-06T14:55:51.037' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:03 foi adicionado ao banco, custo de R$42,39', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (122, CAST(N'2024-06-06T14:56:09.820' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:04 foi adicionado ao banco, custo de R$99,99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (123, CAST(N'2024-06-06T14:56:42.827' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:05 foi adicionado ao banco, custo de R$178,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (124, CAST(N'2024-06-06T14:57:14.907' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:06 foi adicionado ao banco, custo de R$26,74', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (125, CAST(N'2024-06-06T14:58:08.513' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (126, CAST(N'2024-06-06T14:58:20.813' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (127, CAST(N'2024-06-06T14:58:33.617' AS DateTime), 2, N'O Jogo de PS2 TEST06-06-2024:07 foi adicionado ao banco, custo de R$158,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (128, CAST(N'2024-06-06T15:00:09.617' AS DateTime), 2, N'O Jogo de PS3 TEST06-06-2024:01 foi adicionado ao banco, custo de R$415,50', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (129, CAST(N'2024-06-06T15:00:39.083' AS DateTime), 2, N'O Jogo de PS3 TEST06-06-2024:02 foi adicionado ao banco, custo de R$100', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (130, CAST(N'2024-06-06T15:01:07.453' AS DateTime), 2, N'O Jogo de PS3 TEST06-06-2024:03 foi adicionado ao banco, custo de R$165,80', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (131, CAST(N'2024-06-06T15:04:55.693' AS DateTime), 2, N'O Jogo de PS4 TEST06-06-2024:01 foi adicionado ao banco, custo de R$89,8', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (132, CAST(N'2024-06-06T15:05:39.390' AS DateTime), 2, N'O Jogo de PS4 TEST06-06-2024:02 foi adicionado ao banco, custo de R$200', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (133, CAST(N'2024-06-06T15:06:09.770' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (134, CAST(N'2024-06-06T15:06:38.603' AS DateTime), 2, N'O Jogo de PS4 TEST06-06-2024:03 foi adicionado ao banco, custo de R$300,15', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (135, CAST(N'2024-06-07T13:24:51.147' AS DateTime), 2, N'O Jogo de PS4 de ID 39 foi editado para Ride 1', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (136, CAST(N'2024-06-07T13:30:38.463' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:01 foi adicionado ao banco, custo de R$345', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (137, CAST(N'2024-06-07T13:31:25.897' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:02 foi adicionado ao banco, custo de R$113,58', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (138, CAST(N'2024-06-07T13:32:00.047' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:03 foi adicionado ao banco, custo de R$199,99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (139, CAST(N'2024-06-07T13:32:46.463' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:04 foi adicionado ao banco, custo de R$120', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (140, CAST(N'2024-06-07T13:33:19.377' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (141, CAST(N'2024-06-07T13:33:27.280' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (142, CAST(N'2024-06-07T13:33:32.563' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:05 foi adicionado ao banco, custo de R$142,24', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (143, CAST(N'2024-06-07T13:34:10.517' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:06 foi adicionado ao banco, custo de R$199,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (144, CAST(N'2024-06-07T13:34:43.790' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:07 foi adicionado ao banco, custo de R$230,27', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (145, CAST(N'2024-06-07T13:35:23.490' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:08 foi adicionado ao banco, custo de R$350,9', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (146, CAST(N'2024-06-07T13:36:15.620' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:09 foi adicionado ao banco, custo de R$400', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (147, CAST(N'2024-06-07T13:46:36.030' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024:01 foi adicionado ao banco, custo de R$79', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (148, CAST(N'2024-06-07T13:46:54.733' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024:01 foi adicionado ao banco, custo de R$89', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (149, CAST(N'2024-06-07T13:47:11.010' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024 foi adicionado ao banco, custo de R$170', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (150, CAST(N'2024-06-07T13:47:30.443' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024 foi adicionado ao banco, custo de R$200', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (151, CAST(N'2024-06-07T13:47:46.173' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024 foi adicionado ao banco, custo de R$197,5', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (152, CAST(N'2024-06-07T13:48:11.967' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (153, CAST(N'2024-06-07T13:48:29.643' AS DateTime), 2, N'O Jogo de WiiU TESTE-07-06-2024 foi adicionado ao banco, custo de R$200,82', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (154, CAST(N'2024-06-07T13:54:03.213' AS DateTime), 2, N'O Jogo de Xbox 360 de ID 1 foi editado para REPLACEOLDGAME', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (155, CAST(N'2024-06-07T13:55:27.233' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME1 foi adicionado ao banco, custo de R$147,6', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (156, CAST(N'2024-06-07T13:56:04.830' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME2 foi adicionado ao banco, custo de R$99,5', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (157, CAST(N'2024-06-07T13:56:29.830' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME3 foi adicionado ao banco, custo de R$320,36', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (158, CAST(N'2024-06-07T13:56:47.703' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME7 foi adicionado ao banco, custo de R$0', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (159, CAST(N'2024-06-07T13:57:07.707' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME8 foi adicionado ao banco, custo de R$37,5', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (160, CAST(N'2024-06-07T13:57:24.203' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME9 foi adicionado ao banco, custo de R$78,4', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (161, CAST(N'2024-06-07T13:57:45.127' AS DateTime), 2, N'O Jogo de Xbox 360 PLACEHOLDERGAME10 foi adicionado ao banco, custo de R$99,99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (162, CAST(N'2024-06-29T12:45:05.000' AS DateTime), 2, N'O Jogo de PS5 TESTE-07-06-2024:01 foi editado para Thymesia', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (163, CAST(N'2024-07-03T18:02:21.623' AS DateTime), 2, N'O Estado Teste Foi registrado no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (164, CAST(N'2024-07-05T13:09:13.227' AS DateTime), 1, N'Um Erro foi encontrado', N'The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See http://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (165, CAST(N'2024-07-05T13:09:37.930' AS DateTime), 2, N'O Estado Teste Foi Alterado para Teste2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (166, CAST(N'2024-07-05T13:22:48.213' AS DateTime), 2, N'O Estado Teste2 Foi Alterado para Teste3', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (167, CAST(N'2024-07-05T13:23:11.133' AS DateTime), 2, N'O Estado Teste3 Foi apagado do Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (168, CAST(N'2024-07-05T13:30:36.290' AS DateTime), 2, N'O genero TesteInsomnia0507 Foi registrado no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (169, CAST(N'2024-07-05T13:32:33.363' AS DateTime), 2, N'O genero TesteInsomnia0507 Foi Alterado para 05072024Teste no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (170, CAST(N'2024-07-05T13:34:01.230' AS DateTime), 2, N'O genero 05072024Teste Foi apagado do Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (171, CAST(N'2024-07-05T14:04:37.213' AS DateTime), 2, N'a Plataforma VirtualBoy da Nintendo  Foi registrado no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (172, CAST(N'2024-07-05T14:06:40.997' AS DateTime), 2, N'O Console VirtualBoy Foi alterado para VirtualBoy no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (173, CAST(N'2024-07-05T14:06:54.113' AS DateTime), 2, N'O Console VirtualBoy Foi alterado para VirtualBoy no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (174, CAST(N'2024-07-05T14:07:14.167' AS DateTime), 2, N'O Console VirtualBoy Foi alterado para Insomnia no Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (175, CAST(N'2024-07-05T14:08:04.293' AS DateTime), 2, N'O Console Insomnia Foi apagado do Banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (176, CAST(N'2024-07-05T14:18:29.603' AS DateTime), 2, N'A região MDE foi Adicionada ao banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (177, CAST(N'2024-07-05T14:19:58.110' AS DateTime), 2, N'A região MDE foi editada para TST', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (178, CAST(N'2024-07-05T14:20:48.197' AS DateTime), 2, N'A região TST foi Apagada do banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (179, CAST(N'2024-07-05T16:45:02.400' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia foi adicionado ao banco, custo de R$137,40', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (180, CAST(N'2024-07-05T16:48:55.490' AS DateTime), 2, N'O Jogo de PS3 de ID 43 foi editado para TesteInsomnia2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (181, CAST(N'2024-07-05T17:12:17.843' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (182, CAST(N'2024-07-05T17:12:55.520' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (183, CAST(N'2024-07-05T17:14:01.527' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (184, CAST(N'2024-07-05T17:14:29.193' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (185, CAST(N'2024-07-05T17:17:22.960' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (186, CAST(N'2024-07-05T17:18:21.960' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (187, CAST(N'2024-07-05T17:24:16.800' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (188, CAST(N'2024-07-12T21:57:15.247' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (189, CAST(N'2024-07-12T22:37:48.713' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (190, CAST(N'2024-07-12T22:38:36.780' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (191, CAST(N'2024-07-12T22:39:52.693' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (192, CAST(N'2024-07-12T22:40:23.770' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (193, CAST(N'2024-07-12T22:44:26.497' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (194, CAST(N'2024-07-12T22:45:33.160' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (195, CAST(N'2024-07-12T22:45:37.780' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (196, CAST(N'2024-07-12T22:46:16.513' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (197, CAST(N'2024-07-12T22:50:54.560' AS DateTime), 1, N'Um Erro foi encontrado', N'Unable to cast object of type ''Microsoft.AspNetCore.JsonPatch.JsonPatchDocument`1[GameDB.Models.Consoles.Ps3]'' to type ''Microsoft.AspNetCore.JsonPatch.Adapters.IObjectAdapter''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (198, CAST(N'2024-07-12T22:55:51.627' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (199, CAST(N'2024-07-12T23:05:26.403' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
GO
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (200, CAST(N'2024-07-12T23:06:22.980' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco para System.Func`1[System.String]', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (201, CAST(N'2024-07-12T23:22:38.097' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (202, CAST(N'2024-07-12T23:22:38.097' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (203, CAST(N'2024-07-12T23:23:46.273' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (204, CAST(N'2024-07-12T23:26:01.083' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (205, CAST(N'2024-07-13T13:42:49.930' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (206, CAST(N'2024-07-13T13:47:54.657' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (207, CAST(N'2024-07-13T13:49:32.810' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (208, CAST(N'2024-07-13T13:49:55.913' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (209, CAST(N'2024-07-13T13:50:15.563' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (210, CAST(N'2024-07-13T13:51:30.530' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (211, CAST(N'2024-07-13T13:56:37.567' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (212, CAST(N'2024-07-13T13:57:24.213' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (213, CAST(N'2024-07-13T13:57:49.057' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (214, CAST(N'2024-07-13T13:59:31.697' AS DateTime), 2, N'O Jogo de PS3 TesteInsomnia2 foi editado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (215, CAST(N'2024-07-13T14:34:02.647' AS DateTime), 2, N'O Jogo de PS3 foi Editado No banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (216, CAST(N'2024-07-13T14:36:08.730' AS DateTime), 2, N'O Jogo de PS3 foi Editado No banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (217, CAST(N'2024-07-13T14:36:20.090' AS DateTime), 2, N'O Jogo de PS3 foi Editado No banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (218, CAST(N'2024-07-13T14:44:05.910' AS DateTime), 2, N'O Jogo de PS3 foi Editado No banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (219, CAST(N'2024-07-13T14:48:38.953' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (220, CAST(N'2024-07-13T14:49:38.237' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (221, CAST(N'2024-07-15T17:10:22.183' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (222, CAST(N'2024-07-15T17:14:29.157' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (223, CAST(N'2024-07-15T17:17:31.630' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (224, CAST(N'2024-07-15T17:19:44.350' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (225, CAST(N'2024-07-15T17:19:49.973' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (226, CAST(N'2024-07-15T17:27:30.813' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (227, CAST(N'2024-07-15T17:34:46.480' AS DateTime), 1, N'Um Erro foi encontrado', N'Nome de objeto ''@p0'' inválido.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (228, CAST(N'2024-07-15T17:38:09.407' AS DateTime), 1, N'Um Erro foi encontrado', N'Nome de objeto ''@p0'' inválido.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (229, CAST(N'2024-07-15T17:38:30.117' AS DateTime), 1, N'Um Erro foi encontrado', N'Nome de objeto ''@p0'' inválido.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (230, CAST(N'2024-07-15T17:41:48.120' AS DateTime), 1, N'Um Erro foi encontrado', N'É necessário declarar a variável de tabela "@p0".')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (231, CAST(N'2024-07-15T17:46:12.593' AS DateTime), 1, N'Um Erro foi encontrado', N'É necessário declarar a variável de tabela "@p0".
É necessário declarar a variável escalar "@p2".')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (232, CAST(N'2024-07-15T17:48:01.750' AS DateTime), 1, N'Um Erro foi encontrado', N'The SqlParameterCollection only accepts non-null Microsoft.Data.SqlClient.SqlParameter type objects, not System.Data.SqlClient.SqlParameter objects.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (233, CAST(N'2024-07-15T17:50:39.103' AS DateTime), 1, N'Um Erro foi encontrado', N'É necessário declarar a variável de tabela "@p0".')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (234, CAST(N'2024-07-15T17:52:31.650' AS DateTime), 1, N'Um Erro foi encontrado', N'Dados de cadeia ou binários seriam truncados.
A instrução foi finalizada.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (235, CAST(N'2024-07-15T17:54:06.883' AS DateTime), 1, N'Um Erro foi encontrado', N'Dados de cadeia ou binários seriam truncados.
A instrução foi finalizada.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (236, CAST(N'2024-07-15T17:58:30.973' AS DateTime), 1, N'Um Erro foi encontrado', N'Dados de cadeia ou binários seriam truncados.
A instrução foi finalizada.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (237, CAST(N'2024-07-15T18:01:24.910' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (238, CAST(N'2024-07-15T18:02:02.313' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (239, CAST(N'2024-07-15T18:02:44.553' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (240, CAST(N'2024-07-15T23:07:10.947' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (241, CAST(N'2024-07-15T23:07:34.630' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (242, CAST(N'2024-07-15T23:08:19.493' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (243, CAST(N'2024-07-15T23:09:07.853' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (244, CAST(N'2024-07-16T23:02:33.507' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (245, CAST(N'2024-07-16T23:04:46.393' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (246, CAST(N'2024-07-16T23:04:48.143' AS DateTime), 1, N'Um Erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (247, CAST(N'2024-07-16T23:04:54.273' AS DateTime), 2, N'O Jogo de PS3 Insomnia1607 foi adicionado ao banco, custo de R$99', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (248, CAST(N'2024-07-16T23:05:48.167' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para TesteInsomnia2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (249, CAST(N'2024-07-16T23:06:15.117' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para TesteInsomnia2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (250, CAST(N'2024-07-16T23:13:29.853' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para TesteInsomnia2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (251, CAST(N'2024-07-16T23:13:52.607' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para TesteInsomnia2', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (252, CAST(N'2024-07-16T23:14:16.753' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para Insomnia37', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (253, CAST(N'2024-07-16T23:16:58.760' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (254, CAST(N'2024-07-16T23:17:09.990' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (255, CAST(N'2024-07-16T23:21:41.927' AS DateTime), 2, N'O Jogo de PS4 TesteInsomniaPS4 foi adicionado ao banco, custo de R$145,98', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (256, CAST(N'2024-07-16T23:26:41.727' AS DateTime), 1, N'Um erro foi encontrado', N'The instance of entity type ''Ps4'' cannot be tracked because another instance with the same key value for {''GameId''} is already being tracked. When attaching existing entities, ensure that only one entity instance with a given key value is attached. Consider using ''DbContextOptionsBuilder.EnableSensitiveDataLogging'' to see the conflicting key values.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (257, CAST(N'2024-07-16T23:27:29.253' AS DateTime), 2, N'O Jogo de PS4 de ID 43 foi editado para TesteInsomniaPS4', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (258, CAST(N'2024-07-16T23:27:48.067' AS DateTime), 2, N'O Jogo de PS4 de ID 43 foi editado para TesteInsomniaPS4', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (259, CAST(N'2024-07-16T23:28:07.520' AS DateTime), 2, N'O Jogo de PS4 de ID 43 foi editado para TesteInsomniaPS4', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (260, CAST(N'2024-07-16T23:28:46.337' AS DateTime), 2, N'O Jogo de PS4 TesteInsomniaPS4 foi apagado do banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (261, CAST(N'2024-07-16T23:29:19.000' AS DateTime), 2, N'O Jogo de PS4 TesteInsomniaPS4 foi adicionado ao banco, custo de R$145,98', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (262, CAST(N'2024-07-16T23:32:23.420' AS DateTime), 2, N'Um Jogo foi editado parcialmente no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (263, CAST(N'2024-08-23T20:10:41.747' AS DateTime), 2, N'O Jogo de PS3 de ID 40 foi editado para Rocksmith', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (264, CAST(N'2024-08-23T20:11:24.323' AS DateTime), 2, N'O Jogo de PS3 de ID 40 foi editado para Rocksmith', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (265, CAST(N'2024-08-23T20:11:44.617' AS DateTime), 2, N'O Jogo de PS3 de ID 40 foi editado para Rocksmith', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (266, CAST(N'2024-08-23T20:12:38.343' AS DateTime), 2, N'O Jogo de PS3 de ID 47 foi editado para TesteInsomina', N'Nenhum erro encontrado')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[N3DS] ON 

INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (1, N'Mario Party - Island Tour', N'CTR-ATSE', 1, 3, 27, CAST(N'2013-11-22' AS Date), 175.5, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital, Versão Nintendo Select', 1, 4)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (2, N'Super Mario 3D Land', N'CTR-AREE', 1, 3, 3, CAST(N'2013-11-03' AS Date), 222.9, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital', 1, 8)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (3, N'Super Mario Maker For 3DS', N'CTR-AJHE', 1, 3, 27, CAST(N'2015-09-10' AS Date), 221, 0, CAST(N'2023-02-15' AS Date), N'Mercado Livre', N'Completo, Manual Digital', 0, 4)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (4, N'The Legend Of Zelda - Ocarina Of Time 3D', N'CTR-AQEE', 1, 3, 3, CAST(N'2011-11-16' AS Date), 454.57, 147.38, CAST(N'2023-06-09' AS Date), N'Shopee', N'Completo com Manual', 1, 3)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (5, N'Hot Wheels - World''s Best Driver', N'CTR-AEAE', 1, 3, 4, CAST(N'2013-09-17' AS Date), 654.57, 49.84, CAST(N'2023-07-10' AS Date), N'Shopee', N'Completo com Manual', 1, 5)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (6, N'Beyblade Evolution', N'CTR-ARXE', 2, 3, 27, CAST(N'2013-10-29' AS Date), 179, 62.68, CAST(N'2023-08-08' AS Date), N'Shopee', N'Completo com Manual', 1, 5)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (7, N'TEST-26102023', N'CTR-TEST', 1, 3, 5, CAST(N'2012-02-15' AS Date), 435, 150, CAST(N'2023-10-26' AS Date), N'Teste', N'Teste Truncate', 1, 3)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (8, N'TESTE06-06-2024:01', N'CTR-TEST', 5, 3, 9, CAST(N'2014-02-06' AS Date), 150, 150.09, CAST(N'2024-06-06' AS Date), N'TesteAdicao', N'teste', 0, 6)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (9, N'TESTE06-06-2024:02', N'CTR-TEST', 5, 3, 9, CAST(N'2014-02-06' AS Date), 150, 150.09, CAST(N'2024-06-06' AS Date), N'TesteAdicao', N'teste', 0, 6)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [EstadoID]) VALUES (10, N'TESTE06-06-2024:03', N'CTR-TEST', 3, 3, 7, CAST(N'2014-02-06' AS Date), 150, 150.09, CAST(N'2024-06-06' AS Date), N'TesteAdicao', N'teste', 0, 6)
SET IDENTITY_INSERT [dbo].[N3DS] OFF
GO
SET IDENTITY_INSERT [dbo].[Plataforma] ON 

INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (1, N'Sony', N'Playstation 3')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (2, N'Sony', N'Playstation 4')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (3, N'Nintendo', N'3DS')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (5, N'Sony', N'Playstation 5')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (6, N'Microsoft', N'Xbox 360')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (7, N'Sony', N'Playstation 2')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (8, N'Nintendo', N'WiiU')
SET IDENTITY_INSERT [dbo].[Plataforma] OFF
GO
SET IDENTITY_INSERT [dbo].[PS2] ON 

INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (1, N'Guitar Hero I', N'SLUS-21224', 1, 7, 10, CAST(N'2005-11-08T00:00:00.000' AS DateTime), 176.94, CAST(N'2023-06-26T00:00:00.000' AS DateTime), N'Ebay (USA)', N'Completo', 1, 5)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (2, N'Socom US Navy Seals 1', N'SCUS-97230', 1, 7, 14, CAST(N'2002-08-27T00:00:00.000' AS DateTime), 43.44, CAST(N'2023-10-10T00:00:00.000' AS DateTime), N'Shopee', N'Completo, Versão Greatest hits', 0, 5)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (3, N'Guitar Hero II', N'SLUS-21447', 1, 7, 10, CAST(N'2006-11-07T00:00:00.000' AS DateTime), 141.36, CAST(N'2023-10-26T00:00:00.000' AS DateTime), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (4, N'TEST06-06-2024:01', N'SLUS-20001', 1, 7, 27, CAST(N'2009-09-23T00:00:00.000' AS DateTime), 140.45, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (5, N'TEST06-06-2024:02', N'SLUS-20002', 2, 7, 3, CAST(N'2004-07-18T00:00:00.000' AS DateTime), 98.5, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (6, N'TEST06-06-2024:03', N'SLUS-20003', 3, 7, 8, CAST(N'2001-09-11T00:00:00.000' AS DateTime), 42.39, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (7, N'TEST06-06-2024:04', N'SLUS-20004', 4, 7, 28, CAST(N'2001-09-11T00:00:00.000' AS DateTime), 99.99, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (8, N'TEST06-06-2024:05', N'SLUS-20005', 5, 7, 14, CAST(N'2001-01-20T00:00:00.000' AS DateTime), 178.9, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (9, N'TEST06-06-2024:06', N'SLUS-20006', 6, 7, 15, CAST(N'2002-06-06T00:00:00.000' AS DateTime), 26.74, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS2] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Widescreen], [EstadoID]) VALUES (12, N'TEST06-06-2024:07', N'SLUS-20007', 2, 7, 2, CAST(N'2007-05-14T00:00:00.000' AS DateTime), 158.9, CAST(N'2024-06-06T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
SET IDENTITY_INSERT [dbo].[PS2] OFF
GO
SET IDENTITY_INSERT [dbo].[PS3] ON 

INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (1, N'Grid 1', N'BLUS-30142', 2, 1, 4, CAST(N'2008-06-03' AS Date), CAST(43.27 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Versão brasileira Relançada, Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (2, N'DarkSiders 1 ', N'BLES-00705', 3, 1, 19, CAST(N'2010-01-08' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-06-14' AS Date), N'Dubai Games', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (3, N'Soul Calibur IV', N'BLUS-30160', 1, 1, 7, CAST(N'2008-07-29' AS Date), CAST(41.15 AS Decimal(5, 2)), CAST(N'2023-10-28' AS Date), N'Lucas Santana', N'Completo', 0, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (4, N'Mass Effect 1', N'BLUS-31139P3', 1, 1, 2, CAST(N'2012-12-04' AS Date), CAST(42.99 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Edição Colecionador, Preço dividido, Completo', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (5, N'Mass Effect 2', N'BLUS-30650P3', 1, 1, 2, CAST(N'2011-01-18' AS Date), CAST(42.99 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Edição Colecionador, Preço dividido, Completo', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (6, N'Mass Effect 3', N'BLUS-30853P3', 1, 1, 2, CAST(N'2012-03-06' AS Date), CAST(42.99 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Edição Colecionador, Preço dividido, Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (7, N'Dead Island Game Of The Year Edition', N'BLUS-31026GH', 1, 1, 2, CAST(N'2011-09-06' AS Date), CAST(30.90 AS Decimal(5, 2)), CAST(N'2023-09-05' AS Date), N'Shopee', N'Todas as DLC no disco, completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (8, N'X-Com - Enemy Within', N'BLUS-31180SA', 2, 1, 15, CAST(N'2013-11-12' AS Date), CAST(39.90 AS Decimal(5, 2)), CAST(N'2022-05-08' AS Date), N'Livraria Leitura', N'Completo novo e lacrado', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (9, N'Midnight Club Los Angeles', N'BLES-00652/P', 3, 1, 4, CAST(N'2008-10-24' AS Date), CAST(59.90 AS Decimal(5, 2)), CAST(N'2023-07-21' AS Date), N'Shopee', N'Completo, Versão Platinum', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (10, N'Demon''s Souls', N'BLUS-30443GH', 1, 1, 5, CAST(N'2009-10-06' AS Date), CAST(105.96 AS Decimal(5, 2)), CAST(N'2022-08-17' AS Date), N'Shopee', N'Completo, Versão Greatest Hits', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (11, N'Bioshock 1', N'BLES-00316', 3, 1, 13, CAST(N'2008-10-17' AS Date), CAST(48.13 AS Decimal(5, 2)), CAST(N'2022-07-04' AS Date), N'Shopee', N'Versão especial com Luva', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (12, N'F1 2010', N'BLUS-30379', 1, 1, 4, CAST(N'2010-09-22' AS Date), CAST(38.27 AS Decimal(5, 2)), CAST(N'2022-09-29' AS Date), N'Shopee', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (13, N'Dirt 1', N'BLES-00095/P', 3, 1, 4, CAST(N'2007-09-14' AS Date), CAST(63.45 AS Decimal(5, 2)), CAST(N'2023-10-10' AS Date), N'Shopee', N'Completo, Manual em Alemão', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (14, N'Splinter Cell Trilogy', N'BLUS-30761', 1, 1, 2, CAST(N'2011-09-27' AS Date), CAST(35.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', NULL, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (15, N'Final Fantasy XIII', N'BLUS-30416', 1, 1, 5, CAST(N'2010-03-09' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-06-08' AS Date), N'Joana', N'Completo, Capa foil', NULL, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (16, N'Need For Speed Carbon', N'BLES-00020', 3, 1, 4, CAST(N'2007-03-23' AS Date), CAST(129.90 AS Decimal(5, 2)), CAST(N'2022-07-05' AS Date), N'Shopee', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (17, N'God Of War Ascension', N'BCUS-98232', 2, 1, 19, CAST(N'2013-03-12' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2021-01-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (18, N'White Knight Chronicles 1', N'BCUS-98146', 1, 1, 5, CAST(N'2010-02-02' AS Date), CAST(77.59 AS Decimal(5, 2)), CAST(N'2022-05-10' AS Date), N'Shopee', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (19, N'God Of War III', N'BCUS-98111', 1, 1, 19, CAST(N'2010-03-16' AS Date), CAST(62.71 AS Decimal(5, 2)), CAST(N'2022-11-08' AS Date), N'Shopee', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (20, N'The Last Of Us', N'BCUS-98174', 2, 1, 2, CAST(N'2013-06-14' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', 0, 6)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (21, N'Metal Gear 4 - Guns Of The Patriots', N'BLUS-30109GHL', 1, 1, 2, CAST(N'2008-06-12' AS Date), CAST(29.90 AS Decimal(5, 2)), CAST(N'2022-06-08' AS Date), N'Shopee', N'Completo, versão Greatest Hits', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (22, N'Guitar Hero - Warriors Of Rock', N'BLUS-30487', 1, 1, 10, CAST(N'2010-09-28' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-02-08' AS Date), N'Shopee', N'Completo, Bundle com a Guitarra', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (23, N'Resisteance - Fall Of Man', N'BCUS-98107', 1, 1, 13, CAST(N'2006-11-17' AS Date), CAST(47.59 AS Decimal(5, 2)), CAST(N'2023-04-11' AS Date), N'Shopee', N'Completo, Versão Greatest Hits', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (24, N'Uncharted - Drake''s Fortune', N'BCUS-90083', 1, 1, 3, CAST(N'2007-11-19' AS Date), CAST(48.69 AS Decimal(5, 2)), CAST(N'2023-06-09' AS Date), N'Shopee', N'Completo, Versão Greatest Hits', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (25, N'Gran Turismo 5', N'BCUS-98394', 2, 1, 4, CAST(N'2010-11-24' AS Date), CAST(60.00 AS Decimal(5, 2)), CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (26, N'Assassin''s Creed 1', N'BLUS-30089GH', 2, 1, 3, CAST(N'2007-11-13' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo, Versão Greatest Hits', 1, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (27, N'Diablo III - Reaper Of Souls', N'BLUS-31438SA', 2, 1, 5, CAST(N'2014-08-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (28, N'Brutal Legend', N'BLUS-30330', 1, 1, 3, CAST(N'2009-10-13' AS Date), CAST(74.17 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (29, N'Red Dead Redemption', N'BLUS-30418', 1, 1, 2, CAST(N'2010-05-18' AS Date), CAST(77.69 AS Decimal(5, 2)), CAST(N'2023-04-12' AS Date), N'Shopee', N'Completo com mapa', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (30, N'Gran Turismo 6', N'BCUS-99247', 2, 1, 4, CAST(N'2013-12-06' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2022-07-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, 8)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (31, N'Spider Man 3', N'BLUS-30031', 1, 1, 3, CAST(N'2007-05-04' AS Date), CAST(41.15 AS Decimal(5, 2)), CAST(N'2023-10-28' AS Date), N'Lucas Santana', N'Completo', 1, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (32, N'F1 2011', N'BLUS-30772SA', 2, 1, 4, CAST(N'2011-09-20' AS Date), CAST(34.42 AS Decimal(5, 2)), CAST(N'2024-06-06' AS Date), N'Will Thegamer (Shopee)', N'Completo', 1, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (33, N'Band Hero', N'BLUS-30372L', 1, 1, 10, CAST(N'2009-11-03' AS Date), CAST(45.00 AS Decimal(5, 2)), CAST(N'2023-07-20' AS Date), N'RetrotekaLive', N'Completo', 0, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (34, N'Castlevania - Lords Of Shadows 1', N'BLUS-30339S', 1, 1, 19, CAST(N'2010-10-05' AS Date), CAST(54.99 AS Decimal(5, 2)), CAST(N'2023-01-06' AS Date), N'Shopee', N'Completo', 0, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (35, N'Metal Gear Rising - Revengeance', N'BLUS-31045S', 1, 1, 19, CAST(N'2013-02-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (36, N'Alice - Madness Return', N'BLAS-50467', 5, 1, 3, CAST(N'2011-06-14' AS Date), CAST(197.49 AS Decimal(5, 2)), CAST(N'2023-02-23' AS Date), N'Shopee', N'Completo, Versão Chinesa', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (37, N'Battlefield - Bad Company', N'BLUS-30118', 1, 1, 13, CAST(N'2008-06-23' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-10' AS Date), N'Shopee', N'Completo', NULL, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (38, N'Hitman Absolution', N'BLUS-30835S', 1, 1, 2, CAST(N'2012-11-20' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2024-03-09' AS Date), N'Lucas Santana', N'Completo', NULL, 3)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (39, N'Dead Space 1', N'BLES-00308', 3, 1, 9, CAST(N'2008-10-20' AS Date), CAST(137.24 AS Decimal(5, 2)), CAST(N'2024-02-26' AS Date), N'Shopee', N'Completo', 0, 5)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (40, N'Rocksmith', N'BLUS-30871', 1, 1, 27, CAST(N'2011-10-18' AS Date), CAST(385.93 AS Decimal(5, 2)), CAST(N'2024-08-23' AS Date), N'MercadoLivre', N'Edição best Buy exclusiva com Real Tone', 0, 4)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (41, N'TEST06-06-2024:02', N'BLUS-00041', 3, 1, 9, CAST(N'2010-05-06' AS Date), CAST(100.00 AS Decimal(5, 2)), CAST(N'2024-06-06' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (42, N'TEST06-06-2024:03', N'BLUS-00042', 4, 1, 15, CAST(N'2006-02-15' AS Date), CAST(165.80 AS Decimal(5, 2)), CAST(N'2024-06-06' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (43, N'TesteInsomnia2', N'TEST-30002', 2, 1, 15, CAST(N'2007-07-05' AS Date), CAST(137.40 AS Decimal(5, 2)), CAST(N'2024-09-05' AS Date), N'Insomnia', N'Teste de integração com o insomnia', 0, 6)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [EstadoID]) VALUES (47, N'TesteInsomina', N'BLUS-02308', 1, 1, 5, CAST(N'2011-10-18' AS Date), CAST(97.50 AS Decimal(5, 2)), CAST(N'2024-08-23' AS Date), N'Teste', N'Testeintegraçãoinsom,ina', 0, 6)
SET IDENTITY_INSERT [dbo].[PS3] OFF
GO
SET IDENTITY_INSERT [dbo].[PS4] ON 

INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (1, N'Crash Bandicoot - N.Sane Trilogy', N'CUSA-07402', 2, 2, 11, CAST(N'2017-06-30' AS Date), 33, 109.15, CAST(N'2023-06-11' AS Date), N'Shopee', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (2, N'NiOh 1', N'CUSA-07113', 2, 2, 19, CAST(N'2017-07-02' AS Date), 46, 50, CAST(N'2023-12-21' AS Date), N'JP Games', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (3, N'Shadow Warrior 1', N'CUSA-00628SA', 2, 2, 13, CAST(N'2014-10-21' AS Date), 7.9, 72.45, CAST(N'2023-12-22' AS Date), N'Shopee', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (4, N'Metal Gear Solid V - The Definitive Experience', N'CUSA-05610', 2, 2, 2, CAST(N'2016-10-11' AS Date), 35, 98.39, CAST(N'2024-01-18' AS Date), N'Shopee', N'Completo, Manual Digital', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (5, N'Call Of Duty - Modern Warfare', N'CUSA-17481', 2, 2, 13, CAST(N'2019-10-25' AS Date), 150, 0, CAST(N'2024-01-29' AS Date), N'Juliano', N'Completo', 1, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (6, N'Dark Souls II - Scholar Of The First Sin', N'CUSA-01589/DST', 3, 2, 5, CAST(N'2015-04-02' AS Date), 39, 103.24, CAST(N'2023-10-07' AS Date), N'Mercado Livre', N'Edição Trilogy, Lacrado', 1, 1)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (7, N'Horizon Zero Dawn - Complete Edition', N'CUSA-10237', 2, 2, 3, CAST(N'2017-02-28' AS Date), 49, 60, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo, versão Greatest hits', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (8, N'Spider-Man ', N'CUSA-02299', 2, 2, 3, CAST(N'2018-09-07' AS Date), 45, 100, CAST(N'2022-08-20' AS Date), N'Marcos Gunner', N'Completo', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (9, N'Aragami - Collector''s Edition', N'CUSA-06168', 2, 2, 3, CAST(N'2016-10-04' AS Date), 6, 127.69, CAST(N'2023-05-08' AS Date), N'Shopee', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (10, N'Killzone - Shadow Fall', N'CUSA-00190', 1, 2, 13, CAST(N'2013-11-15' AS Date), 40, 40, CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (11, N'Call Of Duty - Infinite Warfare', N'CUSA-06443', 2, 2, 13, CAST(N'2016-11-04' AS Date), 70, 60, CAST(N'2022-08-13' AS Date), N'Marcos Gunner', N'Completo', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (12, N'Murdered - Soul Suspect', N'CUSA-00343LES', 1, 2, 3, CAST(N'2014-06-03' AS Date), 11, 50, CAST(N'2022-12-13' AS Date), N'Shopee', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (13, N'Grand Theft Auto V', N'CUSA-00419SA', 2, 2, 2, CAST(N'2014-11-18' AS Date), 59, 120, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo Com mapa', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (14, N'Middle Earth - Shadow Of Mordor', N'CUSA-00053/ANZ', 6, 2, 2, CAST(N'2014-09-30' AS Date), 11, 65.71, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (15, N'Resident Evil - Origins Collection', N'CUSA-02882', 6, 2, 9, CAST(N'2016-01-19' AS Date), 27, 125.71, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo, emprestado com o Juliano', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (16, N'Grand Theft Auto - The Trilogy Remastered', N'CUSA-29728', 2, 2, 2, CAST(N'2021-11-11' AS Date), 43, 100, CAST(N'2023-07-11' AS Date), N'JP Games', N'Completo', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (17, N'Need For Speed - Payback', N'CUSA-0599', 2, 2, 4, CAST(N'2017-09-10' AS Date), 45, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Bundle com o Videogame', 1, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (18, N'CyberPunk 2077', N'CUSA-16597/CUSA-16596', 2, 2, 5, CAST(N'2020-12-10' AS Date), 70, 60, CAST(N'2023-07-11' AS Date), N'JP Games', N'Completo, ediçao de colecionador', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (19, N'Gran Turismo Sport', N'CUSA-03220', 1, 2, 4, CAST(N'2017-10-17' AS Date), 60, 50, CAST(N'2022-08-02' AS Date), N'Shopee', N'Completo, Emprestado com o Juliano', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (20, N'Red Dead Redemption II', N'CUSA-11081/CUSA-03041', 2, 2, 2, CAST(N'2018-10-26' AS Date), 105, 100, CAST(N'2023-08-13' AS Date), N'Marcos Gunner', N'Edição Com mapa Completo', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (21, N'God Of War', N'CUSA-07408', 2, 2, 19, CAST(N'2018-04-20' AS Date), 50, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Bundle Com o Videogame', 1, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (22, N'Resident Evil 4', N'CUSA-04885', 2, 2, 9, CAST(N'2016-08-30' AS Date), 6.5, 120, CAST(N'2023-12-31' AS Date), N'Fox Games', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (23, N'Watch Dogs 1', N'CUSA-00021', 2, 2, 2, CAST(N'2014-05-26' AS Date), 21, 55, CAST(N'2023-04-06' AS Date), N'Shopee', N'Completo', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (24, N'Need For Speed Rivals', N'PLAS-05007', 5, 2, 4, CAST(N'2013-11-15' AS Date), 25, 55.45, CAST(N'2022-10-06' AS Date), N'Meu Game Usado', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (25, N'Shadow Of The Colossus', N'CUSA-08034', 2, 2, 3, CAST(N'2018-02-06' AS Date), 14, 74, CAST(N'2023-12-09' AS Date), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (26, N'The Order 1886', N'CUSA-00785', 2, 2, 2, CAST(N'2015-02-20' AS Date), 50, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (27, N'Dark Souls I Remastered', N'CUSA-08495/DST', 3, 2, 5, CAST(N'2018-05-25' AS Date), 39, 103.24, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Edição Trilogy, Lacrado', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (28, N'Medievil', N'CUSA-11227', 2, 2, 11, CAST(N'2019-10-25' AS Date), 25, 66, CAST(N'2022-06-08' AS Date), N'Shopee', N'Completo', 1, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (29, N'Star Wars - Jedi Fallen Order', N'CUSA-12539', 2, 2, 19, CAST(N'2019-11-10' AS Date), 55, 60, CAST(N'2022-05-08' AS Date), N'Lucas Santana', N'Completo', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (30, N'Dark Souls III - The Fire Fades Edition', N'CUSA-07439/DST', 3, 2, 5, CAST(N'2018-10-19' AS Date), 39, 103.24, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Edição Trilogy, Lacrado', 1, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (31, N'Tomb Raider - Definitive Edition', N'CUSA-00109', 3, 2, 3, CAST(N'2014-01-18' AS Date), 23, 80, CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (32, N'Spyro - Reignited Trilogy', N'CUSA-12125', 2, 2, 11, CAST(N'2018-11-13' AS Date), 55, 79, CAST(N'2023-07-06' AS Date), N'Shopee', N'Completo', 1, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (33, N'Sniper Elite III - Afrika', N'CUSA-00378', 1, 2, 14, CAST(N'2014-06-26' AS Date), 26, 80, CAST(N'2023-06-07' AS Date), N'Shopee', N'Completo', 0, 5)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (34, N'Knack', N'CUSA-00068', 1, 2, 11, CAST(N'2013-11-15' AS Date), 37, 84.46, CAST(N'2024-04-20' AS Date), N'Feras Games (Shopee)', N'completo', 0, 2)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (35, N'Gravity Rush 2', N'CUSA-03694', 1, 2, 11, CAST(N'2017-01-18' AS Date), 17, 0, CAST(N'2023-12-27' AS Date), N'Mãe', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (36, N'Watch Dogs 2', N'CUSA-04459', 2, 2, 2, CAST(N'2016-11-15' AS Date), 30, 0, CAST(N'2023-12-27' AS Date), N'Mãe', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (37, N'The Witcher 3 Edição Completa', N'CUSA-05725', 2, 2, 5, CAST(N'2015-05-18' AS Date), 50, 50, CAST(N'2024-03-09' AS Date), N'Lucas Santana', N'Completo', 0, 8)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (38, N'Mad Max', N'CUSA-02703', 2, 2, 3, CAST(N'2015-08-30' AS Date), 38, 50, CAST(N'2024-03-09' AS Date), N'Lucas Santana', N'Completo', 0, 4)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (39, N'Ride 1', N'CUSA-02351', 2, 2, 4, CAST(N'2015-03-27' AS Date), 20, 94.39, CAST(N'2024-06-07' AS Date), N'EduardoMorenoGames (Shopee)', N'Completo', 0, 3)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (40, N'TEST06-06-2024:02', N'BLUS-00040', 5, 2, 27, CAST(N'2020-08-12' AS Date), 150, 200, CAST(N'2024-06-06' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (42, N'TEST06-06-2024:03', N'BLUS-00041', 4, 2, 14, CAST(N'2018-02-04' AS Date), 48, 300.15, CAST(N'2024-06-06' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [EstadoID]) VALUES (44, N'NewTestInsomnia', N'TEST-01507', 3, 2, 5, CAST(N'2016-08-09' AS Date), 57, 145.98, CAST(N'2024-07-15' AS Date), N'Insomnia', N'Teste de integração com o insomnia', 0, 6)
SET IDENTITY_INSERT [dbo].[PS4] OFF
GO
SET IDENTITY_INSERT [dbo].[PS5] ON 

INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (1, N'Kena And The Bridge Of Spirits', N'PPSA-01746', 1, 5, 3, CAST(N'2021-09-21' AS Date), 19, 189.9, CAST(N'2023-08-21' AS Date), N'Shopee', N'Completo, Lacrado', 1, 2)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (2, N'Thymesia', N'PPSA-05213', 3, 5, 2, CAST(N'2022-08-15' AS Date), 13, 164, CAST(N'2024-06-29' AS Date), N'MercadoLivre', N'Completo, Novo e lacrado', 0, 3)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (3, N'TESTE-07-06-2024:02', N'PPSA-00003', 2, 5, 28, CAST(N'2023-02-15' AS Date), 98, 113.58, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (4, N'TESTE-07-06-2024:03', N'PPSA-00004', 3, 5, 27, CAST(N'2020-06-20' AS Date), 14, 199.99, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (5, N'TESTE-07-06-2024:04', N'PPSA-00005', 4, 5, 19, CAST(N'2021-01-02' AS Date), 51, 120, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (8, N'TESTE-07-06-2024:05', N'PPSA-00006', 5, 5, 16, CAST(N'2023-07-07' AS Date), 46, 142.24, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (9, N'TESTE-07-06-2024:06', N'PPSA-00007', 6, 5, 15, CAST(N'2023-09-28' AS Date), 265, 199.9, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (10, N'TESTE-07-06-2024:07', N'PPSA-00008', 1, 5, 14, CAST(N'2022-09-11' AS Date), 26.5, 230.27, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (11, N'TESTE-07-06-2024:08', N'PPSA-00009', 2, 5, 13, CAST(N'2024-04-23' AS Date), 79.8, 350.9, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
INSERT [dbo].[PS5] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Dualsense], [EstadoID]) VALUES (12, N'TESTE-07-06-2024:09', N'PPSA-00010', 3, 5, 12, CAST(N'2021-06-07' AS Date), 99, 400, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
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
SET IDENTITY_INSERT [dbo].[WiiU] ON 

INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (1, N'Bayonetta 1', N'WUP-AAFE', 1, 8, 19, CAST(N'2014-10-24T00:00:00.000' AS DateTime), 123.32, CAST(N'2023-11-29T00:00:00.000' AS DateTime), N'Shopee', N'Completo com Manual', 1, 4)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (2, N'Bayonetta 2', N'WUP-AQUE', 1, 8, 19, CAST(N'2014-10-24T00:00:00.000' AS DateTime), 123.32, CAST(N'2023-11-29T00:00:00.000' AS DateTime), N'Shopee', N'Completo com Manual', 1, 3)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (3, N'Super Mario 3D World', N'WUP-ARDE', 1, 8, 11, CAST(N'2013-11-22T00:00:00.000' AS DateTime), 0, CAST(N'2023-04-20T00:00:00.000' AS DateTime), N'Shopee', N'Completo com Manual', 1, 8)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (4, N'TESTE-07-06-2024:01', N'WUP-TST1', 1, 8, 2, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 79, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (5, N'TESTE-07-06-2024:01', N'WUP-TST2', 2, 8, 3, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 89, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (6, N'TESTE-07-06-2024', N'WUP-TST3', 3, 8, 4, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 170, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (7, N'TESTE-07-06-2024', N'WUP-TST4', 4, 8, 5, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 200, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (8, N'TESTE-07-06-2024', N'WUP-TST5', 5, 8, 6, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 197.5, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (9, N'TESTE-07-06-2024', N'WUP-TST6', 6, 8, 7, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 0, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
INSERT [dbo].[WiiU] ([GameID], [Nome], [Serial], [RegiaoID], [PlataformaID], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [WiiMote], [EstadoID]) VALUES (10, N'TESTE-07-06-2024', N'WUP-TST7', 1, 8, 8, CAST(N'2013-12-23T00:00:00.000' AS DateTime), 200.82, CAST(N'2024-06-07T00:00:00.000' AS DateTime), N'teste', N'teste', 1, 6)
SET IDENTITY_INSERT [dbo].[WiiU] OFF
GO
SET IDENTITY_INSERT [dbo].[Xbox360] ON 

INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (1, N'REPLACEOLDGAME', N'12345-67801', 1, 6, 8, CAST(N'2006-10-05' AS Date), 98, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (2, N'Devil May Cry HD Collection', N'01338893101-9', 1, 6, 19, CAST(N'2012-03-22' AS Date), 124.48, CAST(N'2023-07-08' AS Date), N'Shopee', N'Completo com Manual', 0, 3)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (3, N'Dragon Age Origins', N'0146331580-6', 1, 6, 5, CAST(N'2009-11-02' AS Date), 62.3, CAST(N'2023-10-04' AS Date), N'Shopee', N'Completo com Manual', 0, 3)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (4, N'PLACEHOLDERGAME1', N'24680-13502', 2, 5, 9, CAST(N'2006-11-27' AS Date), 147.6, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (5, N'PLACEHOLDERGAME2', N'24680-13503', 3, 6, 10, CAST(N'2006-11-27' AS Date), 99.5, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (6, N'PLACEHOLDERGAME3', N'24680-13504', 4, 6, 11, CAST(N'2006-11-27' AS Date), 320.36, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (7, N'PLACEHOLDERGAME7', N'24680-13507', 5, 6, 12, CAST(N'2006-11-27' AS Date), 0, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 0, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (8, N'PLACEHOLDERGAME8', N'24680-13508', 6, 6, 13, CAST(N'2006-11-27' AS Date), 37.5, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (9, N'PLACEHOLDERGAME9', N'24680-13509', 1, 6, 14, CAST(N'2006-11-27' AS Date), 78.4, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
INSERT [dbo].[Xbox360] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Kinect], [EstadoID]) VALUES (10, N'PLACEHOLDERGAME10', N'24680-13510', 2, 6, 15, CAST(N'2006-11-27' AS Date), 99.99, CAST(N'2024-06-07' AS Date), N'teste', N'teste', 1, 6)
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
ALTER TABLE [dbo].[WiiU]  WITH CHECK ADD FOREIGN KEY([RegiaoID])
REFERENCES [dbo].[Regiao] ([RegiaoId])
GO
ALTER TABLE [dbo].[WiiU]  WITH CHECK ADD FOREIGN KEY([EstadoID])
REFERENCES [dbo].[Estado] ([estadoID])
GO
ALTER TABLE [dbo].[WiiU]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[WiiU]  WITH CHECK ADD FOREIGN KEY([PlataformaID])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_N3DS]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS2]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS3]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4]    Script Date: 30/08/2024 15:22:45 ******/
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
	  when PS4Pro = 0 then 'Não'
	  when PS4Pro = 1 then 'Sim'
	  end as PS4Pro
	  ,[Estado].[EstadoNome] as Estado
  FROM [GameDB].[dbo].[PS4]
  inner join Regiao on Regiao.RegiaoId = PS4.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS4.PlataformaId
  inner join Genero on Genero.GeneroID = PS4.GeneroID
  inner join Estado on Estado.estadoID = PS4.EstadoID
  order by Nome
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4_E_PS5]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS5]    Script Date: 30/08/2024 15:22:45 ******/
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_WiiU]    Script Date: 30/08/2024 15:22:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Listar_Jogos_WiiU]
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
	  When WiiMote = 0 then 'Não'
	  when WiiMote = 1 then 'Sim'
	  else 'Sem informação'
	  end as WiiMote
	  ,[Estado].[EstadoNome] as Estado
  FROM WiiU
	  inner join Regiao on Regiao.RegiaoId = WiiU.RegiaoId
	  inner join Plataforma on Plataforma.PlataformaId = WiiU.PlataformaId
	  inner join Genero on Genero.GeneroID = WiiU.GeneroID
	  inner join Estado on Estado.estadoID = WiiU.EstadoID	 
  order by Nome 
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_Xbox360]    Script Date: 30/08/2024 15:22:45 ******/
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
