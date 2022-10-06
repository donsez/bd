drop table if exists lesmonuments ;
drop table if exists lesetapes ;
drop table if exists lesreservations ;
drop table if exists lesprogrammations ;
drop table if exists lescircuits ;
drop table if exists lesvilles ;

create table LESVILLES (
		NOMV char(20) primary key,
		PAYS char (20)
);

create table LESMONUMENTS (
		NOMM char(35) primary key,
		NOMV char (20), 
		PRIX numeric (6,2)
);

create table LESCIRCUITS (
		NUMC numeric (3,0) primary key,
		VDEP char (20), 
		VARR char (20), 
		PRIX numeric (7,2),
		constraint fk_vdep foreign key (vdep) references lesvilles (nomv),
		constraint fk_varr foreign key (varr) references lesvilles (nomv)
);

create table LESETAPES (
		NUMC numeric (3,0),
		RANG  numeric (2,0), 
		VETAPE char (20), 
		NBJOURS numeric (2,0),
		constraint clef_ce primary key (NUMC, rang),
		constraint fk_nc_ce foreign key (NUMC) references lescircuits (NUMC),
		constraint fk_vilet foreign key (VETAPE) references lesvilles (nomv)
);

create table lesprogrammations (
		NUMC numeric (3,0),
		DATEDEP date, 
		NBPLACES  numeric (2,0),
		constraint clef_cd primary key (NUMC, datedep),
		constraint fk_nc_cd foreign key (NUMC) references lescircuits (NUMC)
);

create table LESRESERVATIONS (
		NUMR numeric (4,0),
		NOMC char (20), 
		NUMC numeric (3,0),
		DATEDEP date, 
		NBRES  numeric (2,0),
		constraint clef_r primary key (NUMR),
		constraint fk_nc_date_r foreign key (NUMC, datedep) references lesprogrammations (NUMC, datedep)
);

grant select on LESVILLES to public;
grant select on LESMONUMENTS to public;
grant select on LESCIRCUITS to public;
grant select on LESETAPES to public;
grant select on lesprogrammations to public;
grant select on LESRESERVATIONS to public;

begin transaction;

