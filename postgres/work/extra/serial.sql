-- Serial types
-- https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL

-- Drop table

DROP TABLE IF EXISTS account;

-- Create a table with a serial column

CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    amount NUMERIC(10,2) DEFAULT 0.00
);

-- Insert rows

INSERT INTO account (name) VALUES ('alice');
INSERT INTO account (name) VALUES ('bob');

-- Select rows

SELECT * FROM account;

\d
\d account
\d account_id_seq
