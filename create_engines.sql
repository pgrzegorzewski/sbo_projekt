USE [cars]
GO

/****** Object:  Table [dbo].[engines]    Script Date: 01.01.2019 15:04:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[engines](
	[engine_id] [int] NOT NULL,
	[engine_type] [varchar](255) NULL,
	[engine_size] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[engine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

