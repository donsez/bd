# Apache Druid

Apache Druid is an open source distributed data store. Druid’s core design combines ideas from data warehouses, timeseries databases, and search systems to create a high performance real-time analytics database for a broad range of use cases. Druid merges key characteristics of each of the 3 systems into its ingestion layer, storage format, querying layer, and core architecture.

* https://druid.apache.org/
* https://www.baeldung.com/apache-druid-event-driven-data

## Getting started in single server

```bash
tar -xzf apache-druid-0.22.1-bin.tar.gz
cd apache-druid-0.22.1
./bin/start-micro-quickstart
```

After the Druid services finish startup, open the Druid console at http://localhost:8888.


## Getting started with Docker

```bash
docker-compose up -d
```

Once the cluster has started, you can navigate to the Druid console at http://localhost:8888. The Druid router process serves the UI.

## Load data

ngestion specs define the schema of the data Druid reads and stores. You can write ingestion specs by hand or using the data loader, as we'll do here to perform batch file loading with Druid's native batch ingestion.

The Druid distribution bundles sample data we can use. The sample data located in quickstart/tutorial/wikiticker-2015-09-12-sampled.json.gz in the Druid root directory represents Wikipedia page edits for a given day

## Load streaming data from Apache Kafka

https://druid.apache.org/docs/latest/tutorials/tutorial-kafka.html

## Integration with NodeJS

https://www.npmjs.com/package/druid-query


