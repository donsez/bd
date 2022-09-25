--
-- Create and populate the ZOO PostgreSQL database
-- (c) Stéphane Desvismes, Didier Donsez, Université Grenoble Alpes
--

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_zoo;

-- Create a new database
CREATE DATABASE db_zoo;

-- Connect to the database
\connect db_zoo

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE IF EXISTS LesEmployes CASCADE;
DROP TABLE IF EXISTS LesCages CASCADE;
DROP TABLE IF EXISTS LesResponsables CASCADE;
DROP TABLE IF EXISTS LesAnimaux CASCADE;
DROP TABLE IF EXISTS LesGardiens CASCADE;
DROP TABLE IF EXISTS LesMaladies CASCADE;

-- Create the table LesEmployes and import a CSV file into the table
CREATE TABLE LesEmployes (
    nomE VARCHAR (20) NOT NULL PRIMARY KEY,
    adresse VARCHAR(20) NOT NULL
);

COPY LesEmployes(nomE,adresse)
FROM '/work/zoo/lesemployes.csv'
DELIMITER ','
CSV HEADER;


-- Create the table LesCages and import a CSV file into the table
CREATE TABLE LesCages (
   noCage INT PRIMARY KEY NOT NULL,
   fonction VARCHAR (20) NOT NULL,
   noAllée INT NOT NULL
);

COPY LesCages(noCage,fonction,noAllée)
FROM '/work/zoo/lescages.csv'
DELIMITER ','
CSV HEADER;

-- Create the table LesResponsables and import a CSV file into the table
CREATE TABLE LesResponsables (
   noAllée INT NOT NULL,
   nomE VARCHAR (20) NOT NULL,
   FOREIGN KEY (nomE) REFERENCES LesEmployes(nomE)
);

COPY LesResponsables(noAllée,nomE)
FROM '/work/zoo/lesresponsables.csv'
DELIMITER ','
CSV HEADER;

-- Create the table LesAnimaux and import a CSV file into the table
CREATE TABLE LesAnimaux (
    nomA VARCHAR(20) NOT NULL PRIMARY KEY,
    sexe VARCHAR(20) NOT NULL,
    type VARCHAR(20) NOT NULL,
    pays VARCHAR(20) NOT NULL,
    anNais INT NOT NULL,
    noCage INT NOT NULL,
    CONSTRAINT fk_noCage FOREIGN KEY (noCage) REFERENCES LesCages(noCage)
);

COPY LesAnimaux(nomA,sexe,type,pays,anNais,noCage)
FROM '/work/zoo/lesanimaux.csv'
DELIMITER ','
CSV HEADER;

-- Create the table LesGardiens and import a CSV file into the table
CREATE TABLE LesGardiens (
   noCage INT NOT NULL,
   nomE VARCHAR (20) NOT NULL,
   PRIMARY KEY (noCage, nomE),
   FOREIGN KEY (noCage) REFERENCES LesCages (noCage),
   FOREIGN KEY (nomE) REFERENCES LesEmployes (nomE)
);

COPY LesGardiens(noCage,nomE)
FROM '/work/zoo/lesgardiens.csv'
DELIMITER ','
CSV HEADER;

-- Create the table LesMaladies and import a CSV file into the table
CREATE TABLE LesMaladies (
    nomA VARCHAR(20) NOT NULL,
    nomM VARCHAR(20) NOT NULL,
    FOREIGN KEY (nomA) REFERENCES LesAnimaux (nomA)
);

COPY LesMaladies(nomA,nomM)
FROM '/work/zoo/lesmaladies.csv'
DELIMITER ','
CSV HEADER;

-- Show tables
\d
\dt+

-- Show all
SELECT * FROM LesEmployes;
SELECT * FROM LesCages;
SELECT * FROM LesResponsables;
SELECT * FROM LesAnimaux;
SELECT * FROM LesGardiens;
SELECT * FROM LesMaladies;

