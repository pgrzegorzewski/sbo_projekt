USE [cars]
GO
UPDATE [dbo].[purchases]
   SET [purchase_date] = DATEFROMPARTS (2018, 12, floor(RAND()*(31-1)+1) )
 WHERE [purchase_id] % 9 = 0
UPDATE [dbo].[purchases]
   SET [purchase_date] = DATEFROMPARTS (2018, 1, floor(RAND()*(28-1)+1) )
 WHERE [purchase_id] % 10 = 0
GO