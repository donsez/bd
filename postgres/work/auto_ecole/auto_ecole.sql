--
-- Create and populate the AutoEcole PostgreSQL database
-- (c) Stéphane Desvismes, Didier Donsez, Université Grenoble Alpes
--

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_auto_ecole;

-- Create a new database
CREATE DATABASE db_auto_ecole;

-- Connect to the database
\connect db_auto_ecole

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE IF EXISTS LesVehicules CASCADE;
DROP TABLE IF EXISTS LesMoniteurs CASCADE;
DROP TABLE IF EXISTS LesPermis CASCADE;
DROP TABLE IF EXISTS LesEleves CASCADE;
DROP TABLE IF EXISTS LesLecons CASCADE;

CREATE SEQUENCE seg_numM START 101;
CREATE SEQUENCE seq_numE START 1001;
CREATE SEQUENCE seq_numI START 1000001;


-- Create the table LesVehicules and import lignes into the table
CREATE TABLE LesVehicules (
    numI INTEGER DEFAULT NEXTVAL('seq_numI'),
    type VARCHAR(20) NOT NULL,
    PRIMARY KEY(numI)
);

COPY LesVehicules(nomI,nom,premom)
FROM '/work/auto_ecole/lesvehicules.csv'
DELIMITER ','
CSV HEADER;

-- Create the table LesMoniteurs and import a CSV file into the table
CREATE TABLE LesMoniteurs (
    nomM INTEGER DEFAULT NEXTVAL('seq_numI'),
    nom VARCHAR(20) NOT NULL,
    prenom VARCHAR(20) NOT NULL
    PRIMARY KEY(nomM)
);

COPY LesMoniteurs(nomM,nom,premom)
FROM '/work/auto_ecole/lesmoniteurs.csv'
DELIMITER ','
CSV HEADER;

