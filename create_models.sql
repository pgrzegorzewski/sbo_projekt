USE [cars]
GO

/****** Object:  Table [dbo].[models]    Script Date: 01.01.2019 15:05:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[models](
	[model_id] [int] NOT NULL,
	[model_name] [varchar](255) NULL,
	[model_class] [varchar](255) NULL,
	[manufacturer_id] [int] NULL,
	[engine_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[model_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[models]  WITH CHECK ADD  CONSTRAINT [FK_engine_id] FOREIGN KEY([engine_id])
REFERENCES [dbo].[engines] ([engine_id])
GO

ALTER TABLE [dbo].[models] CHECK CONSTRAINT [FK_engine_id]
GO

ALTER TABLE [dbo].[models]  WITH CHECK ADD  CONSTRAINT [FK_manufacturer_id] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[manufacturers] ([manufacturer_id])
GO

ALTER TABLE [dbo].[models] CHECK CONSTRAINT [FK_manufacturer_id]
GO

