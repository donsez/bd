-- https://www.postgresql.org/docs/current/plpgsql-trigger.html

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_payroll;

-- Create a new database
CREATE DATABASE db_payroll;

-- Connect to the database
\connect db_payroll

DROP TABLE IF EXISTS emp CASCADE;
DROP TABLE IF EXISTS emp_audit CASCADE;

CREATE TABLE emp (
    empname text,
    salary integer,
    last_date timestamp,
    last_user text
);

CREATE FUNCTION emp_stamp() RETURNS trigger AS $emp_stamp$
BEGIN
    -- Check that empname and salary are given
    IF NEW.empname IS NULL THEN
        RAISE EXCEPTION 'empname cannot be null';
    END IF;
    IF NEW.salary IS NULL THEN
        RAISE EXCEPTION '% cannot have null salary', NEW.empname;
    END IF;

    -- Who works for us when they must pay for it?
    IF NEW.salary < 0 THEN
        RAISE EXCEPTION '% cannot have a negative salary', NEW.empname;
    END IF;

    -- Remember who changed the payroll when
    NEW.last_date := current_timestamp;
    NEW.last_user := current_user;
    RETURN NEW;
END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER emp_stamp BEFORE INSERT OR UPDATE ON emp
FOR EACH ROW EXECUTE FUNCTION emp_stamp();


-- 

DROP TABLE IF EXISTS emp CASCADE;
DROP TABLE IF EXISTS emp_audit CASCADE;

CREATE TABLE emp (
empname           text NOT NULL,
salary            integer
);


CREATE TABLE emp_audit(
    operation         char(1)   NOT NULL,
    stamp             timestamp NOT NULL,
    userid            text      NOT NULL,
    empname           text      NOT NULL,
    salary integer
);

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$
BEGIN
    --
    -- Create a row in emp_audit to reflect the operation performed on emp,
    -- making use of the special variable TG_OP to work out the operation.
    --
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO emp_audit SELECT 'D', now(), user, OLD.*;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO emp_audit SELECT 'U', now(), user, NEW.*;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO emp_audit SELECT 'I', now(), user, NEW.*;
    END IF;
    RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
AFTER INSERT OR UPDATE OR DELETE ON emp
FOR EACH ROW EXECUTE FUNCTION process_emp_audit();




-- 

DROP TABLE IF EXISTS emp CASCADE;
DROP TABLE IF EXISTS emp_audit CASCADE;


CREATE TABLE emp (
empname           text PRIMARY KEY,
salary            integer
);

CREATE TABLE emp_audit(
operation         char(1)   NOT NULL,
userid            text      NOT NULL,
empname           text      NOT NULL,
salary            integer,
stamp             timestamp NOT NULL
);

CREATE VIEW emp_view AS
SELECT e.empname,
       e.salary,
       max(ea.stamp) AS last_updated
  FROM emp e
  LEFT JOIN emp_audit ea ON ea.empname = e.empname
 GROUP BY 1, 2;

CREATE OR REPLACE FUNCTION update_emp_view() RETURNS TRIGGER AS $$
BEGIN
    --
    -- Perform the required operation on emp, and create a row in emp_audit
    -- to reflect the change made to emp.
    --
    IF (TG_OP = 'DELETE') THEN
        DELETE FROM emp WHERE empname = OLD.empname;
        IF NOT FOUND THEN RETURN NULL; END IF;

        OLD.last_updated = now();
        INSERT INTO emp_audit VALUES('D', user, OLD.*);
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE emp SET salary = NEW.salary WHERE empname = OLD.empname;
        IF NOT FOUND THEN RETURN NULL; END IF;

        NEW.last_updated = now();
        INSERT INTO emp_audit VALUES('U', user, NEW.*);
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO emp VALUES(NEW.empname, NEW.salary);

        NEW.last_updated = now();
        INSERT INTO emp_audit VALUES('I', user, NEW.*);
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit
INSTEAD OF INSERT OR UPDATE OR DELETE ON emp_view
FOR EACH ROW EXECUTE FUNCTION update_emp_view();


--
-- Main tables - time dimension and sales fact.
--


DROP TABLE IF EXISTS time_dimension CASCADE;
DROP TABLE IF EXISTS sales_fact CASCADE;
DROP TABLE IF EXISTS sales_summary_bytime CASCADE;


CREATE TABLE time_dimension (
time_key                    integer NOT NULL,
day_of_week                 integer NOT NULL,
day_of_month                integer NOT NULL,
month                       integer NOT NULL,
quarter                     integer NOT NULL,
year                        integer NOT NULL
);
CREATE UNIQUE INDEX time_dimension_key ON time_dimension(time_key);

CREATE TABLE sales_fact (
time_key                    integer NOT NULL,
product_key                 integer NOT NULL,
store_key                   integer NOT NULL,
amount_sold                 numeric(12,2) NOT NULL,
units_sold                  integer NOT NULL,
amount_cost                 numeric(12,2) NOT NULL
);
CREATE INDEX sales_fact_time ON sales_fact(time_key);

--
-- Summary table - sales by time.
--
CREATE TABLE sales_summary_bytime (
time_key                    integer NOT NULL,
amount_sold                 numeric(15,2) NOT NULL,
units_sold                  numeric(12) NOT NULL,
amount_cost                 numeric(15,2) NOT NULL
);
CREATE UNIQUE INDEX sales_summary_bytime_key ON sales_summary_bytime(time_key);

