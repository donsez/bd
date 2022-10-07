-- PostgreSQL Transaction 
-- https://www.postgresql.org/docs/current/tutorial-transactions.html
-- https://www.postgresql.org/docs/current/sql-start-transaction.html

-- Drop table

DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS transfer;

-- Create a table with a serial column

CREATE TABLE account (
    name TEXT PRIMARY KEY,
    balance NUMERIC(10,2) DEFAULT 0.00
);

CREATE TABLE transfer (
    account_from TEXT,
    account_to TEXT NOT NULL,
    amount NUMERIC(10,2),
    reason TEXT,
    date DATE DEFAULT CURRENT_DATE
);

-- Insert rows

INSERT INTO account (name) VALUES ('alice');
INSERT INTO account (name) VALUES ('bob');


UPDATE account SET balance = balance+1000 WHERE name = 'alice';
INSERT INTO transfer (account_to, amount, reason) VALUES ('alice', 1000, 'initial deposit');

UPDATE account SET balance = balance+500 WHERE name = 'bob';
INSERT INTO transfer (account_to, amount, reason) VALUES ('bob', 500, 'initial deposit');


SELECT * FROM account;
SELECT * FROM transfer;

BEGIN;
UPDATE account SET balance = balance-100 WHERE name = 'alice';
UPDATE account SET balance = balance+100 WHERE name = 'bob';
INSERT INTO transfer (account_from, account_to, amount, reason) VALUES ('alice', 'bob', 100, 'birthday present');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;


BEGIN;
UPDATE account SET balance = balance+200 WHERE name = 'bob';
UPDATE account SET balance = balance-200 WHERE name = 'alice';
INSERT INTO transfer (account_from, account_to, amount) VALUES ('bob', 'alice', 200, 'xmas present');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

