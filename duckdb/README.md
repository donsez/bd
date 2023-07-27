# DuckDB

[DuckDB](https://duckdb.org/) is an in-process SQL OLAP database management systemi. Data can be efficiently loaded from files in CSV, JSON, Parquet formats.

## Demo: https://shell.duckdb.org/

```sql
.help
.examples
.features
```

Simple agregate
```sql
SELECT count(*) FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/lineitem.parquet';
```

Simple join
```sql
SELECT n_name, count(*)
  FROM 'https://shell.duckdb.org/data/tpch/0_01/parquet/customer.parquet',
       'https://shell.duckdb.org/data/tpch/0_01/parquet/nation.parquet'
  WHERE c_nationkey = n_nationkey GROUP BY n_name;
```

## Import JSON files

https://duckdb.org/docs/data/json/overview.html

## Misc
* [Building and deploying data apps with DuckDB and Streamlit](https://medium.com/@octavianzarzu/build-and-deploy-apps-with-duckdb-and-streamlit-in-under-one-hour-852cd31cccce)
* https://github.com/drifting-in-space/duckdb-demo