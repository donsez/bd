# PostgresSQL With Spring boot

From https://dzone.com/articles/bounty-spring-boot-and-postgresql-database

## Build (and skip tests)

```bash
./mvnw clean package -DskipTests
```

## Launch the PostgreSQL server

```bash
(cd ../postgres; docker compose up -d; ; docker compose ps)
```

## Launch Spring Boot server

```bash
./mvnw spring-boot:run
```

## Get the list of employees

```bash
curl -X GET http://localhost:8080/postgressApp/employeeList
curl -X GET http://localhost:8080/postgressApp/employeeList | jq .
```

## Create an employee

```bash
curl -X POST -H "Content-Type: application/json" \
    -d \
    '{ "employeeId": "2", "employeeName": "Joe", "employeeEmail": "joe@gmail.com",  "employeeAddress":"GB" }' \
    http://localhost:8080/postgressApp/createEmp
```

```bash
curl -X GET http://localhost:8080/postgressApp/employeeList | jq .
```

## Update an employee

```bash
curl -X PUT -H "Content-Type: application/json" \
    -d \
    '{ "employeeId": "2", "employeeName": "Marie" }' \
     http://localhost:8080/postgressApp/executeUpdateEmp
```

```bash
curl -X GET http://localhost:8080/postgressApp/employeeList | jq .
```

## Delete an employee

```bash
curl -X DELETE -H "Content-Type: application/json" \
    -d \
    '{ "employeeId": "2"}' \
    http://localhost:8080/postgressApp/deleteEmpById
```

```bash
curl -X GET http://localhost:8080/postgressApp/employeeList | jq .
```

## Exercice

Refactor the classes in order to change the type of `employeeId` in `SERIAL`.  [`SERIAL`](https://www.postgresql.org/docs/current/datatype-numeric.html#DATATYPE-SERIAL) is a pseudo-type to define auto-increment `integer` columns in tables.

The [`main/resources/schema.sql`](main/resources/schema.sql) is:

```sql
CREATE TABLE employee
(
 employeeId SERIAL,
 employeeName VARCHAR(100) NOT NULL,
 employeeAddress VARCHAR(100) DEFAULT NULL,
 employeeEmail VARCHAR(100) DEFAULT NULL,
 PRIMARY KEY (employeeId)
);
```