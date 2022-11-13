-- Binary Long Object (BLOB) support in PostgreSQL

SELECT '\xDEADBEEF';

SET bytea_output = 'escape';

SELECT 'abc \153\154\155 \052\251\124'::bytea;
