USE [cars]
GO

/****** Object:  Table [dbo].[cars]    Script Date: 01.01.2019 15:04:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[cars](
	[car_id] [int] NOT NULL,
	[car_version] [int] NULL,
	[is_sold] [bit] NULL,
 CONSTRAINT [PK_cars] PRIMARY KEY CLUSTERED 
(
	[car_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[cars]  WITH CHECK ADD  CONSTRAINT [FK_cars_version] FOREIGN KEY([car_version])
REFERENCES [dbo].[car_versions] ([version_id])
GO

ALTER TABLE [dbo].[cars] CHECK CONSTRAINT [FK_cars_version]
GO

