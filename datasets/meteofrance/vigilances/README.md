# API Meteofrance :: Vigilance

* Créer un compte sur https://portail-api.meteofrance.fr/web/fr/
* Souscrire (gratuitement) à l'API Vigilance https://portail-api.meteofrance.fr/web/fr/api/DonneesPubliquesVigilance
* Générer un TOKEN ou une API_KEY
* Consulter le swagger de l'API

 
https://confluence-meteofrance.atlassian.net/wiki/spaces/OpenDataMeteoFrance/pages/1447788546/Guide+de+d+marrage+rapide+d+couvrir+les+APIs+de+M+t+o-France#Abonnement-%C3%A0-une-API-et-gestion-des-acc%C3%A8s


```bash
API_KEY='eyJ4NXQiOiJZV0kxTTJZNE1qWTNOemsyTkRZeU5XTTRPV014TXpjek1UVmhNbU14T1RSa09ETXlOVEE0Tnc9PSIsImtpZCI6ImdhdGV3YXlfY2VydGlmaWNhdGVfYWxpYXMiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.....'
```

```bash
curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPVigilance/v1/textesvigilance/encours' \
  -H 'accept: */*' \
  -H "apikey: $API_KEY" \
  -o textesvigilance_encours.json
```

```bash
curl -X 'GET' \
  'https://public-api.meteofrance.fr/public/DPVigilance/v1/cartevigilance/encours' \
  -H 'accept: */*' \
  -H "apikey: $API_KEY" \
  -o cartevigilance_encours.json
```

## Misc

```bash
curl -k -X POST https://portail-api.meteofrance.fr/token -d "grant_type=client_credentials" -H "Authorization: Basic APPLICATION_ID"
```
