#  Sujet de DM1 2025-2026

Polytech Grenoble :: [INFO](https://polytech.grenoble-inp.fr/fr/formations/informatique-1#page-presentation) 4A :: UE Bases de Données

Rédacteur(s): Didier DONSEZ + promo INFO4

> La date et heure limite du rendu du DM est sur Moodle.

## Partie 1: Interrogation de la base de données Telemed (Bornes de téléconsultation médicale)

> Ce sujet n’a pas été généré, ni « nettoyé » au moyen d’un LLM. Vous pouvez néanmoins tenter de répondre au moyen d’un LLM aux exercices de ce DM.

Suite à un appel d'offre remporté, votre entreprise est chargée par un grand groupement pharmaceutique de développer un service de téléconsultation médicale (Telemed) sans rendez-vous au travers de bornes qui mettent en relation des patients avec des médecins.

Les bornes sont installées dans les pharmacies, les mairies et les maisons de service dans les villages. Pour préserver le secret médical médical, la borne peut être cloisonnée dans une cabine de confidentialité.

La borne est équipée d'un mini PC relié à Internet par la connexion fibre ou ADSL du lieu où elle est installée. Un écran, une caméra haute définition (éventuellement en profondeur1) et un casque microphone sont reliés à ce mini PC pour réaliser la visioconférence entre le patient et le médecin. La borne peut être équipé d'un lecteur de QR code et d'un scanner de documents. Deux lecteurs de carte à puce permettent de lire la carte vitale du patient et éventuellement réaliser une transaction bancaire si c'est nécessaire. La borne est équipée de quelques dispositifs médicaux, permettant de mesurer quelques constantes du patient : un thermomètre infrarouge, un tensiomètre, un oxymètre, un otoscope, un glucomètre, une balance, un stéthoscope … Un distributeur de liquide désinfectant est mis à disposition du patient pour nettoyer les instruments utilisés ainsi que le casque et le microphone. Les bornes sont périodiquement nettoyées par des agents d'entretien. Les bornes sont périodiquement contrôlées et maintenues par des techniciens de la société. En cas de défaillance d'un des dispositifs médicaux, le pharmacien ou un agent de la mairie peut effectuer le remplacement de celui-ci à partir des pièces qui lui ont données en rechange ou expédiées en urgence.

Un patient peut sans rendez-vous s'installer devant la borne de téléconsultation médicale. Il insère sa carte vitale dans le lecteur prévu à cet effet. Il peut demander à se connecter à être mis en relation avec un médecin disponible en fonction de sa spécialité, généraliste, médecin du sport,  O.R.L … Le patient est mis en attente d'un médecin disponible. Pendant la période d'attente, le système demande au patient à autoriser le médecin à consulter son dossier médical partagé (DMP) de son espace monespacesante.fr. Pendant l'attente, le système peut lui demander également de scanner les documents qu'il a en sa possession et de lire les QRCode présents sur les documents. Dès qu'un médecin est disponible, la communication est établie entre le médecin et le patient. Pendant la consultation, le médecin peut demander au patient d'utiliser les dispositifs médicaux à sa disposition pour prendre ses constantes (pouls, tension, température, ...). Toutes les constantes prises seront conservées ultérieurement dans le dossier patient. À la fin de la consultation, le médecin rédige une ou plusieurs ordonnances destinées à un ou plusieurs professionnels de santé (pharmacien, laboratoire d'analyses, cabinet radiologique, infirmier, kinésithérapeute …). Les ordonnances sont envoyées soit par courrier électronique au patient, soit directement sur son adresse mail soit via un MMS/SMS qui contient les numéros uniques d'ordonnance (QRCode du numéro du document présent dans le DMP). Les ordonnances sont signées électroniquement par la plate-forme avec la clé du médecin. Les numéros de l'ordonnance est également inscrit dans la carte vitale. Cela facilitera la récupération de l'ordonnance par le profession de santé. Une opération bancaire est réalisée avec la carte bancaire du patient en cas de dépassement d'honoraire. Si le patient a un médecin traitant, le télé-médecin peut informer son confrère de la consultation et des traitements prescrits. Les résultats des analyses biologiques et les radiographies seront transmis à la fois au médecin traitant et au télé-médecin. 

