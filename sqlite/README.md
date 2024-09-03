# SQLite

https://www.sqlite.org/

SQLite is a C-language library that implements a small, fast, self-contained, high-reliability, full-featured, SQL database engine. SQLite is the most used database engine in the world. SQLite is built into all mobile phones and most computers and comes bundled inside countless other applications that people use every day.

## Installation (with Docker)

```bash
docker pull keinos/sqlite3
```

## Creation

```bash
docker run --rm -it -v "$(pwd):/workspace" -w /workspace keinos/sqlite3
```

```sql
.help
.open ./university.db
CREATE TABLE student(timestamp TEXT, firstname TEXT, lastname TEXT, year INTEGER);
INSERT INTO student VALUES(datetime('now'),'Alan','Turing',1912);
INSERT INTO student VALUES(datetime('now'),'Albert','Einstein',1879);
SELECT * FROM student;
.show
.dbconfig
.exit
```

```bash
docker run --rm -it -v "$(pwd):/workspace" -w /workspace keinos/sqlite3
```

```sql
.open ./university.db
.databases
.fullschema
.schema
SELECT * FROM student;
SELECT rowid, * FROM student;
.exit
```


```bash
docker run --rm -it -v "$(pwd):/workspace" keinos/sqlite3 sqlite3 /workspace/university.db -header -column 'SELECT rowid, * FROM student;'
```

```bash
docker run --rm keinos/sqlite3 /run-test.sh
```

## Misc

```bash
docker run --rm -it -v "$(pwd):/workspace" -w /workspace keinos/sqlite3
```

### CSV

https://www.sqlite.org/csv.html

```sql
.load ./csv
CREATE VIRTUAL TABLE temp.t1 USING csv(filename='student.csv');
SELECT * FROM t1;
```


### Date and Time

```sql
SELECT datetime('now');
SELECT datetime('now','localtime');
SELECT datetime('now','-1 day','localtime') result;
SELECT json_object('ex','[52,3.14159]');
SELECT json_array(1,null,'3','[4,5]','{"six":7.7}');
```


### JSON

```sql
SELECT json_object('ex','[52,3.14159]');
SELECT json_array(1,null,'3','[4,5]','{"six":7.7}');
```


### R*Tree

https://www.sqlite.org/rtree.html

```sql
CREATE VIRTUAL TABLE demo_index USING rtree(
   id,              -- Integer primary key
   minX, maxX,      -- Minimum and maximum X coordinate
   minY, maxY       -- Minimum and maximum Y coordinate
);
INSERT INTO demo_index VALUES
  (28215, -80.781227, -80.604706, 35.208813, 35.297367),
  (28216, -80.957283, -80.840599, 35.235920, 35.367825),
  (28217, -80.960869, -80.869431, 35.133682, 35.208233),
  (28226, -80.878983, -80.778275, 35.060287, 35.154446),
  (28227, -80.745544, -80.555382, 35.130215, 35.236916),
  (28244, -80.844208, -80.841988, 35.223728, 35.225471),
  (28262, -80.809074, -80.682938, 35.276207, 35.377747),
  (28269, -80.851471, -80.735718, 35.272560, 35.407925),
  (28270, -80.794983, -80.728966, 35.059872, 35.161823),
  (28273, -80.994766, -80.875259, 35.074734, 35.172836),
  (28277, -80.876793, -80.767586, 35.001709, 35.101063),
  (28278, -81.058029, -80.956375, 35.044701, 35.223812),
  (28280, -80.844208, -80.841972, 35.225468, 35.227203),
  (28282, -80.846382, -80.844193, 35.223972, 35.225655);
SELECT datetime('now','-1 day','localtime') result;
SELECT id FROM demo_index
 WHERE minX<=-80.77470 AND maxX>=-80.77470
   AND minY<=35.37785  AND maxY>=35.37785;
SELECT A.id FROM demo_index AS A, demo_index AS B
 WHERE A.maxX>=B.minX AND A.minX<=B.maxX
   AND A.maxY>=B.minY AND A.minY<=B.maxY
   AND B.id=28269;
SELECT id FROM demo_index
 WHERE maxY>=35.0  AND minY<=35.0;
```


## Language integration

* [Python](https://docs.python.org/3/library/sqlite3.html#sqlite3-tutorial)
* [Jupiter Notebook](https://github.com/jupyter-xeus/xeus-sqlite)
* [RUST](https://github.com/rusqlite/rusqlite)
* [JDBC](https://github.com/xerial/sqlite-jdbc)
* [JavaScript](https://www.npmjs.com/package/sqlite)

## Extensions SQLite

* https://github.com/nalgeon/sqlean


## References

* https://www.sqlite.org
* https://www.sqlitetutorial.net/
* https://www.sqlite.org/fileformat2.html
* [SQLite Studio](https://sqlitestudio.pl/)