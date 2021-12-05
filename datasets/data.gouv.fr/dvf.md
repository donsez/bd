# Demandes de Valeurs Foncières

Le présent jeu de données « Demandes de valeurs foncières », publié et produit par la direction générale des finances publiques, permet de connaître les transactions immobilières intervenues au cours des cinq dernières années sur le territoire métropolitain et les DOM-TOM, à l’exception de l’Alsace, de la Moselle et de Mayotte. Les données contenues sont issues des actes notariés et des informations cadastrales

https://www.data.gouv.fr/fr/datasets/demandes-de-valeurs-foncieres/

Téléchargez le fichier du dernier semestre (par exemple valeursfoncieres-2021-s1.txt pour le premier semestre de 2021).

Convertissez les espaces en _ de la ligne d'entête
```bash
TODO avec sed
```

Convertissez les | en ; et , en . pour obtenir un fichier CSV
```bash
TODO avec sed
```

Produissez un fichier plus réduit pour accélerer la mise au point de vos essais

```bash
(head -100 valeursfoncieres-2021-s1.csv; tail -100 valeursfoncieres-2021-s1.csv) > valeursfoncieres-2021-s1.extrait.csv
```



