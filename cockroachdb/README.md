# CockroachDB

CockroachDB is a cloud-native distributed SQL database designed to build, scale, and manage modern, data-intensive applications.

https://github.com/cockroachdb/cockroach

## Install

https://www.cockroachlabs.com/docs/v22.1/install-cockroachdb-mac.html

## Quickstart

https://www.cockroachlabs.com/docs/cockroachcloud/quickstart.html?filters=local&filters=linux

```bash
git clone https://github.com/cockroachdb/quickstart-code-samples

cd quickstart-code-samples/node

npm install

node app.js

```

## Install a cluster with Docker

https://www.cockroachlabs.com/docs/stable/start-a-local-cluster-in-docker-linux.html

## Query with the CLI client

https://www.cockroachlabs.com/docs/stable/start-a-local-cluster-in-docker-linux.html#step-3-use-the-built-in-sql-client

```bash
docker exec -it roach1 ./cockroach sql --insecure
```

```sql
CREATE DATABASE bank;

CREATE TABLE bank.accounts (id INT PRIMARY KEY, balance DECIMAL);

INSERT INTO bank.accounts VALUES (1, 1000.50);

SELECT * FROM bank.accounts;

\q
```

```bash
docker exec -it roach2 ./cockroach sql --insecure
```

```sql
SELECT * FROM bank.accounts;

\q
```

## Access the DB Console

 http://localhost:8080

![Cluster Overview](./coackrockdb_dbconsole_01.png)

Stop the third node

```bash
docker stop roack3
```

Check the console

![Cluster Overview](./coackrockdb_dbconsole_02.png)

```bash
docker start roack3
```

Check the console 

## Fault-Tolerance & Recovery

https://www.cockroachlabs.com/docs/v22.1/demo-fault-tolerance-and-recovery

Setup the HAProxy load balancer.

> HAProxy can be [deployed with Docker](https://hub.docker.com/_/haproxy): have a look on [this `docker-compose.yml` example](https://github.com/cockroachlabs-field/docker-examples/tree/master/example-haproxy)


## Misc

### Running OLTP-Bench Suite

https://github.com/cockroachlabs-field/docker-examples/tree/master/example-oltpbench

## Clean the cluster

```bash
docker stop roach1 roach2 roach3
docker rm roach1 roach2 roach3
docker volume rm roach1 roach2 roach3

docker stop haproxy
docker rm haproxy
```

## TODO: docker-compose.yml






