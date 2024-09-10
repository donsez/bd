# SQLFluff : SQL Linter

SQLFluff is designed to be used both as a utility for developers but also to be part of CI/CD pipelines.

* https://sqlfluff.com/

## Getting started

```bash
$ pip install sqlfluff
$ echo "  SELECT a  +  b FROM tbl;  " > test.sql
$ sqlfluff lint test.sql --dialect ansi
```
