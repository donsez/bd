# Spring Boot + Spring data JPA + PostgreSQL example

Article link : https://mkyong.com/spring-boot/spring-boot/spring-boot-spring-data-jpa-postgresql/

The [source repository](https://github.com/mkyong/spring-boot) can be cloned using `git clone https://github.com/mkyong/spring-boot.git`

## Technologies used:
Technologies used:
* Spring Boot 3.1.2
* Spring Data JPA (Hibernate 6  is the default JPA implementation)
* PostgreSQL
* Maven
* Java 21
* JUnit 5
* Docker
* [REST Assured](https://rest-assured.io/) and [Testcontainers](https://testcontainers.com/) (for Spring integration tests using a container)

## How to run it

### DBMS

Launch your PostgreSQL DBMS using [`docker compose`](../postgres) or the command line below
```
docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=changeme -e POSTGRES_DB=test -d postgres:15-alpine
```

### Build the application and launch the service

```bash
cd ~/github/donsez/bd/spring-data-jpa-postgresql

# explore the source code
tree src/

./mvnw clean package -Dmaven.test.skip=true

./mvnw spring-boot:run
```

### JPA traces

Exercice: add `logging.*` lines into `src/main/resources/application.properties` for tracing JPA operations

```bash
vi src/main/resources/application.properties
```

## REST requests

TODO

