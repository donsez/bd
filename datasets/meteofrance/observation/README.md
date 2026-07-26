# API Meteofrance :: Observation

* Créer un compte sur https://portail-api.meteofrance.fr/web/fr/
* Souscrire (gratuitement) à l'API Observation https://public-api.meteofrance.fr/public/DPObs/v2
* Générer un TOKEN ou une API_KEY
* Consulter le swagger de l'API


```bash
API_KEY='eyJ4NXQiOiJZV0kxTTJZNE1qWTNOemsyTkRZeU5XTTRPV014TXpjek1UVmhNbU14T1RSa09ETXlOVEE0Tnc9PSIsImtpZCI6ImdhdGV3YXlfY2VydGlmaWNhdGVfYWxpYXMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9...'
```

```bash
curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPObs/v1/liste-stations' \
  -H 'accept: */*' \
  -H "apikey: $API_KEY" \
  -o liste-stations.csv
wc -l liste-stations.csv
csv2json -d -s ';' liste-stations.csv | jq . > liste-stations.json
```


```bash
jq '{
  type: "FeatureCollection",
  features: map({
    type: "Feature",
    geometry: {
      type: "Point",
      coordinates: [.Longitude, .Latitude]
    },
    properties: {
      name: .Nom_usuel,
      altitude: .Altitude,
      id: .Id_station
    }
  })
}' liste-stations.json > liste-stations.geojson
```

Open the geojson with https://geojson.io

```bash
# Mont Aigoual
STATION_ID=30339001
grep $STATION_ID$ liste-stations.csv
NOW=`date +%d%m%y%H%M%S`
curl -X 'GET' \
  "https://public-api.meteofrance.fr/public/DPObs/v2/station/infrahoraire-6m?id_station=$STATION_ID&format=json" \
  -H 'accept: */*' \
  -H "apikey: $API_KEY" \
| jq . > liste-infrahoraire-$STATION_ID-$NOW.json
```
