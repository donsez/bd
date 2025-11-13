# Sujet DM2 2025-2026 :: Jumeau numérique d'un campus intelligent

Un [jumeau numérique (digital twin en anglais)](https://fr.wikipedia.org/wiki/Jumeau_num%C3%A9rique) est une réplique numérique d’un objet, d’un système ou d’un processus réel, qui permet de simuler, surveiller, analyser et optimiser son fonctionnement en temps réel ou différé. Il permet donc permet de mimer le comportement réel et d’anticiper son évolution.

Dans le contexte d’un campus universitaire, un jumeau numérique est une réplique virtuelle dynamique du campus physique intégrant bâtiments, infrastructures (voirie, transports en commun, parking ...), équipements (sportifs), activités et usagers.

Dans ce DM, vous vous intéresserez uniquement au jumeau numérique simple des campus universitaires de l'Université Grenoble Alpes, CampusTwin, qui se focalise à la GTC simple des batiments. C'est à la mesure de la temperature, l'humidité, la qualité de l'air dans les salles. Des sources externes de données comme la météo peuvent être ajoutées dans le système d'information.

On supposera que les batiments sont construits sur plusieurs niveaux. Le dernier niveau correspond au toit qui peut recevoir des équipements (staion méteo, antenne de communication, panneau photovoltaïque ...). Chaque niveau contient des salles, des couloirs et des passages (escalier, ascenceur, monte charge ...). Des capteurs qui collectent périodiquement des mesures environnementales (température, humidité, CO2, COV, présence, occupation, ouverture/fermuture d'un ouvrant (fenetre, porte ...) ...) sont installés dans les salles, les couloirs et les passages. On attribue une fonction aux salles (bureau, kfet, salle de détente, entrepot, labo, salle de réunion, salle de TD, amphi ...). On connait sa surface, ses vitres interieurs/exterieures, ses ouvrants ... Un capteur est installé dans un lieu à une date donnée. Il peut être remplacé (défaillance ...) ou déplacé vers un autre lieu.

Les informations de CampusTwin seront gérées par deux SGBDs : PostGIS pour la structures du jumeau et InfluxDB pour les series temporelles des mesures de capteurs IoT et de données et prévision météo récupérés auprès de l'[API](https://openweathermap.org/api) du service [Open Weather](https://openweathermap.org/).

Vous peuplerez les deux bases de données avec le jeu de données concernant un batiment fictif StartupStudio du campus qui est donné [ici](https://github.com/CampusIoT/datasets/tree/main/BuildPred). L'angle sud-est du batiment est situé à la position [45.194921,5.769378](https://www.openstreetmap.org/search?query=Campus+Grenoble&zoom=16&minlon=-88.3198642730713&minlat=41.02027043253553&maxlon=-88.29647541046144&maxlat=41.030841216135926#map=19/45.194921/5.769378). L'empreinte au sol du batîment est de 51 x 36 mêtres.

Vous pourrez ajouter également des informations concernant les batiments du DSLT, IMAG, IM2AG F, ENSIMAG E et H, MUSE, MACI, Polytech

Le plan de masse du premier niveau de ce batiment sur trois niveaux (dont le toit) est donné ci dessous :

![Plan de masse annoté](https://raw.githubusercontent.com/CampusIoT/datasets/refs/heads/main/BuildPred/ground_plan_sensors.jpg)

## Exercice 1:

Modélisez le SI de ce juneau numérique CampusTwin au moyen d'un diagramme de classe UML (rendu au format plantuml)

## Exercice 2:

Donnez les requêtes SQL de création et de peuplage des tables de la base de données (Postgres + PostGIS) de CampusTwin

## Exercice 3:

Donnez les requêtes de création et de peuplage des series temporelles de la base de données InfluxDB de CampusTwin

## Exercice 4:

Donnez 5 requètes sur la base PostGIS.

Donnez 5 requètes (aggrégats temporelles) sur la base InfluxDB.

## Rendu
`dm2-2526-nombinome1-nombinome2.zip` regroupant
* 1 fichier README.md (avec les noms et les prénoms des binomes)
* 1 fichier plantuml + 1 fichier SVG
* 1 fichier `create.sql` + 1 fichier `populate.sql` pour PostGIS
* 1 fichier `create.txt` + 1 fichier `populate.txt` pour InfluxBD
* 1 fichier `query.sql`
* 1 fichier `query.txt`
