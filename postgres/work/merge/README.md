# MERGE Command in PostgreSQL

MERGE — conditionally insert, update, or delete rows of a table

PostgreSQL 15 introduced the MERGE statement that simplifies data manipulation by combining INSERT, UPDATE, and DELETE operations into a single statement. The MERGE statement is often referred to as UPSERT statement.



https://www.postgresql.org/docs/current/sql-merge.html

https://dzone.com/articles/introducing-the-merge-command-in-postgresql-15

https://neon.tech/postgresql/postgresql-tutorial/postgresql-merge


```sql
MERGE INTO target_table
USING source_query
ON merge_condition
WHEN MATCH [AND condition] THEN {merge_update | merge_delete | DO NOTHING }
WHEN NOT MATCHED [AND condition] THEN { merge_insert | DO NOTHING };
```


```sql
CREATE TABLE leads(
    lead_id serial PRIMARY key,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    active bool NOT NULL DEFAULT TRUE
);
CREATE TABLE customers(
    customer_id serial PRIMARY key,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    active bool NOT NULL DEFAULT TRUE
);
```

```sql
INSERT INTO leads(name, email)
VALUES
   ('John Doe', '[[email protected]](../cdn-cgi/l/email-protection.html)'),
   ('Jane Doe', '[[email protected]](../cdn-cgi/l/email-protection.html)')
RETURNING *;
```


```sql
MERGE INTO customers c
USING leads l ON c.email = l.email
WHEN NOT MATCHED THEN
   INSERT (name, email)
   VALUES(l.name, l.email);
```

```sql
SELECT * FROM customers;
```

```sql
INSERT INTO leads(name, email)
VALUES('Alice Smith', '[[email protected]](../cdn-cgi/l/email-protection.html)');

UPDATE leads
SET name = 'Jane Gate'
WHERE lead_id = 2;
```


```sql
SELECT * FROM leads
ORDER BY id;
```



```sql
MERGE INTO customers c
USING leads l ON c.email = l.email
WHEN NOT MATCHED THEN
   INSERT (name, email)
   VALUES(l.name, l.email)
WHEN MATCHED THEN
   UPDATE SET
      name = l.name,
      email = l.email;
```

```sql
INSERT INTO leads(name, email)
VALUES('Bob Climo', '[[email protected]](../cdn-cgi/l/email-protection.html)');
```


```sql
UPDATE leads
SET active = false
WHERE lead_id = 2;
```


```sql
UPDATE leads
SET email = '[[email protected]](../cdn-cgi/l/email-protection.html)'
WHERE lead_id = 1;
```


```sql
SELECT * FROM leads
ORDER BY lead_id;
```


```sql
MERGE INTO customers c
USING leads l ON c.email = l.email
WHEN NOT MATCHED THEN
   INSERT (name, email)
   VALUES(l.name, l.email)
WHEN MATCHED AND l.active = false THEN
   DELETE
WHEN MATCHED AND l.active = true THEN
   UPDATE SET
      name = l.name,
      email = l.email;
```



```sql
SELECT * FROM customers;
```
