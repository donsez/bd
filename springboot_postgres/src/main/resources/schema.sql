CREATE TABLE employee
(
 employeeName VARCHAR(100) NOT NULL,
 employeeId VARCHAR(11) NOT NULL ,
 employeeAddress VARCHAR(100) DEFAULT NULL,
 employeeEmail VARCHAR(100) DEFAULT NULL,
 PRIMARY KEY (employeeId)
);