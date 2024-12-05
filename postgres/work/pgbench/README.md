# Exécution du benchmark `pgbench` sur PostgreSQL

pgbench est un programme pour réaliser simplement des tests de performance (benchmark) sur PostgreSQL. Il s'inspire du benchmark [TPC-B](https://www.tpc.org/tpcb/) défini par le Transaction Processing Performance Council. Le TCP-B a été remplacé par le [TPC-C](https://www.tpc.org/tpcc/) qui est plus complet.

* https://docs.postgresql.fr/17/pgbench.html
* http://jimgray.azurewebsites.net/benchmarkhandbook/tpcb.pdf

> NB : https://docs.docker.com/engine/containers/resource_constraints/

## Démarrage


```yaml
services:
  postgres:
    container_name: postgres_container
    image: postgres
    deploy:
      resources:
        limits:
          memory: 128M
        reservations:
          memory: 128M
    environment:
...
```


Lancez le serveur Postgres avec `docker compose` depuis le répertoire `~/github/donsez/bd/postgres`

```bash
cd ~/github/donsez/bd/postgres
rm -fr data
mkdir -p data/postgres
docker compose up -d
docker compose ps
sleep 1
du -sh data/postgres/
```

Créez la base de données `db_bench`:

```bash
docker exec -it postgres_container createdb -U postgres -W db_bench
```

Lancez les commandes SQL suivantes:

```bash
docker exec -it postgres_container psql -U postgres -W
```

```sql
\l
\connect db_bench
\dt
\d+
```

Inspectez l'occupation disque des bases de données `db_bench` gérées par le conteneur:

```bash
du -sh data/postgres/
```

## Show help

```bash
docker exec -it postgres_container \
pgbench --help
```

> Nota Bene: branchez votre machine sur le secteur quand vous lancez vos `run`s de bancs d'essai.

## Initialisation de la base de données `db_bench`

```bash
date --utc

docker exec -it postgres_container \
pgbench --host=localhost -U postgres \
--initialize --scale=10 db_bench

date --utc
```

Inspectez l'occupation disque des bases de données gérées par le conteneur.

```bash
du -sh data/postgres/
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

date --utc
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

Report the result of the bench into [`results.csv`](results.csv)

## Injection de la charge (`extended`)

Ajoutez `--protocol=extended` à la ligne de commande de `pgbench`

Report the result of the bench into [`results.csv`](results.csv)

## Injection de la charge (`prepared`)

Ajoutez `--protocol=prepared` à la ligne de commande de `pgbench`

Report the result of the bench into [`results.csv`](results.csv)

## Reinitialisation de la base en utilisant le partitionnement

```
  --partition-method=(range|hash)
                           partition pgbench_accounts with this method (default: range)
  --partitions=NUM         partition pgbench_accounts into NUM parts (default: 0)
```

Avec `NUM` = `8`, `16`, `32`

Recommencez les injections de charge et reportez les résultats dans `pgbench`.

Analysez et visualisez les résultats au moyen d'un notebook Jupyter.

## Bancs d'essai avec un système de fichiers en RAM (bonus)

### Linux

```bash
rm -fr data
```

Refaites les bancs d'essai avec des données stockées en mémoire vive avec `ramfs`.

```bash
sudo unmount $PWD/data
sudo mount ramfs -t ramfs $PWD/data
```

Refaites les bancs d'essai avec des données stockées en mémoire vive avec `tmpfs`.

```bash
sudo unmount $PWD/data
sudo mount tmpfs -t tmpfs -o size=100k $PWD/data
```

### MacOS

> [RAM Disk on MacOS](https://blog.robe.one/ram-disk-on-macos)

| Desired Size in MB	| Calculation	|  Value to use |  Comment |
| ------------------- | ------------------- | ------------------- | ------------------- |
| 256	| 256 * 2048	| 524'288	|  256 Mega Byte | 
| 512	| 512 * 2048	| 1'048'576	|  512 Mega Byte | 
| 1024	| 1024 * 2048	| 2'097'152 |  1 Giga Byte | 


```bash
diskutil erasevolume HFS+ "pg_ram_disk" `hdiutil attach -nomount ram://524288`
diskutil erasevolume HFS+ "pg_ram_disk" `hdiutil attach -nomount ram://2097152`
diskutil list | grep "pg_ram_disk"
ln -s /Volumes/pg_ram_disk data
```



```
Started erase on disk10
Unmounting disk
Erasing
Initialized /dev/rdisk10 as a 1024 MB case-insensitive HFS Plus volume
Mounting disk
Finished erase on disk10 (pg_ram_disk)
```

Recommencez la procédure d'initialisation de la base de données `pg_bench`

Affichez le volume de données occupé sur disque (en RAM):

```bash
du -sh data/postgres/
df -h | grep pg_ram_disk
```

Lancez le bain d'essai

```bash
docker exec -it postgres_container \
  pgbench --host=localhost -U postgres    \
  --client=100 \
  --connect  \
  --jobs=4 \
  --progress=1 \
  --transactions=20 \
  db_bench
