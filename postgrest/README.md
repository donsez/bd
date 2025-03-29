# PostgREST

PostgREST is a standalone web server that turns your PostgreSQL database directly into a RESTful API. The structural constraints and permissions in the database determine the API endpoints and operations

https://docs.postgrest.org/en/v12/


https://docs.postgrest.org/en/v12/ecosystem.html#example-apps

```bash
mkdir -p github/mattddowney
cd github/mattddowney
git clone https://github.com/mattddowney/compose-postgrest.git
cd compose-postgrest
docker compose up -d
docker compose ps
```

## Demo Application with [world db](https://www.postgresql.org/ftp/projects/pgFoundry/dbsamples/world/)

Located at http://localhost

Postgrest OpenAPI description located at http://localhost:3000

Try GET requests like:

* http://localhost:3000/city
* http://localhost:3000/country
* http://localhost:3000/countrylanguage
* http://localhost:3000/city?name=eq.Denver
* http://localhost:3000/city?population=gte.5000000
* http://localhost:3000/city?district=like.*Island
* http://localhost:3000/city?district=like.*Island&population=lt.1000&select=id,name

### Swagger UI

Located at http://localhost:8080