# Playing SQL from Notebook

## Setup


## Start the DBMS

```bash
mkdir -p data/postgres
docker-compose up -d
```

```bash
docker-compose ps
```

Browse the [PGAdmin console](http://localhost:5050).

Set a new password for PGAdmin.

Add a new server.
* In `General` tab, The `name` is `TEST`.
* In `Connection` tab, the `hostname` is `postgres_container`, the `username` is `postgres` and the  `password` is `changeme`.

> You can interact with the DBMS using the [`psql` command](https://docs.postgresql.fr/10/app-psql.html). The password is still `changeme`.
```bash
docker exec -it postgres_container psql -U postgres -W
```

## Start Jypiter and open the notebook

```bash
jupyter notebook
```

Open the notebook `postgres-01.ipynb`



## Enjoy


## Nota Bene
* Postgres files are stored in the host dir ./data/postgres


## References
* https://www.compose.com/articles/getting-started-with-compose-postgresql-and-jupyter-notebooks/
* https://medium.com/analytics-vidhya/postgresql-integration-with-jupyter-notebook-deb97579a38d
* https://engineering.fb.com/2022/04/26/developer-tools/sql-notebooks/
