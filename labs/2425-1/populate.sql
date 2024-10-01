--  ___________  __   __  ___   __  ___________  ___________  _______   _______       ________   ___      ___ 
-- ("     _   ")|"  |/  \|  "| |" \("     _   ")("     _   ")/"     "| /"      \     |"      "\ |"  \    /"  |
--  )__/  \\__/ |'  /    \:  | ||  |)__/  \\__/  )__/  \\__/(: ______)|:        |    (.  ___  :) \   \  //   |
--     \\_ /    |: /'        | |:  |   \\_ /        \\_ /    \/    |  |_____/   )    |: \   ) || /\\  \/.    |
--     |.  |     \//  /\'    | |.  |   |.  |        |.  |    // ___)_  //      /     (| (___\ |||: \.        |
--     \:  |     /   /  \\   | /\  |\  \:  |        \:  |   (:      "||:  __   \     |:       :)|.  \    /:  |
--      \__|    |___/    \___|(__\_|_)  \__|         \__|    \_______)|__|  \___)    (________/ |___|\__/|___|
                                                                                                        
-- Binome 1 : Je soussigné(e), Nom, Prénom, …………………………………………………………………………………………………………………………………… certifie qu’il s’agit d’un travail original et que toutes les sources utilisées ont été indiquées dans leur totalité. Fait à ______________ le __/__/__.
-- Binome 2 : Je soussigné(e), Nom, Prénom, …………………………………………………………………………………………………………………………………… certifie qu’il s’agit d’un travail original et que toutes les sources utilisées ont été indiquées dans leur totalité. Fait à ______________ le __/__/__.

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_twitter;

-- Create a new database
CREATE DATABASE db_twitter;

-- Connect to the database
\connect db_twitter

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP TABLE IF EXISTS TUserInfo CASCADE;
DROP TABLE IF EXISTS TFollow CASCADE;
DROP TABLE IF EXISTS TTweet CASCADE;
DROP TABLE IF EXISTS TLike CASCADE;
DROP TABLE IF EXISTS TMedia CASCADE;
DROP TABLE IF EXISTS TReport CASCADE;
DROP TABLE IF EXISTS TURL CASCADE;

-- Create the table TUserInfo and import a CSV file into the table
CREATE TABLE TUserInfo (
    userId VARCHAR (20) PRIMARY KEY,
    userName VARCHAR (20) NOT NULL,
    realName VARCHAR (20) NOT NULL,
    -- TBC
);

COPY TUserInfo(userId,userName,realName)
FROM 'users.csv'
DELIMITER ','
CSV HEADER;


-- Create the table TFollow and import a CSV file into the table

-- Create the table TTweet and import a CSV file into the table

-- Create the table TLike and import a CSV file into the table

-- Create the table TMedia and import a CSV file into the table

-- Create the table TReport and import a CSV file into the table

-- Create the table TURL and import a CSV file into the table


-- Bannière générée avec https://manytools.org/hacker-tools/ascii-banner/