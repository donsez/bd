SELECT ST_DistanceSphere(
    ST_MakePoint(city1.longitude, city1.latitude),
    ST_MakePoint(city2.longitude, city2.latitude)
) / 1000 AS distance_in_km
FROM cities AS city1
CROSS JOIN cities AS city2
WHERE city1.name = 'Lisbon'
  AND city2.name = 'Porto';

SELECT ST_DistanceSphere(
    ST_MakePoint(city1.longitude, city1.latitude),
    ST_MakePoint(city2.longitude, city2.latitude)
) / 1000 AS distance_in_km
FROM cities AS city1
CROSS JOIN cities AS city2
WHERE city1.name = 'Sintra'
  AND city2.name = 'Coimbra';

SELECT city1.name "from", city2.name "to", round(ST_DistanceSphere(
    ST_MakePoint(city1.longitude, city1.latitude),
    ST_MakePoint(city2.longitude, city2.latitude)
) / 1000) AS distance_in_km
FROM cities AS city1
CROSS JOIN cities AS city2
where city1.name > city2.name
order by 3 desc, 1, 2;


