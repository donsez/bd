drop table LesPreferences;
drop table LeMenu;
drop table LesPlats;
drop table LesRepas;

CREATE TABLE LesRepas (
    dateR date,
    nomI varchar(100),
    CONSTRAINT pk_repas PRIMARY KEY (dateR, nomI)
);

CREATE TABLE LesPlats (
    nomP varchar(100) PRIMARY KEY,
    typeP varchar(100)
);

CREATE TABLE LeMenu (
    dateR date,
    nomP varchar(100),
    nomV varchar(100),
    CONSTRAINT pk_menu PRIMARY KEY (dateR, nomP),
    CONSTRAINT fk_menu_nomP FOREIGN KEY (nomP) REFERENCES LesPlats(nomP)
);

CREATE TABLE LesPreferences (
    nomA varchar(100),
    nomP varchar(100),
    CONSTRAINT pk_pref PRIMARY KEY (nomA, nomP),
    CONSTRAINT fk_pref_nomP FOREIGN KEY (nomP) REFERENCES LesPlats(nomP)
);

grant select on LesPreferences to public;
grant select on LeMenu to public;
grant select on LesPlats to public;
grant select on LesRepas to public;

INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Mousse chocolat', 'dessert');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Medaillon langouste', 'crustaces');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Soupe champignons', 'soupe');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Pates beurre', 'pates');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Salade nicoise', 'salade');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Steak hache', 'viande');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Saumon', 'poisson');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Mousse citron', 'dessert');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Plateau fromages', 'fromages');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Ile flottante', 'dessert');
INSERT INTO LesPlats ("NOMP", "TYPEP") VALUES ('Foie gras', 'charcuterie');

INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('21-OCT-16', 'Adrian');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('21-OCT-16', 'Marie');
INSERT INTO LesRepas ("DATER", "NOMI")  VALUES ('21-OCT-16', 'Myriam');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('21-OCT-16', 'Thomas');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Adrian');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Jacques');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Malou');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Marie');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Patrick');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('31-DEC-17', 'Thomas');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('06-MAR-18', 'Adrian');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('06-MAR-18', 'Jackie');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('06-MAR-18', 'Marie');
INSERT INTO LesRepas ("DATER", "NOMI") VALUES ('06-MAR-18', 'Phil');

INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('31-Dec-17', 'Medaillon langouste', 'Tariquet');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('31-Dec-17', 'Mousse chocolat', 'Tariquet');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('31-Dec-17', 'Plateau fromages', 'Tariquet');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('21-Oct-16', 'Foie gras', 'Veuve Cliquot');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('21-Oct-16', 'Steak hache', 'Cote de Nuits');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('21-Oct-16', 'Ile flottante', 'Tariquet');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('21-Oct-16', 'Mousse chocolat', 'Tariquet');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('06-Mar-18', 'Pates beurre', 'Vasse Felix');
INSERT INTO LeMenu ("DATER", "NOMP", "NOMV") VALUES ('06-Mar-18', 'Mousse chocolat', 'Vasse Felix');

INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Foie gras');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Ile flottante');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Medaillon langouste');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Mousse chocolat');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Mousse citron');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Pates beurre');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Plateau fromages');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Salade nicoise');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Saumon');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Soupe champignons');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Adrian', 'Steak hache');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Jackie', 'Medaillon langouste');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Jacques', 'Mousse chocolat');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Malou', 'Ile flottante');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Malou', 'Mousse chocolat');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Malou', 'Mousse citron');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Martin', 'Ile flottante');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Patrick', 'Mousse chocolat');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Patrick', 'Pates beurre');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Patrick', 'Salade nicoise');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Phil', 'Medaillon langouste');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Pierre', 'Medaillon langouste');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Pierre', 'Mousse chocolat');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Pierre', 'Soupe champignons');
INSERT INTO LesPreferences ("NOMA", "NOMP") VALUES ('Thomas', 'Mousse chocolat');
