# OpenSenseMap

[OpenSenseMap](https://opensensemap.org/) est un site communautaire publiant des mesures de capteurs environnementaux en données ouvertes (open-data).

## Quels capteurs LoRaWAN de CampusIoT
* Elsys EMS (Température, Humidité, Mouvement)
    * https://opensensemap.org/explore/61a1183bd85cc7001bf3640e
    * https://opensensemap.org/explore/61a1dfebd85cc7001b4d04e3
    * https://opensensemap.org/explore/61a49c884a7833001b5eda03
* MCF88 LW12TERPM (Température, Humidité, Particules fines)
    * https://opensensemap.org/explore/61a223c64a7833001b3fcf09

## API
* https://docs.opensensemap.org/
* https://api.opensensemap.org/
* https://docs.opensensemap.org/#api-Measurements-getData
* https://docs.opensensemap.org/#api-Measurements-postNewMeasurement
* https://docs.opensensemap.org/#api-Measurements-postNewMeasurements 
* https://en.docs.sensebox.de/sensebox-home/home-erweiterung-lora/ 
* https://en.docs.sensebox.de/opensensemap/opensensemap-mqtt/

## Récuperation d'un historique de mesures

```bash
# Show info about ELSYS_EMS_PERRET_SEE
senseBoxId=61a1183bd85cc7001bf3640e
URL="https://api.opensensemap.org/boxes/$senseBoxId?format=json"
curl -X GET $URL -o $senseBoxId.json
jq . $senseBoxId.json
jq '.sensors [] | .title' $senseBoxId.json

# Get the GeoJSON about ELSYS_EMS_PERRET_SEE
URL="https://api.opensensemap.org/boxes/$senseBoxId?format=geojson"
curl -X GET $URL -o $senseBoxId.geojson
# open $senseBoxId.geojson with http://geojson.io (`Open > File`)

# Get latest measurements of a senseBox
URL="https://api.opensensemap.org/boxes/$senseBoxId/sensors"
curl -X GET $URL -o $senseBoxId.data.json

# Get the history of measurements for the `temperature` sensor 
sensorId=61a1183bd85cc7001bf36410
# fromDate`
# toDate=
# URL=https://api.opensensemap.org/boxes/$senseBoxId/data/$sensorId?from-date=$fromDate&to-date=$toDate&download=true&format=json
URL="https://api.opensensemap.org/boxes/$senseBoxId/data/$sensorId?download=true&format=json"
curl -X GET $URL -o $senseBoxId.$sensorId.48h.json

URL="https://api.opensensemap.org/boxes/$senseBoxId/data/$sensorId?download=true&format=csv"
curl -X GET $URL -o $senseBoxId.$sensorId.48h.csv
cat $senseBoxId.$sensorId.48h.csv
```

