/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  qwert
 * Created: Dec 20, 2018
 */
CREATE DATABASE [SaBoDa]
GO
USE [SaBoDa]
GO
/****** Object:  Table [dbo].[order]    Script Date: 12/20/2018 00:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[fieldId] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
	[from] [int] NULL,
	[to] [int] NULL,
	[price] [nvarchar](max) NOT NULL,
	[id] [int] NOT NULL,
	[date] [nvarchar](max) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[field]    Script Date: 12/20/2018 00:20:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field](
	[id] [int] NOT NULL,
	[desc] [nvarchar](max) NULL,
	[price] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Default [datect]    Script Date: 12/20/2018 00:20:50 ******/
ALTER TABLE [dbo].[order] ADD  CONSTRAINT [datect]  DEFAULT ('2018-12-17') FOR [date]
GO
