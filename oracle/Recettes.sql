drop table Composition;
drop table Recettes;
drop table Origines;
drop table Ingredients;

create table Origines ( 
    code char(2),
    pays varchar2(20) not null,
    continent varchar2(20) not null,
    constraint Origines_C1 check (continent in ('Europe','Asie','Afrique','Oceanie','Amerique','Antarctique')),
    constraint Origines_C2 primary key (code)
);

grant SELECT on Origines to PUBLIC;

insert into Origines(code,pays,continent) values ('FR','France','Europe');
insert into Origines(code,pays,continent) values ('D','Allemagne','Europe');
insert into Origines(code,pays,continent) values ('I','Italie','Europe');
insert into Origines(code,pays,continent) values ('E','Espagne','Europe');
insert into Origines(code,pays,continent) values ('C','Chine','Asie');
insert into Origines(code,pays,continent) values ('J','Japon','Asie');
insert into Origines(code,pays,continent) values ('A','Algerie','Afrique');
insert into Origines(code,pays,continent) values ('M','Maroc','Afrique');
insert into Origines(code,pays,continent) values ('S','Senegal','Afrique');
insert into Origines(code,pays,continent) values ('US','Etats-Unis','Amerique');
insert into Origines(code,pays,continent) values ('BR','Bresil','Amerique');
insert into Origines(code,pays,continent) values ('NZ','Nouvelle-Zelande','Oceanie');
insert into Origines(code,pays,continent) values ('TA','Terre Adelie','Antarctique');

create table Recettes (
    idR char(4),
    nomR varchar2(30) not null,
    provenance char(2),
    constraint Recette_C1 primary key (idR),
    constraint Recette_C2 foreign key (provenance) references Origines(code) on delete cascade
);

grant SELECT on Recettes to PUBLIC;

insert into Recettes(idR,nomR,provenance) values ('R1','Quiche lorraine','FR');
insert into Recettes(idR,nomR,provenance) values ('R2','Omelette aux champignons','FR');
insert into Recettes(idR,nomR,provenance) values ('R3','Choucroute','D');
insert into Recettes(idR,nomR,provenance) values ('R4','Tagliatelles a la carbonara','I');
insert into Recettes(idR,nomR,provenance) values ('R5','Paella','E');
insert into Recettes(idR,nomR,provenance) values ('R6','Rouleau de printemps','C');
insert into Recettes(idR,nomR,provenance) values ('R7','Sushi','J');
insert into Recettes(idR,nomR,provenance) values ('R8','Couscous','A');
insert into Recettes(idR,nomR,provenance) values ('R9','Hamburger (x6)','US');

create table Ingredients (
    idI char(4),
    nomI varchar2(35) not null,
    unite varchar2(10) not null,
    disponibilite float default 0.0,
    constraint Ingredients_C1 primary key (idI),
    constraint Ingredients_C2 check (unite in ('gramme(s)','litre(s)','unite(s)')),
    constraint Ingredients_C3 check (disponibilite >= 0.0)
);

grant SELECT on Ingredients to PUBLIC;

insert into Ingredients(idI,nomI,unite,disponibilite) values ('I1','tomates','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I2','huile d olive','litre(s)',5.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I3','pommes de terre','gramme(s)',5000.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I4','farine','gramme(s)',1000.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I5','champignons','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I6','beurre','gramme(s)',500.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I7','oeufs','unite(s)',24.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I8','sel','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I9','poivre','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I10','pains a hamburger','unite(s)',6.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I11','tranches de cheddar','unite(s)',20.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I12','laitue','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I13','ketchup','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I14','cornichons','gramme(s)',250.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I15','steak hache','unite(s)',6.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I16','creme','litre(s)',0.2);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I17','lardons','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I18','parmesan','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I19','tagliatelles','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I20','gruyere','gramme(s)',100.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I21','pate a tarte','unite(s)',3.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I22','lait','litre(s)',3.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I23','thon','gramme(s)',300.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I24','saumon','gramme(s)',300.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I25','wazabi','gramme(s)',50.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I26','riz','gramme(s)',0.5);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I27','chou','gramme(s)',2000.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I28','oignons','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I29','vin blanc','litre(s)',0.75);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I30','saucisses de strasbourg','unite(s)',6.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I31','saucisses fumees','unite(s)',6.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I32','tranches de lard','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I33','tranches de saucissons a l ail','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I34','moutarde','gramme(s)',200.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I35','ailes de poulet','unite(s)',20.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I36','crevettes','gramme(s)',500.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I37','gousses d ail','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I38','poivron rouge','unite(s)',2.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I39','galettes de riz','unite(s)',10.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I40','vermicelles de riz','gramme(s)',100.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I41','blancs de poulet','gramme(s)',6.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I42','sauce soja','litre(s)',0.2);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I43','germes de soja','gramme(s)',100.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I44','epices','gramme(s)',50.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I45','harissa','gramme(s)',50.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I46','navets','unite(s)',5);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I47','carottes','unite(s)',5);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I48','courgettes','unite(s)',5);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I49','pois chiche','gramme(s)',100.0);
insert into Ingredients(idI,nomI,unite,disponibilite) values ('I50','merguez','unite(s)',10.0);

