SELECT 
	COUNT(*) AS car_sold_nb
	,MONTH(purchase_date)
FROM dbo.purchases
GROUP BY 
	MONTH(purchase_date)


SELECT 
	DATEPART(q, purchase_date) AS Q
	,MONTH(purchase_date)
	,COUNT(*) AS car_sold_nb
FROM dbo.purchases
GROUP BY ROLLUP	
	(DatePart(q, purchase_date), MONTH(purchase_date))


SELECT 
	DATEPART(q, purchase_date) AS Q
	,MONTH(purchase_date)
	,COUNT(*) AS car_sold_nb
FROM dbo.purchases
GROUP BY CUBE	
	(DatePart(q, purchase_date), MONTH(purchase_date))


SELECT 
	a.region
	,a.city
	,COUNT(*) AS car_sold_nb
FROM dbo.purchases AS p
INNER JOIN dbo.clients AS c					ON			c.client_id = p.client_id
INNER JOIN dbo.client_addresses AS ca		ON			c.client_id = ca.client_id
INNER JOIN dbo.addresses AS a				ON			a.address_id = ca.address_id
GROUP BY ROLLUP	
	(a.region, a.city)

SELECT 
	COUNT(*) AS car_sold_nb
	,c.client_sex
FROM dbo.purchases AS p
INNER JOIN dbo.clients AS c					ON			c.client_id = p.client_id
GROUP BY 
	c.client_sex


SELECT 
	COUNT(*) AS car_sold_nb
	,c.client_sex
	,m.model_name
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
INNER JOIN dbo.cars ca						ON			ca.car_id = p.car_id
INNER JOIN dbo.car_versions cv				ON			cv.version_id = ca.car_version
INNER JOIN dbo.models m						ON			m.model_id = cv.model_id
GROUP BY 
	c.client_sex
	,m.model_name
ORDER BY 
	c.client_sex
	,m.model_name


SELECT 
	COUNT(*) AS car_sold_nb
	,c.client_sex
	,m.model_class
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
INNER JOIN dbo.cars ca						ON			ca.car_id = p.car_id
INNER JOIN dbo.car_versions cv				ON			cv.version_id = ca.car_version
INNER JOIN dbo.models m						ON			m.model_id = cv.model_id
GROUP BY 
	c.client_sex
	,m.model_class
ORDER BY 
	c.client_sex
	,m.model_class


SELECT 
	ma.manufacturer_name
	,e.engine_type
	,e.engine_size
	,COUNT(*) AS car_sold_nb
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
INNER JOIN dbo.cars ca						ON			ca.car_id = p.car_id
INNER JOIN dbo.car_versions cv				ON			cv.version_id = ca.car_version
INNER JOIN dbo.models m						ON			m.model_id = cv.model_id
INNER JOIN dbo.manufacturers ma				ON			m.manufacturer_id = ma.manufacturer_id
INNER JOIN dbo.engines e					ON			e.engine_id = m.engine_id
GROUP BY CUBE	
	(ma.manufacturer_name
	,e.engine_type
	,e.engine_size)


SELECT 
	c.client_first_name
	,c.client_last_name
	,m.model_name
	,total_price
FROM dbo.purchases p
INNER JOIN dbo.clients c		ON		p.client_id = c.client_id
INNER JOIN dbo.cars ca						ON			ca.car_id = p.car_id
INNER JOIN dbo.car_versions cv				ON			cv.version_id = ca.car_version
INNER JOIN dbo.models m						ON			m.model_id = cv.model_id
INNER JOIN 
			(
				SELECT 
					COUNT(*) AS cnt,
					SUM(p.price) AS total_price,
					c.client_id 
				FROM dbo.purchases p
				INNER JOIN dbo.clients c		ON			p.client_id = c.client_id
				GROUP BY 
					c.client_id
				HAVING
					COUNT(*) > 1
			) AS x
ON x.client_id = c.client_id


SELECT 
	COUNT(*) AS car_sold_nb
	,AVG(p.price) AS avg_price
	,'18-25' AS age
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
WHERE	
	DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) > 18
	AND DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) < 25

UNION

SELECT 
	COUNT(*) AS car_sold_nb
	,AVG(p.price) AS avg_price
	,'25-35' AS age
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
WHERE	
	DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) >= 25
	AND DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) < 35

UNION 

SELECT 
	COUNT(*) AS car_sold_nb
	,AVG(p.price) AS avg_price
	,'35-45' AS age
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
WHERE	
	DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) >= 35
	AND DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) < 45

UNION 

SELECT 
	COUNT(*) AS car_sold_nb
	,AVG(p.price) AS avg_price
	,'45-55' AS age
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
WHERE	
	DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) >= 45
	AND DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) < 55


UNION 

SELECT 
	COUNT(*) AS car_sold_nb
	,AVG(p.price) AS avg_price
	,'55 < ' AS age
FROM dbo.purchases p
INNER JOIN dbo.clients c					ON			c.client_id = p.client_id
WHERE	
	DATEDIFF(YEAR,  c.date_of_birth, CAST(GetDate() AS DATE)) >= 55