-- Create a keyspace
CREATE KEYSPACE IF NOT EXISTS store WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : '1' };


DROP TABLE store.shopping_cart;

-- Create a table
CREATE TABLE IF NOT EXISTS store.shopping_cart (
userid text PRIMARY KEY,
item_count int,
last_update_timestamp timestamp
);

-- Insert some data
INSERT INTO store.shopping_cart
(userid, item_count, last_update_timestamp)
VALUES ('4565', 2, toTimeStamp(now()));

INSERT INTO store.shopping_cart
(userid, item_count, last_update_timestamp)
VALUES ('4566', 5, toTimeStamp(now()));
