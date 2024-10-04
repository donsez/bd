# Postgres Tutorial

## Install [Docker Engine](https://docs.docker.com/engine/install/) or [Docker Desktop](https://docs.docker.com/desktop/) on your host

```bash
docker --help
docker --help compose
```

## Clone (or fork) the project

```bash
mkdir -p ~/github/donsez/
cd ~/github/donsez/
git clone https://github.com/donsez/bd.git
cd ~/github/donsez/bd/postgres
```

## Start the DBMS

```bash
mkdir -p data/postgres
docker compose up -d
```

List the services
```bash
docker compose ps
```

Check the services logs (`^C` to stop checking the logs)
```bash
docker compose logs -f
```

Interact with the DBMS using the [`psql` command](https://docs.postgresql.fr/17/app-psql.html).
The password is still `changeme`.

```bash
docker compose exec -it postgres psql -U postgres -W
```

> Nota Bene: You can stop the container with `docker compose stop` and destroy the container with `docker compose down`. However,Postgres DBMS files are still stored in the host directory `./data/postgres`.

## Execute the PSQL statements

```sql
-- List databases
\l

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_turing;

-- Create a new database
CREATE DATABASE db_turing;

-- List databases
\l

-- Connect to the database
\connect db_turing

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

-- Drop existing tables for cleaning

DROP TABLE IF EXISTS PERSON CASCADE;
DROP TABLE IF EXISTS TURING_AWARD;

-- Create the table PERSON
CREATE TABLE PERSON (
   ID           SERIAL PRIMARY KEY  NOT NULL,
   NAME         VARCHAR (255) NOT NULL,
   BIRTHDATE    DATE NOT NULL DEFAULT CURRENT_DATE,
   LEVEL        INT
);

-- Show tables
\d

-- Show schema of table PERSON
\d PERSON

-- Insert new rows into table PERSON
INSERT INTO PERSON (ID, NAME, BIRTHDATE, LEVEL) VALUES
    (1001, 'Codd', '1923-08-19', 10),
    (1002, 'Turing', '1912-06-12', 10),
    (1003, 'Ullman', '1942-11-22', NULL),
    (1004, 'Patterson', DEFAULT, NULL),
    (1005, 'Hennessy', '1952-07-22', NULL),
    (1006, 'Stonebraker', '1943-10-11', NULL);

-- Show persons
SELECT * FROM PERSON;

-- Show persons with 'undefined' (aka 'unknown') level
SELECT * FROM PERSON WHERE LEVEL IS NOT NULL;

-- Update level of persons with 'undefined' (aka 'unknown') level
UPDATE PERSON SET LEVEL=0 WHERE LEVEL IS NULL;

-- Insert a new row into table PERSON
INSERT INTO PERSON (NAME, BIRTHDATE) VALUES
    ('Gray', DEFAULT);

-- Show tables
\d
\dt+

-- Show schema of table PERSON
\d PERSON

-- Show schema of PERSON_ID_SEQ table used for sequencing the ID column of table PERSON
\d PERSON_ID_SEQ

-- Show persons
SELECT * FROM PERSON;

-- Show the three first persons
SELECT * FROM PERSON LIMIT 3;

-- Show persons sorted by birthdate
SELECT * FROM PERSON ORDER BY BIRTHDATE ASC;

-- Show persons sorted by age
SELECT NAME, AGE(BIRTHDATE) AS AGE FROM PERSON ORDER BY AGE ASC;

-- Show persons sorted by age (descending)
SELECT NAME, AGE(BIRTHDATE) AS AGE FROM PERSON ORDER BY AGE DESC;

-- Import a CSV file into a table using COPY statement.
-- Remark: the CSV file is into a directory mounted by the container
COPY PERSON(ID, NAME, BIRTHDATE, LEVEL)
FROM '/work/turing/persons.csv'
DELIMITER ','
CSV HEADER;

-- Show persons
SELECT * FROM PERSON;

-- Create the table TURING_AWARD
CREATE TABLE TURING_AWARD (
   YEAR         INT NOT NULL,
   ID           INT,
   CONSTRAINT FK_PERSON
      FOREIGN KEY(ID) 
	  REFERENCES PERSON(ID)
);

-- Insert new rows into table TURING_AWARD (See https://en.wikipedia.org/wiki/Turing_Award)
INSERT INTO TURING_AWARD (ID, YEAR) VALUES
    (1001, 1981),
    (1003, 2020),
    (1004, 2017),
    (1005, 2017),
    (1006, 2014),
    (1007, 2013),
    (1008, 1974);

-- Show turing awards ordered by year
SELECT * FROM TURING_AWARD ORDER BY YEAR ASC;

-- Show name of persons with turing award
SELECT * FROM PERSON P, TURING_AWARD T WHERE P.ID=T.ID;
SELECT * FROM PERSON P NATURAL JOIN TURING_AWARD T;
SELECT * FROM PERSON P INNER JOIN TURING_AWARD T ON P.ID=T.ID;

SELECT * FROM PERSON P LEFT JOIN TURING_AWARD T ON P.ID=T.ID;
SELECT * FROM PERSON P RIGHT JOIN TURING_AWARD T ON P.ID=T.ID;

-- The full outer join combines the results of both left join and right join.
SELECT * FROM PERSON P FULL OUTER JOIN TURING_AWARD T ON P.ID=T.ID;

-- The cross join
SELECT * FROM PERSON P CROSS JOIN TURING_AWARD T;

-- Show name of persons with turing award ordered by year
SELECT P.NAME, T.YEAR FROM PERSON P, TURING_AWARD T WHERE P.ID=T.ID ORDER BY YEAR ASC;

-- Show name of persons that are not awarded
SELECT NAME FROM PERSON WHERE ID NOT IN (SELECT ID FROM TURING_AWARD);

-- Insert a new row into table TURING_AWARD (the foreign constraint is violated since person id does not exist)
INSERT INTO TURING_AWARD (ID, YEAR) VALUES
    (9999, 2099);

-- Exercice: Increment by one the level of each person

-- Exercice: List the numbers of awarded persons per year

-- Exercice: Alter table in order to rename NAME into LASTNAME and to add FIRSTNAME and MIDDLENAME columns

-- Exercice: List the persons awarded the same year

```

## PGAdmin

Browse the [PGAdmin console](http://localhost:5050).

Set a new password for PGAdmin.

Add a new server.
* In `General` tab, The `name` is `TEST`.
* In `Connection` tab, the `hostname` is `postgres_container`, the `username` is `postgres` and the  `password` is `changeme`.

Browse the DB tree on the left panel.

![PGAdmin](pgadmin-01.png)

## Enjoy

## At the end

Stop and remmove the composition
```bash
docker compose down
```

Remove the DBMS files
```bash
rm -fr data/
```

## Misc: PSQL statements

### Date and Time

https://www.postgresql.org/docs/current/functions-datetime.html

```sql
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
```

More in [work/extra/datetime.sql](work/extra/datetime.sql)


### Variables

```sql
\set overTheAgeOf 100

SELECT *
FROM PERSON
WHERE DATE_PART('year', AGE(BIRTHDATE)) > :overTheAgeOf;
```


### Constants

```sql
WITH myconstants (var1, var2) as (
   values (5, 'foo')
)
SELECT *
FROM somewhere, myconstants
WHERE something = var1
   OR something_else = var2;
```

### Constraints and Transactions

[In french](./work/bank)

### Triggers

Doc: https://docs.postgresql.fr/10/plpgsql-trigger.html


### CSV export

Export the table TURING_AWARD into a CSV file.
```sql
COPY TURING_AWARD TO '/work/turing/turing_award.csv' DELIMITER ',' CSV HEADER;
```
### JSON export

Export the table TURING_AWARD into a JSON file.

```sql
\t
\a
\o /work/turing/turing_award.json
SELECT JSON_AGG(t) FROM (SELECT * FROM TURING_AWARD) T;
```

### Periodic dump

Exercice: add a container to the composition `docker-compose.yml` in order to dump the database every half hour (for instance, [`annixa/docker-pg_dump`](https://hub.docker.com/r/annixa/docker-pg_dump))

```yaml
  postgres-backup-turing:
    image: annixa/docker-pg_dump
    container_name: postgres-backup-turing
    #links:
    #  - postgresql:db # Maps postgres as "db"
    environment:
      - PGUSER=postgres
      - PGPASSWORD=changeme
      - CRON_SCHEDULE=0,30 * * * * # Every 30 minutes
      - DELETE_OLDER_THAN=10080 # seven days : Optionally delete files older than $DELETE_OLDER_THAN minutes.
      - PGDB=turing_db # The name of the database to dump
      - PREFIX=turing
    volumes:
      - ./backups/postgresql:/dump
    command: dump-cron
```

### Dump the database

```bash
TODAY=$(date +"%Y%m%d")
docker exec -it postgres_container pg_dumpall -c -U postgres > work/turing/dump_turing_db-$TODAY.sql
cat work/turing/dump_turing_db-$TODAY.sql
```

### Comment le planificateur utilise les statistiques ?

https://docs.postgresql.fr/16/planner-stats-details.html

### Geometric extension (PostGIS)

[PostGIS](../postgis)

## References

* https://docs.postgresql.fr
* https://www.postgresqltutorial.com/postgresql-tutorial
