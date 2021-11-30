# Exemples pour Apache Cassandra

[Apache Cassandra](https://cassandra.apache.org/) est un système de gestion de bases de données de type stockage clé-valeur (_key-value store_). Apache Cassandra utilise des tables, des lignes et des colonnes, mais contrairement à une base de données relationnelle, les noms et le format des colonnes peuvent varier d'une ligne à l'autre dans la même table, qui peut être interprété comme un stockage clé-valeur bidimensionnel.

## Lancement du serveur Cassandra 

```bash
docker pull cassandra:latest
docker network create cassandra
docker run --rm --name cassandra --hostname cassandra --network cassandra cassandra
```

## Création de la base de données 

```bash
cat $(pwd)/data.cql
```

```bash
docker run -it --rm --network cassandra -v "$(pwd)/data.cql:/scripts/data.cql" cassandra cqlsh cassandra
```

```sql
SOURCE '/scripts/data.cql'
SELECT * FROM store.shopping_cart;
```

## Interrogation CQL de la base de données 

```bash
docker run -it --rm --network cassandra cassandra cqlsh cassandra
```

```sql
HELP
SHOW VERSION
SHOW HOST
```

```sql
SELECT * FROM store.shopping_cart;
INSERT INTO store.shopping_cart (userid, item_count) VALUES ('4567', 30));
INSERT INTO store.shopping_cart (userid, item_count, last_update_timestamp) VALUES ('4568', 20, toTimeStamp(now()));
SELECT * FROM store.shopping_cart;
```

```sql
SELECT userid, item_count FROM store.shopping_cart WHERE item_count > 20;
SELECT * FROM store.shopping_cart WHERE userid = '1234';
SELECT * FROM store.shopping_cart WHERE last_update_timestamp > '2021-11-30';
SELECT * FROM store.shopping_cart WHERE last_update_timestamp > '2021-11-30' ALLOW FILTERING;
SELECT COUNT (*) AS shopping_cart_count FROM store.shopping_cart;
SELECT JSON * FROM store.shopping_cart;

exit
```

[Testez d'autres requêtes CQL](https://cassandra.apache.org/doc/4.0/cassandra/cql/dml.html).

## Arrêt du serveur Cassandra

```bash
docker kill cassandra
docker network rm cassandra
```
