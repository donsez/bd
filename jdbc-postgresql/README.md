# Manipulation d'une base PostgreSQL via JBDC 

Read https://mkyong.com/jdbc/how-do-connect-to-postgresql-with-jdbc-driver-java/

Check Java version
```bash
java --version
javac --version
```

Install [Maven](https://maven.apache.org/install.html)
```bash
mkdir -p ~/devtools/apache
cd ~/devtools/apache
wget https://dlcdn.apache.org/maven/maven-3/3.9.9/binaries/apache-maven-3.9.9-bin.tar.gz
tar xvf apache-maven-3.9.9-bin.tar.gz
```

Set $PATH
```bash
export PATH=$PATH:~/devtools/apache/apache-maven-3.9.9/bin
mvn -v
```

Install JDBC example
```bash
mkdir -p ~/github/mkyong/
cd ~/github/mkyong/
git clone https://github.com/mkyong/java-jdbc/
```

Build the Jarfile of the program
```bash
cd ~/github/mkyong/
cd java-jdbc/postgresql
mvn install
```


Check the classpath of the program
```bash
APP_CLASSPATH=$(mvn -q exec:exec -Dexec.executable=echo -Dexec.args="%classpath")
echo $APP_CLASSPATH
```

Run the program `src/main/java/com/mkyong/jdbc/JDBCExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.JDBCExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS
```
or
```bash
java -cp $APP_CLASSPATH $MAIN_CLASS
```


Run the program `src/main/java/com/mkyong/jdbc/JDBCExample2.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.JDBCExample2
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS 
```
or
```bash
java -cp $APP_CLASSPATH $MAIN_CLASS
```

Run the program `src/main/java/com/mkyong/jdbc/TransactionExample.java`
```bash
MAIN_CLASS=com.mkyong.jdbc.TransactionExample
mvn -q exec:java -Dexec.mainClass=$MAIN_CLASS 
```
or
```bash
java -cp $APP_CLASSPATH $MAIN_CLASS
```

## Extra: JDBC URL

Modify the URL `"jdbc:postgresql://127.0.0.1:5432/test"` into the Java classes

```
tree src/main/java/com/mkyong/jdbc/
grep -r -n "jdbc:postgresql://127.0.0.1:5432/test" src/main/java/com/mkyong/jdbc/
```

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

## Extra : Vérification des vulnérabilités
[Vérification des vulnérabilités](https://mvnrepository.com/artifact/org.owasp/dependency-check-maven) dans le programme Java : https://jeremylong.github.io/DependencyCheck/dependency-check-maven/
 
## References
* https://jdbc.postgresql.org/documentation/use/
