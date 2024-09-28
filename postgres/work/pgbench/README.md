# Exécution du benchmark `pgbench` sur PostgreSQL

pgbench est un programme pour réaliser simplement des tests de performance (benchmark) sur PostgreSQL. Il s'inspire du benchmark [TPC-B](https://www.tpc.org/tpcb/) défini par le Transaction Processing Performance Council. Le TCP-B a été remplacé par le [TPC-C](https://www.tpc.org/tpcc/) qui est plus complet.

* https://docs.postgresql.fr/15/pgbench.html
* http://jimgray.azurewebsites.net/benchmarkhandbook/tpcb.pdf

## Démarrage

Lancez le serveur Postgres avec `docker compose` depuis le répertoire `~/github/donsez/bd/postgres`

```bash
cd ~/github/donsez/bd/postgres
rm -fr data
mkdir -p data/postgres
docker compose up -d
docker compose ps
docker exec -it postgres_container psql -U postgres -W
```


Lancez les commandes suivantes:
```sql
CREATE DATABASE db_bench;
\l
\connect db_bench
\dt
\d+
```

## Show help

```bash
docker exec -it postgres_container \
pgbench --help
```

## Initialisation de la base de données

```bash
docker exec -it postgres_container \
pgbench --host=localhost -U postgres \
--initialize --scale=10 db_bench
```


## Inspection de la base de données

Lancez les commandes suivantes depuis la console `psql`
```sql
\connect db_bench
\dt
\d+
```

```
db_bench=# \d+
                                         List of relations
 Schema |       Name       | Type  |  Owner   | Persistence | Access method |  Size  | Description 
--------+------------------+-------+----------+-------------+---------------+--------+-------------
 public | pgbench_accounts | table | postgres | permanent   | heap          | 128 MB | 
 public | pgbench_branches | table | postgres | permanent   | heap          | 96 kB  | 
 public | pgbench_history  | table | postgres | permanent   | heap          | 232 kB | 
 public | pgbench_tellers  | table | postgres | permanent   | heap          | 128 kB | 
(4 rows)
```

```sql
select count(*) as NumAccounts from pgbench_accounts;
select count(*) as NumBranches from pgbench_branches;
select count(*) as NumHistory from pgbench_history;
select count(*) as NumTellers from pgbench_tellers;
```

```
 numaccounts 
-------------
     1000000
(1 row)

 numbranches 
-------------
          10
(1 row)

 numhistory 
------------
       2000
(1 row)

 numtellers 
------------
        100
(1 row)
```

Question: quel sera l'espace disque occupé par les tables de la base de données si `--scale=10000` ?

## Injection de la charge (`simple`)

```bash
date --utc

docker exec -it postgres_container \
pgbench --host=localhost -U postgres    \
--client=100 \
--connect  \
--jobs=4 \
--progress=1 \
--transactions=20 \
db_bench
```

Computer under test: [MacBook Pro 13-inch, M1, 2020](https://www.cpubenchmark.net/cpu.php?cpu=Apple+M1+8+Core+3200+MHz&id=4104), 16GB RAM (2024/09/27)

```
pgbench (16.4 (Debian 16.4-1.pgdg120+1))
starting vacuum...end.
progress: 1.0 s, 31.5 tps, lat 568.944 ms stddev 139.946, 0 failed
progress: 2.0 s, 98.1 tps, lat 888.993 ms stddev 341.870, 0 failed
progress: 3.1 s, 79.5 tps, lat 1105.593 ms stddev 594.005, 0 failed
progress: 4.0 s, 74.8 tps, lat 1027.023 ms stddev 530.912, 0 failed
progress: 5.0 s, 75.0 tps, lat 1198.793 ms stddev 795.843, 0 failed
...
progress: 23.0 s, 85.4 tps, lat 1239.119 ms stddev 1221.674, 0 failed
progress: 24.1 s, 81.6 tps, lat 847.224 ms stddev 780.374, 0 failed
progress: 25.0 s, 58.1 tps, lat 892.161 ms stddev 602.215, 0 failed
progress: 26.0 s, 67.4 tps, lat 945.256 ms stddev 708.948, 0 failed
progress: 27.0 s, 72.8 tps, lat 616.256 ms stddev 485.794, 0 failed
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 10
query mode: simple
number of clients: 100
number of threads: 4
maximum number of tries: 1
number of transactions per client: 20
number of transactions actually processed: 2000/2000
number of failed transactions: 0 (0.000%)
latency average = 1155.258 ms
latency stddev = 1110.821 ms
average connection time = 49.349 ms
tps = 72.648287 (including reconnection times)
```

Report the result of the bench into [results.csv](results.csv)

## Injection de la charge (`extended`)

Ajoutez `--protocol=extended` à la ligne de commande de `pgbench`

Report the result of the bench into [results.csv](results.csv)

## Injection de la charge (`prepared`)

Ajoutez `--protocol=prepared` à la ligne de commande de `pgbench`

Report the result of the bench into [results.csv](results.csv)

## Reinitialisation de la base en utilisant le partitionnement

```
  --partition-method=(range|hash)
                           partition pgbench_accounts with this method (default: range)
  --partitions=NUM         partition pgbench_accounts into NUM parts (default: 0)
```

Avec NUM = 8, 16, 32

Recommencez les injections de charge et reportez les résultats dans `pgbench`.

Analysez et visualisez les résultats au moyen d'un notebook Jupyter.
