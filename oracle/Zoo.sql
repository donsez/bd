drop table LesMaladies;
drop table LesAnimaux ;
drop table LesGardiens ;
drop table LesCages ;
drop table LesResponsables ;
drop table LesEmployes ;

create table LesEmployes (
    nomE varchar2(20),
    adresse varchar2(20) not null,
    constraint LesEmployes_C1 primary key (nomE)
);

insert into LesEmployes(nomE,adresse) values ('Peyrin','Noumea');
insert into LesEmployes(nomE,adresse) values ('Berrut','Sartene');
insert into LesEmployes(nomE,adresse) values ('Maraninchi','Calvi');
insert into LesEmployes(nomE,adresse) values ('Cartade','Pointe a Pitre');
insert into LesEmployes(nomE,adresse) values ('Scholl','Ushuaia');
insert into LesEmployes(nomE,adresse) values ('Adiba','Papeete');

create table LesResponsables (
    noAllee number(3),
    nomE varchar2(20) not null,
    constraint LesResponsables_C1 primary key (noAllee),
    constraint LesResponsables_C2 foreign key (nomE) references LesEmployes (nomE) on delete cascade,
    constraint LesResponsables_C3 check (noAllee between 1 and 999)
);

insert into LesResponsables(noAllee,nomE) values (10,'Peyrin');
insert into LesResponsables(noAllee,nomE) values (1,'Adiba');
insert into LesResponsables(noAllee,nomE) values (2,'Cartade');

create table LesCages (
    noCage number(3),
    fonction varchar2(20) not null,
    noAllee number(3) not null,
    constraint LesCages_C1 primary key (noCage),
    constraint LesCages_C2 check (noCage between 1 and 999),
    constraint LesCages_C3 foreign key (noAllee) references LesResponsables (noAllee) on delete cascade
 );

insert into LesCages(noCage,fonction,noAllee) values (11,'fauve',10);
insert into LesCages(noCage,fonction,noAllee) values (1,'fosse',1);
insert into LesCages(noCage,fonction,noAllee) values (2,'aquarium',1);
insert into LesCages(noCage,fonction,noAllee) values (3,'petits oiseaux',2);
insert into LesCages(noCage,fonction,noAllee) values (4,'grand aquarium',1);
insert into LesCages(noCage,fonction,noAllee) values (12,'fauve',10);
insert into LesCages(noCage,fonction,noAllee) values (5,'fauve',10);

create table LesGardiens (
    noCage number(3),
    nomE varchar2(20),
    constraint LesGardiens_C1 primary key (noCage, nomE),
    constraint LesGardiens_C2 foreign key (nomE) references LesEmployes (nomE) on delete cascade,
    constraint LesGardiens_C3 foreign key (noCage) references LesCages (noCage) on delete cascade
);

insert into LesGardiens(noCage,nomE) values (1,'Scholl');
insert into LesGardiens(noCage,nomE) values (12,'Berrut');
insert into LesGardiens(noCage,nomE) values (12,'Maraninchi');
insert into LesGardiens(noCage,nomE) values (11,'Berrut');
insert into LesGardiens(noCage,nomE) values (11,'Maraninchi');
insert into LesGardiens(noCage,nomE) values (11,'Scholl');
insert into LesGardiens(noCage,nomE) values (3,'Scholl');
insert into LesGardiens(noCage,nomE) values (12,'Scholl');
insert into LesGardiens(noCage,nomE) values (5,'Scholl');

create table LesAnimaux (
    nomA varchar2(20),
    sexe varchar2(13) DEFAULT 'male',
    type varchar2(15) not null,
    pays varchar2(20) DEFAULT 'France',
    anNais number(4),
    noCage number(3) not null,
    constraint LesAnimaux_C1 primary key (nomA),
    constraint LesAnimaux_C2 check (sexe in ('femelle','male','hermaphrodite')),
    constraint LesAnimaux_C3 check (anNais >= 1900),
    constraint LesAnimaux_C4 foreign key(noCage) references LesCages (noCage) on delete cascade
);

insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Charly','male','lion','Kenya',1999,12);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Arthur','male','ours','France',2000,1);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Chloe','femelle','pie','France',2001,3);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Milou','male','leopard','France',2013,11);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Tintin','male','leopard','France',2013,11);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Charlotte','femelle','lion','Kenya',2012,12);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Huan','femelle','panda','Chine',2005,1);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Yuan Meng','male','panda','France',2015,1);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Lola','femelle','lion','Kenya',1999,5);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Tola','femelle','ours','Espagne', 2003,1);
insert into LesAnimaux(nomA, sexe,type,pays,anNais,noCage) values ('Tai Lung','femelle','leopard','Chine',2006,5);

create table LesMaladies (
    nomA varchar2(20),
    nomM varchar2(20),
    constraint LesMaladies_C1 primary key (nomA,nomM),
    constraint LesMaladies_C2 foreign key (nomA) references LesAnimaux (nomA) on delete cascade
);

insert into LesMaladies (nomA,nomM) values ('Charlotte','grippe');
insert into LesMaladies (nomA,nomM) values ('Charly','rage de dents');
insert into LesMaladies (nomA,nomM) values ('Charly','grippe');
insert into LesMaladies (nomA,nomM) values ('Milou','angine');
insert into LesMaladies (nomA,nomM) values ('Chloe','grippe');
insert into LesMaladies (nomA,nomM) values ('Huan','angine');
insert into LesMaladies (nomA,nomM) values ('Huan','grippe');
insert into LesMaladies (nomA,nomM) values ('Huan','rage de dents');

grant select on LesMaladies to public;
grant select on LesAnimaux to public;
grant select on LesGardiens to public;
grant select on LesCages to public;
grant select on LesResponsables to public;
grant select on LesEmployes to public;

commit;
