# Sujet DM2 2025-2026 :: Jumeau numérique d'un campus intelligent

Un [jumeau numérique (digital twin en anglais)](https://fr.wikipedia.org/wiki/Jumeau_num%C3%A9rique) est une réplique numérique d’un objet, d’un système ou d’un processus réel, qui permet de simuler, surveiller, analyser et optimiser son fonctionnement en temps réel ou différé. Il permet donc permet de mimer le comportement réel et d’anticiper son évolution.

Dans le contexte d’un campus universitaire, un jumeau numérique est une réplique virtuelle dynamique du campus physique intégrant bâtiments, infrastructures (voirie, transports en commun, parking ...), équipements (sportifs), activités et usagers.

Dans ce DM, vous vous intéresserez uniquement au jumeau numérique simple des campus universitaires de l'Université Grenoble Alpes, CampusTwin, qui se focalise à la GTC simple des bâtiments. C'est à la mesure de la temperature, l'humidité, la qualité de l'air dans les salles. Des sources externes de données comme la météo peuvent être ajoutées dans le système d'information.

On supposera que les bâtiments sont construits sur plusieurs niveaux. Le dernier niveau correspond au toit qui peut recevoir des équipements (climatiseur, récupérateur d'eau, station méteo, antenne de communication, panneau photovoltaïque, ruche, serre ...). Chaque niveau contient des salles, des couloirs et des passages (escalier, ascenseur, monte charge, escalator, sas ...). Pour chaque espace, on connait ses dimensions, sa surface, ses vitres interieurs/exterieures, ses ouvrants, ses coordonnées relatives en mêtre au point (latitude et longitude du batiment ...). On attribue une fonction aux salles : bureau, kfet, salle de détente, entrepot, labo, salle de réunion, bibliothéque, toilette, douche, cuisine, bar, salle de TD, salle de TP, amphi, garage (vélo, voiture ...), patio (outdoor sur le plan de masse ci-dessous) ... Une salle a une capacité (nombre de personnes, de vélo, de voiture ...) et d'autres attributs comme par exemple accès PMR, vidioprojecteur, système de visioconférence ...

Des capteurs qui transmettent périodiquement ou sporadiquement des événements (ouverture/fermuture d'un ouvrant (fenetre, porte ...), présence dans une pièce ...), des mesures environnementales (température, humidité, CO2, COV, présence, occupation,  ...) sont installés dans les salles, les couloirs et les passages. Un capteur possède un nom de fabricant, un modèle, un numéro de série (chez le fabricant), un identifiant unique (48 bits pour MAC Address, 64 bits pour les DevEUI LoRaWAN, 14-15 digits pour les IMSI NB-IoT ...) appelé EUI. Un capteur est enregistré chez un opérateur réseau public (Orange, Netmore, Helium, TTN ...) ou privé (CampusIoT, SlicesFR). Un capteur est installé dans un lieu à une date donnée (par un agent identifié qu'on ne modélisera pas). Il peut être remplacé (défaillance, modernisation ...) ou déplacé vers un autre lieu à une date donnée.

Les informations de CampusTwin seront gérées par deux SGBDs : [PostGIS](../../postgis) pour la structures du jumeau et [InfluxDB](../../influxdb) pour les series temporelles des mesures de capteurs IoT et de données et prévision météo récupérés auprès de l'[API](https://openweathermap.org/api) du service [Open Weather](https://openweathermap.org/).

Vous peuplerez les deux bases de données avec le jeu de données concernant un bâtiment fictif StartupStudio du campus qui est donné [ici](https://github.com/CampusIoT/datasets/tree/main/BuildPred). L'angle sud-est du bâtiment est situé à la position [45.194921,5.769378](https://www.openstreetmap.org/search?query=Campus+Grenoble&zoom=16&minlon=-88.3198642730713&minlat=41.02027043253553&maxlon=-88.29647541046144&maxlat=41.030841216135926#map=19/45.194921/5.769378). L'empreinte au sol du batîment est de 51 x 36 mêtres. Vous ne considérez pas la zone 6.

Vous pourrez ajouter également des informations concernant quelques bâtiments du Campus tel que Polytech, la serre de Polytech (qui n'apparait pas sur OpenStreetMap), [Greener](https://mhi-srv.g2elab.grenoble-inp.fr/django/API/), DSLT, IMAG, IM2AG F, ENSIMAG E, ENSIMAG H, MUSE (avec le fablab FabMSTIC), MACI, Bibliothéque des Sciences, Amphi Weil, EVE ...

> Vous pourrez utiliser [GeoJSON.io](https://geojson.io/#new&map=18/45.184622/5.752789) pour récupérer l'empreinte des bâtiments. Par exemple, le polygone du bâtiment Polytech Grenoble.

```json
{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"building":"Polytech Grenoble"},"geometry":{"coordinates":[[[5.7522099617184494,45.184746684041386],[5.752231419390995,45.18455952593308],[5.753701269930872,45.184154959837684],[5.753824651545159,45.184362914731594],[5.75379246503698,45.18437803869452],[5.753918528861135,45.18461056911465],[5.753518879717319,45.18472210775943],[5.753473282164947,45.18463514544473],[5.753553748435394,45.18461435008908],[5.753500104254698,45.18452549711989],[5.753644943541502,45.184487687303374],[5.753596663779234,45.18441773907742],[5.7522099617184494,45.184746684041386]]],"type":"Polygon"},"id":0}]}
```

```geojson
{"type":"FeatureCollection","features":[{"type":"Feature","properties":{"building":"Polytech Grenoble"},"geometry":{"coordinates":[[[5.7522099617184494,45.184746684041386],[5.752231419390995,45.18455952593308],[5.753701269930872,45.184154959837684],[5.753824651545159,45.184362914731594],[5.75379246503698,45.18437803869452],[5.753918528861135,45.18461056911465],[5.753518879717319,45.18472210775943],[5.753473282164947,45.18463514544473],[5.753553748435394,45.18461435008908],[5.753500104254698,45.18452549711989],[5.753644943541502,45.184487687303374],[5.753596663779234,45.18441773907742],[5.7522099617184494,45.184746684041386]]],"type":"Polygon"},"id":0}]}
```

Le plan de masse du premier niveau de ce bâtiment sur trois niveaux (dont le toit) est donné ci dessous :

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

## Exercice 5 (Bonus)

Vous pouvez contruire des tableaux de bord pour les capteurs et pour les salles au moyen d'un [serveur Grafana](../../influxdb) qui interroge la base InfluxDB.

![Grafana](https://raw.githubusercontent.com/CampusIoT/datasets/refs/heads/main/TourPerret/media/elsys-ems-perret-grafana-02.jpg)

## Rendu
`dm2-2526-nombinome1-nombinome2.zip` regroupant
* 1 fichier README.md (avec les noms et les prénoms des binomes)
* 1 fichier plantuml + 1 fichier SVG
* 1 fichier `create.sql` + 1 fichier `populate.sql` pour PostGIS
* 1 fichier `create.txt` + 1 fichier `populate.txt` pour InfluxBD
* 1 fichier `query.sql`
* 1 fichier `query.txt`
