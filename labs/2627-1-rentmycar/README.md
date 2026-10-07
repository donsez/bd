#  Sujet de DM1 2026-2027

Polytech Grenoble :: [INFO](https://polytech.grenoble-inp.fr/fr/formations/informatique-1#page-presentation) 4A :: UE Bases de Données

Rédacteur(s): Didier DONSEZ

> La date et heure limite du rendu du DM est sur Moodle.

## RentMyCar

«RentMyCar» est un service de location de voiture entre particuliers (propriétaire et locataire). Il permet à un particulier de louer ses véhicules légers ou utilitaires à d’autres particuliers pour 1 heure, 1 jour, 1 semaine, 1 mois.

Propriétaires et locataires décrivent leurs profils (bon père de famille avec 2 enfants, étudiant fêtard, …) ainsi que la copie scannée du permis du ou des conducteurs, de la carte grise, de l'attestation, l'assurance, son bonus/malus, carnet d'entretien (roues, vidange, ...) des véhicules mis en location …

Un propriétaire décrit le ou les véhicules qui souhaitent mettre à la location. Un véhicule est identifié par son numéro d’immatriculation et il est caractérisé par sa marque (Cette information est complétée automatiquement à partir du numéro d’immatriculation.), modèle, type, nombre de places, modèle, année, état, kilométrage, photos, volume coffre/fourgeon en m³ (Cette information est complétée automatiquement à partir de la marque et du modèle), accessoires (siège enfant, galerie, barre de toit, coffre de toit,, boule remorque, GPS amovible, pneus neige, chaines, extincteurs, gilets fluo …). Le type peut être un véhicule léger, une fourgonnette, une camionnette à plateau, une camionnette avec nacelle élévatrice … On ne considéra pas les véhicules non motorisés comme les remorques, caravanes ...

Le propriétaire décrit les plages de disponibilité du véhicule sur les jours, semaines et mois à venir.

Un locataire recherche pour une plage temporelle et une zone donnée (cercle centré sur une position qui peut être son domicile) pour une location et pour un objectif donné (kilométrage, courses, animaux domestiques, fumeur on non, nombre de conducteurs …). Un propriétaire peut refuser de louer son véhicule à un particulier (à partir de la connaissance du profil ou de celui des autres conducteurs) ou de l'objectif.

Une fois, le contrat de location établis, le locataire récupère les clés auprès du propriétaire ainsi qu'une copie des papiers et du contrat. La place de parking du véhicule est géolocalisée lors de la remise de celui-ci. La place de parking du véhicule est géolocalisée lors de la restitution de celui-ci. Le kilométrage au compteur est renseigné à la récupération et à la restitution.

L'application développée permet de prévenir le propriétaire en cas de retard ou d’incident. En cas de incident au cours de la location, le locataire doit déclarer immédiatement avec son application mobile l’incident (bris de glace, carrosserie, moteur …). L’incident est documenté avec un texte décrivant les circonstances, un memo vocal, le kilométrage au compteur, une position GPS ainsi qu’une série de photos/video.

Propriétaire loueurs et locataires s'annotent mutuellement à l'issue de la contrat.

Un propriétaire peut être bien sur être locataire (exemple : j'ai un coupé Audi TT que je loue et je veux transporter ce samedi un piano à queue).

Lors de la récupération du véhicule, le locataire peut dresser un état du véhicule pour des photos du véhicule avec son smartphone et les envoyer sur le site qui les estampille d'une date pour limiter les contestations par la suite.

le schéma de la base est le suivant:
* Utilisateur(Login, Nom, Prénom, Adresse, Quartier, Ville, Profil, Permis ...)
* Vehicule(Login, Immatriculation, Marque, Modele, Millesime, AnnéeMisService, CarteGrise, Assurance, DateAchat, DateRevente ...)
* PhotoVehicule(Login, Immatriculation, Date, TypeMIME, Contenu, Commentaire)
* ModeleVehicule(Marque, Modele, Millesime, TypeCarroserie, NbPlacesMin, NbPlacesMax, VolumeCoffreMin, VolumeCoffreMax ...)
* Offre(Immatriculation, DateDebut, DateFin, AdresseParking, VilleParking, PositionParking ...)
* Contrat(LoginLoueur, LoginProp, Immatriculation, Statut, PositionRetour, DateDebut, DateFin, EtatLieuDebut, EtatLieuFin, NoteProp, NoteLoc, CommentaireProp, CommentaireLoc ...)
* MediaContrat(LoginLoueur, LoginProp, Immatriculation, DatePhoto, LoginPhotographe, Commentaire)

Le schéma ne modèlise pas la déclaration des incidents qui peuvent survenir pendant le contrat (vol, accident, bris de glace, infraction au code de la route ...) et ni les conducteurs secondaires.

### Ex1 Création de la base

Donnez les ordres de création des tables (en précisant bien les clés primaires et les clés étrangères) et les ordres de peuplage des tables pour une base d'exemples.

Vous pouvez ajouter des colonnes manquantes qui sont décrites dans le cahier des charges.

### Ex2 Requêtage

Répondez aux questions suivantes par des requêtes SQL. Donnez également l’expression algébrique relationnelle pour les 2 premières questions (vous pouvez utiliser la représentation en arbre)

Q1: Donnez la liste des véhicules légers de plus de 4 places dans un rayon de 5 kms autour du domicile de l’utilisateur « Lewis Hamilton ». Vous utilisez le dernier emplacement de parking des véhicules. RentMyCar localise l’utilisateur. Utilisez la fonction `boolean ST_Point_Inside_Circle(geometry a_point, float center_x, float center_y, float radius)`.
Q2: Donnez le jour de la semaine qui fait l’objet du plus de transactions (The day of the week (0 - 6; Sunday is 0) `SELECT EXTRACT(DOW FROM TIMESTAMP '2025-02-16 20:38:40')`).

Q3: Donnez le type des véhicules les plus demandés (nombre de contrat de location établis)?

Q4: Donnez la liste des propriétaires qui ont une note moyenne supérieure à 4,5.

Q5: Donnez des véhicules pour lesquels il n’y a pas de photos à la fin de contrat.

Q6: Donnez la durée moyenne des locations par type de véhicule et par mois de l’année 2025 ?

Q7: Donnez une question et sa requête qui requiert une jointure externe à droite

Q8: Donnez une question et sa requête qui requiert une double agrégation

Q9: Donnez une question et sa requête avec des valeurs absentes

Q10: Donnez une question et sa requête qui requiert une opération ensembliste (union, intersection, différence)

### Ex3 Vue

Donnez l'ordre de création d'une vue matérialisée utilisant une agrégation.

### Ex4 Déclencheur

Donnez un déclencheur qui annule la création d'un contrat quand le loueur n'a pas renseigné son permis.

### Rendu

Vous devez rendre deux fichiers SQL [`populate.sql`](populate.sql) et [`queries.sql`](queries.sql) qui contiennent :
* 1. en en-tête commenté : les noms prénoms composant le binôme
* 2. la partie création de tables (`DROP TABLE`, `CREATE TABLE`, `INSERT`) ; vous devez ajouter les lignes (ie peupler la base) nécessaires pour afficher les réponses aux requêtes ci-dessus (et compter le nombre de lignes)
* 3. pour chaque requête, le SQL correspondant et, en commentaire, l’explication de la requête et la sortie CSV de cette requête (result.qXX.csv) sur votre base exemple.

> Astuce pour les requêtes de type `TOP10`, `TOP100`, "les plus ...", "hall of fame", "King of the Mountain (KOM)" ... : https://www.postgresql.org/docs/current/queries-limit.html

> Astuce : vous pouvez également utiliser les instructions [`CUBE`](https://neon.com/postgresql/postgresql-tutorial/postgresql-cube) et [ROLLUP](https://neon.com/postgresql/postgresql-tutorial/postgresql-rollup)

> Astuce: Utilisez des tables temporaires pour charger les fichiers CSV et peuplés les tables.

> Important : ce fichier SQL doit être executable est testable dans le container Docker PostgreSQL utilisé en TP.
 
Vous devez rendre ce fichier via Moodle, à l’exclusion de tout autre moyen, par un seul membre du binôme.

## Partie 2: Estimation de la base d’utilisateurs de Telemed

L’estimation de la base d’utilisateurs de RentMyCar est de 1.5 million d'utilisateurs.

Voici les principales informations à prendre en compte :
* Loueur : 1 million de loueurs. RentMyCar recrute 15% de loueurs supplémentaires par an.
* Propriétaire : 0.5 million de propriétaires. RentMyCar recrute 10% de propriétaires supplémentaires par an.
* Véhicule: un propretaire met en location ses véhicules 180 jours par an.
* Contrat :  un locataire utilise le service 10 fois par an pour une durée de 3 jours en moyenne

Question: A partir de la taille de chaque ligne des tables définies ci-dessus, Estimez la taille des tables pour 365 jours (un an). Projetez la taille de la base sur les 10 prochaines années.

Voir https://github.com/donsez/bd/blob/main/postgres/work/extra/database_size.sql

## Partie 3 : Transactions

Suivez les instructions de tutoriel https://github.com/donsez/bd/tree/main/postgres/work/bank

Donnez le code de deux transaction debit-credit dont l'exécution entraine une situation d'interblocage.

Donnez la trace des 2 consoles exécutant chacun une des transactions (et surtout le message d'erreur).

##  Partie 4 : Banc d'essai TPC-B

Suivez les instructions de tutoriel https://github.com/donsez/bd/tree/main/postgres/work/pgbench

Produisez au moins quatre rapports du banc d'essai `pgbench` et ajoutez ces rapports au fichier results.csv

## Annexes

* [Sequences et SERIAL](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-serial/)
