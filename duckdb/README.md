# DuckDB

[DuckDB](https://duckdb.org/) is an in-process SQL OLAP database management systemi. Data can be efficiently loaded from files in CSV, JSON, Parquet formats.

## Demo: https://shell.duckdb.org/

```sql
.help
.examples
.features

select current_timestamp;
select now();
```

Simple agregate
```sql
duckdb> select count(*) from 'https://shell.duckdb.org/data/tpch/0_01/parquet/customer.parquet';
┌──────────────┐
│ count_star() │
╞══════════════╡
│         1500 │
└──────────────┘
```

Simple join
```sql
duckdb> SELECT n_name, count(*)
  FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/customer.parquet',
       'https://shell.duckdb.org/data/tpch/0_01/parquet/nation.parquet'
  WHERE c_nationkey = n_nationkey GROUP BY n_name;

┌────────────────┬──────────────┐
│ n_name         ┆ count_star() │
╞════════════════╪══════════════╡
│ MOROCCO        ┆           72 │
│ JORDAN         ┆           54 │
│ ARGENTINA      ┆           59 │
│ EGYPT          ┆           66 │
│ CANADA         ┆           69 │
│ SAUDI ARABIA   ┆           67 │
│ CHINA          ┆           58 │
│ PERU           ┆           56 │
│ INDIA          ┆           60 │
│ ETHIOPIA       ┆           57 │
│ UNITED KINGDOM ┆           56 │
│ IRAN           ┆           72 │
│ BRAZIL         ┆           68 │
│ FRANCE         ┆           36 │
│ RUSSIA         ┆           59 │
│ JAPAN          ┆           67 │
│ ALGERIA        ┆           61 │
│ VIETNAM        ┆           58 │
│ ROMANIA        ┆           64 │
│ MOZAMBIQUE     ┆           62 │
│ INDONESIA      ┆           66 │
│ IRAQ           ┆           58 │
│ GERMANY        ┆           57 │
│ KENYA          ┆           50 │
│ UNITED STATES  ┆           48 │
└────────────────┴──────────────┘
Elapsed: 239 ms
```

## Import JSON files

https://duckdb.org/docs/data/json/overview.html

## Install

```bash
brew install duckdb
```

## Run on host

```bash
duckdb
```

```
v0.8.1 6536a77232
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
D .help
.bail on|off             Stop after hitting an error.  Default OFF
.binary on|off           Turn binary output on or off.  Default OFF
.cd DIRECTORY            Change the working directory to DIRECTORY
.changes on|off          Show number of rows changed by SQL
.check GLOB              Fail if output since .testcase does not match
.clone NEWDB             Clone data into NEWDB from the existing database
.columns                 Column-wise rendering of query results
.constant ?COLOR?        Sets the syntax highlighting color used for constant values
.constantcode ?CODE?     Sets the syntax highlighting terminal code used for constant values
.databases               List names and files of attached databases
.dump ?TABLE?            Render database content as SQL
.echo on|off             Turn command echo on or off
.excel                   Display the output of next command in spreadsheet
.exit ?CODE?             Exit this program with return-code CODE
.explain ?on|off|auto?   Change the EXPLAIN formatting mode.  Default: auto
.fullschema ?--indent?   Show schema and the content of sqlite_stat tables
.headers on|off          Turn display of headers on or off
.help ?-all? ?PATTERN?   Show help text for PATTERN
.highlight [on|off]      Toggle syntax highlighting in the shell on/off
.import FILE TABLE       Import data from FILE into TABLE
.indexes ?TABLE?         Show names of indexes
.keyword ?COLOR?         Sets the syntax highlighting color used for keywords
.keywordcode ?CODE?      Sets the syntax highlighting terminal code used for keywords
.lint OPTIONS            Report potential schema issues.
.log FILE|off            Turn logging on or off.  FILE can be stderr/stdout
.maxrows COUNT           Sets the maximum number of rows for display. Only for duckbox mode.
.maxwidth COUNT          Sets the maximum width in characters. 0 defaults to terminal width. Only for duckbox mode.
.mode MODE ?TABLE?       Set output mode
.nullvalue STRING        Use STRING in place of NULL values
.once ?OPTIONS? ?FILE?   Output for the next SQL command only to FILE
.open ?OPTIONS? ?FILE?   Close existing database and reopen FILE
.output ?FILE?           Send output to FILE or stdout if FILE is omitted
.parameter CMD ...       Manage SQL parameter bindings
.print STRING...         Print literal STRING
.prompt MAIN CONTINUE    Replace the standard prompts
.quit                    Exit this program
.read FILE               Read input from FILE
.rows                    Row-wise rendering of query results (default)
.schema ?PATTERN?        Show the CREATE statements matching PATTERN
.separator COL ?ROW?     Change the column and row separators
.sha3sum ...             Compute a SHA3 hash of database content
.shell CMD ARGS...       Run CMD ARGS... in a system shell
.show                    Show the current values for various settings
.system CMD ARGS...      Run CMD ARGS... in a system shell
.tables ?TABLE?          List names of tables matching LIKE pattern TABLE
.testcase NAME           Begin redirecting output to 'testcase-out.txt'
.timer on|off            Turn SQL timer on or off
.width NUM1 NUM2 ...     Set minimum column widths for columnar output
D 
```

```sql
INSTALL httpfs;
SELECT n_name, count(*)
  FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/customer.parquet',
       'https://shell.duckdb.org/data/tpch/0_01/parquet/nation.parquet'
  WHERE c_nationkey = n_nationkey GROUP BY n_name;
```


```sql
.show
.cd 'tpch/parquet'

SELECT * FROM 'nation.parquet';
SELECT * FROM 'customer.parquet';
SELECT * FROM 'lineitem.parquet';
SELECT * FROM 'orders.parquet';

SELECT count(*) FROM 'orders.parquet';

SELECT n_name, count(*)
  FROM 'customer.parquet',
       'nation.parquet'
  WHERE c_nationkey = n_nationkey GROUP BY n_name;
```

Change output format
```sql
.mode csv
SELECT * FROM 'nation.parquet';
.separator "|"
SELECT * FROM 'nation.parquet';

.mode json
SELECT * FROM 'nation.parquet';
.mode markdown
SELECT * FROM 'nation.parquet';
```

Write output into a file
```sql
.mode markdown
.output ../../nation.md
SELECT * FROM 'nation.parquet';
```

More with https://duckdb.org/docs/api/cli.html

## Create tables

```sql
CREATE TABLE weather (
     city           VARCHAR,
     temp_lo        INTEGER, -- minimum temperature on a day
     temp_hi        INTEGER, -- maximum temperature on a day
     prcp           REAL,
     date           DATE
 );

describe weather;
┌─────────────┬─────────────┬─────────┬─────────┬─────────┬───────┐
│ column_name │ column_type │  null   │   key   │ default │ extra │
│   varchar   │   varchar   │ varchar │ varchar │ varchar │ int32 │
├─────────────┼─────────────┼─────────┼─────────┼─────────┼───────┤
│ city        │ VARCHAR     │ YES     │         │         │       │
│ temp_lo     │ INTEGER     │ YES     │         │         │       │
│ temp_hi     │ INTEGER     │ YES     │         │         │       │
│ prcp        │ FLOAT       │ YES     │         │         │       │
│ date        │ DATE        │ YES     │         │         │       │
└─────────────┴─────────────┴─────────┴─────────┴─────────┴───────┘
CREATE TABLE cities (
     name            VARCHAR,
     lat             DECIMAL,
     lon             DECIMAL
 );
describe cities;
┌─────────────┬───────────────┬─────────┬─────────┬─────────┬───────┐
│ column_name │  column_type  │  null   │   key   │ default │ extra │
│   varchar   │    varchar    │ varchar │ varchar │ varchar │ int32 │
├─────────────┼───────────────┼─────────┼─────────┼─────────┼───────┤
│ name        │ VARCHAR       │ YES     │         │         │       │
│ lat         │ DECIMAL(18,3) │ YES     │         │         │       │
│ lon         │ DECIMAL(18,3) │ YES     │         │         │       │
└─────────────┴───────────────┴─────────┴─────────┴─────────┴───────┘
INSERT INTO weather VALUES ('San Francisco', 46, 50, 0.25, '1994-11-27');
INSERT INTO cities VALUES ('San Francisco', -194.0, 53.0);
INSERT INTO weather (city, temp_lo, temp_hi, prcp, date)
     VALUES ('San Francisco', 43, 57, 0.0, '1994-11-29');
INSERT INTO weather (date, city, temp_hi, temp_lo)
     VALUES ('1994-11-29', 'Hayward', 54, 37);
SELECT * FROM weather;
┌───────────────┬─────────┬─────────┬───────┬────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │
│    varchar    │  int32  │  int32  │ float │    date    │
├───────────────┼─────────┼─────────┼───────┼────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │
│ Hayward       │      37 │      54 │       │ 1994-11-29 │
└───────────────┴─────────┴─────────┴───────┴────────────┘
SELECT city, temp_lo, temp_hi, prcp, date FROM weather;
┌───────────────┬─────────┬─────────┬───────┬────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │
│    varchar    │  int32  │  int32  │ float │    date    │
├───────────────┼─────────┼─────────┼───────┼────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │
│ Hayward       │      37 │      54 │       │ 1994-11-29 │
└───────────────┴─────────┴─────────┴───────┴────────────┘
SELECT city, (temp_hi+temp_lo)/2 AS temp_avg, date FROM weather;
┌───────────────┬──────────┬────────────┐
│     city      │ temp_avg │    date    │
│    varchar    │  double  │    date    │
├───────────────┼──────────┼────────────┤
│ San Francisco │     48.0 │ 1994-11-27 │
│ San Francisco │     50.0 │ 1994-11-29 │
│ Hayward       │     45.5 │ 1994-11-29 │
└───────────────┴──────────┴────────────┘
SELECT * FROM weather
     WHERE city = 'San Francisco' ANprcp  0.0;
┌───────────────┬─────────┬─────────┬───────┬────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │
│    varchar    │  int32  │  int32  │ float │    date    │
├───────────────┼─────────┼─────────┼───────┼────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │
└───────────────┴─────────┴─────────┴───────┴────────────┘
SELECT * FROM weather
     ORDER BY city;
┌───────────────┬─────────┬─────────┬───────┬────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │
│    varchar    │  int32  │  int32  │ float │    date    │
├───────────────┼─────────┼─────────┼───────┼────────────┤
│ Hayward       │      37 │      54 │       │ 1994-11-29 │
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │
└───────────────┴─────────┴─────────┴───────┴────────────┘
SELECT * FROM weather
     ORDER BY city, temp_lo;
┌───────────────┬─────────┬─────────┬───────┬────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │
│    varchar    │  int32  │  int32  │ float │    date    │
├───────────────┼─────────┼─────────┼───────┼────────────┤
│ Hayward       │      37 │      54 │       │ 1994-11-29 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │
└───────────────┴─────────┴─────────┴───────┴────────────┘
SELECT DISTINCT city
     FROM weather;
┌───────────────┐
│     city      │
│    varchar    │
├───────────────┤
│ San Francisco │
│ Hayward       │
└───────────────┘
SELECT *
     FROM weather, cities
     WHERE city = name;
┌───────────────┬─────────┬─────────┬───────┬────────────┬───────────────┬───────────────┬───────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │     name      │      lat      │      lon      │
│    varchar    │  int32  │  int32  │ float │    date    │    varchar    │ decimal(18,3) │ decimal(18,3) │
├───────────────┼─────────┼─────────┼───────┼────────────┼───────────────┼───────────────┼───────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │ San Francisco │      -194.000 │        53.000 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │ San Francisco │      -194.000 │        53.000 │
└───────────────┴─────────┴─────────┴───────┴────────────┴───────────────┴───────────────┴───────────────┘
SELECT city, temp_lo, temp_hi, prcp, date, lon, lat
   FROM weather, cities
   WHERE city = name;
┌───────────────┬─────────┬─────────┬───────┬────────────┬───────────────┬───────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │      lon      │      lat      │
│    varchar    │  int32  │  int32  │ float │    date    │ decimal(18,3) │ decimal(18,3) │
├───────────────┼─────────┼─────────┼───────┼────────────┼───────────────┼───────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │        53.000 │      -194.000 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │        53.000 │      -194.000 │
└───────────────┴─────────┴─────────┴───────┴────────────┴───────────────┴───────────────┘
SELECT weather.city, weather.temp_lo, weather.temp_hi,
        weather.prcp, weather.date, cities.lon, cities.lat
     FROM weather, cities
     WHERE cities.name = weather.city;
┌───────────────┬─────────┬─────────┬───────┬────────────┬───────────────┬───────────────┐
│     city      │ temp_lo │ temp_hi │ prcp  │    date    │      lon      │      lat      │
│    varchar    │  int32  │  int32  │ float │    date    │ decimal(18,3) │ decimal(18,3) │
├───────────────┼─────────┼─────────┼───────┼────────────┼───────────────┼───────────────┤
│ San Francisco │      46 │      50 │  0.25 │ 1994-11-27 │        53.000 │      -194.000 │
│ San Francisco │      43 │      57 │   0.0 │ 1994-11-29 │        53.000 │      -194.000 │
└───────────────┴─────────┴─────────┴───────┴────────────┴───────────────┴───────────────┘
```


## SQL editors
https://duckdb.org/docs/guides/sql_editors/harlequin

```bash
pip install harlequin
harlequin
```

## Misc
* [Building and deploying data apps with DuckDB and Streamlit](https://medium.com/@octavianzarzu/build-and-deploy-apps-with-duckdb-and-streamlit-in-under-one-hour-852cd31cccce)
* https://github.com/drifting-in-space/duckdb-demo