De leur côté, les médecins généralistes ou spécialistes, qui pratiquent des consultations à distance définissent les plages horaires pour lesquelles ils réalisent des téléconsultation avec des patients. Chaque médecin définit la durée moyenne de ses consultations. La durée d’une consultation peut varier en fonction de la pathologie du patient consulté. Un médecin ne peut exercer plus de 20 % de son activité au sein des plateformes de téléconsultation. Il doit avoir un cabinet physique comme libéral ou salarié et être enregistré auprès de l'ordre des médecins de son département. Le médecin signe une charte dans ce sens. Il doit résident en France. Il est diplômé de plusieurs DU (Diplôme Universitaires) spécialisés (sport, orthopédie, nutrition …). Le médecin s'engage également à suivre périodiquement la FMC (formation médicale continue). Le service propose un catalogue de FMC sous forme de MOOC ou de séminaire, éventuellement validées par un QCM.

Votre équipe est chargée du développement du système information qui gère ce service de téléconsultation médicale. Vous êtes en charge de la modélisation en UML de celui-ci et de son implémentation en SQL.

Une modélisation SQL simple du service Telemed est la suivante :

* Patient(NumCarteVitale, NumINSEE, Nom, Prénom, DateNaissance, Genre, Coordonnées, NumRPPSTraitant, CaissePrimaireAssuranceMaladie, Mutuelle)
* Médecin(NumRPPS, Nom, Prénom, NomSpécialitéPrincipale, StatutProfessionnel, Secteur, VilleOrdre, Diplôme, DateDiplôme, UniversitéDiplôme, CoordonnéesProfessionnellesCabinet, MontantConsultation)
* Langue(NumRPPS, Langue)
* Spécialité(NomSpécialité)
* DU(NumRPPS, NomSpécialité, DateDU, UniversitéDU)
* PlageConsultation(NumRPPS, DateDébut, DateFin, DuréeMoyenneEstiméeConsultation)
* Borne(NumBorne, ModeleBorne, NumLieu)
* DisposifMédical(NumSerieDM, MarqueDM, ModeleDM, TypeDM, TypeConstante, NumBorne, DateMiseEnService, EtatDM)
* Lieu(NumLieu, NomLieu, TypeLieu, Adresse, HoraireOuverture, HoraireFermeture)
* Consultation(NumConsultation, NumRPPS, NumCarteVitale,DateDebutConsultation, DateFinConsultation, DateFinConnexion, NumBorne, Montant, MontantDépassement)
* Constantes( NumConsultation, TypeConstante, Valeur, Date, NumSerieDM)
* Ordonnance(NumConsultation, NumOrdonnance, TypeOrdonnance)
* OrdonnanceLigne(NumConsultation, NumOrdonnance, Rangligne, TypeOrdonnanceLine, Détail, Quantité)

> Remarque : Patient.NumRPPSTraitant n’est pas forcement celui d’un médécin qui téléconsulte via la plateforme

> La modélisation SQL est volontairement incomplète. Par exemple, on se considère par le cas des enfants mineurs rattachés à la carte vitale d’un de leurs deux parents, ni les rapports de défaillance des dispositifs médicaux, etc.