insert into lesvilles values ('Akureyri','Islande');
insert into lesvilles values ('Amsterdam','Hollande');
insert into lesvilles values ('Ardara','Irlande');
insert into lesvilles values ('Asbyrgi','Islande');
insert into lesvilles values ('Bantry','Irlande');
insert into lesvilles values ('Bari','Italie');
insert into lesvilles values ('Benevento','Italie');
insert into lesvilles values ('Besse','France');
insert into lesvilles values ('Briancon','France');
insert into lesvilles values ('Brindisi','Italie');
insert into lesvilles values ('Cap Nord','Norvege');
insert into lesvilles values ('Capri','Italie');
insert into lesvilles values ('Carrick','Irlande');
insert into lesvilles values ('Caserte','Italie');
insert into lesvilles values ('Castelo de Vide','Portugal');
insert into lesvilles values ('Catanzaro','Italie');
insert into lesvilles values ('Christianshab','Groenland');
insert into lesvilles values ('Cleggan','Irlande');
insert into lesvilles values ('Clermont Ferrand','France');
insert into lesvilles values ('Clifden','Irlande');
insert into lesvilles values ('Copenhague','Danemark');
insert into lesvilles values ('Cork','Irlande');
insert into lesvilles values ('Cosenza','Italie');
insert into lesvilles values ('Dingle','Irlande');
insert into lesvilles values ('Disko','Groenland');
insert into lesvilles values ('Donegal','Irlande');
insert into lesvilles values ('Dublin','Irlande');
insert into lesvilles values ('Dungloe','Irlande');
insert into lesvilles values ('Egedesmine','Groenland');
insert into lesvilles values ('Ennis','Irlande');
insert into lesvilles values ('Evora','Portugal');
insert into lesvilles values ('Faro','Portugal');
insert into lesvilles values ('Fatima','Portugal');
insert into lesvilles values ('Florence','Italie');
insert into lesvilles values ('Galway','Irlande');
insert into lesvilles values ('Geysir','Islande');
insert into lesvilles values ('Glengariff','Irlande');
insert into lesvilles values ('Godafoss','Islande');
insert into lesvilles values ('Godhavn','Groenland');
insert into lesvilles values ('Gullfoss','Islande');
insert into lesvilles values ('Hammerfest','Norvege');
insert into lesvilles values ('Helsinky','Finlande');
insert into lesvilles values ('Hoedic','France');
insert into lesvilles values ('Holsteinborg','Groenland');
insert into lesvilles values ('Houat','France');
insert into lesvilles values ('Husavik','Islande');
insert into lesvilles values ('Hveravellir','Islande');
insert into lesvilles values ('Inari','Norvege');
insert into lesvilles values ('Jakobshavn','Groenland');
insert into lesvilles values ('Kenmare','Irlande');
insert into lesvilles values ('Killarney','Irlande');
insert into lesvilles values ('Killibegs','Irlande');
insert into lesvilles values ('Laschamps','France');
insert into lesvilles values ('Lecce','Italie');
insert into lesvilles values ('Leenan','Irlande');
insert into lesvilles values ('Leiria','Portugal');
insert into lesvilles values ('Letterkenny','Irlande');
insert into lesvilles values ('Lisbonne','Portugal');
insert into lesvilles values ('Londres','Angleterre');
insert into lesvilles values ('Louisburgh','Irlande');
insert into lesvilles values ('Metaponto','Italie');
insert into lesvilles values ('Myvatn','Islande');
insert into lesvilles values ('Naples','Italie');
insert into lesvilles values ('Orcival','France');
insert into lesvilles values ('Paris','France');
insert into lesvilles values ('Lyon','France');
insert into lesvilles values ('Pompei','Italie');
insert into lesvilles values ('Port Cotton','France');
insert into lesvilles values ('Port Maria','France');
insert into lesvilles values ('Porto','Portugal');
insert into lesvilles values ('Puy de Dome','France');
insert into lesvilles values ('Quiberon','France');
insert into lesvilles values ('Ravenne','Italie');
insert into lesvilles values ('Reykholt','Islande');
insert into lesvilles values ('Reykjavik','Islande');
insert into lesvilles values ('Rome','Italie');
insert into lesvilles values ('Saarijarvi','Norvege');
insert into lesvilles values ('St Ives','Angleterre');
insert into lesvilles values ('Sissinghurst','Angleterre');
insert into lesvilles values ('Exeter','Angleterre');
insert into lesvilles values ('Bath','Angleterre');
insert into lesvilles values ('Salisbury','Angleterre');
insert into lesvilles values ('Salerne','Italie');
insert into lesvilles values ('Salla','Norvege');
insert into lesvilles values ('Shannon','Irlande');
insert into lesvilles values ('Sondre','Groenland');
insert into lesvilles values ('Tornio','Norvege');
insert into lesvilles values ('Urgeirica','Portugal');
insert into lesvilles values ('Venise','Italie');
insert into lesvilles values ('Verone','Italie');
insert into lesvilles values ('Vila Real','Portugal');
insert into lesvilles values ('Westport','Irlande');
insert into lesvilles values ('Ylivieska','Norvege');

