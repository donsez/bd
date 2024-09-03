# Simple base de données commerciale (pour ORACLE Sqlplus)

Auteur: Didier Donsez

Cette base représente une application (simpliste) de prise de commande et de facture

Ce répertoire contient les ordres de génération de la base de données pour le SGBD Oracle 7 et +

Lancez `sqlplus`

Lancez sous `sqlplus` le fichier commande

```
SQLPLUS> @builddb;
``` 

puis lancez la validation

```
SQLPLUS> commit;
```

## Base des données

Soit le schéma de base `Commandes`

    CLIENT		(NoClient, Nom, Adresse, Ville, Reduction)
    FACTURE		(NoFact, NoClient, Date, Reduction)
    COMMANDE	(NoFact, NoLigne, RefArt, Qte)
    ARTICLE		(RefArt, LibellÈ, PU, TVA)
    PAIEMENT	(NoFact, NoPaiement, Paiement)

Question: donnez les clés primaires et les clés étrangères des tables de cette base ?

## Requêtes

    1- Quels sont les clients ?
    2- Quels sont les noms des clients
    3- Quels sont les noms des clients parisiens ?
    4- Quels sont les noms des clients dont le nom commence par un "D" OU qui habitent PARIS ?
    5- Quels sont les noms des clients dont le nom commence par un "D" ET qui habitent PARIS ?
    6- Listez les numÈros de facture pour chaque client.
    7- Donnez le nom des clients et les libellÈs des articles qu'ils ont commandÈs.
    8- Quels sont le prix TTC des articles ?
    9-Donnez le chiffre d'affaire (CA) HT et TTC depuis le 1/2/98.
    10- Donnez les quantitÈs commandÈes par client et par libellÈ d'article.
    11-Donnez le montant TTC de chaque facture.
    12-Donnez la somme des paiements pour chaque facture.
    13-Donnez le reste ‡ payer pour chaque facture. Utilisez le rÈsultat des requÍtes 11 et 12.
    14- Quels sont les couples de clients qui habitent la mÍme ville ?

## Evolution (ie `ALTER`)

Les articles sont classés dans une ou plusieurs sous-catégories (et catégories).
Donnez les ordres de création des nouvelles tables nécessaires à cette évolution du schéma de la base.

