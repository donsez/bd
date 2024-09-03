drop table FREQUENTS;
drop table SELLS;
drop table LIKES;
drop table BARS;
drop table BEERS;
drop table DRINKERS;

create table DRINKERS
(
  NAME VARCHAR2(30) not null
    constraint D_C0
    primary key,
  ADDR VARCHAR2(30),
  PHONE VARCHAR2(30)
);

create table BEERS
(
  NAME VARCHAR2(30) not null
    constraint BE_C0
    primary key,
  MANF VARCHAR2(30)
);

create table BARS
(
  NAME VARCHAR2(30) not null
    constraint BA_C0
    primary key,
  ADDR VARCHAR2(30),
  LLCENSE VARCHAR2(30),
  OPENDATE DATE
);

create table LIKES
(
  DRINKER VARCHAR2(30) not null
    constraint L_C1
    references DRINKERS,
  BEER VARCHAR2(30) not null
    constraint L_C2
    references BEERS,
  constraint L_C0
  primary key (DRINKER, BEER)
);

create table SELLS
(
  BAR VARCHAR2(30) not null
    constraint S_C1
    references BARS,
  BEER VARCHAR2(30) not null
    constraint S_C2
    references BEERS,
  PRICE NUMBER(8,2),
  constraint S_C0
  primary key (BAR, BEER)
);

create table FREQUENTS
(
  DRINKER VARCHAR2(30) not null
    constraint F_C2
    references DRINKERS,
  BAR VARCHAR2(30) not null
    constraint F_C1
    references BARS,
  constraint F_C0
  primary key (DRINKER, BAR)
);

grant SELECT on DRINKERS to PUBLIC;
grant SELECT on BEERS to PUBLIC;
grant SELECT on BARS to PUBLIC;
grant SELECT on LIKES to PUBLIC;
grant SELECT on SELLS to PUBLIC;
grant SELECT on FREQUENTS to PUBLIC;

INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('Adam', 'Randwick ', '9385-4444');
INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('Gernot', 'Newtown', '9415-3378');
INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('John', 'Clovelly', '9665-1234');
INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('Justin', 'Mosman', '9845-4321');
INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('Marie', 'Rose Bay', '9371-2126');
INSERT INTO DRINKERS (NAME, ADDR, PHONE) VALUES ('Adrian', 'Redfern', '9371-1244');

INSERT INTO BEERS (NAME, MANF) VALUES ('80/-', 'Caledonian');
INSERT INTO BEERS (NAME, MANF) VALUES ('Bigfoot Barley Wine', 'Sierra Nevada');
INSERT INTO BEERS (NAME, MANF) VALUES ('Burragorang Bock', 'George IV Inn');
INSERT INTO BEERS (NAME, MANF) VALUES ('Crown Lager', 'Carlton');
INSERT INTO BEERS (NAME, MANF) VALUES ('Fosters Lager', 'Carlton');
INSERT INTO BEERS (NAME, MANF) VALUES ('Invalid Stout', 'Carlton');
INSERT INTO BEERS (NAME, MANF) VALUES ('Melbourne Bitter', 'Carlton');
INSERT INTO BEERS (NAME, MANF) VALUES ('New', 'Toohey''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Old', 'Toohey''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Old Admiral', 'Lord Nelson');
INSERT INTO BEERS (NAME, MANF) VALUES ('Pale Ale', 'Sierra Nevada');
INSERT INTO BEERS (NAME, MANF) VALUES ('Premium Lager', 'Cascade');
INSERT INTO BEERS (NAME, MANF) VALUES ('Red', 'Toohey''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Sheaf Stout', 'Toohey''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Sparkling Ale', 'Cooper''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Stout', 'Cooper''s');
INSERT INTO BEERS (NAME, MANF) VALUES ('Three Sheets', 'Lord Nelson');
INSERT INTO BEERS (NAME, MANF) VALUES ('Victoria Bitter', 'Carlton');

INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Australia Hotel', 'The Rocks', '123456', TO_DATE('1940-01-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Rose Bay Hotel', 'Rose Bay', '966410', TO_DATE('1920-08-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Coogee Bay Hotel', 'Coogee', '966500', TO_DATE('1980-08-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Lord Nelson', 'The Rocks', '123888', TO_DATE('1920-11-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Marble Bar', 'Sydney', '122123', TO_DATE('2001-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Regent Hotel', 'Kingsford', '987654', TO_DATE('2000-02-29 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO BARS (NAME, ADDR, LLCENSE, OPENDATE) VALUES ('Royal Hotel', 'Randwick', '938500', TO_DATE('1986-06-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO LIKES (DRINKER, BEER) VALUES ('Adam', 'Crown Lager');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Adam', 'Fosters Lager');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Adam', 'New');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Adam', 'Old');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Gernot', 'Premium Lager');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Gernot', 'Sparkling Ale');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('John', '80/-');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('John', 'Bigfoot Barley Wine');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('John', 'Pale Ale');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('John', 'Three Sheets');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Justin', 'Sparkling Ale');
INSERT INTO LIKES (DRINKER, BEER) VALUES ('Justin', 'Victoria Bitter');

INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Australia Hotel', 'Burragorang Bock', 3.50);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Coogee Bay Hotel', 'New', 2.30);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Coogee Bay Hotel', 'Old', 2.50);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Coogee Bay Hotel', 'Sparkling Ale', 2.80);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Coogee Bay Hotel', 'Victoria Bitter', 2.30);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Lord Nelson', 'Three Sheets', 3.75);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Lord Nelson', 'Old Admiral', 3.75);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Marble Bar', 'New', 2.80);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Marble Bar', 'Old', 2.80);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Marble Bar', 'Victoria Bitter', 2.80);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Regent Hotel', 'New', 2.20);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Regent Hotel', 'Victoria Bitter', 2.20);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Royal Hotel', 'New', 2.30);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Royal Hotel', 'Old', 2.30);
INSERT INTO SELLS (BAR, BEER, PRICE) VALUES ('Royal Hotel', 'Victoria Bitter', 2.30);

INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('Adam', 'Coogee Bay Hotel');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('Gernot', 'Lord Nelson');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('John', 'Australia Hotel');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('John', 'Coogee Bay Hotel');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('John', 'Lord Nelson');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('Justin', 'Marble Bar');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('Justin', 'Regent Hotel');
INSERT INTO FREQUENTS (DRINKER, BAR) VALUES ('Marie', 'Rose Bay Hotel');
