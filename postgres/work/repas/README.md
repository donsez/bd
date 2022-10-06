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
