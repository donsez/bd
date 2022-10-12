# Transaction avec PostgreSQL

Lancez le serveur Postgres avec `docker-compose` depuis le répertoire `~/github/donsez/bd/postgres`

Le fichier `bank.sql` contient les ordres pour créer et peupler la base de données `db_bank`.

Lancez les commandes suivantes:
```sql
\help
\l
\l+
CREATE DATABASE db_bank;
\l
\connect db_bank
\i /work/bank/bank.sql
\dt
\d+
```

## Ajout de contraintes

Ajoutez des [contraintes](https://www.postgresql.org/docs/current/ddl-constraints.html) pour que la colonne `balance` ne soit pas négative et que la colonne `amount` soit strictement positive.

Effectuez un transfert d'argent à un montant négatif (au sien d'une transaction). Que se passe-t'il ?
 
Effectuez un transfert d'argent depuis un compte insuffisament approvisionné : le montant du transfert depasse le solde du compte (au sien d'une transaction). Que se passe-t'il ?

Que se passerait-il si vous n'aviez pas utilisé de transactions pour exécuter les deux opérations précédentes ?

## Execution de transactions concurrentes

Ouvrez 2 sessions en parallèle et connectez vous sur la base `db_bank` avec:
```bash
docker exec -it postgres_container psql -U postgres -W
```

Démarrez 2 transactions dans les sessions parallèles
```sql
\connect db_bank
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE READ WRITE;
...
```

Exercice: Exécutez un entrelacement des 2 séquences d'instruction des 2 transferts bancaires pour conduire à un interblocage.

* pour la transaction 1, transfert de `100.00` de `bob` à `alice`
* pour la transaction 2, transfert de `50.00` de `alice` à `bob`

Pour cela, ouvrez 2 sessions `psql` en parallèle (dans 2 terminaux).

> Vous pouvez utiliser `\prompt 'enter return to continue' dummy` ou `pg_sleep(1);` pour faire des pauses dans l'exécution de la transaction.




## Autres niveaux d'isolation

Le niveau d'isolation d'une transaction par défaut est `SERIALIZABLE`.

Exercice : Retentez d'exécuter la même séquence avec d'autres [niveaux d'isolation](https://www.postgresql.org/docs/current/transaction-iso.html) au moyen de [`SET TRANSACTION`](https://www.postgresql.org/docs/current/sql-set-transaction.html) pour observer des lectures sales, des lectures non répétables et des lectures fantomes.


```sql
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
...
COMMIT;
```

```sql
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
...
COMMIT;
```

```sql
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
...
COMMIT;
```

Tout au long de votre test d'enchevrétement d'executer des instructions des 2 transactions, vous pouvez exécuter le transaction suivante dans une troisième session:


```sql
BEGIN TRANSACTION ISOLATION LEVEL READ UNCOMMITTED READ ONLY;
SELECT * FROM account;
SELECT * FROM transfer;
COMMIT;
```

## Utilisation du `SAVEPOINT``

Exécutez les instructions suivantes:

```sql
BEGIN;
    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

    UPDATE account SET balance = balance+500 WHERE name = 'bob';
    INSERT INTO transfer (account_to, amount) VALUES ('bob', 500);

    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

    SAVEPOINT my_savepoint;

    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

    UPDATE account SET balance = balance+1000000 WHERE name = 'bob';
    INSERT INTO transfer (account_to, amount) VALUES ('bob', 1000000);

    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

    ROLLBACK TO SAVEPOINT my_savepoint;

    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

    UPDATE account SET balance = balance+100 WHERE name = 'bob';
    INSERT INTO transfer (account_to, amount) VALUES ('bob', 100);

    SELECT * FROM account WHERE name = 'bob'; 
    SELECT * FROM transfer WHERE account_to = 'bob'; 

COMMIT;

SELECT * FROM account WHERE name = 'bob'; 
SELECT * FROM transfer WHERE account_to = 'bob'; 
```

Que c'est il passé pour le virement à 1000000 ?

## Bonus : Procédure

Exercice: Ecrivez une [procédure](https://www.postgresql.org/docs/current/sql-createprocedure.html) `transfer` pour exécuter les 3 instructions requise pour un transfert bancaire.

```sql
CREATE PROCEDURE transfer(...)
LANGUAGE SQL
BEGIN ATOMIC
    ...
END;

CREATE PROCEDURE show_last_transfer(...)
LANGUAGE SQL
BEGIN ATOMIC
    ...
END;
```


```sql
CALL transfer(...);
CALL show_last_transfer(...);
```
