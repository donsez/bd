-- Tests

   DROP TABLE IF EXISTS BinaryTest;
   DROP TABLE IF EXISTS MiscTest;

  CREATE TABLE BinaryTest
  (              id SERIAL,
               name VARCHAR(250),
         binary_col BYTEA,
        binary_col2 BYTEA
  );

   CREATE TABLE MiscTest
  (         test_col VARCHAR(250),
            testcol2 VARCHAR(250)
  );

   CREATE TABLE DropTest ( test_col INTEGER );
   DROP TABLE DropTest;
   CREATE TABLE DropTest (
            test_col VARCHAR(50),
            test_col2 NUMERIC,
            test_col3 VARCHAR(3000000)
   );
   DROP TABLE DropTest;

   INSERT INTO BinaryTest
       ( name, binary_col, binary_col2 )
     VALUES
       ( '\'Binary Test1\'', 'Is this stored as Binary?', 'Store this as binary please.' ),
       ( '\'Binary Test2\'', 1000.43, 'Another test to see if this is stored as a binary.' )
;

   INSERT INTO MiscTest
       ( test_col, testcol2 )
     VALUES
       ( 'test1', 'test2'  ),
       ( 'test3', 'test4'  ),
       ( 'A400', 'A200'    ),
       ( 'A900', 'B433'    ),
       ( 'D400', 'A200'    ),
       ( 'U65900', 'B1433' ),
       ( 'UA900', 'D'      ),
       ( 'Z', ''           ),
       ( '', 'C333'        )
;

   INSERT INTO MiscTest
       ( testcol2 )
     VALUES
       ( 'JJII' ),
       ( 'AFDD' )
;




   SELECT CONCAT('a', 'BCD', 'EF', 1),
          (5 + 10) * 20,
          SIGN(-4333),
          ROUND(4334.54493, 2),
          LOWER('JIIKLDKF kfooeF'),
          UPPER('kOFdsood oFpQQW'),
          SUBSTRING('tubs', 0, 3)
;

   SELECT LEAST('a', 'b', 'A', 'B'),
          GREATEST('h', 'H', 'l', 'L', '9', '3'),
          LEAST(6, 8, 6, 3, 4, 1),
          GREATEST(6, 8, 6, 3, 4, 1)
;
          
   SELECT TRIM(TRAILING 'a' FROM 'abbbbcaaaa'),
          TRIM(LEADING 'a' FROM 'abbbbcaaaa'),
          TRIM(BOTH 'a' FROM 'abbbbcaaaa'),
          TRIM('abc' FROM 'abcabcabc'),
          TRIM('abc' FROM 'abcabcababc'),
          TRIM('ab' FROM 'abcabcababc'),
          LTRIM('      yak   '),
          RTRIM('      yak   '),
          LENGTH(LTRIM('      yak   ')),
          LENGTH(RTRIM('      yak   ')),
          RTRIM('aaaaaayakaaa'),
          TRIM('aaaaaayakaaa'),
          TRIM('      yak   ')
   ;



   SELECT *
     FROM BinaryTest;


   SELECT * FROM MiscTest;

   SELECT *
     FROM MiscTest
    WHERE test_col LIKE ''
;

   SELECT *
     FROM MiscTest
    WHERE test_col LIKE 'A%'
;

   SELECT * FROM MiscTest WHERE test_col IS NULL;

   SELECT * FROM MiscTest WHERE test_col IS NOT NULL;

   SELECT * FROM MiscTest WHERE test_col = NULL;

   SELECT * FROM MiscTest WHERE test_col <> NULL;

   SELECT * FROM MiscTest WHERE test_col >= NULL;

