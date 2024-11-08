--
-- Create and populate the Employee PostgreSQL database
-- For JDBC example in https://mkyong.com/jdbc/how-do-connect-to-postgresql-with-jdbc-driver-java/
-- (c) 2024, Didier Donsez, Université Grenoble Alpes
--

-- Drop the existing database if exists
DROP DATABASE IF EXISTS test;

-- Create a new database
-- TODO Rename to db_employee
CREATE DATABASE test;

-- Connect to the database
\connect test

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE IF EXISTS LesEmployes CASCADE;

-- Create the table LesEmployes and import a CSV file into the table
CREATE TABLE EMPLOYEE
(
    ID serial,
    NAME varchar(100) NOT NULL,
    SALARY numeric(15, 2) NOT NULL,
    CREATED_DATE timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
    PRIMARY KEY (ID)
);

COPY EMPLOYEE(ID,NAME,SALARY)
FROM '/work/employee/employee.csv'
DELIMITER ','
CSV HEADER;

-- Show tables
\d
\dt+

-- Show all
SELECT * FROM EMPLOYEE;