--
-- Function and trigger to amend summarized column(s) on UPDATE, INSERT, DELETE.
--
CREATE OR REPLACE FUNCTION maint_sales_summary_bytime() RETURNS TRIGGER
AS $maint_sales_summary_bytime$
DECLARE
    delta_time_key          integer;
    delta_amount_sold       numeric(15,2);
    delta_units_sold        numeric(12);
    delta_amount_cost       numeric(15,2);
BEGIN

    -- Work out the increment/decrement amount(s).
    IF (TG_OP = 'DELETE') THEN

        delta_time_key = OLD.time_key;
        delta_amount_sold = -1 * OLD.amount_sold;
        delta_units_sold = -1 * OLD.units_sold;
        delta_amount_cost = -1 * OLD.amount_cost;

    ELSIF (TG_OP = 'UPDATE') THEN

        -- forbid updates that change the time_key -
        -- (probably not too onerous, as DELETE + INSERT is how most
        -- changes will be made).
        IF ( OLD.time_key != NEW.time_key) THEN
            RAISE EXCEPTION 'Update of time_key : % -> % not allowed',
                                                  OLD.time_key, NEW.time_key;
        END IF;

        delta_time_key = OLD.time_key;
        delta_amount_sold = NEW.amount_sold - OLD.amount_sold;
        delta_units_sold = NEW.units_sold - OLD.units_sold;
        delta_amount_cost = NEW.amount_cost - OLD.amount_cost;

    ELSIF (TG_OP = 'INSERT') THEN

        delta_time_key = NEW.time_key;
        delta_amount_sold = NEW.amount_sold;
        delta_units_sold = NEW.units_sold;
        delta_amount_cost = NEW.amount_cost;

    END IF;


    -- Insert or update the summary row with the new values.
    <<insert_update>>
    LOOP
        UPDATE sales_summary_bytime
            SET amount_sold = amount_sold + delta_amount_sold,
                units_sold = units_sold + delta_units_sold,
                amount_cost = amount_cost + delta_amount_cost
            WHERE time_key = delta_time_key;

        EXIT insert_update WHEN found;

        BEGIN
            INSERT INTO sales_summary_bytime (
                        time_key,
                        amount_sold,
                        units_sold,
                        amount_cost)
                VALUES (
                        delta_time_key,
                        delta_amount_sold,
                        delta_units_sold,
                        delta_amount_cost
                       );

            EXIT insert_update;

        EXCEPTION
            WHEN UNIQUE_VIOLATION THEN
                -- do nothing
        END;
    END LOOP insert_update;

    RETURN NULL;

END;
$maint_sales_summary_bytime$ LANGUAGE plpgsql;

CREATE TRIGGER maint_sales_summary_bytime
AFTER INSERT OR UPDATE OR DELETE ON sales_fact
FOR EACH ROW EXECUTE FUNCTION maint_sales_summary_bytime();

INSERT INTO sales_fact VALUES(1,1,1,10,3,15);
INSERT INTO sales_fact VALUES(1,2,1,20,5,35);
INSERT INTO sales_fact VALUES(2,2,1,40,15,135);
INSERT INTO sales_fact VALUES(2,3,1,10,1,13);
SELECT * FROM sales_summary_bytime;
DELETE FROM sales_fact WHERE product_key = 1;
SELECT * FROM sales_summary_bytime;
UPDATE sales_fact SET units_sold = units_sold * 2;
SELECT * FROM sales_summary_bytime;


-- 

DROP TABLE IF EXISTS emp CASCADE;
DROP TABLE IF EXISTS emp_audit CASCADE;

CREATE TABLE emp (
empname           text NOT NULL,
salary            integer
);

CREATE TABLE emp_audit(
operation         char(1)   NOT NULL,
stamp             timestamp NOT NULL,
userid            text      NOT NULL,
empname           text      NOT NULL,
salary integer
);

CREATE OR REPLACE FUNCTION process_emp_audit() RETURNS TRIGGER AS $emp_audit$
BEGIN
    --
    -- Create rows in emp_audit to reflect the operations performed on emp,
    -- making use of the special variable TG_OP to work out the operation.
    --
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO emp_audit
            SELECT 'D', now(), user, o.* FROM old_table o;
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO emp_audit
            SELECT 'U', now(), user, n.* FROM new_table n;
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO emp_audit
            SELECT 'I', now(), user, n.* FROM new_table n;
    END IF;
    RETURN NULL; -- result is ignored since this is an AFTER trigger
END;
$emp_audit$ LANGUAGE plpgsql;

CREATE TRIGGER emp_audit_ins
AFTER INSERT ON emp
REFERENCING NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION process_emp_audit();
CREATE TRIGGER emp_audit_upd
AFTER UPDATE ON emp
REFERENCING OLD TABLE AS old_table NEW TABLE AS new_table
FOR EACH STATEMENT EXECUTE FUNCTION process_emp_audit();
CREATE TRIGGER emp_audit_del
AFTER DELETE ON emp
REFERENCING OLD TABLE AS old_table
FOR EACH STATEMENT EXECUTE FUNCTION process_emp_audit();



CREATE OR REPLACE FUNCTION snitch() RETURNS event_trigger AS $$
BEGIN
RAISE NOTICE 'snitch: % %', tg_event, tg_tag;
END;
$$ LANGUAGE plpgsql;

CREATE EVENT TRIGGER snitch ON ddl_command_start EXECUTE FUNCTION snitch();
CREATE EVENT TRIGGER snitch ON ddl_command_end EXECUTE FUNCTION snitch();