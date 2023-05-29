# Apache Sedona

https://sedona.apache.org/latest-snapshot/

```


SELECT superhero.name
FROM city, superhero
WHERE ST_Contains(city.geom, superhero.geom)
AND city.name = 'Gotham'

```
