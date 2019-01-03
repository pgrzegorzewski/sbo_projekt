USE [cars]
GO
--DELETE FROM [dbo].[client_addresses]
--DBCC CHECKIDENT ('client_addresses', RESEED, 0) 
GO
DECLARE @cnt INT = 1;

WHILE @cnt <= 300
BEGIN
   INSERT INTO [dbo].[client_addresses]
           ([address_id])
     VALUES
           (@cnt)
   SET @cnt = @cnt + 1;
END;

 
GO


