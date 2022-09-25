-- PostgreSQL Views
-- https://www.postgresql.org/docs/current/sql-createview.html

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

SELECT * FROM items;

\dt+

CREATE VIEW discounted_items AS
    SELECT *
    FROM items
    WHERE discount IS NOT NULL OR discount > 0;

SELECT * FROM discounted_items;

\dt+

DROP VIEW IF EXISTS discounted_items;
