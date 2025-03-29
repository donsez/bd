# PostgREST

[PostgREST](https://docs.postgrest.org) a standalone web server that turns your PostgreSQL database directly into a [RESTful API](https://en.wikipedia.org/wiki/REST). The structural constraints and permissions in the database determine the API endpoints and operations

https://docs.postgrest.org/en/v12/

https://docs.postgrest.org/en/v12/ecosystem.html#example-apps

## Install and run (with Docker Compose) the `world db` demo

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

### Swagger UI

Located at http://localhost:8080

## CRUD

### GET requests

Try GET requests like:

* http://localhost:3000/city
* http://localhost:3000/country
* http://localhost:3000/countrylanguage
* http://localhost:3000/city?name=eq.Denver
* http://localhost:3000/city?population=gte.5000000
* http://localhost:3000/city?district=like.*Island
* http://localhost:3000/city?district=like.*Island&population=lt.1000&select=id,name


### Paging

https://docs.postgrest.org/en/v12/references/api/pagination_count.html


### POST requests

TBC

### PUT requests

TBC

### DELETE requests

TBC

### PATCH requests

TBC

* https://blog.fgribreau.com/2020/11/how-postgresql-triggers-works-when.html
* https://github.com/FGRibreau/postgrest-patch-request-trigger

```bash
curl http://localhost:3000/cities

echo "\n\nPATCH /cities?id=eq.1 '{\"name\": null}'"
curl -s -H "content-type: application/json" --request PATCH --data '{"name": null}' http://localhost:3000/cities?id=eq.1 | jq '.message'

echo "\n\nPATCH /cities?id=eq.1 '{\"name\": \"new_value\"}'"
curl -s -H "content-type: application/json" --request PATCH --data '{"name": "new_value"}' http://localhost:3000/cities?id=eq.1 | jq '.message'
```

### Providing HTML Content Using Htmx

https://docs.postgrest.org/en/v12/how-tos/providing-html-content-using-htmx.html

Homework : Demo of Htmx [Infinite scrolling](https://en.wikipedia.org/wiki/Infinite_scrolling) using Paging


### Transactions and Isolation levels

https://docs.postgrest.org/en/v12/references/transactions.html

### User management and Access Control

https://docs.postgrest.org/en/v12/how-tos/sql-user-management.html

https://docs.postgrest.org/en/v12/integrations/jwt_gen.html

https://www.keycloak.org/

https://www.mathieupassenaud.fr/codeless_backend/

https://docs.postgrest.org/en/v12/explanations/db_authz.html

TBC

## Client-side libraries

https://docs.postgrest.org/en/v12/ecosystem.html#client-side-libraries


## Security

https://docs.postgrest.org/en/v12/explanations/nginx.html


Fail2Ban integration (TODO)