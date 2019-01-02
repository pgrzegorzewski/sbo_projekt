USE [cars]
GO

/****** Object:  Table [dbo].[car_versions]    Script Date: 01.01.2019 15:03:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[car_versions](
	[version_id] [int] NOT NULL,
	[version_name] [varchar](255) NULL,
	[is_radio_available] [bit] NULL,
	[is_air_condition_available] [bit] NULL,
	[is_pearl_paint_available] [bit] NULL,
	[is_gps_available] [bit] NULL,
	[is_leather_available] [bit] NULL,
	[is_parking_support_avaible] [bit] NULL,
	[model_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[version_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[car_versions]  WITH CHECK ADD  CONSTRAINT [FK_model_id] FOREIGN KEY([model_id])
REFERENCES [dbo].[models] ([model_id])
GO

ALTER TABLE [dbo].[car_versions] CHECK CONSTRAINT [FK_model_id]
GO

