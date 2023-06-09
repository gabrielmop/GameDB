USE [master]
GO
/****** Object:  Database [GameDB]    Script Date: 27/04/2023 11:06:38 ******/
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
/****** Object:  Table [dbo].[EventoLogs]    Script Date: 27/04/2023 11:06:38 ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 27/04/2023 11:06:38 ******/
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
/****** Object:  Table [dbo].[Logs]    Script Date: 27/04/2023 11:06:38 ******/
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
/****** Object:  Table [dbo].[N3DS]    Script Date: 27/04/2023 11:06:38 ******/
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
	[Estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plataforma]    Script Date: 27/04/2023 11:06:38 ******/
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
/****** Object:  Table [dbo].[PS3]    Script Date: 27/04/2023 11:06:38 ******/
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
	[Estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS4]    Script Date: 27/04/2023 11:06:38 ******/
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
	[Estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regiao]    Script Date: 27/04/2023 11:06:38 ******/
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
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (1, CAST(N'2023-03-31T23:42:40.860' AS DateTime), 2, N'O genero TTL Foi registrado no Banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (2, CAST(N'2023-03-31T23:46:31.303' AS DateTime), 2, N'O genero TTL Foi apagado do Banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (3, CAST(N'2023-04-03T15:49:43.320' AS DateTime), 2, N'a Plataforma Moop1 da Teste  Foi registrado no Banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (4, CAST(N'2023-04-03T15:59:53.777' AS DateTime), 2, N'O Jogo Teste foi adicionado ao banco, custo de R$40', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (5, CAST(N'2023-04-03T16:14:10.933' AS DateTime), 2, N'O Jogo Teste04 foi adicionado ao banco, custo de R$90', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (6, CAST(N'2023-04-03T16:16:13.417' AS DateTime), 2, N'O Jogo de PS4 Teste05 foi adicionado ao banco, custo de R$50', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (7, CAST(N'2023-04-03T17:35:43.603' AS DateTime), 1, N'Um Erro foi encontrado', N'The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See http://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (8, CAST(N'2023-04-03T17:36:43.377' AS DateTime), 1, N'Um Erro foi encontrado', N'The database operation was expected to affect 1 row(s), but actually affected 0 row(s); data may have been modified or deleted since entities were loaded. See http://go.microsoft.com/fwlink/?LinkId=527962 for information on understanding and handling optimistic concurrency exceptions.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (9, CAST(N'2023-04-03T17:42:15.517' AS DateTime), 2, N'O Jogo Mass Effect 1 (Mass Effect Colletion) foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (10, CAST(N'2023-04-03T17:43:19.723' AS DateTime), 2, N'O Jogo Mass Effect 2 (Mass Effect Colletion) foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (11, CAST(N'2023-04-03T17:45:53.337' AS DateTime), 2, N'O Jogo de Ps3 Mass Effect 3 (Mass Effect Collection) foi adicionado ao banco, custo de R$120', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (12, CAST(N'2023-04-03T18:01:03.977' AS DateTime), 2, N'O Jogo Call Of Duty - Infinite Warfare foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (13, CAST(N'2023-04-03T18:02:44.170' AS DateTime), 2, N'O Jogo Call Of Duty - Infinite Warfare foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (14, CAST(N'2023-04-03T18:05:11.370' AS DateTime), 2, N'O Jogo Call Of Duty - Infinite Warfare foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (15, CAST(N'2023-04-03T18:30:47.960' AS DateTime), 2, N'O Jogo Dark Souls 1 (Dark Souls Trilogy) foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (16, CAST(N'2023-04-03T18:32:14.463' AS DateTime), 2, N'O Jogo Dark Souls 2 (Dark Souls Trilogy) foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (17, CAST(N'2023-04-03T18:32:38.617' AS DateTime), 2, N'O Jogo Dark Souls 3 (Dark Souls Trilogy) foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (18, CAST(N'2023-04-03T18:37:47.977' AS DateTime), 2, N'O Jogo de ID 7 foi editado para God Of War 2018', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (19, CAST(N'2023-04-03T18:43:41.677' AS DateTime), 2, N'O Jogo de ID 4 foi editado para Gran Turismo Sport', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (20, CAST(N'2023-04-04T12:01:28.573' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (21, CAST(N'2023-04-04T12:01:53.827' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (22, CAST(N'2023-04-04T12:02:34.363' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (23, CAST(N'2023-04-04T12:03:07.257' AS DateTime), 2, N'O Jogo de PS4 Grand Theft Auto V foi adicionado ao banco, custo de R$120', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (24, CAST(N'2023-04-04T13:13:56.473' AS DateTime), 2, N'O Jogo de PS4 Gravity Rush 2  foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (25, CAST(N'2023-04-04T13:16:01.147' AS DateTime), 2, N'O Jogo de PS4 Horizon - Zero Dawn Complete Edition foi adicionado ao banco, custo de R$60', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (26, CAST(N'2023-04-04T13:20:11.923' AS DateTime), 2, N'O Jogo de PS4 Killzone - Shadow''s Fall foi adicionado ao banco, custo de R$40', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (27, CAST(N'2023-04-04T15:11:33.473' AS DateTime), 2, N'O Jogo de PS4 Medievil foi adicionado ao banco, custo de R$66', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (28, CAST(N'2023-04-04T15:13:01.583' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (29, CAST(N'2023-04-04T15:13:24.223' AS DateTime), 2, N'O Jogo de PS4 Middle Earth - Shadow Of Mordor foi adicionado ao banco, custo de R$60', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (30, CAST(N'2023-04-04T15:14:55.087' AS DateTime), 2, N'O Jogo de PS4 Need For Speed - Payback foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (31, CAST(N'2023-04-04T15:15:59.937' AS DateTime), 2, N'O Jogo de PS4 Need For Speed - Rivals foi adicionado ao banco, custo de R$55,45', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (32, CAST(N'2023-04-04T15:17:50.670' AS DateTime), 1, N'Um erro foi encontrado', N'An error occurred while saving the entity changes. See the inner exception for details.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (33, CAST(N'2023-04-04T15:19:14.723' AS DateTime), 2, N'O Jogo de PS4 Red Dead Redemption II foi adicionado ao banco, custo de R$100', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (34, CAST(N'2023-04-04T15:20:46.133' AS DateTime), 2, N'O Jogo de PS4 Resident Evil - Origins Collection foi adicionado ao banco, custo de R$120', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (35, CAST(N'2023-04-04T15:22:02.407' AS DateTime), 2, N'O Jogo de PS4 Resident Evil 4 foi adicionado ao banco, custo de R$120', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (36, CAST(N'2023-04-04T15:23:46.077' AS DateTime), 2, N'O Jogo de PS4 Shadow Of The Colossus foi adicionado ao banco, custo de R$74', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (37, CAST(N'2023-04-04T15:24:39.323' AS DateTime), 2, N'O Jogo de PS4 Spider-Man - Game of The Year Edition foi adicionado ao banco, custo de R$100', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (38, CAST(N'2023-04-04T15:25:49.570' AS DateTime), 2, N'O Jogo de PS4 Spyro Reignited Trilogy foi adicionado ao banco, custo de R$79', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (39, CAST(N'2023-04-04T15:28:16.950' AS DateTime), 2, N'O Jogo de PS4 Star Wars - Jedi Fallen Order foi adicionado ao banco, custo de R$60', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (40, CAST(N'2023-04-04T15:29:57.673' AS DateTime), 2, N'O Jogo Spyro Reignited Trilogy foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (41, CAST(N'2023-04-04T15:31:09.650' AS DateTime), 2, N'O Jogo de PS4 The Division 1 foi adicionado ao banco, custo de R$40', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (42, CAST(N'2023-04-04T15:31:40.870' AS DateTime), 2, N'O Jogo The Division 1 foi editado no banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (43, CAST(N'2023-04-04T15:32:42.167' AS DateTime), 2, N'O Jogo de PS4 The Division 2 foi adicionado ao banco, custo de R$40', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (44, CAST(N'2023-04-04T15:33:53.800' AS DateTime), 2, N'O Jogo de PS4 The Order 1886 foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (45, CAST(N'2023-04-04T15:35:27.193' AS DateTime), 2, N'O Jogo de PS4 Tomb Raider Definitive Edition foi adicionado ao banco, custo de R$80', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (46, CAST(N'2023-04-04T15:36:55.757' AS DateTime), 2, N'O Jogo de PS4 Watch_Dogs 2 foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (47, CAST(N'2023-04-04T15:41:23.343' AS DateTime), 2, N'O Jogo de PS4 Murdered - Soul Suspect foi adicionado ao banco, custo de R$50', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (48, CAST(N'2023-04-06T18:39:42.383' AS DateTime), 2, N'O Jogo de PS4 Watch_Dogs 1 foi adicionado ao banco, custo de R$55', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (49, CAST(N'2023-04-11T11:25:51.900' AS DateTime), 2, N'O Jogo de N3DS teste foi adicionado ao banco, custo de R$100', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (50, CAST(N'2023-04-11T15:43:55.067' AS DateTime), 1, N'Um erro foi encontrado', N'The required column ''Tamanho'' was not present in the results of a ''FromSql'' operation.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (51, CAST(N'2023-04-11T15:50:24.340' AS DateTime), 1, N'Um erro foi encontrado', N'Unable to cast object of type ''System.String'' to type ''System.DateTime''.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (52, CAST(N'2023-04-11T22:09:25.733' AS DateTime), 2, N'O Jogo de Ps3 Resistance 1 - Fall Of Man foi adicionado ao banco, custo de R$47,59', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (53, CAST(N'2023-04-12T12:27:37.320' AS DateTime), 2, N'O Jogo de N3DS teste1204 foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (54, CAST(N'2023-04-12T12:29:00.560' AS DateTime), 2, N'O Jogo de N3DS teste120402 foi adicionado ao banco, custo de R$120', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (55, CAST(N'2023-04-12T12:29:57.083' AS DateTime), 2, N'O Jogo de N3DS teste120403 foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (56, CAST(N'2023-04-12T12:39:31.997' AS DateTime), 2, N'O Jogo de N3DS teste120404 foi adicionado ao banco, custo de R$0', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (57, CAST(N'2023-04-12T12:50:01.327' AS DateTime), 1, N'Um erro foi encontrado', N'Input string was not in a correct format.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (58, CAST(N'2023-04-12T18:51:55.750' AS DateTime), 2, N'O jogo teste de ID 1 foi apagado do banco', N'Nenhum erro foi encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (59, CAST(N'2023-04-12T18:52:54.353' AS DateTime), 2, N'O jogo teste1204 foi alterado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (60, CAST(N'2023-04-12T19:02:17.897' AS DateTime), 2, N'O genero Misc Foi registrado no Banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (61, CAST(N'2023-04-12T19:04:02.760' AS DateTime), 2, N'O Jogo de 3DS de id 2 foi editado no banco para teste1204', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (62, CAST(N'2023-04-12T19:04:41.483' AS DateTime), 2, N'O Jogo de 3DS de id 2 foi editado no banco para teste1204', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (63, CAST(N'2023-04-12T19:06:02.880' AS DateTime), 2, N'O Jogo de 3DS de id 2 foi editado no banco para teste1204', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (64, CAST(N'2023-04-12T19:06:53.593' AS DateTime), 2, N'O Jogo de 3DS de id 2 foi editado no banco para Mario Party - Island Tour', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (65, CAST(N'2023-04-12T19:18:27.157' AS DateTime), 1, N'Um erro foi encontrado', N'Nome de coluna ''New3DS'' inválido.')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (66, CAST(N'2023-04-12T19:18:58.383' AS DateTime), 2, N'O jogo Mario Party - Island Tour foi alterado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (67, CAST(N'2023-04-12T19:22:40.260' AS DateTime), 2, N'O Jogo de 3DS de id 3 foi editado no banco para Super Mario 3D Land', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (68, CAST(N'2023-04-12T19:23:05.367' AS DateTime), 2, N'O jogo Super Mario 3D Land foi alterado no banco', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (69, CAST(N'2023-04-12T19:24:46.593' AS DateTime), 2, N'O Jogo de 3DS de id 4 foi editado no banco para Super Mario Maker For 3DS', N'Nenhum erro encontrado')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (70, CAST(N'2023-04-12T20:52:20.363' AS DateTime), 2, N'O Jogo de Ps3 Red Dead Redemption 1 foi adicionado ao banco, custo de R$77,69', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (71, CAST(N'2023-04-27T10:48:55.363' AS DateTime), 2, N'O genero FPS Foi Alterado no Banco', N'')
INSERT [dbo].[Logs] ([ID], [DataHora], [TipoEvento], [Mensagem], [Exception]) VALUES (72, CAST(N'2023-04-27T10:49:09.253' AS DateTime), 2, N'O genero TPS Foi Alterado no Banco', N'')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [dbo].[N3DS] ON 

INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [Estado]) VALUES (2, N'Mario Party - Island Tour', N'CTR-ATSE', 1, 5, 27, CAST(N'2013-11-22' AS Date), 175.5, 0, CAST(N'2023-02-15' AS Date), N'MercadoLivre', N'Completo, Veio Com o Videogame', 1, NULL)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [Estado]) VALUES (3, N'Super Mario 3D Land', N'CTR-AREE', 1, 5, 11, CAST(N'2013-11-03' AS Date), 222.9, 0, CAST(N'2023-02-15' AS Date), N'MercadoLivre', N'Completo, Veio com o Videogame', 1, NULL)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [Estado]) VALUES (4, N'Super Mario Maker For 3DS', N'CTR-AJHE', 1, 5, 27, CAST(N'2015-09-10' AS Date), 221.5, 0, CAST(N'2023-02-15' AS Date), N'MercadoLivre', N'Completo, Veio com o Videogame', 0, NULL)
INSERT [dbo].[N3DS] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroId], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Suporte3D], [Estado]) VALUES (5, N'teste120404', N'TEste-1204', 2, 5, 19, CAST(N'2006-02-15' AS Date), 5.1, 0, CAST(N'2022-04-12' AS Date), N'Teste', N'TesteEndpoints120403, Videogame', NULL, NULL)
SET IDENTITY_INSERT [dbo].[N3DS] OFF
GO
SET IDENTITY_INSERT [dbo].[Plataforma] ON 

INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (1, N'Sony', N'Playstation 3')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (2, N'Sony', N'Playstation 4')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (3, N'Nintendo', N'Wii')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (5, N'Nintendo', N'New 3DS XL')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (6, N'Teste', N'Moop1')
SET IDENTITY_INSERT [dbo].[Plataforma] OFF
GO
SET IDENTITY_INSERT [dbo].[PS3] ON 

INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (2, N'Alice - Madness Return', N'BLAS-50467', 5, 1, 3, CAST(N'2011-06-14' AS Date), CAST(188.00 AS Decimal(5, 2)), CAST(N'2023-02-23' AS Date), N'Shopee', N'Completo, Versão Chinesa', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (3, N'Assassin''s Creed 1 ', N'BLUS-30089SA ', 1, 1, 2, CAST(N'2007-11-13' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo, Versão Greatest Hits', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (4, N'Battlefield - Bad Company 1', N'BLUS-30118', 1, 1, 13, CAST(N'2008-06-23' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-10' AS Date), N'Shopee', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (6, N'Bioshock 1', N'BLES-00316', 3, 1, 13, CAST(N'2007-08-27' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2022-07-04' AS Date), N'Shopee', N'Versão especial com luva foil', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (7, N'Brütal Legend', N'BLUS-30330', 1, 1, 3, CAST(N'2009-10-13' AS Date), CAST(69.90 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Completo', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (8, N'Castlevania - Lords Of Shadows 1', N'BLUS-30339S', 1, 1, 19, CAST(N'2010-10-05' AS Date), CAST(54.99 AS Decimal(5, 2)), CAST(N'2023-01-06' AS Date), N'Shopee', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (9, N'Demon''s Souls', N'BLUS-30443GH', 1, 1, 5, CAST(N'2009-02-05' AS Date), CAST(99.00 AS Decimal(5, 2)), CAST(N'2022-08-17' AS Date), N'Shopee', N'Versão Greatest Hits, Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (10, N'Diablo III Ultimate Evil Edition', N'BLUS-31438', 2, 1, 5, CAST(N'2014-08-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (11, N'F1 2010', N'BLUS-30379', 1, 1, 4, CAST(N'2010-09-22' AS Date), CAST(34.00 AS Decimal(5, 2)), CAST(N'2022-09-29' AS Date), N'Shopee', N'Completo', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (12, N'God of War: Ascension', N'BCUS-98232', 2, 1, 19, CAST(N'2013-03-12' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2021-01-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (13, N'God Of War III', N'BCUS-98111', 1, 1, 19, CAST(N'2010-03-16' AS Date), CAST(60.00 AS Decimal(5, 2)), CAST(N'2022-11-08' AS Date), N'Shopee', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (14, N'Gran turismo 5 XL', N'BCUS-98394', 2, 1, 4, CAST(N'2010-11-24' AS Date), CAST(60.00 AS Decimal(5, 2)), CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (15, N'Gran turismo 6', N'BCUS-99247', 2, 1, 4, CAST(N'2013-12-06' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2021-07-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (16, N'Grid 1', N'BLUS-30142', 2, 1, 4, CAST(N'2008-05-30' AS Date), CAST(39.90 AS Decimal(5, 2)), CAST(N'2022-12-07' AS Date), N'Shopee', N'Versão Brasileira Relançada, completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (17, N'Guitar Hero 6 - Warriors Of Rock', N'BLUS-30487', 1, 1, 10, CAST(N'2010-09-28' AS Date), CAST(0.00 AS Decimal(5, 2)), CAST(N'2023-02-08' AS Date), N'Shopee', N'Completo, Bundle com a Guitarra', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (18, N'Mass Effect 1 (Mass Effect Colletion)', N'BLUS-31139P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(120.00 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (19, N'Metal Gear 4 - Guns Of the Patriots', N'BLUS-30109GHL', 1, 1, 2, CAST(N'2008-06-12' AS Date), CAST(29.90 AS Decimal(5, 2)), CAST(N'2022-06-08' AS Date), N'Shopee', N'Completo, Versão Greatest hits', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (20, N'Metal Gear Rising - Revengeance', N'BLUS-31045S', 1, 1, 19, CAST(N'2013-02-19' AS Date), CAST(40.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (21, N'Need For Speed Carbon', N'BLES-00020', 3, 1, 4, CAST(N'2006-10-30' AS Date), CAST(128.00 AS Decimal(5, 2)), CAST(N'2022-07-05' AS Date), N'Shopee', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (22, N'The Last Of Us', N'BCUS-98174', 2, 1, 2, CAST(N'2013-06-16' AS Date), CAST(50.00 AS Decimal(5, 2)), CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (23, N'Tom Clancy''s Splinter Cell Trilogy', N'BLUS-30761', 1, 1, 6, CAST(N'2011-09-27' AS Date), CAST(35.00 AS Decimal(5, 2)), CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (24, N'White Knight Chronicles 1', N'BCUS-98146', 1, 1, 5, CAST(N'2010-02-02' AS Date), CAST(60.00 AS Decimal(5, 2)), CAST(N'2022-05-15' AS Date), N'Shopee', N'Completo', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (25, N'Xcom: enemy Within', N'BLUS-31180', 2, 1, 15, CAST(N'2013-11-12' AS Date), CAST(39.90 AS Decimal(5, 2)), CAST(N'2022-05-08' AS Date), N'Livraria Leitura', N'Completo Novo e Lacrado', NULL, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (26, N'Mass Effect 2 (Mass Effect Colletion)', N'BLUS-30650P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(120.00 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (27, N'Mass Effect 3 (Mass Effect Collection)', N'BLUS-30853P3', 1, 1, 14, CAST(N'2012-12-04' AS Date), CAST(120.00 AS Decimal(5, 2)), CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, edição de Colecionador', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (28, N'Resistance 1 - Fall Of Man', N'BCUS-98107', 1, 1, 13, CAST(N'2006-11-17' AS Date), CAST(47.59 AS Decimal(5, 2)), CAST(N'2023-04-11' AS Date), N'Shopee', N'Versão Greatest Hits, Completo', 1, NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao], [Estado]) VALUES (29, N'Red Dead Redemption 1', N'BLUS-30418', 1, 1, 2, CAST(N'2010-05-18' AS Date), CAST(77.69 AS Decimal(5, 2)), CAST(N'2023-04-12' AS Date), N'Shopee', N'Completo Com Mapa', 1, NULL)
SET IDENTITY_INSERT [dbo].[PS3] OFF
GO
SET IDENTITY_INSERT [dbo].[PS4] ON 

INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (2, N'Call Of Duty - Infinite Warfare', N'CUSA-06443', 2, 2, 13, CAST(N'2016-04-11' AS Date), 70, 60, CAST(N'2022-08-13' AS Date), N'Marcos Gunner', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (3, N'Dark Souls 1 (Dark Souls Trilogy)', N'CUSA-08495', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 309, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Completo, Edição de Colecionador, lacrado', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (4, N'Gran Turismo Sport', N'CUSA-03220', 2, 2, 4, CAST(N'2017-10-17' AS Date), 60, 50, CAST(N'2022-08-02' AS Date), N'Shopee', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (5, N'Dark Souls 2 (Dark Souls Trilogy)', N'CUSA-01589', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 309, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Completo, Edição de Colecionador, lacrado', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (6, N'Dark Souls 3 (Dark Souls Trilogy)', N'CUSA-07439', 3, 2, 5, CAST(N'2018-10-19' AS Date), 13, 309, CAST(N'2022-10-07' AS Date), N'Mercado Livre', N'Completo, Edição de Colecionador, lacrado', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (7, N'God Of War 2018', N'CUSA-07408', 2, 2, 19, CAST(N'2018-04-20' AS Date), 55, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Veio com o Videogame', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (8, N'Grand Theft Auto V', N'CUSA-00419SA', 2, 2, 2, CAST(N'2014-11-18' AS Date), 59, 120, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo com Mapa', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (9, N'Gravity Rush 2 ', N'CUSA-03694', 2, 2, 11, CAST(N'2017-01-18' AS Date), 17, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (10, N'Horizon - Zero Dawn Complete Edition', N'CUSA-10237', 2, 2, 3, CAST(N'2017-02-28' AS Date), 49, 60, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo, Greatest Hits', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (11, N'Killzone - Shadow''s Fall', N'CUSA-00190', 1, 2, 13, CAST(N'2013-11-15' AS Date), 40, 40, CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (12, N'Medievil', N'CUSA-11227', 2, 2, 3, CAST(N'2019-10-25' AS Date), 25, 66, CAST(N'2022-06-08' AS Date), N'Shopee', N'Lacrado', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (13, N'Middle Earth - Shadow Of Mordor', N'CUSA-00053', 6, 2, 19, CAST(N'2014-09-30' AS Date), 29, 60, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (14, N'Need For Speed - Payback', N'CUSA-05999', 2, 2, 4, CAST(N'2017-09-10' AS Date), 45, 0, CAST(N'2022-04-14' AS Date), N'Mercado Livre', N'Completo, Veio com o Videogame', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (15, N'Need For Speed - Rivals', N'PLAS-05007', 5, 2, 4, CAST(N'2013-11-15' AS Date), 25, 55.45, CAST(N'2022-10-06' AS Date), N'Meu Game Usado', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (17, N'Red Dead Redemption II', N'CUSA-11081/CUSA-03041', 2, 2, 2, CAST(N'2018-10-26' AS Date), 105, 100, CAST(N'2022-08-13' AS Date), N'Marcos Gunner', N'Edição de Lançamento com o Mapa', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (18, N'Resident Evil - Origins Collection', N'CUSA-02882', 6, 2, 9, CAST(N'2016-01-19' AS Date), 27, 120, CAST(N'2022-06-01' AS Date), N'Fox Games', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (19, N'Resident Evil 4', N'CUSA-04885', 2, 2, 9, CAST(N'2016-08-30' AS Date), 6.5, 120, CAST(N'2022-12-30' AS Date), N'Fox Games', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (20, N'Shadow Of The Colossus', N'CUSA-08034', 2, 2, 3, CAST(N'2018-02-06' AS Date), 14, 74, CAST(N'2022-12-09' AS Date), N'Shopee', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (21, N'Spider-Man - Game of The Year Edition', N'CUSA-02299', 2, 2, 3, CAST(N'2018-09-07' AS Date), 45, 100, CAST(N'2022-08-20' AS Date), N'Marcos Gunner', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (22, N'Spyro Reignited Trilogy', N'CUSA-12125', 2, 2, 11, CAST(N'2018-11-13' AS Date), 55, 79, CAST(N'2022-07-06' AS Date), N'Shopee', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (23, N'Star Wars - Jedi Fallen Order', N'CUSA-12539', 2, 2, 19, CAST(N'2019-11-10' AS Date), 55, 60, CAST(N'2022-05-08' AS Date), N'Lucas Santana', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (24, N'The Division 1', N'CUSA-01810', 2, 2, 14, CAST(N'2016-03-08' AS Date), 56, 40, CAST(N'2022-05-16' AS Date), N'Lucas Santana', N'Encarte Reimpresso e Capa de Filme', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (25, N'The Division 2', N'CUSA-12639', 2, 2, 14, CAST(N'2019-02-07' AS Date), 94, 40, CAST(N'2022-05-15' AS Date), N'Lucas Santana', N'Completo', 1, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (26, N'The Order 1886', N'CUSA-00785', 2, 2, 2, CAST(N'2015-02-20' AS Date), 50, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (27, N'Tomb Raider Definitive Edition', N'CUSA-00109', 3, 2, 3, CAST(N'2014-01-18' AS Date), 23, 80, CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (28, N'Watch_Dogs 2', N'CUSA-04459', 2, 2, 2, CAST(N'2016-11-15' AS Date), 30, 0, CAST(N'2022-12-27' AS Date), N'Mãe', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (29, N'Murdered - Soul Suspect', N'CUSA-00343', 1, 2, 9, CAST(N'2014-06-03' AS Date), 11, 50, CAST(N'2022-12-13' AS Date), N'Shopee', N'Completo', 0, NULL)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro], [Estado]) VALUES (30, N'Watch_Dogs 1', N'CUSA-00021', 1, 2, 2, CAST(N'2014-05-26' AS Date), 21, 55, CAST(N'2022-04-06' AS Date), N'Shopee', N'Completo', 0, NULL)
SET IDENTITY_INSERT [dbo].[PS4] OFF
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
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD FOREIGN KEY([TipoEvento])
REFERENCES [dbo].[EventoLogs] ([ID])
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
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([GeneroID])
REFERENCES [dbo].[Genero] ([GeneroID])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([PlataformaId])
REFERENCES [dbo].[Plataforma] ([PlataformaId])
GO
ALTER TABLE [dbo].[PS3]  WITH CHECK ADD FOREIGN KEY([RegiaoId])
REFERENCES [dbo].[Regiao] ([RegiaoId])
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_N3DS]    Script Date: 27/04/2023 11:06:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
	  ,convert (varchar, [Tamanho]) as Tamanho
      ,format ([Preco], 'C') as Preco
      ,convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,[Suporte3D]
	  ,[Estado]
  FROM N3DS
  inner join Regiao on Regiao.RegiaoId = N3DS.RegiaoId
  inner join Plataforma on Plataforma.PlataformaId = N3ds.PlataformaId
  inner join Genero on Genero.GeneroID = N3DS.GeneroId
  order by Nome 
END
GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS3]    Script Date: 27/04/2023 11:06:38 ******/
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
      ,[Instalacao]
	  ,[Estado]
  FROM [GameDB].[dbo].[PS3]
  inner join Regiao on Regiao.RegiaoId = PS3.RegiaoId
  inner join Plataforma on Plataforma.PlataformaId = PS3.PlataformaId
  inner join Genero on Genero.GeneroID = Ps3 .GeneroID
  order by Nome 
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4]    Script Date: 27/04/2023 11:06:38 ******/
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
      ,Convert (varchar, [Tamanho] ) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,Convert (varchar, [Aquisicao], 103) as Aquisicao
      ,[LocalAdq]
      ,[Observacoes]
      ,[PS4Pro]
	  ,[Estado]
  FROM [GameDB].[dbo].[PS4]
  inner join Regiao on Regiao.RegiaoId = PS4.RegiaoId 
  inner join Plataforma on Plataforma.PlataformaId = PS4.PlataformaId
  inner join Genero on Genero.GeneroID = PS4.GeneroID
  order by Nome
END


GO
USE [master]
GO
ALTER DATABASE [GameDB] SET  READ_WRITE 
GO
