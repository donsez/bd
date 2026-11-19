-- ============================================================
-- Base de données Office HLM - PostgreSQL
-- Schéma correspondant au cahier des charges
-- ============================================================

-- Création de la base (à exécuter depuis une autre base, par ex. postgres)
-- CREATE DATABASE office_hlm;
-- Puis se connecter à office_hlm avant d'exécuter le reste du script.

-- Nettoyage optionnel pour rejouer le script
DROP TABLE IF EXISTS entretien CASCADE;
DROP TABLE IF EXISTS appartement CASCADE;
DROP TABLE IF EXISTS artisan CASCADE;
DROP TABLE IF EXISTS type_logement CASCADE;
DROP TABLE IF EXISTS locataire CASCADE;
DROP TABLE IF EXISTS batiment CASCADE;
DROP TABLE IF EXISTS cite CASCADE;
DROP TABLE IF EXISTS gardien CASCADE;
DROP TABLE IF EXISTS office_hlm CASCADE;

-- Office HLM
CREATE TABLE office_hlm (
    id_office SERIAL PRIMARY KEY
);

-- Gardien
CREATE TABLE gardien (
    id_gardien SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);

-- Cité : rattachée à un office et placée sous la responsabilité d'un gardien
CREATE TABLE cite (
    id_cite SERIAL PRIMARY KEY,
    id_office INTEGER NOT NULL REFERENCES office_hlm(id_office),
    id_gardien INTEGER NOT NULL REFERENCES gardien(id_gardien)
);

-- Bâtiment : numéro unique au sein de sa cité
CREATE TABLE batiment (
    id_batiment SERIAL PRIMARY KEY,
    numero_batiment INTEGER NOT NULL CHECK (numero_batiment >= 1),
    id_cite INTEGER NOT NULL REFERENCES cite(id_cite),
    UNIQUE (id_cite, numero_batiment)
);

-- Locataire
CREATE TABLE locataire (
    id_locataire SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);

-- Type de logement (F1 à F6)
CREATE TABLE type_logement (
    id_type SERIAL PRIMARY KEY,
    type VARCHAR(2) NOT NULL UNIQUE CHECK (type IN ('F1', 'F2', 'F3', 'F4', 'F5', 'F6')),
    libelle TEXT NOT NULL
);

-- Appartement : locataire facultatif (NULL signifie appartement vacant)
CREATE TABLE appartement (
    id_appartement SERIAL PRIMARY KEY,
    numero_appartement INTEGER NOT NULL CHECK (numero_appartement >= 1),
    id_batiment INTEGER NOT NULL REFERENCES batiment(id_batiment),
    id_type INTEGER NOT NULL REFERENCES type_logement(id_type),
    id_locataire INTEGER REFERENCES locataire(id_locataire),
    etage INTEGER NOT NULL,
    loyer NUMERIC(10,2) NOT NULL CHECK (loyer >= 0),
    garage BOOLEAN NOT NULL DEFAULT FALSE,
    ville VARCHAR(100) NOT NULL,
    adresse VARCHAR(255) NOT NULL,
    UNIQUE (id_batiment, numero_appartement)
);

-- Artisan
CREATE TABLE artisan (
    id_artisan SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL
);

-- Entretien : opération effectuée par un artisan sur un appartement
CREATE TABLE entretien (
    id_entretien SERIAL PRIMARY KEY,
    id_appartement INTEGER NOT NULL REFERENCES appartement(id_appartement),
    id_artisan INTEGER NOT NULL REFERENCES artisan(id_artisan),
    prix NUMERIC(10,2) NOT NULL CHECK (prix >= 0),
    detail TEXT NOT NULL
);

-- Données initiales : types de logement
INSERT INTO type_logement (type, libelle) VALUES
    ('F1', 'Logement comprenant une pièce principale'),
    ('F2', 'Logement comprenant deux pièces principales'),
    ('F3', 'Logement comprenant trois pièces principales'),
    ('F4', 'Logement comprenant quatre pièces principales'),
    ('F5', 'Logement comprenant cinq pièces principales'),
    ('F6', 'Logement comprenant six pièces principales');

-- ============================================================
-- Exemples de requêtes (commentées)
-- ============================================================

-- Appartements et leurs locataires (inclut les logements vacants)
-- SELECT a.id_appartement, a.numero_appartement, a.etage, a.loyer,
--        a.ville, a.adresse, l.nom AS nom_locataire, l.prenom AS prenom_locataire
-- FROM appartement a
-- LEFT JOIN locataire l ON a.id_locataire = l.id_locataire;

-- Appartements vacants
-- SELECT * FROM appartement WHERE id_locataire IS NULL;

-- Cités et gardiens responsables
-- SELECT c.id_cite, g.nom, g.prenom
-- FROM cite c JOIN gardien g ON c.id_gardien = g.id_gardien;

-- Entretiens d'un appartement
-- SELECT e.detail, e.prix, ar.nom, ar.prenom
-- FROM entretien e
-- JOIN artisan ar ON e.id_artisan = ar.id_artisan
-- WHERE e.id_appartement = 1;
