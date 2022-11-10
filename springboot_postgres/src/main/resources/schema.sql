DROP TABLE employee IF EXISTS;

CREATE TABLE employee
(
--  employeeId SERIAL,    
 employeeId VARCHAR(11) NOT NULL ,
 employeeName VARCHAR(100) NOT NULL,
 employeeAddress VARCHAR(100) DEFAULT NULL,
 employeeEmail VARCHAR(100) DEFAULT NULL,
 PRIMARY KEY (employeeId)
);
