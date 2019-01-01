USE [cars]
GO

DELETE FROM cars.dbo.manufacturers
GO

INSERT INTO cars.dbo.manufacturers(manufacturer_id, manufacturer_name)
VALUES 
(0, 'AUDI'),
(1, 'MERCEDES'),
(2, 'OPEL'),
(3, 'VOLKSWAGEN'),
(4, 'FORD'),
(5, 'NISSAN'),
(6, 'KIA'),
(7, 'TOYOTA'),
(8, 'HONDA'),
(9, 'BMW'),
(10, 'PORSHE'),
(11, 'HYUNDAI'),
(12, 'FIAT'),
(13, 'CITROEN'),
(14, 'PEUGEOT'),
(15, 'VOLVO'),
(16, 'LAND ROVER'),
(17, 'MAZDA'),
(18, 'CHEVROLET'),
(19, 'SEAT'),
(20, 'SUZUKI')
GO