```

```
pgbench (16.4 (Debian 16.4-1.pgdg120+1))
starting vacuum...end.
progress: 1.1 s, 20.2 tps, lat 641.031 ms stddev 214.467, 0 failed
progress: 2.0 s, 82.5 tps, lat 992.013 ms stddev 388.483, 0 failed
progress: 3.0 s, 83.8 tps, lat 1062.881 ms stddev 668.188, 0 failed
progress: 4.0 s, 80.9 tps, lat 1165.180 ms stddev 703.552, 0 failed
progress: 5.0 s, 81.5 tps, lat 1167.888 ms stddev 870.887, 0 failed
progress: 6.1 s, 83.4 tps, lat 1153.191 ms stddev 751.799, 0 failed
progress: 7.0 s, 78.5 tps, lat 1046.106 ms stddev 705.431, 0 failed
progress: 8.1 s, 75.5 tps, lat 1205.544 ms stddev 835.288, 0 failed
progress: 9.1 s, 74.8 tps, lat 1376.846 ms stddev 868.885, 0 failed
progress: 10.0 s, 78.6 tps, lat 1109.227 ms stddev 786.193, 0 failed
progress: 11.0 s, 87.0 tps, lat 1166.939 ms stddev 793.138, 0 failed
progress: 12.0 s, 77.2 tps, lat 1108.911 ms stddev 953.232, 0 failed
progress: 13.0 s, 85.6 tps, lat 1145.346 ms stddev 873.460, 0 failed
progress: 14.0 s, 84.2 tps, lat 1103.783 ms stddev 628.501, 0 failed
progress: 15.1 s, 82.9 tps, lat 1119.992 ms stddev 910.284, 0 failed
progress: 16.0 s, 88.8 tps, lat 1111.206 ms stddev 1052.176, 0 failed
progress: 17.1 s, 85.4 tps, lat 1218.307 ms stddev 994.823, 0 failed
progress: 18.0 s, 87.0 tps, lat 1136.181 ms stddev 988.430, 0 failed
progress: 19.0 s, 86.1 tps, lat 1020.969 ms stddev 631.127, 0 failed
progress: 20.1 s, 91.0 tps, lat 977.929 ms stddev 736.334, 0 failed
progress: 21.0 s, 86.8 tps, lat 979.677 ms stddev 670.426, 0 failed
progress: 22.0 s, 99.0 tps, lat 1000.144 ms stddev 1033.347, 0 failed
progress: 23.1 s, 105.8 tps, lat 822.725 ms stddev 948.482, 0 failed
progress: 24.0 s, 113.9 tps, lat 298.490 ms stddev 312.881, 0 failed
transaction type: <builtin: TPC-B (sort of)>
scaling factor: 10
query mode: simple
number of clients: 100
number of threads: 4
maximum number of tries: 1
number of transactions per client: 20
number of transactions actually processed: 2000/2000
number of failed transactions: 0 (0.000%)
latency average = 1043.260 ms
latency stddev = 833.643 ms
average connection time = 43.592 ms
tps = 83.172543 (including reconnection times)
```


Pour nettoyer:

```bash
docker compose down
du -sh data/postgres/
df -h | grep pg_ram_disk
diskutil eject "pg_ram_disk"
```

## Lectures

* https://github.com/Vonng/pgtpc