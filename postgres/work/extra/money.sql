-- https://www.postgresql.org/docs/current/datatype-money.html

-- \i /work/extra/money.sql

SELECT '12.34'::float8::numeric::money;

SELECT '52093.89'::money::numeric::float8;