create table Composition (
    idR char(4),
    idI char(4),
    quantite float not null,
    conseil varchar2(60),
    constraint Composition_C1 foreign key (idR) references Recettes(idR) on delete cascade,
    constraint Composition_C2 foreign key (idI) references Ingredients(idI) on delete cascade,
    constraint Composition_C3 primary key (idR,idI),
    constraint Composition_C4 check (quantite > 0.0)
);

grant SELECT on Composition to PUBLIC;

-- omelette

insert into Composition(idR,idI,quantite,conseil) values ('R2','I7',3.0,'bien battre les oeufs');
insert into Composition(idR,idI,quantite,conseil) values ('R2','I5',200.0,'emince');
insert into Composition(idR,idI,quantite,conseil) values ('R2','I2',0.02,'deux cuilleres a soupe');
insert into Composition(idR,idI,quantite,conseil) values ('R2','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R2','I9',2.0,'une pincee');

-- burger

insert into Composition(idR,idI,quantite,conseil) values ('R9','I1',1.0,'decouper en rondelles');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I12',50.0,'quelques feuilles');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I13',50.0,'deux cuilleres a soupe par hamburger');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I15',6.0,'un steak par hamburger');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I14',30.0,'un cornichon emince par hamburger');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I11',6.0,'une tranche par hamburger');
insert into Composition(idR,idI,quantite,conseil) values ('R9','I10',6.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R9','I28',2.0,'emincer et cru');

-- tagliatelle

insert into Composition(idR,idI,quantite,conseil) values ('R4','I16',100.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R4','I17',100.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R4','I18',100.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R4','I19',200,'al dente');
insert into Composition(idR,idI,quantite,conseil) values ('R4','I7',3.0,'seulement le jaune');
insert into Composition(idR,idI,quantite,conseil) values ('R4','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R4','I9',2.0,'une pincee');

-- quiche

insert into Composition(idR,idI,quantite,conseil) values ('R1','I21',1.0,'prechauffer le four');
insert into Composition(idR,idI,quantite,conseil) values ('R1','I20',50.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R1','I7',3.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R1','I17',200.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R1','I16',200.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R1','I22',0.1,null);
insert into Composition(idR,idI,quantite,conseil) values ('R1','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R1','I9',2.0,'une pincee');

-- sushi

insert into Composition(idR,idI,quantite,conseil) values ('R7','I23',50.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R7','I24',50.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R7','I25',0.10,null);
insert into Composition(idR,idI,quantite,conseil) values ('R7','I26',200.0,'le riz doit etre collant');
insert into Composition(idR,idI,quantite,conseil) values ('R7','I8',2.0,'une pincee');

-- choucroute

insert into Composition(idR,idI,quantite,conseil) values ('R3','I27',2000.0,'le chou doit etre cru');
insert into Composition(idR,idI,quantite,conseil) values ('R3','I28',2.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I29',0.5,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I30',6.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I31',6.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I32',3.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I33',6.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I3',300.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I34',20.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R3','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R3','I9',2.0,'une pincee');

-- paella

insert into Composition(idR,idI,quantite,conseil) values ('R5','I26',400.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I35',4.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I36',250.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I28',2.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I37',4.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I38',1.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R5','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R5','I9',2.0,'une pincee');

-- rouleau de printemps

insert into Composition(idR,idI,quantite,conseil) values ('R6','I39',2.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I40',25.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I41',200.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I42',0.2,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I43',50.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I12',30.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R6','I36',50.0,null);

-- couscous 

insert into Composition(idR,idI,quantite,conseil) values ('R8','I8',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R8','I9',2.0,'une pincee');
insert into Composition(idR,idI,quantite,conseil) values ('R8','I35',8.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I50',12.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I2',0.1,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I1',10.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I44',20.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I45',15.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I46',10.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I47',5.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I48',2.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I49',400.0,null);
insert into Composition(idR,idI,quantite,conseil) values ('R8','I28',3.0,null);

commit;
