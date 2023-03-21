USE [master]
GO
/****** Object:  Database [GameDB]    Script Date: 21/03/2023 17:14:29 ******/
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
/****** Object:  Table [dbo].[Genero]    Script Date: 21/03/2023 17:14:30 ******/
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
/****** Object:  Table [dbo].[Plataforma]    Script Date: 21/03/2023 17:14:30 ******/
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
/****** Object:  Table [dbo].[PS3]    Script Date: 21/03/2023 17:14:30 ******/
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
	[Preco] [float] NULL,
	[Aquisicao] [date] NULL,
	[LocalAdq] [nvarchar](100) NULL,
	[Observacoes] [nvarchar](300) NULL,
	[Instalacao] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PS4]    Script Date: 21/03/2023 17:14:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PS4](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](350) NULL,
	[Serial] [nvarchar](15) NULL,
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
PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regiao]    Script Date: 21/03/2023 17:14:30 ******/
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
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (13, N'Tiro em Primeira Pessoa')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (14, N'Tiro em Terceira Pessoa')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (15, N'Estrategia')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (16, N'Indie')
INSERT [dbo].[Genero] ([GeneroID], [Genero]) VALUES (19, N'Hack N'' Slash')
SET IDENTITY_INSERT [dbo].[Genero] OFF
GO
SET IDENTITY_INSERT [dbo].[Plataforma] ON 

INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (1, N'Sony', N'Playstation 3')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (2, N'Sony', N'Playstation 4')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (3, N'Nintendo', N'Wii')
INSERT [dbo].[Plataforma] ([PlataformaId], [Marca], [Console]) VALUES (5, N'Nintendo', N'New 3DS XL')
SET IDENTITY_INSERT [dbo].[Plataforma] OFF
GO
SET IDENTITY_INSERT [dbo].[PS3] ON 

INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (2, N'Alice - Madness Return', N'BLAS-50467', 5, 1, 3, CAST(N'2011-06-14' AS Date), 188, CAST(N'2023-02-23' AS Date), N'Shopee', N'Completo, Versão Chinesa', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (3, N'Assassin''s Creed 1 ', N'BLUS-30089SA ', 1, 1, 2, CAST(N'2007-11-13' AS Date), 40, CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo, Versão Greatest Hits', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (4, N'Battlefield - Bad Company 1', N'BLUS-30118', 1, 1, 13, CAST(N'2008-06-23' AS Date), 40, CAST(N'2023-01-10' AS Date), N'Shopee', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (6, N'Bioshock 1', N'BLES-00316', 3, 1, 13, CAST(N'2007-08-27' AS Date), 50, CAST(N'2022-07-04' AS Date), N'Shopee', N'Versão especial com luva foil', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (7, N'Brütal Legend', N'BLUS-30330', 1, 1, 3, CAST(N'2009-10-13' AS Date), 69.9, CAST(N'2022-12-07' AS Date), N'Shopee', N'Completo', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (8, N'Castlevania - Lords Of Shadows 1', N'BLUS-30339S', 1, 1, 19, CAST(N'2010-10-05' AS Date), 54.99, CAST(N'2023-01-06' AS Date), N'Shopee', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (9, N'Demon''s Souls', N'BLUS-30443GH', 1, 1, 5, CAST(N'2009-02-05' AS Date), 99, CAST(N'2022-08-17' AS Date), N'Shopee', N'Versão Greatest Hits, Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (10, N'Diablo III Ultimate Evil Edition', N'BLUS-31438', 2, 1, 5, CAST(N'2014-08-19' AS Date), 40, CAST(N'2023-01-21' AS Date), N'JP Games', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (11, N'F1 2010', N'BLUS-30379', 1, 1, 4, CAST(N'2010-09-22' AS Date), 34, CAST(N'2022-09-29' AS Date), N'Shopee', N'Completo', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (12, N'God of War: Ascension', N'BCUS-98232', 2, 1, 19, CAST(N'2013-03-12' AS Date), 0, CAST(N'2021-01-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (13, N'God Of War III', N'BCUS-98111', 1, 1, 19, CAST(N'2010-03-16' AS Date), 60, CAST(N'2022-11-08' AS Date), N'Shopee', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (14, N'Gran turismo 5 XL', N'BCUS-98394', 2, 1, 4, CAST(N'2010-11-24' AS Date), 60, CAST(N'2022-09-10' AS Date), N'Fox Games', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (15, N'Gran turismo 6', N'BCUS-99247', 2, 1, 4, CAST(N'2013-12-06' AS Date), 0, CAST(N'2021-07-14' AS Date), N'Lucas Santana', N'Completo, Manual Digital', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (16, N'Grid 1', N'BLUS-30142', 2, 1, 4, CAST(N'2008-05-30' AS Date), 39.9, CAST(N'2022-12-07' AS Date), N'Shopee', N'Versão Brasileira Relançada, completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (17, N'Guitar Hero 6 - Warriors Of Rock', N'BLUS-30487', 1, 1, 10, CAST(N'2010-09-28' AS Date), 0, CAST(N'2023-02-08' AS Date), N'Shopee', N'Completo, Bundle com a Guitarra', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (18, N'Mass Effect Collection', N'BLUS-41000', 1, 1, 14, CAST(N'2012-12-04' AS Date), 120, CAST(N'2022-08-16' AS Date), N'Shopee', N'Completo, Edição De Colecionador', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (19, N'Metal Gear 4 - Guns Of the Patriots', N'BLUS-30109GHL', 1, 1, 2, CAST(N'2008-06-12' AS Date), 29.9, CAST(N'2022-06-08' AS Date), N'Shopee', N'Completo, Versão Greatest hits', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (20, N'Metal Gear Rising - Revengeance', N'BLUS-31045S', 1, 1, 19, CAST(N'2013-02-19' AS Date), 40, CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', 1)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (21, N'Need For Speed Carbon', N'BLES-00020', 3, 1, 4, CAST(N'2006-10-30' AS Date), 128, CAST(N'2022-07-05' AS Date), N'Shopee', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (22, N'The Last Of Us', N'BCUS-98174', 2, 1, 2, CAST(N'2013-06-16' AS Date), 50, CAST(N'2022-08-28' AS Date), N'Lucas Santana', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (23, N'Tom Clancy''s Splinter Cell Trilogy', N'BLUS-30761', 1, 1, 6, CAST(N'2011-09-27' AS Date), 35, CAST(N'2022-07-02' AS Date), N'Lucas Santana', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (24, N'White Knight Chronicles 1', N'BCUS-98146', 1, 1, 5, CAST(N'2010-02-02' AS Date), 60, CAST(N'2022-05-15' AS Date), N'Shopee', N'Completo', NULL)
INSERT [dbo].[PS3] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [Instalacao]) VALUES (25, N'Xcom: enemy Within', N'BLUS-31180', 2, 1, 15, CAST(N'2013-11-12' AS Date), 39.9, CAST(N'2022-05-08' AS Date), N'Livraria Leitura', N'Completo Novo e Lacrado', NULL)
SET IDENTITY_INSERT [dbo].[PS3] OFF
GO
SET IDENTITY_INSERT [dbo].[PS4] ON 

INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro]) VALUES (2, N'Teste', N'TEST-00001', 1, 1, 2, CAST(N'2022-03-21' AS Date), 64, 100, CAST(N'2022-03-21' AS Date), N'Teste', N'Teste Add1', 1)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro]) VALUES (3, N'Teste2', N'TEST-00002', 1, 1, 2, CAST(N'2014-02-25' AS Date), 100, 150, CAST(N'2022-02-17' AS Date), N'Teste', N'Teste API 2', 0)
INSERT [dbo].[PS4] ([GameID], [Nome], [Serial], [RegiaoId], [PlataformaId], [GeneroID], [Lancamento], [Tamanho], [Preco], [Aquisicao], [LocalAdq], [Observacoes], [PS4Pro]) VALUES (4, N'Teste2', N'TEST-00002', 1, 1, 2, CAST(N'2014-02-25' AS Date), 100, 0, CAST(N'2022-02-17' AS Date), N'Teste', N'Teste API 3, Veio com o Videogame', 0)
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
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS3]    Script Date: 21/03/2023 17:14:30 ******/
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
      ,[RegiaoId]
      ,[PlataformaId]
      ,[PS3].[GeneroID]
      ,[Lancamento]
      ,format ([Preco], 'C') as Preco
      ,[Aquisicao]
      ,[LocalAdq]
      ,[Observacoes]
      ,[Instalacao]
  FROM [GameDB].[dbo].[PS3]
  order by Nome 
END


GO
/****** Object:  StoredProcedure [dbo].[Listar_Jogos_PS4]    Script Date: 21/03/2023 17:14:30 ******/
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
      ,[RegiaoId]
      ,[PlataformaId]
      ,[GeneroID]
      ,[Lancamento]
      ,Convert (varchar, [Tamanho] ) as Tamanho
      ,format ([Preco], 'c') as Preco
      ,[Aquisicao]
      ,[LocalAdq]
      ,[Observacoes]
      ,[PS4Pro]
  FROM [GameDB].[dbo].[PS4]
  order by Nome 
END


GO
USE [master]
GO
ALTER DATABASE [GameDB] SET  READ_WRITE 
GO
