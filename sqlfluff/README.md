# SQLFluff

SQL Linter

* https://sqlfluff.com/

## Getting started

```bash
$ pip install sqlfluff
$ echo "  SELECT a  +  b FROM tbl;  " > test.sql
$ sqlfluff lint test.sql --dialect ansi
```
