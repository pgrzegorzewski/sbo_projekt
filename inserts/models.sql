USE [cars]
GO

DELETE FROM cars.dbo.models
GO

INSERT INTO cars.dbo.models(model_id, model_name, model_class, manufacturer_id, engine_id)
VALUES 
(0, 'A1', 'CITY', 0, 2),
(1, 'A1', 'CITY', 0, 4),
(2, 'A5', 'SPORT', 0, 0),
(3, 'A5', 'SPORT', 0, 1),
(4, 'A7', 'PREMIUM', 0, 1),
(5, 'Q3', 'CITY', 0, 0),
(6, 'Q5', 'FAMILY', 0, 0),
(7, 'Q7', 'PREMIUM', 0, 1),
(8, 'C180', 'PREMIUM', 1, 7),
(9, 'C200', 'PREMIUM', 1, 0),
(10, 'GLA220', 'SUV', 1, 0),
(11, 'A180', 'CITY', 1, 2),
(12, 'E220D', 'PREMIUM', 1, 1),
(13, 'ASTRA', 'FAMILY', 2, 9),
(14, 'INSIGNIA', 'PREMIUM', 2, 0),
(15, 'ADAM', 'CITY', 2, 2),
(16, 'ADAM', 'CITY', 2, 4)

GO