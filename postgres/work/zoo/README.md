# Base de données `Zoo`

```bash
cd ~/github/donsez/bd/postgres
rm -fr data
mkdir -p data/postgres
docker compose up -d
docker compose ps
docker exec -it postgres_container psql -U postgres -W
```

> The password is `postgres`

Run SQL scripts into PSQL CLI
```sql
\i /work/zoo/populate.sql
\i /work/zoo/queries.sql
```
