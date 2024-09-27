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

\! echo "Create 2 new accounts"

BEGIN;
INSERT INTO account (name) VALUES ('alice');
INSERT INTO account (name) VALUES ('bob');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

\! echo "Initial deposit by Alice"

BEGIN;
UPDATE account SET balance = balance+1000 WHERE name = 'alice';
INSERT INTO transfer (account_to, amount, reason) VALUES ('alice', 1000, 'initial deposit');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

SELECT
  pg_sleep(5),
  clock_timestamp();

\! echo "Initial deposit by Bob"

BEGIN;
UPDATE account SET balance = balance+500 WHERE name = 'bob';
INSERT INTO transfer (account_to, amount, reason) VALUES ('bob', 500, 'initial deposit');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

SELECT
  pg_sleep_for('5 seconds'),
  clock_timestamp();

\! echo "Transfer 100 from Alice to Bob"

BEGIN;
UPDATE account SET balance = balance-100 WHERE name = 'alice';
UPDATE account SET balance = balance+100 WHERE name = 'bob';
INSERT INTO transfer (account_from, account_to, amount, reason) VALUES ('alice', 'bob', 100, 'birthday present');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

SELECT
  pg_sleep_for('5 seconds'),
  clock_timestamp();

\! echo "Transfer 200 from Bob to Alice"

BEGIN;
UPDATE account SET balance = balance-200 WHERE name = 'alice';
UPDATE account SET balance = balance+200 WHERE name = 'bob';
INSERT INTO transfer (account_from, account_to, amount) VALUES ('alice', 'bob', 200, 'new year day refund');
ROLLBACK;

SELECT * FROM account;
SELECT * FROM transfer;

SELECT
  pg_sleep_for('5 seconds'),
  clock_timestamp();

\! echo "Transfer 100 from Alice to Bob"

BEGIN;
UPDATE account SET balance = balance+100 WHERE name = 'bob';
SELECT * FROM account;
SAVEPOINT my_savepoint;
UPDATE account SET balance = balance+200 WHERE name = 'bob';
SELECT * FROM account;
ROLLBACK TO SAVEPOINT my_savepoint;
SELECT * FROM account;
UPDATE account SET balance = balance-100 WHERE name = 'alice';
SELECT * FROM account;
INSERT INTO transfer (account_from, account_to, amount) VALUES ('alice', 'bob', 100, 'easter (chocolate) eggs');
COMMIT;

SELECT * FROM account;
SELECT * FROM transfer;

