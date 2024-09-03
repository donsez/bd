CREATE TABLE cars (name CHAR(25), id INT);
CREATE TABLE people (pe_name CHAR(25), pe_id NUMERIC(8), car_id INT);

INSERT INTO cars (name, id) VALUES('Fiat', 1);
insert into cars (name, id) values('Pinto', 2);
INSerT inTO cars (name, id) VALueS('Thing', 3);
INSERT INTO cars (name, id) VALUES('Bug', 4);
INSERT INTO cars (name, id) VALUES('Newport', 5);
INSERT INTO cars (name, id) VALUES('Rangerover', 6);
INSERT INTO cars (name, id) VALUES('Jeep', 7);
INSERT INTO cars (name, id) VALUES('Hummer', 8);

INSERT INTO people (pe_name, pe_id, car_id) VALUES('Irwin Garden', 1, 2);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Mr. Fiction', 2, 7);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Sal Paradise', 3, 8);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Dean Moriarty', 4, 3);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Bull Lee', 5, 7);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Jack Chip', 6, 1);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Glen Runciter', 7, 4);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Horselover Fat', 8, 2);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Gnossos Pappadopoulos', 9, 7);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Hef', 10, 6);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Matty Groves', 11, 7);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('Raoul Frodus', 12, 5);
INSERT INTO people (pe_name, pe_id, car_id) VALUES('H‰gar Boﬂ', 12, 5);

UPDATE people SET car_id=6 WHERE pe_name='Irwin Garden';
