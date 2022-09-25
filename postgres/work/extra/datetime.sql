--
-- See https://www.postgresql.org/docs/current/functions-datetime.html
--

-- Show current date
SELECT CURRENT_DATE;

-- Show current time
SELECT CURRENT_TIME;

-- Show current time
SELECT CURRENT_TIME(2);

-- Show current time
SELECT LOCALTIME;

-- Convert date
SELECT TO_TIMESTAMP(
    '2022-09-01 12:00:00',
    'YYYY-MM-DD HH:MI:SS'
);

-- Show current timestamp
SELECT NOW();

-- Extract the day of the week (0 - 6; Sunday is 0) (for timestamp values only)
SELECT EXTRACT(DOW FROM TIMESTAMP '2001-02-16 20:38:40');

-- Extract the century
SELECT EXTRACT(CENTURY FROM TIMESTAMP '2000-12-16 12:21:13');
SELECT EXTRACT(CENTURY FROM TIMESTAMP '2001-02-16 20:38:40');



