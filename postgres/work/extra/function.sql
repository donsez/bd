-- Functions in PL/pgSQL
-- https://www.postgresql.org/docs/current/plpgsql-functions.html
--
-- Test 1: Simple function
-- https://www.postgresql.org/docs/current/plpgsql-functions.html#PLPGSQL-FUNCTIONS-SIMPLE
--
CREATE TABLE test1 (a int, b int);
INSERT INTO test1 VALUES (1, 2), (3, 4), (5, 6);
--
CREATE OR REPLACE FUNCTION test1() RETURNS SETOF test1 AS $$
DECLARE
    r test1%ROWTYPE;
    c CURSOR FOR SELECT * FROM test1;
BEGIN

    OPEN c;
    LOOP
        FETCH c INTO r;
        EXIT WHEN NOT FOUND;
        RETURN NEXT r;
    END LOOP;
    CLOSE c;

END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION sum_n_product(x int, y int, OUT sum int, OUT prod int) AS $$
BEGIN
    sum := x + y;
    prod := x * y;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM sum_n_product(2, 4);