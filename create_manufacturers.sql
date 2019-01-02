USE [cars]
GO

/****** Object:  Table [dbo].[manufacturers]    Script Date: 01.01.2019 15:05:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[manufacturers](
	[manufacturer_id] [int] NOT NULL,
	[manufacturer_name] [nchar](10) NULL,
 CONSTRAINT [PK_manufacturers] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

