USE [cars]
GO

/****** Object:  Table [dbo].[clients]    Script Date: 01.01.2019 15:04:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[clients](
	[client_id] [int] NOT NULL,
	[client_first_name] [varchar](255) NULL,
	[client_last_name] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[client_sex] [varchar](1) NULL,
	[address_1] [varchar](255) NULL,
	[address_2] [varchar](255) NULL,
	[address_3] [varchar](255) NULL,
	[address_4] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

