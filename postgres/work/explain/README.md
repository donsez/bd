# Postgres :: Execution plan and Join strategies



```sql
SET enable_hashjoin = off;
SET enable_mergejoin = off;
SET enable_nestloop = off;
```


```sql


```


```sql


```



```sql


```

##  REFRESH MATERIALIZED VIEW sales;



https://postgresqlblog.hashnode.dev/mastering-parameter-sensitive-plans-in-postgresql-for-better-query-performance

## VACUUM

The PostgreSQL VACUUM operation is designed to reclaim storage occupied by dead tuples, which are rows that have been updated or deleted. These dead tuples are not immediately removed to allow for transactional consistency and MVCC (Multi-Version Concurrency Control). 

https://postgresqlblog.hashnode.dev/understanding-postgresql-vacuum-boosting-query-performance-with-memory-reclamation


## MVCC



SQL: Finding the bottleneck

## References
* https://github.com/shiviyer/Blogs/wiki
* https://github.com/shiviyer/Troubleshooting-PostgreSQL-Performance
* https://www.cybertec-postgresql.com/en/join-strategies-and-performance-in-postgresql/
* https://www.cybertec-postgresql.com/en/postgresql-speeding-up-group-by-and-joins/
* https://www.cybertec-postgresql.com/en/tag/performance-tuning/
* https://www.cybertec-postgresql.com/en/postgresql-hash-index-performance/
* https://git.postgresql.org/gitweb/?p=postgresql.git;a=blob_plain;f=src/backend/access/hash/README
* https://www.timescale.com/learn/strategies-for-improving-postgres-join-performance
* https://postgresqlblog.hashnode.dev/optimizing-postgresql-performance-with-the-sort-merge-join-algorithm-a-detailed-guide
* https://postgresqlblog.hashnode.dev/understanding-postgresql-vacuum-boosting-query-performance-with-memory-reclamation
* https://djangocas.dev/blog/postgresql/postgresql-mini-cookbook-performance-tuning-debugging-and-testing/
* 