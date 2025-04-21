# Sujet DM2 2024-2025 :: BCBA.fr  (les bons comptes font les bons amis)

BCBA.fr est une plateforme de suivi des dépenses et des remboursements dans un groupe de personnes lors d'événements (soirées 🥳🍸🎳, vacances 🏖️, colocataires 🏠, cadeaux d'anniversaire 🎁🎂 ...). 

Un événement peut être créé par un utilisateur identifié de la plateforme. Il peut inviter des personnes (qui ne sont pas nécessairement des utilisateurs de la plateforme) via un lien vers SMS 💬, Whatapps, réseaux sociaux 🧑‍🤝‍🧑, un QRCode sur l'écran du smartphone 📱 ... Un événement a un titre, un icone ou une photo 📷. Une dépense peut être ajoutée à l'évenement. Une dépense est payée par un des participants. La dépense a un titre, un montant (dans une devise), une note, une date, une étiquette (transport, location, santé, boisson 🍹, billets de cinéma, nourriture 🥖🥩🥕, location de voiture 🚗, péage, carburant ⛽ ...). Une ou plusieurs photos peuvent être ajoutées à la dépense (typiquement un ticket de restaurant, un ticket de course de supermarché ...). Elle est payée par un acheteur. Il peut y avoir plusieurs dépenses par événement. Chaque dépense est répartie soit équitablement, par montant, ou par part (pourcentage par exemple pour équilibrer les gros mangeurs et les petits mangeurs.). Un acheteur n'est pas nécessaire dans les participants. L'utilisateur peut rembourser les acheteurs en choisissant un des moyens de paiement possible : en liquide, depuis son compte bancaire (numéro IBAN), paypal, apple pay, google pay, alibaba pay, en service (cours d'escalade, réparation vélo, coup de main pour déménagement ....) ... Une cagnotte 🐖 peut être alimentée pour les futures dépenses en liquide 💶. En cas d'excédent, le restant de la cagnotte est reversé aux participants. Un événement peut être clot par son créateur quand tout est remboursé. Les devises ont une parité qui évolue 📈 tous les jours.

## Exercice 1:

Modélisez le service BCBA.fr au moyen d'un diagramme de classe UML (rendu au format plantuml)

## Exercice 2:

Donnez les requêtes SQL (Postgres) de création des tables de la base de données BCBA

## Exercice 3:

Donnez les requètes SQL pour:
- Q1: Donner le solde global de l'utilisateur Saitama (サイタマ).
- Q2: Donner la liste des événements pour lesquels l'utilisateur Onizuka (オニヅカ) doit de l'argent
- Q3: Donner la liste des événements pour lesquels des utilisateurs doivent de l'argent à l'utilisateur Kaneda (嘉手納).
- Q4: Stats par étiquette par utilisateur
- Q5: Stats par année, par mois, par semaine, par jour et par type d'évenement (colocation, vacances ...) pour l'utilisateur Kaneda (嘉手納)

## Exercice 4:

Donnez la réquête cloturant un événement.

Donnez le déclencheur SQL (Postgres) qui vérifie les conditions lors de la cloture d'un événement.

## Rendu
`dm2-2425-nombinome1-nombinome2.zip` regroupant
* 1 fichier README.md (avec les noms et les prénoms des binomes)
* 1 fichier plantuml + 1 fichier SVG
* 1 fichier `create.sql` + 1 fichier `populate.sql`
* 1 fichier `query.sql`
* 1 fichier `trigger.sql`