insert into lesmonuments values ('Tower Bridge','Londres',50);
insert into lesmonuments values ('Madame Tussau','Londres',50);
insert into lesmonuments values ('The Tower','Londres',60);
insert into lesmonuments values ('British Museum','Londres',40);
insert into lesmonuments values ('Loydd Building','Londres',0);
insert into lesmonuments values ('Canals','Amsterdam',90);
insert into lesmonuments values ('Medical Center','Amsterdam',0);
insert into lesmonuments values ('Madurodam','Amsterdam',120);
insert into lesmonuments values ('Plaza San Marco','Venise',0);
insert into lesmonuments values ('Cratere du Pariou','Puy de Dome',20);
insert into lesmonuments values ('Cretes du Sancy','Puy de Dome',0);
insert into lesmonuments values ('reserve ornithologique','Port Cotton',0);
insert into lesmonuments values ('Grotte de l Apothicairerie','Port Cotton',20);
insert into lesmonuments values ('Citadelle Vauban','Port Maria',0);
insert into lesmonuments values ('Elizabeth Gardens','Sissinghurst',15);
insert into lesmonuments values ('Stonehenge Prehistoric Spot','Salisbury',50);
insert into lesmonuments values ('Roman baths','Bath',35);
insert into lesmonuments values ('Palais Royal de Queluz','Lisbonne',120);
insert into lesmonuments values ('Monastere des Jeronimos','Lisbonne',36);
insert into lesmonuments values ('Chateau de Saint Georges','Lisbonne',45);
insert into lesmonuments values ('Monastere Cysterien d Alcobaca','Leiria',36);
insert into lesmonuments values ('Cathedrale','Porto',0);
insert into lesmonuments values ('Palais de la Bourse','Porto',90);
insert into lesmonuments values ('Palais des Ducs de Braganda','Vila Real',120);
insert into lesmonuments values ('Musee Graovasco','Urgeirica',10);
insert into lesmonuments values ('Universite de Santa Clara','Fatima',0);
insert into lesmonuments values ('Chateau des Templiers','Fatima',20);
insert into lesmonuments values ('Usine de Tapisseries','Evora',0);
insert into lesmonuments values ('Chapelle des Os','Evora',0);
insert into lesmonuments values ('Maison Royale de Braganda','Evora',120);
insert into lesmonuments values ('Couvent Daconciecao','Faro',20);
insert into lesmonuments values ('Forteresse Sagres','Faro',0);
insert into lesmonuments values ('Piazza Venezia','Rome',0);
insert into lesmonuments values ('La Fontaine de Trevi','Rome',0);
insert into lesmonuments values ('La Basilique Saint Pierre','Rome',0);
insert into lesmonuments values ('Le Pantheon','Rome',40);
insert into lesmonuments values ('Le Colisee','Rome',40);
insert into lesmonuments values ('Le Cirque de Maxime','Rome',40);
insert into lesmonuments values ('Eglise Santa Maria del Fiore','Florence',0);
insert into lesmonuments values ('Campanile de Giotto','Florence',30);
insert into lesmonuments values ('Baptistere','Florence',30);
insert into lesmonuments values ('Mausolee de Galla Placidia','Ravenne',30);
insert into lesmonuments values ('Sant Apolinnare Nuovo','Ravenne',30);
insert into lesmonuments values ('Piazza de Signori','Verone',0);
insert into lesmonuments values ('Casa de Capuleti','Verone',40);
insert into lesmonuments values ('Piazza San Marco','Venise',0);
insert into lesmonuments values ('La Basilique San Marco','Venise',30);
insert into lesmonuments values ('Le palais des Doges','Venise',30);
insert into lesmonuments values ('Le pont des Soupirs','Venise',0);
insert into lesmonuments values ('Le Grand Canal','Venise',40);
insert into lesmonuments values ('Ruines','Pompei',0);
insert into lesmonuments values ('Site Grec de Paestum','Cosenza',36);
insert into lesmonuments values ('Tombeau d Isabelle d Aragon','Cosenza',50);
insert into lesmonuments values ('Cathedrale Roccella','Catanzaro',0);
insert into lesmonuments values ('Triangle de Pythagore','Metaponto',0);
insert into lesmonuments values ('Le Dome','Lecce',50);
insert into lesmonuments values ('Basilique San Croce','Lecce',0);
insert into lesmonuments values ('Basilique de San Nicolas','Bari',0);
insert into lesmonuments values ('Chateau de Frederic II','Bari',80);
insert into lesmonuments values ('Arc du Trajan','Benevento',0);
insert into lesmonuments values ('Theatre','Benevento',50);
insert into lesmonuments values ('Palais Royal','Caserte',50);
insert into lesmonuments values ('Le Grand Serre Che','Briancon',145);
insert into lesmonuments values ('Le Prorel','Briancon',95);
insert into lesmonuments values ('Le Monetier les Bains','Briancon',95);
insert into lesmonuments values ('Serre Chevalier','Briancon',120);
insert into lesmonuments values ('Puy Saint Vincent','Briancon',110);
insert into lesmonuments values ('Montgenevre','Briancon',110);

