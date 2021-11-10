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

Il est possible de créer et peupler une table en récupérant les entrées d'un fichier CSV:
```sql
CREATE TABLE Author(ID INT PRIMARY KEY, Firstname VARCHAR(255), Lastname VARCHAR(255))
    AS SELECT * FROM CSVREAD('authors.csv');
CREATE TABLE Author_Book(
    ID_Author INT,
    ID_Book INT,
    PRIMARY KEY(ID_Author,ID_Book),
    FOREIGN KEY (ID_Author) REFERENCES Author(ID),
    FOREIGN KEY (ID_Book) REFERENCES Book(ID)
    ) AS SELECT * FROM CSVREAD('authors_books.csv');
```

## Interrogation de la base

```sql
SELECT * FROM Book ORDER BY ID;
SELECT * FROM Author ORDER BY ID;
SELECT * FROM Author AS A ,Author_Book AS AB, Book AS B WHERE A.ID=AB.ID_Author AND AB.ID_Book = B.ID;
SELECT * FROM Author AS A JOIN Author_Book AS AB ON A.ID=AB.ID_Author JOIN Book AS B ON AB.ID_Book = B.ID;
```

```sql
SELECT * FROM Book WHERE Title LIKE '%Database%';
```

## Plans d'exécution

L'instruction [EXPLAIN](https://h2database.com/html/performance.html#explain_plan) donne le plan d'exécution de la requête SQL. L'instruction EXPLAIN ANALYZE permet de comprendre les performances de son exécution.

```sql
EXPLAIN SELECT * FROM Book ORDER BY ID;
```

```sql
EXPLAIN SELECT * FROM Book WHERE Title LIKE '%Database%';
```

```sql
EXPLAIN SELECT * FROM Author AS A ,Author_Book AS AB, Book AS B WHERE A.ID=AB.ID_Author AND AB.ID_Book = B.ID;
EXPLAIN SELECT * FROM Author AS A JOIN Author_Book AS AB ON A.ID=AB.ID_Author JOIN Book AS B ON AB.ID_Book = B.ID;

```

## Mise à jour de la table

```sql
UPDATE Book SET Title='Transaction Processing: Concepts and Techniques' WHERE ID=1;
DELETE FROM Book WHERE ID=2;
SELECT * FROM Book ORDER BY ID;
```

## Connection via la console en ligne de commande

```bash
java -cp h2/bin/h2*.jar org.h2.tools.Shell
```

```
Welcome to H2 Shell 1.4.200 (2019-10-14)
Exit with Ctrl+C
[Enter]   jdbc:h2:~/test
URL       
[Enter]   org.h2.Driver
Driver    
[Enter]   sa
User      
Password  
Connected
Commands are case insensitive; SQL statements end with ';'
help or ?      Display this help
list           Toggle result list / stack trace mode
maxwidth       Set maximum column width (default is 100)
autocommit     Enable or disable autocommit
history        Show the last 20 statements
quit or exit   Close the connection and exit

sql> list
Result list mode is now on
sql> select * from Book
```


## Export d'une table en CSV

```sql
CALL CSVWRITE('books.csv', 'SELECT * FROM Book');
```

```bash
cat books.csv
```

## Déclencheurs

H2 supporte les déclencheurs (ie _triggers_). Cependant, ceux-ci doivent être écrits en Java (contrairement à Oracle avec `PL/SQL`).
[Pour en savoir plus](http://h2database.com/html/features.html#triggers).

## Plus aller plus loin

* [Le tutoriel](https://h2database.com/html/tutorial.html)
* [L'anti sèche](https://h2database.com/html/cheatSheet.html)

Vous trouverez des exemples `SQL` et `JDBC` dans `h2/src/test/org/h2/samples`.

## Nettoyage

```bash
ls -l ~/test.*.db
rm ~/test.*.db
```