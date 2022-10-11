# PostGIS

## Start the DBMS

```bash
mkdir -p data/postgis
docker-compose up -d
```

```bash
docker-compose ps
docker-compose logs -f
```

```bash
curl https://codeload.github.com/cantzakas/postgis-demo/zip/refs/heads/master -o work/postgis-demo.zip 
(cd work; unzip postgis-demo.zip)
```

Interact with the DBMS using the [`psql` command](https://docs.postgresql.fr/10/app-psql.html).
The password is still `changeme`.
```bash
docker exec -it postgis_container psql -U postgres -W
```

> Nota Bene: You can stop the container with `docker-compose stop` and destroy the container with `docker-compose down`. However,Postgres DBMS files are still stored in the host directory `./data/postgis`.


## Execute the PSQL statements

```sql
SELECT postgis_full_version();

-- Drop the existing database if exists
DROP DATABASE IF EXISTS db_geo;

-- Create a new database
CREATE DATABASE db_geo;

\l

-- Enable PostGIS (includes raster)
CREATE EXTENSION postgis;
-- Enable Topology
CREATE EXTENSION postgis_topology;
-- Enable PostGIS Advanced 3D 
-- and other geoprocessing algorithms
CREATE EXTENSION postgis_sfcgal;
-- fuzzy matching needed for Tiger
CREATE EXTENSION fuzzystrmatch;
-- rule based standardizer
CREATE EXTENSION address_standardizer;
-- example rule data set
CREATE EXTENSION address_standardizer_data_us;
-- Enable US Tiger Geocoder
CREATE EXTENSION postgis_tiger_geocoder;
-- routing functionality
CREATE EXTENSION pgrouting;
-- spatial foreign data wrappers
CREATE EXTENSION ogr_fdw;

-- LIDAR support
CREATE EXTENSION pointcloud;
-- LIDAR Point cloud patches to geometry type cases
CREATE EXTENSION pointcloud_postgis;
```

```sql
CREATE TABLE geometries (name varchar, geom geometry);

INSERT INTO geometries VALUES
  ('Point', 'POINT(0 0)'),
  ('Linestring', 'LINESTRING(0 0, 1 1, 2 1, 2 2)'),
  ('Polygon', 'POLYGON((0 0, 1 0, 1 1, 0 1, 0 0))'),
  ('PolygonWithHole', 'POLYGON((0 0, 10 0, 10 10, 0 10, 0 0),(1 1, 1 2, 2 2, 2 1, 1 1))'),
  ('Collection', 'GEOMETRYCOLLECTION(POINT(2 0),POLYGON((0 0, 1 0, 1 1, 0 1, 0 0)))');

SELECT name, ST_AsText(geom) FROM geometries;

SELECT name, ST_AsGeoJSON(geom) FROM geometries;

SELECT name, ST_AsSVG(geom) FROM geometries;

SELECT name, ST_AsGML(geom) FROM geometries;

SELECT name, ST_Length(geom) FROM geometries;

SELECT SUM(ST_Length(geom)) AS TotalLength FROM geometries;


SELECT
  G1.name AS g1_name,
  G2.name AS g2_name
FROM geometries AS G1
JOIN geometries AS G2
ON ST_Contains(G1.geom, G2.geom);

SELECT
  G1.name AS g1_name,
  G2.name AS g2_name
FROM geometries AS G1
JOIN geometries AS G2
ON ST_Intersects(G1.geom, G2.geom);

```

```sql
\i /work/postgis-demo-master/load/nyc/nyc_census_sociodata.sql
```


```sql
CREATE TABLE cities ( id int4 primary key, name varchar(50), geom geometry(POINT,4326) );
INSERT INTO cities (id, geom, name) VALUES (1,ST_GeomFromText('POINT(-0.1257 51.508)',4326),'London, England');
INSERT INTO cities (id, geom, name) VALUES (2,ST_GeomFromText('POINT(-81.233 42.983)',4326),'London, Ontario');
INSERT INTO cities (id, geom, name) VALUES (3,ST_GeomFromText('POINT(27.91162491 -33.01529)',4326),'East London,SA');

SELECT * FROM cities;
SELECT id, ST_AsText(geom), ST_AsEwkt(geom), ST_X(geom), ST_Y(geom) FROM cities;

-- Jointures spatiales
SELECT p1.name,p2.name,ST_DistanceSphere(p1.geom,p2.geom)
FROM cities AS p1, cities AS p2 WHERE p1.id > p2.id;

SELECT p1.name,p2.name,ST_DistanceSpheroid(p1.geom,p2.geom, 'SPHEROID["GRS_1980",6378137,298.257222]')
FROM cities AS p1, cities AS p2 WHERE p1.id > p2.id;
```



## Plus
* http://postgis.net/workshops/postgis-intro/loading_data.html
* http://postgis.net/workshops/postgis-intro/geometries_exercises.html

