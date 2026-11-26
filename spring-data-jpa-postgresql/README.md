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

### Install `jq` (command-line JSON processor)

https://jqlang.org/download/

### Launch the DBMS

Launch your PostgreSQL DBMS using [`docker compose`](../postgres)

> You can simply launch another instance of PostgreSQL DBMS with the command line below
```bash
docker run --name postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=changeme -e POSTGRES_DB=test -d postgres:15-alpine
```

### Review the code

```bash
cd ~/github/donsez/bd/spring-data-jpa-postgresql

# explore the source code
tree src/

# application properties
cat src/main/resources/application.properties

# main class
cat src/main/java/com/mkyong/MainApplication.java
# entity
cat src/main/java/com/mkyong/model/Book.java
# repository
cat src/main/java/com/mkyong/repository/BookRepository.java
# service
cat src/main/java/com/mkyong/service/BookService.java
# REST controller
cat src/main/java/com/mkyong/controller/BookController.java
```

### Build the application

```bash
./mvnw clean compile -Dmaven.test.skip=true
```

### Launch the service

```bash
./mvnw spring-boot:run
```

### JPA traces

Exercice: add `logging.*` lines into `src/main/resources/application.properties` for tracing JPA operations

```bash
vi src/main/resources/application.properties
```

## REST requests

## Get the list of books

```bash
curl -X GET http://localhost:8080/books
curl -X GET http://localhost:8080/books | jq .
```

## Get book #1

```bash
curl -X GET http://localhost:8080/books/1
curl -X GET http://localhost:8080/books/1 | jq .
```

## Create a new book

```bash
curl -X POST -H "Content-Type: application/json" \
    -d \
    '{  "title": "Blabla", "price": 99.9,  "publishDate":"2026-07-31" }' \
    http://localhost:8080/books
```

```bash
curl -X GET http://localhost:8080/books | jq .
```

```bash
curl -X GET http://localhost:8080/books/5 | jq .
```

## Find books by title

```bash
curl -X GET http://localhost:8080/books/find/title/BlaBla | jq .
```

## Find books published after January 1st, 2025

```bash
curl -X GET http://localhost:8080/books/find/date-after/2025-01-01 | jq .
```

## Update a book

```bash
curl -X PUT -H "Content-Type: application/json" \
    -d \
    '{ "id": 2, "price": 109.9 }' \
     http://localhost:8080/books
```

```bash
curl -X GET http://localhost:8080/books/2 | jq .
```

```bash
curl -X PUT -H "Content-Type: application/json" \
    -d \
    '{ "id": 2, "title": "New title", "price": 109.9,  "publishDate":"2026-11-31"  }' \
     http://localhost:8080/books
```

```bash
curl -X PUT -H "Content-Type: application/json" \
    -d \
    '{ "id": 2, "title": "New title", "price": 109.9,  "publishDate":"2026-11-30"  }' \
     http://localhost:8080/books
```

```bash
curl -X GET http://localhost:8080/books/2 | jq .
```

## Delete the book #1

```bash
curl -X DELETE -H "Content-Type: application/json" \
    http://localhost:8080/books/1
```

```bash
curl -X GET http://localhost:8080/books | jq .
```


