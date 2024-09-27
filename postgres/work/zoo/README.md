# Base de données `Zoo`

Lancez le serveur Postgres avec `docker compose` depuis le répertoire `~/github/donsez/bd/postgres`

```bash
cd ~/github/donsez/bd/postgres
rm -fr data
mkdir -p data/postgres
docker compose up -d
docker compose ps
docker exec -it postgres_container psql -U postgres -W
```

Le fichier [`populate.sql`](populate.sql) contient les ordres pour créer et peupler la base de données `db_zoo`.

Le fichier [`query.sql`](query.sql) contient les ordres pour questionner la base de données `db_zoo`.

> The password is `postgres`

Lancez les commandes suivantes depuis la console CLI PSQL
```sql
\help
\l
\l+
\i /work/zoo/populate.sql
\l
\i /work/zoo/queries.sql
\dt
\d+
```
