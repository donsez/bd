# PostgresSQL With Spring boot

From https://dzone.com/articles/bounty-spring-boot-and-postgresql-database

## Build and test

```bash
./mvnw clean package
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
