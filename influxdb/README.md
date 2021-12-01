# Exemples pour InfluxDB

InfluxDB est un système de gestion de bases de données temporelles.

## Lancement du serveur InfluxDB avec Docker

```bash
mkdir -p data/influxdb
mkdir -p data/share
docker rm -f influx
docker run -d --name influx  -p 8086:8086 \
      -v $PWD/data/influxdb:/var/lib/influxdb \
      -v $PWD/data/share:/usr/share:ro \
      influxdb:1.8
docker ps
```

## Création de la base de données

```bash
docker exec -it influx influx -precision rfc3339
```

Entrez les commande suivantes dans la CLI d'InfluxDB
```
help
show databases
CREATE DATABASE NOAA_water_database
show databases
use NOAA_water_database
show measurements
show series
exit
```

## Peuplement de la base de données

> The sample data is publicly available data from the National Oceanic and Atmospheric Administration’s (NOAA) Center for Operational Oceanographic Products and Services. The data include 15,258 observations of water levels (ft) collected every six minutes at two stations (Santa Monica, CA (ID 9410840) and Coyote Creek, CA (ID 9414575)) over the period from August 18, 2015 through September 18, 2015.

```bash
cd data/share
curl https://s3.amazonaws.com/noaa.water-database/NOAA_data.txt -o NOAA_data.txt
wc -l NOAA_data.txt
head -20 NOAA_data.txt
docker exec -it influx influx -import -path=/usr/share/NOAA_data.txt -precision=s -database=NOAA_water_database
```

## Interroger la base de données

Connectez-vous à la base de données via la CLI 
```bash
docker exec -it influx influx -precision rfc3339 -database NOAA_water_database
```

```console
show measurements
show series
```

Essayez les commandes suivantes (qui sont décrites dans https://docs.influxdata.com/influxdb/v1.8/query_language/explore-data/)

```console
SELECT COUNT(*) FROM average_temperature
SELECT COUNT(*) FROM h2o_pH
SELECT COUNT(*) FROM h2o_feet
SELECT COUNT(*) FROM h2o_quality
SELECT COUNT(*) FROM h2o_temperature
SELECT * FROM "h2o_feet" ORDER BY time ASC LIMIT 1
SELECT * FROM "h2o_feet" ORDER BY time DESC LIMIT 1

SELECT COUNT("water_level") FROM h2o_feet
SELECT * FROM h2o_feet LIMIT 10
SELECT "level description","location","water_level" FROM "h2o_feet" LIMIT 10
SELECT "level description"::field,"location"::tag,"water_level"::field FROM "h2o_feet" LIMIT 10
SELECT *::field FROM "h2o_feet" LIMIT 10
SELECT ("water_level" * 2) + 4 FROM "h2o_feet" LIMIT 10
SELECT * FROM "h2o_feet","h2o_pH" LIMIT 10
SELECT * FROM "NOAA_water_database".."h2o_feet" LIMIT 10
SELECT * FROM "h2o_feet" WHERE "water_level" > 8 LIMIT 10
SELECT * FROM "h2o_feet" WHERE "level description" = 'below 3 feet' LIMIT 10
SELECT * FROM "h2o_feet" WHERE "water_level" + 2 > 11.9
SELECT "water_level" FROM "h2o_feet" WHERE "location" = 'santa_monica' LIMIT 10
SELECT "water_level" FROM "h2o_feet" WHERE "location" <> 'santa_monica' AND (water_level < -0.59 OR water_level > 9.95) LIMIT 10
SELECT * FROM "h2o_feet" WHERE time > now() - 7d
SELECT MEAN("water_level") FROM "h2o_feet" GROUP BY "location"
SELECT MEAN("index") FROM "h2o_quality" GROUP BY "location","randtag"
SELECT MEAN("index") FROM "h2o_quality" GROUP BY *
SELECT "water_level","location" FROM "h2o_feet" WHERE time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z'
SELECT COUNT("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(60m)
SELECT COUNT("water_level") FROM "h2o_feet" WHERE time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(60m), location
SELECT MEAN("water_level") FROM "h2o_feet" WHERE time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(60m), location

SELECT MAX("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(60m)

SELECT MAX("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(1m)
SELECT MAX("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(1m) fill(100)
SELECT MAX("water_level") FROM "h2o_feet" WHERE "location"='coyote_creek' AND time >= '2019-08-18T00:00:00Z' AND time <= '2019-08-21T00:00:00Z' GROUP BY time(1m) fill(previous)
exit
```

## Arrêt du serveur de base de données
```bash
docker stop influx
docker rm -f influx
```
