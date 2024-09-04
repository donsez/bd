-- Exception in PL/pgSQL
-- https://www.postgresql.org/docs/current/plpgsql-control-structures.html#PLPGSQL-ERROR-TRAPPING



CREATE FUNCTION raise_expection(x INTEGER) RETURNS INTEGER AS
$$
DECLARE
    x INTEGER;
    y INTEGER;
BEGIN
    x := x + 1;
    y := x / 0;
EXCEPTION
    WHEN division_by_zero THEN
        RAISE NOTICE 'caught division_by_zero';
        RETURN x;
END;
$$
LANGUAGE plpgsql;


select raise_expection(1);


CREATE TABLE mytab (firstname TEXT PRIMARY KEY, lastname TEXT);
INSERT INTO mytab(firstname, lastname) VALUES('Tom', 'Jones');
UPDATE mytab SET firstname = 'Joe' WHERE lastname = 'Jones';


CREATE TABLE Person (a INT PRIMARY KEY, b TEXT);

CREATE FUNCTION merge_db(key INT, data TEXT) RETURNS VOID AS
$$
BEGIN
    LOOP
        -- first try to update the key
        UPDATE db SET b = data WHERE a = key;
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO db(a,b) VALUES (key, data);
            RETURN;
        EXCEPTION WHEN unique_violation THEN
            -- Do nothing, and loop to try the UPDATE again.
        END;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

SELECT merge_db(1, 'david');
SELECT merge_db(1, 'dennis');