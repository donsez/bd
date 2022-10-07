--
-- Base de données Bibliothèque
-- (c) UFR-IM2AG, Université Grenoble Alpes
--

-- From Oracle Server

drop table if exists LOANS;
drop table if exists ITEMS;
drop table if exists BOOKS;
drop table if exists MEMBERS;

create table MEMBERS
(
  MEMBERID NUMERIC(3) NOT NULL
    CONSTRAINT MEMBER_C0
    PRIMARY KEY,
  LASTNAME VARCHAR(20),
  FIRSTNAME VARCHAR(20),
  ADDRESS VARCHAR(20),
  BIRTHYEAR NUMERIC(4),
  JOINDAY DATE
);

create table BOOKS
(
  TITLE VARCHAR(50) not null
    CONSTRAINT BOOK_C1
    PRIMARY KEY,
  LASTNAME VARCHAR(20),
  FIRSTNAME VARCHAR(20),
  PUBYEAR NUMERIC(4)
);

create table ITEMS
(
  ITEMID NUMERIC(10) not null
    CONSTRAINT ITEM_C1
    PRIMARY KEY,
  TITLE VARCHAR(50) not null
    CONSTRAINT ITEM_C2
    REFERENCES BOOKS
    CONSTRAINT ITEM_C0
    CHECK ("TITLE" IS NOT NULL)
);

create table LOANS
(
  ITEMID NUMERIC(10) not null
    CONSTRAINT LOAN_C1
    PRIMARY KEY
    CONSTRAINT LOAN_C2
    REFERENCES ITEMS,
  MEMBERID NUMERIC(3)
    CONSTRAINT LOAN_C3
    REFERENCES MEMBERS,
  LOANDATE DATE
);

grant select on MEMBERS to public;
grant select on BOOKS to public;
grant select on ITEMS to public;
grant select on LOANS to public;

INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (10, 'Martin', 'P.-C.', 'Gieres', 1946, TO_DATE('2010-11-17 16:49:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (11, 'Dupont', 'Fabienne', 'Gieres', 1958, TO_DATE('2021-12-12 16:49:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (199, 'Smith', 'M.-C.', 'Eybens', 1960, TO_DATE('2021-10-16 16:49:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (250, 'Martinez', 'Catherine', 'Brie', 1969, TO_DATE('2021-12-22 16:49:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (12, 'Kobalski', 'Florence', 'Grenoble', 1964, TO_DATE('2021-08-21 16:49:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO MEMBERS (MEMBERID, LASTNAME, FIRSTNAME, ADDRESS, BIRTHYEAR, JOINDAY) VALUES (251, 'Adamos', 'Sophie', 'Meylan', 1960, TO_DATE('2010-11-17 16:49:02', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('La nuit des temps', 'Barjavel', 'René', 1968);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('20000 lieues sous les mers', 'Verne', 'Jules', 1869);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Asterix le Gaulois', 'Goscinny', 'Rene', 1959);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Algorithmique et Representation des donnees', 'Scholl', 'P.-C.', 1984);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Theorie de la relativite', 'Einstein', 'Albert', 1922);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Dosadi', 'Herbert', 'Franck', 1959);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Les enfants de Dune', 'Herbert', 'Franck', 1983);
INSERT INTO BOOKS (TITLE, LASTNAME, FIRSTNAME, PUBYEAR) VALUES ('Dune', 'Herbert', 'Franck', 1973);

INSERT INTO ITEMS (ITEMID, TITLE) VALUES (1, 'Dune');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (2, 'Asterix le Gaulois');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (3, '20000 lieues sous les mers');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (4, 'Theorie de la relativite');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (5, 'Dune');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (6, 'Les enfants de Dune');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (8, 'Dosadi');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (9, 'Algorithmique et Representation des donnees');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (10, 'Asterix le Gaulois');
INSERT INTO ITEMS (ITEMID, TITLE) VALUES (11, 'La nuit des temps');

INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (1, 10, TO_DATE('2021-12-12 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (3, 10, TO_DATE('2021-12-13 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (2, 199, TO_DATE('2021-12-02 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (9, 11, TO_DATE('2021-12-02 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (6, 10, TO_DATE('2021-12-22 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (4, 250, TO_DATE('2021-12-20 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (5, 12, TO_DATE('2021-12-21 16:48:51', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO LOANS (ITEMID, MEMBERID, LOANDATE) VALUES (8, 10, TO_DATE('2021-12-22 16:48:52', 'YYYY-MM-DD HH24:MI:SS'));
