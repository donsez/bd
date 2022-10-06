# Base de données Agence pour PostgreSQL

Lancez le serveur Postgres avec `docker-compose` depuis le répertoire `~/github/donsez/bd/postgres`

Le fichier `agence.sql` contient les ordres pour créer et peupler la base de données `db_agence`.

Lancez les commandes suivantes:
```sql
\help
\l
\l+
CREATE DATABASE db_agence;
\l
\connect db_agence
\i /work/agence/agence.sql
\dt
\d+
```

