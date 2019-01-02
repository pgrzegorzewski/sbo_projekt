USE [cars]
GO

DELETE FROM cars.dbo.engines
GO

INSERT INTO cars.dbo.engines(engine_id, engine_type, engine_size)
VALUES 
(0, 'DIESEL', 2.0),
(1, 'DIESEL', 3.0),
(2, 'PETROL', 1.1),
(3, 'PETROL', 1.6),
(4, 'GAS', 1.5),
(5, 'PETROL', 1.0),
(6, 'PETROL', 2.0),
(7, 'DIESEL', 1.6),
(8, 'DIESEL', 1.9),
(9, 'PETROL', 1.4)
GO