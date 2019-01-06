USE [cars]
GO

/****** Object:  Table [dbo].[purchases]    Script Date: 06.01.2019 20:18:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[purchases](
	[purchase_id] [int] NOT NULL,
	[client_id] [int] NULL,
	[car_id] [int] NULL,
	[price] [bigint] NULL,
	[purchase_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchase_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[purchases]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[clients] ([client_id])
GO

ALTER TABLE [dbo].[purchases]  WITH CHECK ADD  CONSTRAINT [FK_purchase_car] FOREIGN KEY([car_id])
REFERENCES [dbo].[cars] ([car_id])
GO

ALTER TABLE [dbo].[purchases] CHECK CONSTRAINT [FK_purchase_car]
GO
