-- Upsert
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-upsert

CREATE TABLE inventory(
   id INT PRIMARY KEY,
   name VARCHAR(255) NOT NULL,
   price DECIMAL(10,2) NOT NULL,
   quantity INT NOT NULL
);

INSERT INTO inventory(id, name, price, quantity)
VALUES
	(1, 'A', 15.99, 100),
	(2, 'B', 25.49, 50),
	(3, 'C', 19.95, 75)
RETURNING *;


-- INSERT … ON CONFLICT
INSERT INTO inventory (id, name, price, quantity)
VALUES (1, 'A', 16.99, 120)
ON CONFLICT(id)
DO UPDATE SET
  price = EXCLUDED.price,
  quantity = EXCLUDED.quantity;

SELECT * FROM inventory
WHERE id = 1;

INSERT INTO inventory (id, name, price, quantity)
VALUES (4, 'D', 29.99, 20)
ON CONFLICT(id)
DO UPDATE SET
  price = EXCLUDED.price,
  quantity = EXCLUDED.quantity;

SELECT * FROM inventory
ORDER BY id;


-- MERGE
-- https://neon.com/postgresql/postgresql-tutorial/postgresql-merge


-- Create the main products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    price DECIMAL(10,2),
    stock INTEGER,
    status TEXT,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert some initial data
INSERT INTO products (name, price, stock, status) VALUES
    ('Laptop', 999.99, 50, 'active'),
    ('Keyboard', 79.99, 100, 'active'),
    ('Mouse', 29.99, 200, 'active');

-- Create a table for our updates
CREATE TABLE product_updates (
    name TEXT,
    price DECIMAL(10,2),
    stock INTEGER,
    status TEXT
);

-- Insert mixed update data (new products, updates, and discontinuations)
INSERT INTO product_updates VALUES
    ('Laptop', 1099.99, 75, 'active'),      -- Update: price and stock change
    ('Monitor', 299.99, 30, 'active'),      -- Insert: new product
    ('Keyboard', NULL, 0, 'discontinued'),  -- Delete: mark as discontinued
    ('Headphones', 89.99, 50, 'active');    -- Insert: another new product


MERGE INTO products p
USING product_updates u
ON p.name = u.name
WHEN MATCHED AND u.status = 'discontinued' THEN
    DELETE
WHEN MATCHED AND u.status = 'active' THEN
    UPDATE SET
        price = COALESCE(u.price, p.price),
        stock = u.stock,
        status = u.status,
        last_updated = CURRENT_TIMESTAMP
WHEN NOT MATCHED AND u.status = 'active' THEN
    INSERT (name, price, stock, status)
    VALUES (u.name, u.price, u.stock, u.status)
RETURNING
    merge_action() as action,
    p.product_id,
    p.name,
    p.price,
    p.stock,
    p.status,
    p.last_updated;

SELECT * FROM products
ORDER BY product_id;

MERGE INTO products p
USING (
    SELECT
        name,
        price,
        stock,
        status,
        CASE
            WHEN price IS NULL AND status = 'discontinued' THEN 'DELETE'
            WHEN stock = 0 THEN 'OUT_OF_STOCK'
            ELSE status
        END as action_type
    FROM product_updates
) u
ON p.name = u.name
WHEN MATCHED AND u.action_type = 'DELETE' THEN
    DELETE
WHEN MATCHED AND u.action_type = 'OUT_OF_STOCK' THEN
    UPDATE SET
        status = 'inactive',
        stock = 0,
        last_updated = CURRENT_TIMESTAMP
WHEN MATCHED THEN
    UPDATE SET
        price = COALESCE(u.price, p.price),
        stock = u.stock,
        status = u.status,
        last_updated = CURRENT_TIMESTAMP
WHEN NOT MATCHED AND u.action_type != 'DELETE' THEN
    INSERT (name, price, stock, status)
    VALUES (u.name, u.price, u.stock, u.status)
RETURNING
    merge_action() as action,
    p.*,
    u.action_type;