insert into lescircuits values (1,'Paris','Paris',1160);
insert into lescircuits values (2,'Paris','Paris',1160);
insert into lescircuits values (3,'Paris','Paris',1040);
insert into lescircuits values (4,'Paris','Paris',1270);
insert into lescircuits values (5,'Lyon','Lyon',2740);
insert into lescircuits values (6,'Paris','Paris',2520);
insert into lescircuits values (7,'Quiberon','Hoedic',2500);
insert into lescircuits values (8,'Clermont Ferrand','Besse',2140);
insert into lescircuits values (9,'Paris','Paris',5700);
insert into lescircuits values (10,'Shannon','Cork',6170);
insert into lescircuits values (11,'Shannon','Shannon',6270);
insert into lescircuits values (12,'Dublin','Dublin',6170);
insert into lescircuits values (13,'Paris','Paris',18590);
insert into lescircuits values (14,'Reykjavik','Reykjavik',7700);
insert into lescircuits values (15,'Paris','Paris',8560);
insert into lescircuits values (16,'Paris','Paris',10180);
insert into lescircuits values (17,'Lisbonne','Lisbonne',3990);
insert into lescircuits values (18,'Paris','Paris',6690);
insert into lescircuits values (19,'Rome','Rome',10400);
insert into lescircuits values (21,'Paris','Rome',15000);
insert into lescircuits values (20,'Briancon','Briancon',450);

