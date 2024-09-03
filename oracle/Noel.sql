drop table Lutins;
drop table Commandes;
drop table Enfants;
drop table Jouets;

create table Enfants (
    idE int,
    prenomE varchar(20) not null,
    ageE int not null,
    constraint Enfants_C1 check (idE > 0),
    constraint Enfants_C2 check (ageE > 0),
    constraint Enfants_C3 primary key (idE)
);

grant select on Enfants to public;

insert into Enfants(idE,prenomE,ageE) values ('1','Leo','10');
insert into Enfants(idE,prenomE,ageE) values ('2','Lea','5');
insert into Enfants(idE,prenomE,ageE) values ('3','Theo','6');
insert into Enfants(idE,prenomE,ageE) values ('4','Alexandre','9');
insert into Enfants(idE,prenomE,ageE) values ('5','Jeremy','8');
insert into Enfants(idE,prenomE,ageE) values ('6','Camille','5');
insert into Enfants(idE,prenomE,ageE) values ('7','Manon','7');
insert into Enfants(idE,prenomE,ageE) values ('8','Charles','4');

create table Jouets (
    idJ int,
    nomJ varchar(50) not null,
    dureeJ float not null,
    constraint Jouets_C1 check (idJ > 0),
    constraint Jouets_C2 check (dureeJ > 0.0),
    constraint Jouets_C3 primary key (idJ)
);

grant select on Jouets to public;

insert into Jouets(idJ, nomJ, dureeJ) values ('1','Poupee','4');
insert into Jouets(idJ, nomJ, dureeJ) values ('2','Voiture telecommandee','6');
insert into Jouets(idJ, nomJ, dureeJ) values ('3','PS4','40');
insert into Jouets(idJ, nomJ, dureeJ) values ('4','Corde a sauter','2');
insert into Jouets(idJ, nomJ, dureeJ) values ('5','Velo','28');
insert into Jouets(idJ, nomJ, dureeJ) values ('6','Lego','5');
insert into Jouets(idJ, nomJ, dureeJ) values ('7','Telephone portable','35');
insert into Jouets(idJ, nomJ, dureeJ) values ('8','Casse-tete','4');
insert into Jouets(idJ, nomJ, dureeJ) values ('9','Deguisemenent princesse','15');
insert into Jouets(idJ, nomJ, dureeJ) values ('10','Panoplie zoro','16');
insert into Jouets(idJ, nomJ, dureeJ) values ('11','DVD Le Roi Lion','6');
insert into Jouets(idJ, nomJ, dureeJ) values ('12','Trotinette','17');
insert into Jouets(idJ, nomJ, dureeJ) values ('13','Maxi peluche','26');

create table Commandes (
    idC int,
    idJ int,
    idE int,
    constraint Commandes_C1 check (idC > 0),
    constraint Commandes_C2 check (idE > 0),
    constraint Commandes_C3 check (idJ > 0),
    constraint Commandes_C4 primary key (idC),
    constraint Commandes_C5 foreign key (idE) references Enfants(idE) on delete cascade,
    constraint Commandes_C6 foreign key (idJ) references Jouets(idJ) on delete cascade
);

grant select on Commandes to public;

insert into Commandes(idC, idJ, idE) values ('1','2','1');
insert into Commandes(idC, idJ, idE) values ('3','10','1');
insert into Commandes(idC, idJ, idE) values ('7','5','2');
insert into Commandes(idC, idJ, idE) values ('12','3','3');
insert into Commandes(idC, idJ, idE) values ('5','6','3');
insert into Commandes(idC, idJ, idE) values ('10','7','3');
insert into Commandes(idC, idJ, idE) values ('2','5','4');
insert into Commandes(idC, idJ, idE) values ('11','5','5');
insert into Commandes(idC, idJ, idE) values ('6','9','6');
insert into Commandes(idC, idJ, idE) values ('8','6','6');
insert into Commandes(idC, idJ, idE) values ('9','12','7');
insert into Commandes(idC, idJ, idE) values ('13','7','7');
insert into Commandes(idC, idJ, idE) values ('4','11','7');

create table Lutins (
    nomL varchar(20),
    idC int,
    constraint Lutins_C1 check (idC > 0),
    constraint Lutins_C2 primary key (idC),
    constraint Lutins_C3 foreign key (idC) references Commandes(idC) on delete cascade
);

grant select on Lutins to public;

insert into Lutins(nomL, idC) values ('Prof','1');
insert into Lutins(nomL, idC) values ('Atchoum','12');
insert into Lutins(nomL, idC) values ('Grincheux','5');
insert into Lutins(nomL, idC) values ('Joyeux','8');
insert into Lutins(nomL, idC) values ('Timide','3');
insert into Lutins(nomL, idC) values ('Simplet','9');
insert into Lutins(nomL, idC) values ('Grincheux','10');
insert into Lutins(nomL, idC) values ('Atchoum','4');
insert into Lutins(nomL, idC) values ('Grincheux','6');
