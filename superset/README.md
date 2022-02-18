# Apache Superset

Apache Superset is a modern data exploration and visualization platform. [Several SQL database systems](https://github.com/apache/superset#supported-databases) can be connected and queried. Apache Superset offers numerous [dataviz plugins](https://github.com/apache/superset#screenshots--gifs).


## Installation avec Docker

Suivez les [instrucutions](https://superset.apache.org/docs/installation/installing-superset-using-docker-compose).

```bash
git clone https://github.com/apache/superset.git
cd superset
docker-compose -f docker-compose-non-dev.yml pull
docker-compose -f docker-compose-non-dev.yml up -d

```

