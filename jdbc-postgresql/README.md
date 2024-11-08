# Manipulation d'une base PostgreSQL via JBDC 

This tutorial is based on https://mkyong.com/jdbc/how-do-connect-to-postgresql-with-jdbc-driver-java/

Check your Java version
```bash
java --version
javac --version
```

Install [Maven](https://maven.apache.org/install.html) for compiling the classes
```bash
mkdir -p ~/devtools/apache
cd ~/devtools/apache
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
tar xvf apache-maven-3.9.9-bin.tar.gz
```

Set `mvn` into your `$PATH` 
```bash
export PATH=$PATH:~/devtools/apache/apache-maven-3.9.9/bin
mvn -v
```

Start the PostgreSQL server using the instructions [here](../postgres/README.md).

Create and populate the `test` database using the [following example](../postgres/work/employee/employee.sql). Remenber : the password is `changeme` .


Build the classes of the program

```bash
cd ~/github/donsez/bd/jdbc-postgresql
mvn compile
tree target/classes
```

> You can package the program as a Jarfile with `mvn compile`.

```bash
ls -al target/*.jar
```

> You can install the program as a Jarfile with `mvn install` into your local Maven repository `~/.m2/repository`.

```bash
ls -al ~/.m2/repository/github/donsez/bd/jdbc-postgresql/0.1.0-SNAPSHOT/
```


Run the program `src/main/java/com/mkyong/jdbc/ConnectOnlyExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.ConnectOnlyExample
APP_CLASSPATH=./target/classes
java -cp $APP_CLASSPATH $MAIN_CLASS
```

> Question : What's happens ? Why ?


Set the classpath of the program
```bash
APP_CLASSPATH=$(mvn -q exec:exec -Dexec.executable=echo -Dexec.args="%classpath")
echo $APP_CLASSPATH
```

Re-Run the program `src/main/java/com/mkyong/jdbc/ConnectOnlyExample.java`
```bash
java -cp $APP_CLASSPATH $MAIN_CLASS
```

> Question : What's happens ? Why ?

Change the password (the value is defined into [docker-compose.yml](../postgres/docker-compose.yml)) into the program `src/main/java/com/mkyong/jdbc/ConnectOnlyExample.java`.

Recompile the program with `mvn campile`.

Re-Run the program `src/main/java/com/mkyong/jdbc/ConnectOnlyExample.java` with
```bash
MAIN_CLASS=com.mkyong.jdbc.ConnectOnlyExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS
```

Run the program `src/main/java/com/mkyong/jdbc/ListEmployeeExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.ListEmployeeExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS
```

Run the program `src/main/java/com/mkyong/jdbc/TransactionExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.TransactionExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS
```

Run the program `src/main/java/com/mkyong/jdbc/ListEmployeeExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.ListEmployeeExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS
```

> You can replace `./target/classes` by `./target/jdbc-postgresql-0.1.0-SNAPSHOT.jar` into the classpath

```bash
echo $APP_CLASSPATH
MAIN_CLASS=com.mkyong.jdbc.ListEmployeeExample
java -cp $APP_CLASSPATH $MAIN_CLASS
```


## Exercice: pass SELECT query as program argument 

Duplicate `src/main/java/com/mkyong/jdbc/ListEmployeeExample.java` in `src/main/java/com/mkyong/jdbc/GenericQuery.java`

Pass the `SQL_SELECT` string as program argument.

First, use [`getObject(int)`](https://docs.oracle.com/en/java/javase/23/docs/api/java.sql/java/sql/ResultSet.html) for printing the column values.

> NB: `boolean wasNull()` - Reports whether the last column read had a value of SQL NULL.


Second, use [`ResultSetMetaData`](https://docs.oracle.com/en/java/javase/23/docs/api/java.sql/java/sql/ResultSetMetaData.html) for printing the column names in order to beautiful the output.

```java
ResultSetMetaData metaData = rs.getMetaData();
Integer columnCount = metaData.getColumnCount();
String tableName = getTableName(columnNumber); // 
String columnName = getColumnName(columnNumber); //  to get the name of  the column
String columnLabel = getColumnLabel(int columnNumber); //  to get the name of  the column
String tableName = getColumnLabel(int columnNumber); //  to access the label of the column, which is specified after AS in the SQL query

...

System.out.println("("+rs.getRow()+" rows)");
```

The output should be similar to:

```console
  id  |    name     |  salary   |         created_date          
------+-------------+-----------+-------------------------------
 1007 | Lamport     |  10000.00 | 2024-11-08 08:25:22.252877+00
 1008 | Knuth       |  15000.99 | 2024-11-08 08:25:22.252877+00
 1009 | Petri       |  20000.77 | 2024-11-08 08:25:22.252877+00
 1010 | Gray        |  30000.11 | 2024-11-08 08:25:22.252877+00
 1011 | Codd        |  10000.88 | 2024-11-08 08:25:22.252877+00
 1012 | Stonebraker | 100000.00 | 2024-11-08 11:51:21.668123+00
(6 rows)
```

## Exercice: Properties file

Use a properties file in [./src/main/resources](./src/main/resources/app.properties) for improving configurability

```java
import java.lang.System;
import java.lang.Thread;
import java.io.FileInputStream;

...
        String rootPath = Thread.currentThread().getContextClassLoader().getResource("").getPath();
        String appConfigPath = rootPath + "app.properties";

        Properties appProps = new Properties();
        try {
            appProps.load(new FileInputStream(appConfigPath));            
        } catch (java.io.IOException e) {
            e.printStackTrace();
            return;
        }
        
        String jdbcDriver = appProps.getProperty("jdbc_driver");
        System.out.println("driver :"+jdbcDriver);
```

## Exercice: SQL injection

Write a JDBC program exposed to [SQL injection (SQLi)](https://fr.wikipedia.org/wiki/Injection_SQL) attack.

![](1705992627213.jpg)
(Source Gizmodo)

## Extra: local ClassLoader

Change
```java
Class.forName("org.postgresql.Driver");
```
by
```java
final ClassLoader cl = this.getClass().getClassLoader ();
Class theClass = cl.loadClass("org.postgresql.Driver");
```

## Extra : Vérification des vulnérabilités

[Vérification des vulnérabilités](https://mvnrepository.com/artifact/org.owasp/dependency-check-maven) dans le programme Java : https://jeremylong.github.io/DependencyCheck/dependency-check-maven/


## Extra: Mise à jour des dépendances du projet

```bash
mvn versions:display-dependency-updates
mvn versions:display-plugin-updates
```

Modifiez la propriété `postgresql.version` dans le `pom.xml` pour mettre à jour le [driver JDBC PostgreSQL](https://mvnrepository.com/artifact/org.postgresql/postgresql). La dernière version (sans vulnérabilité connue) est la version `42.7.4` au 08/11/2024.

```bash
mvn versions:use-latest-releases
mvn versions:update-properties
git diff pom.xml
```
 
## Extra : Dockerize the program with [`jib` plugin](https://github.com/GoogleContainerTools/jib/blob/master/jib-maven-plugin/README.md)

https://www.baeldung.com/jib-dockerizing


```bash
mvn compile com.google.cloud.tools:jib-maven-plugin:dockerBuild
docker images | grep jdbc-postgresql
```

Run the container containing the application 
```bash
docker run --rm jdbc-postgresql:0.1.0-SNAPSHOT
```

What's happen ? Why ?

Run the container containing the application 
```bash
docker run --rm --network host jdbc-postgresql:0.1.0-SNAPSHOT
```

For publishing the image on https://hub.docker.com

> You should have an account `$DOCKERHUB_USER` on https://hub.docker.com

```bash
export DOCKERHUB_USER=$USER
export IMAGE_PATH=registry.hub.docker.com/$DOCKERHUB_USER/jdbc-postgresql
docker login
mvn compile com.google.cloud.tools:jib-maven-plugin:build -Dimage=$IMAGE_PATH
docker pull $DOCKERHUB_USER/jdbc-postgresql
```

Re-Run the container containing the application 
```bash
docker run --rm --network host $DOCKERHUB_USER/jdbc-postgresql
```


## References
* https://jdbc.postgresql.org/documentation/use/
