-- Simple base de données commerciale (pour ORACLE Sqlplus)
-- Auteur: Didier Donsez


-- Creation des Tables --

CREATE TABLE CLIENT(
	NoClient 	NUMBER(4),	-- Numero du Client
	Nom		VARCHAR(15),	-- Nom du Client
	Adresse		VARCHAR(30),
	Ville		VARCHAR(15),
	Reduction	NUMBER(2,2),	-- Reduction accordee au Client (en Pourcentage)
	PRIMARY KEY(NoClient)
);

CREATE TABLE FACTURE (
	NoFact		NUMBER(5),
	NoClient	NUMBER(4),
	DateFact	DATE,
	Reduction	NUMBER(2,2),	-- Reduction a appliquer sur la facture (en Pourcentage)
	PRIMARY KEY(NoFact),
	FOREIGN KEY(NoClient) REFERENCES CLIENT
);

CREATE TABLE ARTICLE(
	RefArt 		NUMBER(4),
	Libelle 	VARCHAR(30),
	PU		NUMBER(6,2),
	TVA		NUMBER(2,2),
	PRIMARY KEY(RefArt)
);

CREATE TABLE COMMANDE(
	NoFact		NUMBER(5),
	NoLigne		NUMBER(4),
	RefArt		NUMBER(4),
	Qte		NUMBER(4),
	PRIMARY KEY(NoFact,NoLigne,RefArt),
	FOREIGN KEY(NoFact) REFERENCES FACTURE,
	FOREIGN KEY(RefArt) REFERENCES ARTICLE
);

CREATE TABLE PAIEMENT(
	NoFact		NUMBER(5),
	NoPaiement	NUMBER(4),
	Paiement	NUMBER(6,2),
	PRIMARY KEY(NoFact,NoPaiement),
	FOREIGN KEY(NoFact) REFERENCES FACTURE
);