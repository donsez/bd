# Base de données `Agence` pour PostgreSQL

Lancez le serveur Postgres avec `docker compose` depuis le répertoire `~/github/donsez/bd/postgres`

```bash
cd ~/github/donsez/bd/postgres
rm -fr data
mkdir -p data/postgres
docker compose up -d
docker compose ps
docker exec -it postgres_container psql -U postgres -W
```
> The password is `postgres`

Le fichier [`agence.sql`](agence.sql) contient les ordres pour créer et peupler la base de données `db_agence`.

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

