
-- LIMIT
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-limit

SELECT
  film_id,
  title,
  release_year
FROM
  film
ORDER BY
  film_id
LIMIT
  5;


SELECT
  film_id,
  title,
  release_year
FROM
  film
ORDER BY
  film_id
LIMIT 4 OFFSET 3;


SELECT
  film_id,
  title,
  rental_rate
FROM
  film
ORDER BY
  rental_rate DESC
LIMIT
  10;

-- FETCH
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-fetch

SELECT
    film_id,
    title
FROM
    film
ORDER BY
    title
FETCH FIRST 1 ROW ONLY;

-- GROUPING SETS
DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300)
RETURNING *;

-- the number of products sold by brand and segment
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment;

-- finds the number of products sold by a brand
SELECT
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand;

-- finds the number of products sold by segment
SELECT
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment;


-- UNION ALL

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;


SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );

SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
ORDER BY
	brand,
	segment;


SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
HAVING GROUPING(brand) = 0
ORDER BY
	brand,
	segment;

-- CUBE
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-cube
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    CUBE (brand, segment)
ORDER BY
    brand,
    segment;


SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    CUBE (segment)
ORDER BY
    brand,
    segment;


-- ROLLUP
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-rollup

-- find the number of products sold by brand (subtotal) and by all brands and segments (total).
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (brand, segment)
ORDER BY
    brand,
    segment;

SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (segment, brand)
ORDER BY
    segment,
    brand;

SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment,
    ROLLUP (brand)
ORDER BY
    segment,
    brand;

SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );