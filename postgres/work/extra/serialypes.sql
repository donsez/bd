-- Serial types
-- https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL

-- Create a table with a serial column

CREATE TABLE serial_table (
    id SERIAL PRIMARY KEY,
    name TEXT
);

-- Insert a row

INSERT INTO serial_table (name) VALUES ('serial');