insert into lesetapes values (1,1,'Londres',2);
insert into lesetapes values (2,1,'Londres',2);
insert into lesetapes values (3,1,'Amsterdam',3);
insert into lesetapes values (4,1,'Amsterdam',4);
insert into lesetapes values (5,1,'Venise',5);
insert into lesetapes values (6,1,'Venise',4);
insert into lesetapes values (7,1,'Quiberon',2);
insert into lesetapes values (7,2,'Port Cotton',2);
insert into lesetapes values (7,3,'Port Maria',1);
insert into lesetapes values (7,4,'Houat',1);
insert into lesetapes values (7,5,'Hoedic',1);
insert into lesetapes values (8,1,'Laschamps',2);
insert into lesetapes values (8,2,'Orcival',3);
insert into lesetapes values (8,3,'Besse',2);
insert into lesetapes values (9,1,'Sissinghurst',2);
insert into lesetapes values (9,2,'Salisbury',2);
insert into lesetapes values (9,3,'Exeter',1);
insert into lesetapes values (9,4,'St Ives',1);
insert into lesetapes values (9,5,'Bath',1);
insert into lesetapes values (9,6,'Londres',1);
insert into lesetapes values (10,1,'Shannon',1);
insert into lesetapes values (10,2,'Dingle',3);
insert into lesetapes values (10,3,'Killarney',2);
insert into lesetapes values (10,4,'Kenmare',1);
insert into lesetapes values (10,5,'Glengariff',3);
insert into lesetapes values (10,6,'Bantry',2);
insert into lesetapes values (10,7,'Cork',1);
insert into lesetapes values (11,1,'Galway',2);
insert into lesetapes values (11,2,'Clifden',2);
insert into lesetapes values (11,3,'Cleggan',2);
insert into lesetapes values (11,4,'Leenan',1);
insert into lesetapes values (11,5,'Louisburgh',2);
insert into lesetapes values (11,6,'Westport',2);
insert into lesetapes values (11,7,'Ennis',2);
insert into lesetapes values (12,1,'Donegal',1);
insert into lesetapes values (12,2,'Killibegs',2);
insert into lesetapes values (12,3,'Carrick',2);
insert into lesetapes values (12,4,'Ardara',2);
insert into lesetapes values (12,5,'Dungloe',2);
insert into lesetapes values (12,6,'Letterkenny',1);
insert into lesetapes values (12,7,'Dublin',2);
insert into lesetapes values (13,1,'Copenhague',4);
insert into lesetapes values (13,2,'Jakobshavn',2);
insert into lesetapes values (13,3,'Christianshab',2);
insert into lesetapes values (13,4,'Godhavn',1);
insert into lesetapes values (13,5,'Disko',2);
insert into lesetapes values (13,6,'Egedesmine',1);
insert into lesetapes values (13,7,'Holsteinborg',4);
insert into lesetapes values (13,8,'Sondre',2);
insert into lesetapes values (14,1,'Reykjavik',3);
insert into lesetapes values (14,2,'Gullfoss',2);
insert into lesetapes values (14,3,'Geysir',2);
insert into lesetapes values (14,4,'Hveravellir',2);
insert into lesetapes values (14,5,'Akureyri',2);
insert into lesetapes values (14,6,'Myvatn',2);
insert into lesetapes values (14,7,'Asbyrgi',2);
insert into lesetapes values (15,1,'Reykjavik',2);
insert into lesetapes values (15,2,'Reykholt',2);
insert into lesetapes values (15,3,'Husavik',2);
insert into lesetapes values (15,4,'Godafoss',2);
insert into lesetapes values (16,1,'Helsinky',2);
insert into lesetapes values (16,2,'Ylivieska',1);
insert into lesetapes values (16,3,'Tornio',1);
insert into lesetapes values (16,4,'Cap Nord',1);
insert into lesetapes values (16,5,'Hammerfest',1);
insert into lesetapes values (16,6,'Inari',1);
insert into lesetapes values (16,7,'Salla',1);
insert into lesetapes values (16,8,'Saarijarvi',2);
insert into lesetapes values (17,1,'Lisbonne',2);
insert into lesetapes values (17,2,'Leiria',1);
insert into lesetapes values (17,3,'Porto',2);
insert into lesetapes values (17,4,'Vila Real',2);
insert into lesetapes values (17,5,'Urgeirica',1);
insert into lesetapes values (17,6,'Fatima',2);
insert into lesetapes values (17,7,'Castelo de Vide',1);
insert into lesetapes values (17,8,'Evora',2);
insert into lesetapes values (17,9,'Faro',1);
insert into lesetapes values (18,1,'Rome',3);
insert into lesetapes values (18,2,'Florence',3);
insert into lesetapes values (18,3,'Ravenne',2);
insert into lesetapes values (18,4,'Verone',1);
insert into lesetapes values (18,5,'Venise',3);
insert into lesetapes values (19,1,'Rome',2);
insert into lesetapes values (19,2,'Naples',1);
insert into lesetapes values (19,3,'Pompei',1);
insert into lesetapes values (19,4,'Capri',1);
insert into lesetapes values (19,5,'Salerne',1);
insert into lesetapes values (19,6,'Cosenza',2);
insert into lesetapes values (19,7,'Catanzaro',1);
insert into lesetapes values (19,8,'Metaponto',1);
insert into lesetapes values (19,9,'Lecce',1);
insert into lesetapes values (19,10,'Brindisi',1);
insert into lesetapes values (19,11,'Bari',2);
insert into lesetapes values (19,12,'Benevento',2);
insert into lesetapes values (19,13,'Caserte',2);
insert into lesetapes values (20,1,'Briancon',6);
insert into lesetapes values (21,1,'Helsinky',2);
insert into lesetapes values (21,2,'Ylivieska',1);
insert into lesetapes values (21,3,'Tornio',1);
insert into lesetapes values (21,4,'Cap Nord',1);
insert into lesetapes values (21,5,'Hammerfest',1);
insert into lesetapes values (21,6,'Inari',1);
insert into lesetapes values (21,7,'Salla',1);
insert into lesetapes values (21,8,'Saarijarvi',2);
insert into lesetapes values (21,9,'Rome',3);
insert into lesetapes values (21,10,'Florence',3);
insert into lesetapes values (21,11,'Ravenne',2);
insert into lesetapes values (21,12,'Verone',1);
insert into lesetapes values (21,13,'Venise',3);

