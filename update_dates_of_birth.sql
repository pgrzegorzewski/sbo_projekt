USE [cars]
GO
declare @price bigint
declare @client_id int
declare @date_of_birth date

DECLARE @avg_price bigint = (SELECT avg(p.price)
  FROM [cars].[dbo].[purchases] p )

DECLARE update_cursor CURSOR FOR 
SELECT p.price
      ,c.[client_id],
	  c.date_of_birth
  FROM [cars].[dbo].[purchases] p join clients c
  On c.client_id = p.client_id
-- open cursor and fetch first row into variables
OPEN update_cursor
FETCH FROM update_cursor
INTO @price, @client_id, @date_of_birth
-- check for a new row
WHILE @@FETCH_STATUS=0
BEGIN
-- do update operation
IF(@price > @avg_price)
	UPDATE dbo.clients 
	SET date_of_birth = DATEFROMPARTS (floor(RAND()*(1975-1960)+1960), floor(RAND()*(12-1)+1), floor(RAND()*(28-1)+1))
	WHERE CURRENT OF update_cursor 
ELSE
	UPDATE dbo.clients 
	SET date_of_birth = DATEFROMPARTS (floor(RAND()*(2000-1960)+1960), floor(RAND()*(12-1)+1), floor(RAND()*(28-1)+1))
	WHERE CURRENT OF update_cursor 
 
-- get next available row into variables
FETCH NEXT FROM update_cursor
INTO @price, @client_id, @date_of_birth

END
close update_cursor
Deallocate update_cursor
GO


