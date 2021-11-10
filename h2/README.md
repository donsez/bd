# Exemples pour H2

H2 est un SGBD relationnel open-source écrit en Java. Il peut être lancé seul (ie _standalone_) ou bien sous la forme d'un service (ie _embedded_) dans une application Java (comme un serveur Spring).

## Installation
```bash
wget https://h2database.com/h2-2019-10-14.zip
unzip h2-2019-10-14.zip
```

## Démarrage du serveur H2 en mode _standalone_
```bash
bash h2/bin/h2.sh
```

## Ouverture de la console Web du serveur H2
```bash
open http://http://localhost:8082
```

Connectez-vous à la base de test 

## Création d'une table dans la base

```sql
DROP TABLE IF EXISTS Book;
CREATE TABLE Book(ID INT PRIMARY KEY, Title VARCHAR(255), Isbn CHAR(13));

INSERT INTO Book VALUES(1, 'Transaction Processing', '0080519555');
INSERT INTO Book VALUES(2, 'Readings in Database Systems', '1558605231');
```

## Interrogation de la base

```sql
SELECT * FROM Book ORDER BY ID;
SELECT * FROM Book WHERE Title LIKE '%Database%';
```

## Mise à jour de la table

```sql
UPDATE Book SET Title='Transaction Processing: Concepts and Techniques' WHERE ID=1;
DELETE FROM Book WHERE ID=2;
SELECT * FROM Book ORDER BY ID;
```

## Plus aller plus loin

* [Le tutoriel](https://h2database.com/html/tutorial.html)
* [L'anti sèche](https://h2database.com/html/cheatSheet.html)


## Nettoyage

```bash
ls -l ~/test.*.db
rm ~/test.*.db
```