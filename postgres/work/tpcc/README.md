# Banc d'essai d'une base de données OLTP avec PostgreSQL

[TPC-C](https://www.tpc.org/tpcc/) est un banc d'essai (*benchmark*) pour mesurer les performances d'un SGBD (configuration Logiciel + Hardware) dans le contexte de l'activité d'un fournisseur grossiste (wholesale supplier). Il a été défini par le Transaction Processing Performance Council qui définit une suite de benchmarks.
 
* https://github.com/oltpbenchmark/oltpbench/blob/master/src/com/oltpbenchmark/benchmarks/tpcc/ddls/tpcc-postgres-ddl.sql
* https://github.com/Capdata/benchmarksql
* https://github.com/ydb-platform/tpcc-postgres
* https://www.cockroachlabs.com/docs/stable/performance-benchmarking-with-tpcc-medium
* https://db.cs.cmu.edu/projects/benchbase/
* https://hammerdb.com/
* https://github.com/osdldbt/dbt2



## DBT-2

From https://www.enterprisedb.com/blog/how-to-run-a-complex-postgres-benchmark-tpc-c-pgbench

Build a database called dbt2:

```bash
dbt2 pgsql-build-db -w 1 dbt2
```

```
[... CREATE DATABASE, CREATE TABLE, COPY, CREATE INDEX, and CREATE FUNCTION command output omitted ...]
```

 
Run a 120 second (2 minute) test using easy mode:

```bash
dbt2 easy -a pgsql -b dbt2 -w 1 -l 120
```

```
[... test execution status output omitted ...]
```

 Generate a summary of the results (careful, there may be other mix-*.log files in the current directory depending on how many times dbt2 has been run and depending on how many processors are on the system):

```bash
dbt2 post-process mix-556525.log
```

```
============  =====  =========  =========  ===========  ===========  =====
          ..     ..    Response Time (s)            ..           ..     ..
------------  -----  --------------------  -----------  -----------  -----
 Transaction    %     Average     90th %        Total    Rollbacks      %
============  =====  =========  =========  ===========  ===========  =====
    Delivery   3.94      0.001      0.002         4728            0   0.00
   New Order  45.20      0.001      0.002        54215          550   1.01
Order Status   4.03      0.000      0.000         4830            0   0.00
     Payment  42.77      0.000      0.000        51307            0   0.00
 Stock Level   4.06      0.001      0.001         4874            0   0.00
============  =====  =========  =========  ===========  ===========  =====

* Throughput: 27107.50 new-order transactions per minute(NOTPM)
* Duration: 2.0 minute(s)
* Unknown Errors: 0
* Ramp Up Time: 0.0 minute(s)
```

Three steps seem to be on par with pgbench, but there is still some room for improvement around how many command line parameters are really needed.