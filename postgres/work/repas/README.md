# Base de données Repas pour PostgreSQL

Lancez le serveur Postgres avec docker-compose depuis le répertoire `~/github/donsez/bd/postgres`

Le fichier `repas.sql` contient les ordres pour créer et peupler la base de données `db_repas`.

Lancez les commandes suivantes:
```sql
\help
\l
\l+
CREATE DATABASE db_repas;
\l
\connect db_repas
\i /work/repas/repas.sql
\dt
\d+
```

> Observez la taille de la vue `LesPreferencesAdrian`.


## `EXPLAIN`

L'instruction `EXPLAIN` renvoie le plan d'exécution que le planificateur `PostgreSQL` génère pour une requête donnée.

`EXPLAIN` montre comment les tables impliquées dans une requête seront parcourues par un balayage d'index ou un balayage séquentiel, etc., et si plusieurs tables sont utilisées, quel type d'algorithme de jointure sera utilisé.

```sql
\i /work/repas/explain.sql
```