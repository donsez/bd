-- PostgreSQL COALESCE example
-- From https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-coalesce/

CREATE TABLE items (
	ID serial PRIMARY KEY,
	product VARCHAR (100) NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC
);

INSERT INTO items (product, price, discount)
VALUES
	('A', 1000 ,10),
	('B', 1500 ,20),
	('C', 800 ,5),
	('D', 500, NULL);

SELECT
	product,
	(price - discount) AS net_price
FROM
	items;


SELECT
	product,
	(price - COALESCE(discount,0)) AS net_price
FROM
	items;

SELECT
	product,
	(
		price - CASE
		WHEN discount IS NULL THEN
			0
		ELSE
			discount
		END
	) AS net_price
FROM
	items;
