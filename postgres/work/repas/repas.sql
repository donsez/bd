--
-- Base des données "Repas"
-- Copyright: UFR IM2AG, Université Grenoble Alpes
--

drop table if exists LesRepas;
drop table if exists LeMenu;
drop view if exists LesPreferencesAdrian;
drop table if exists LesPreferences;
drop table if exists LesPlats;

create table LesRepas (
    dateR date,
    nomI varchar(20)
);

create table LeMenu (
    dateR date,
    nomP varchar(20),
    nomV varchar(20)
);

create table LesPreferences (
    nomA varchar(20),
    nomP varchar(20)
);

create table LesPlats (
    nomP varchar(20),
    typeP varchar(20)
);

grant select on LesRepas to public;
grant select on LeMenu to public;
grant select on LesPreferences to public;
grant select on LesPlats to public;

-- A transaction is a sequence of SQL statements that are treated as a single unit.
BEGIN TRANSACTION;

insert into LesRepas values (to_date ('31/12/2004','DD/MM/YYYY'), 'Patrick');
insert into LesRepas values (to_date ('31/12/2004','DD/MM/YYYY'), 'Malou');
insert into LesRepas values (to_date ('31/12/2004','DD/MM/YYYY'), 'Thomas');
insert into LesRepas values (to_date ('31/12/2004','DD/MM/YYYY'), 'Jacques');
insert into LesRepas values (to_date ('21/10/2003','DD/MM/YYYY'), 'Thomas');
insert into LesRepas values (to_date ('21/10/2003','DD/MM/YYYY'), 'Marie');
insert into LesRepas values (to_date ('21/10/2003','DD/MM/YYYY'), 'Adrian');
insert into LesRepas values (to_date ('21/10/2003','DD/MM/YYYY'), 'Myriam');
insert into LesRepas values (to_date ('6/3/2005','DD/MM/YYYY'), 'Phil');
insert into LesRepas values (to_date ('6/3/2005','DD/MM/YYYY'), 'Jackie');
insert into LesRepas values (to_date ('6/3/2005','DD/MM/YYYY'), 'Adrian');
insert into LesRepas values (to_date ('6/3/2005','DD/MM/YYYY'), 'Marie');

insert into LeMenu values (to_date ('31/12/2004','DD/MM/YYYY'),'Medaillon langouste','eau');
insert into LeMenu values (to_date ('31/12/2004','DD/MM/YYYY'),'Mousse chocolat','eau');
insert into LeMenu values (to_date ('31/12/2004','DD/MM/YYYY'),'Plateau fromages','eau');
insert into LeMenu values (to_date ('21/10/2003','DD/MM/YYYY'),'Foie gras','Veuve Cliquot');
insert into LeMenu values (to_date ('21/10/2003','DD/MM/YYYY'),'Steak hache','Cote de Nuits');
insert into LeMenu values (to_date ('21/10/2003','DD/MM/YYYY'),'Ile flottante','Cidre');
insert into LeMenu values (to_date ('6/3/2005','DD/MM/YYYY'), 'Pates beurre','Vasse Felix');
insert into LeMenu values (to_date ('6/3/2005','DD/MM/YYYY'),'Mousse chocolat','Vasse Felix');

insert into LesPreferences values ('Pierre','Mousse chocolat');
insert into LesPreferences values ('Pierre','Medaillon langouste');
insert into LesPreferences values ('Pierre','Soupe champignons');
insert into LesPreferences values ('Patrick','Pates beurre');
insert into LesPreferences values ('Patrick','Mousse chocolat');
insert into LesPreferences values ('Patrick','Salade nicoise');
insert into LesPreferences values ('Malou','Ile flottante');
insert into LesPreferences values ('Malou','Mousse chocolat');
insert into LesPreferences values ('Malou','Mousse citron');
insert into LesPreferences values ('Thomas','Mousse chocolat');
insert into LesPreferences values ('Jacques','Mousse chocolat');
insert into LesPreferences values ('Adrian','Mousse chocolat');
insert into LesPreferences values ('Adrian','Medaillon langouste');
insert into LesPreferences values ('Adrian','Saumon');
insert into LesPreferences values ('Adrian','Soupe champignons');
insert into LesPreferences values ('Adrian','Ile flottante');
insert into LesPreferences values ('Adrian','Mousse citron');
insert into LesPreferences values ('Martin','Ile flottante');
insert into LesPreferences values ('Phil','Medaillon langouste');
insert into LesPreferences values ('Jackie','Medaillon langouste');

insert into LesPlats values ('Mousse chocolat','dessert');
insert into LesPlats values ('Medaillon langouste','crustaces');
insert into LesPlats values ('Soupe champignons','soupe');
insert into LesPlats values ('Pates beurre','pates');
insert into LesPlats values ('Salade nicoise','salade');
insert into LesPlats values ('Steak hache','viande');
insert into LesPlats values ('Saumon','poisson');
insert into LesPlats values ('Mousse citron','dessert');
insert into LesPlats values ('Plateau fromages','fromages');
insert into LesPlats values ('Ile flottante','dessert');

COMMIT;

-- A transaction is a sequence of SQL statements that are treated as a single unit.
BEGIN TRANSACTION;

select * from LesRepas;
select * from LeMenu;
select * from LesPreferences;
select * from LesPlats;

COMMIT;

-- A transaction is a sequence of SQL statements that are treated as a single unit.
BEGIN;

delete from LesPreferences where nomA = 'Adrian';
select * from LesPreferences;

ROLLBACK;

-- A implicit transaction
select * from LesPreferences;

create view LesPreferencesAdrian as select * from LesPreferences where nomA = 'Adrian';
select nomP from LesPreferencesAdrian;

select * from LesPreferences join LesPlats using (nomP);
select nomA, typeP from LesPreferences join LesPlats using (nomP);

-- Explain
explain select * from LesPreferences;
explain select * from LesPreferences where nomA = 'Adrian';

select * from LesPreferences join LesPlats using (nomP);
select nomA, typeP from LesPreferences join LesPlats using (nomP);
select * from LesPreferences full outer join LesPlats using (nomP);

explain select * from LesPreferences join LesPlats using (nomP);
explain select nomA, typeP from LesPreferences join LesPlats using (nomP);
explain select * from LesPreferences full outer join LesPlats using (nomP);
