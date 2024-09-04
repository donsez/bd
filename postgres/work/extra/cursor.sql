-- Cursor tests in PL/pgSQL
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html

-- Test 1: Simple cursor
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSORS-SIMPLE

CREATE TABLE test1 (a int, b int);
INSERT INTO test1 VALUES (1, 2), (3, 4), (5, 6);

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

SELECT * FROM test1();
 a | b  
---+----
    1 |  2
    3 |  4
    5 |  6
    (3 rows)

-- Test 2: Cursor with parameters
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSORS-PARAMS

CREATE TABLE test2 (a int, b int);
INSERT INTO test2 VALUES (1, 2), (3, 4), (5, 6);

CREATE OR REPLACE FUNCTION test2(p_a int) RETURNS SETOF test2 AS $$
DECLARE
    r test2%ROWTYPE;
    c CURSOR FOR SELECT * FROM test2 WHERE a = p_a;

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

SELECT * FROM test2(3);
 a | b
---+----

    3 |  4
    (1 row)

-- Test 3: Cursor with parameters and a default value
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSORS-PARAMS

CREATE TABLE test3 (a int, b int);
INSERT INTO test3 VALUES (1, 2), (3, 4), (5, 6);

CREATE OR REPLACE FUNCTION test3(p_a int DEFAULT 3) RETURNS SETOF test3 AS $$
DECLARE
    r test3%ROWTYPE;
    c CURSOR FOR SELECT * FROM test3 WHERE a = p_a;

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

SELECT * FROM test3();
 a | b
---+----

    3 |  4
    (1 row)

-- Test 4: Cursor with parameters and a default value
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html#PLPGSQL-CURSORS-PARAMS

CREATE TABLE test4 (a int, b int);
INSERT INTO test4 VALUES (1, 2), (3, 4), (5, 6);

CREATE OR REPLACE FUNCTION test4(p_a int DEFAULT 3) RETURNS SETOF test4 AS $$
DECLARE
    r test4%ROWTYPE;
    c CURSOR FOR SELECT * FROM test4 WHERE a = p_a;

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

SELECT * FROM test4(5);
 a | b
---+----

    5 |  6
    (1 row)