insert into lesprogrammations values (1,to_date ('04-01-2005','DD-MM-YYYY'),34);
insert into lesprogrammations values (1,to_date ('24-07-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (1,to_date ('21-07-2005','DD-MM-YYYY'),00);
insert into lesprogrammations values (2,to_date ('05-09-2005','DD-MM-YYYY'),30);
insert into lesprogrammations values (6,to_date ('06-09-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (7,to_date ('31-10-2005','DD-MM-YYYY'),39);
insert into lesprogrammations values (10,to_date ('01-01-2005','DD-MM-YYYY'),80);
insert into lesprogrammations values (11,to_date ('29-05-2005','DD-MM-YYYY'),34);
insert into lesprogrammations values (18,to_date ('30-07-2005','DD-MM-YYYY'),90);
insert into lesprogrammations values (21,to_date ('15-01-2005','DD-MM-YYYY'),66);
insert into lesprogrammations values (1,to_date ('04-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (1,to_date ('06-02-2005','DD-MM-YYYY'),34);
insert into lesprogrammations values (2,to_date ('05-02-2005','DD-MM-YYYY'),00);
insert into lesprogrammations values (2,to_date ('06-01-2005','DD-MM-YYYY'),02);
insert into lesprogrammations values (2,to_date ('07-01-2005','DD-MM-YYYY'),09);
insert into lesprogrammations values (2,to_date ('06-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (3,to_date ('03-07-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (3,to_date ('24-12-2004','DD-MM-YYYY'),13);
insert into lesprogrammations values (3,to_date ('31-12-2004','DD-MM-YYYY'),45);
insert into lesprogrammations values (4,to_date ('06-11-2005','DD-MM-YYYY'),18);
insert into lesprogrammations values (4,to_date ('06-08-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (4,to_date ('30-06-2005','DD-MM-YYYY'),11);
insert into lesprogrammations values (4,to_date ('31-08-2005','DD-MM-YYYY'),01);
insert into lesprogrammations values (5,to_date ('06-11-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (5,to_date ('31-08-2005','DD-MM-YYYY'),66);
insert into lesprogrammations values (6,to_date ('06-02-2005','DD-MM-YYYY'),22);
insert into lesprogrammations values (6,to_date ('16-11-2005','DD-MM-YYYY'),34);
insert into lesprogrammations values (6,to_date ('06-10-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (7,to_date ('31-08-2005','DD-MM-YYYY'),56);
insert into lesprogrammations values (7,to_date ('16-12-2004','DD-MM-YYYY'),01);
insert into lesprogrammations values (7,to_date ('06-01-2005','DD-MM-YYYY'),01);
insert into lesprogrammations values (7,to_date ('26-02-2005','DD-MM-YYYY'),01);
insert into lesprogrammations values (8,to_date ('31-08-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (8,to_date ('16-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (8,to_date ('21-02-2005','DD-MM-YYYY'),13);
insert into lesprogrammations values (8,to_date ('21-07-2005','DD-MM-YYYY'),14);
insert into lesprogrammations values (8,to_date ('24-12-2004','DD-MM-YYYY'),18);
insert into lesprogrammations values (8,to_date ('31-12-2004','DD-MM-YYYY'),10);
insert into lesprogrammations values (8,to_date ('28-02-2005','DD-MM-YYYY'),11);
insert into lesprogrammations values (8,to_date ('14-02-2005','DD-MM-YYYY'),00);
insert into lesprogrammations values (8,to_date ('16-05-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (8,to_date ('26-04-2005','DD-MM-YYYY'),31);
insert into lesprogrammations values (8,to_date ('14-11-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (9,to_date ('06-02-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (9,to_date ('30-10-2005','DD-MM-YYYY'),31);
insert into lesprogrammations values (10,to_date ('21-01-2005','DD-MM-YYYY'),45);
insert into lesprogrammations values (10,to_date ('11-02-2005','DD-MM-YYYY'),30);
insert into lesprogrammations values (10,to_date ('28-02-2005','DD-MM-YYYY'),22);
insert into lesprogrammations values (11,to_date ('28-02-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (11,to_date ('06-02-2005','DD-MM-YYYY'),13);
insert into lesprogrammations values (11,to_date ('30-06-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (12,to_date ('06-02-2005','DD-MM-YYYY'),19);
insert into lesprogrammations values (13,to_date ('31-05-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (13,to_date ('30-04-2005','DD-MM-YYYY'),15);
insert into lesprogrammations values (13,to_date ('30-06-2005','DD-MM-YYYY'),52);
insert into lesprogrammations values (13,to_date ('31-12-2005','DD-MM-YYYY'),44);
insert into lesprogrammations values (13,to_date ('31-12-2004','DD-MM-YYYY'),03);
insert into lesprogrammations values (13,to_date ('01-01-2005','DD-MM-YYYY'),68);
insert into lesprogrammations values (13,to_date ('06-02-2005','DD-MM-YYYY'),99);
insert into lesprogrammations values (13,to_date ('06-05-2005','DD-MM-YYYY'),60);
insert into lesprogrammations values (14,to_date ('06-07-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (14,to_date ('26-07-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (15,to_date ('06-02-2005','DD-MM-YYYY'),11);
insert into lesprogrammations values (15,to_date ('31-08-2005','DD-MM-YYYY'),18);
insert into lesprogrammations values (16,to_date ('31-08-2005','DD-MM-YYYY'),17);
insert into lesprogrammations values (16,to_date ('06-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (16,to_date ('06-01-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (17,to_date ('31-12-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (17,to_date ('06-02-2005','DD-MM-YYYY'),03);
insert into lesprogrammations values (17,to_date ('16-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (17,to_date ('26-02-2005','DD-MM-YYYY'),34);
insert into lesprogrammations values (18,to_date ('30-04-2005','DD-MM-YYYY'),15);
insert into lesprogrammations values (18,to_date ('06-12-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (18,to_date ('06-10-2005','DD-MM-YYYY'),40);
insert into lesprogrammations values (19,to_date ('06-09-2005','DD-MM-YYYY'),20);
insert into lesprogrammations values (19,to_date ('16-09-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (19,to_date ('05-08-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (19,to_date ('10-12-2005','DD-MM-YYYY'),28);
insert into lesprogrammations values (19,to_date ('20-12-2005','DD-MM-YYYY'),11);
insert into lesprogrammations values (19,to_date ('06-02-2005','DD-MM-YYYY'),10);
insert into lesprogrammations values (19,to_date ('15-04-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (20,to_date ('01-04-2005','DD-MM-YYYY'),13);
insert into lesprogrammations values (20,to_date ('02-02-2005','DD-MM-YYYY'),14);
insert into lesprogrammations values (20,to_date ('22-12-2004','DD-MM-YYYY'),18);
insert into lesprogrammations values (20,to_date ('20-01-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (20,to_date ('27-01-2005','DD-MM-YYYY'),05);
insert into lesprogrammations values (20,to_date ('03-04-2005','DD-MM-YYYY'),87);
insert into lesprogrammations values (20,to_date ('06-02-2005','DD-MM-YYYY'),01);
insert into lesprogrammations values (21,to_date ('26-02-2005','DD-MM-YYYY'),12);
insert into lesprogrammations values (21,to_date ('06-04-2005','DD-MM-YYYY'),99);
insert into lesprogrammations values (21,to_date ('25-01-2005','DD-MM-YYYY'),03);

insert into lesreservations values (03,'Asterix',01,to_date ('04-02-2005','DD-MM-YYYY'),04);
insert into lesreservations values (04,'Obelix',12,to_date ('06-02-2005','DD-MM-YYYY'),78);
insert into lesreservations values (01,'Donald',10,to_date ('01-01-2005','DD-MM-YYYY'),02);
insert into lesreservations values (02,'Picsou',09,to_date ('30-10-2005','DD-MM-YYYY'),10);
insert into lesreservations values (05,'Ordralphabetix',20,to_date ('27-01-2005','DD-MM-YYYY'),05);
insert into lesreservations values (06,'Corto',18,to_date ('06-12-2005','DD-MM-YYYY'),11);
insert into lesreservations values (21,'Mafalda',19,to_date ('15-04-2005','DD-MM-YYYY'),20);
insert into lesreservations values (22,'Mafalda',05,to_date ('06-11-2005','DD-MM-YYYY'),43);
insert into lesreservations values (23,'Donald',21,to_date ('15-01-2005','DD-MM-YYYY'),10);
insert into lesreservations values (07,'Bidochon',13,to_date ('31-12-2004','DD-MM-YYYY'),05);
insert into lesreservations values (13,'Bonemine',14,to_date ('26-07-2005','DD-MM-YYYY'),21);
insert into lesreservations values (14,'Nestor Burma',12,to_date ('06-02-2005','DD-MM-YYYY'),01);
insert into lesreservations values (15,'Mafalda',13,to_date ('31-12-2004','DD-MM-YYYY'),43);
insert into lesreservations values (16,'GrosseBaf',04,to_date ('30-06-2005','DD-MM-YYYY'),88);
insert into lesreservations values (17,'Picsou',08,to_date ('14-02-2005','DD-MM-YYYY'),01);
insert into lesreservations values (18,'Picsou',01,to_date ('21-07-2005','DD-MM-YYYY'),10);
insert into lesreservations values (19,'Asterix',21,to_date ('15-01-2005','DD-MM-YYYY'),14);
insert into lesreservations values (08,'Milou',08,to_date ('16-02-2005','DD-MM-YYYY'),01);
insert into lesreservations values (09,'La Castafiore',08,to_date ('28-02-2005','DD-MM-YYYY'),07);
insert into lesreservations values (10,'Milou',02,to_date ('05-02-2005','DD-MM-YYYY'),99);
insert into lesreservations values (11,'Jerry',03,to_date ('03-07-2005','DD-MM-YYYY'),11);
insert into lesreservations values (12,'Donald',07,to_date ('16-12-2004','DD-MM-YYYY'),51);
insert into lesreservations values (20,'Ordralphabetix',05,to_date ('31-08-2005','DD-MM-YYYY'),02);
insert into lesreservations values (24,'Mafalda',13,to_date ('01-01-2005','DD-MM-YYYY'),05);
insert into lesreservations values (25,'Nestor Burma',13,to_date ('01-01-2005','DD-MM-YYYY'),05);
insert into lesreservations values (26,'Ordralphabetix',10,to_date ('11-02-2005','DD-MM-YYYY'),02);
insert into lesreservations values (27,'Nestor Burma',2,to_date ('07-01-2005','DD-MM-YYYY'),25);

commit;