Les domaines suivants ont les valeurs suivantes :
* [Secteur](https://www.service-public.fr/particuliers/vosdroits/F17042): 1, 2, 3
* StatutProfessionnel : libéral, salarié
* TypeLieu : pharmacie, mairie, maison de service ...
* TypeOrdonnance: prescription médicaments, échographie, radiographie, analyse biologique, kinésithérapie, soins infirmiers ...
* Langue : fr, en, ...
* TypeConstante : température, tension, pouls, odoscopie …
* EtatDM : opérationnel, défectueux
* NumRPPS : Le [numéro RPPS](https://esante.gouv.fr/sites/default/files/media_entity/documents/ans_tableau-des-populations-rpps_0.pdf) est un identifiant unique et pérenne d’un médecin qui est attribué dès sa première inscription à l'Ordre des médecins (et les autres ordres médicaux).

Déterminez premièrement les clés primaires et les clés étrangères de ces tables/relations.

Requêtes: Répondez à 10 questions parmi les questions suivantes au moyen de requêtes SQL (Postgres).
* [ ] Q1: Donnez la liste des bornes les plus utilisées (en nombre de consultation)
* [ ] Q2: Donnez la liste des médecins qui exercent plus de 10 heures par semaine (20%) sur la plateforme
* [ ] Q3: Donnez la liste des médecins généralistes de secteur 1 actuellement disponibles
* [ ] Q4: Donnez la liste des médecins généralistes de secteur 1 prochainement disponibles (ie triés par durée restante estimés de consultation). Remarque : La consultation ne doit pas dépasser de la fin de leurs plages de consultation.
* [ ] Q5: Donnez la liste des médecins ayant un DU « médecine du sport » de secteur 1 prochainement disponibles et triée par durée restante de consultation
* [ ] Q6: Donnez la durée moyenne des consultations par médecin et par mois1 de l’année 2024 ? (en incluant les médecins qui n’ont effectués aucune téléconsultation dans le mois)
* [ ] Q7: Question dont vous proposerez l'énoncé (avec jointure externe à droite)
* [ ] Q8: Question dont vous proposerez l'énoncé (avec une double agrégation)
* [ ] Q9: Question dont vous proposerez l'énoncé (avec des valeurs absentes)
* [ ] Q10: Question dont vous proposerez l'énoncé (avec une opération ensembliste (union, intersection, différence))

### Rendu

Vous devez rendre deux fichiers SQL [`populate.sql`](populate.sql) et [`queries.sql`](queries.sql) qui contiennent :
* 1. en en-tête commenté : les noms prénoms composant le binôme
* 2. la partie création de tables (`DROP TABLE`, `CREATE TABLE`, `INSERT`) ; vous devez ajouter les lignes (ie peupler la base) nécessaires pour afficher les réponses aux requêtes ci-dessus (et compter le nombre de lignes)
* 3. pour chaque requête, le SQL correspondant et, en commentaire, l’explication de la requête et la sortie de cette requête sur votre base exemple.

> Astuce pour les requêtes de type `TOP10`, `TOP100`, "les plus ...", "hall of fame", "King of the Mountain (KOM)" ... : https://www.postgresql.org/docs/current/queries-limit.html

> Astuce : vous pouvez également utiliser les instructions [`CUBE`](https://neon.com/postgresql/postgresql-tutorial/postgresql-cube) et [ROLLUP](https://neon.com/postgresql/postgresql-tutorial/postgresql-rollup)

> Astuce: Utilisez des tables temporaires pour charger les fichiers CSV et peuplés les tables.

> Important : ce fichier SQL doit être executable est testable dans le container Docker PostgreSQL utilisé en TP.
 
Vous devez rendre ce fichier via Moodle, à l’exclusion de tout autre moyen, par un seul membre du binôme.

## Partie 2: Estimation de la base d’utilisateurs de Telemed

L’estimation de la base d’utilisateurs de Telemed est de 1 million d'utilisateurs.

Voici les principales informations à prendre en compte :
* Patient : 1 million de patients. Telemed recrute 15% de patients supplémentaires par an.
* Borne : 2500 bornes installées. Telemed installe 15% de bornes supplémentaires par an.
* Consultation : 10 consultations par jour et par borne.
* Ordonnance : 1,25 ordonnance en moyenne par consultation.
* Médécin : 10000 médecins recrutés. Telemed recrute 5% de medécins supplémentaires par an.

Question: A partir de la taille de chaque ligne des 5 tables définies ci-dessus, Estimez la taille des 5 tables pour 365 jours (un an). Projetez la taille de la base sur les 10 prochaines années.

Voir https://github.com/donsez/bd/blob/main/postgres/work/extra/database_size.sql

## Partie 3 : Transactions

Suivez les instructions de tutoriel https://github.com/donsez/bd/tree/main/postgres/work/bank

Donnez le code de deux transaction debit-credit dont l'exécution entraine une situation d'interblocage.

Donnez la trace de la console des 2 transactions (et surtout le message d'erreur).

##  Partie 4 : Banc d'essai TPC-B

Suivez les instructions de tutoriel https://github.com/donsez/bd/tree/main/postgres/work/pgbench

Produisez au moins quatre rapports du banc d'essai `pgbench` et ajoutez ces rapports au fichier results.csv

## Annexes

* [Sequences et SERIAL](https://www.postgresqltutorial.com/postgresql-tutorial/postgresql-serial/)
