CREATE TABLE cities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    latitude NUMERIC,
    longitude NUMERIC
);

INSERT INTO cities (name, latitude, longitude) VALUES ('Lisbon', 38.724874, -9.139604);
INSERT INTO cities (name, latitude, longitude) VALUES ('Porto', 41.158389, -8.629163);
INSERT INTO cities (name, latitude, longitude) VALUES ('Sintra', 38.800306, -9.379136);
INSERT INTO cities (name, latitude, longitude) VALUES ('Obidos', 39.362068, -9.157140);
INSERT INTO cities (name, latitude, longitude) VALUES ('Coimbra', 40.211491, -8.429200);
INSERT INTO cities (name, latitude, longitude) VALUES ('Covilha', 40.282650, -7.503260);
INSERT INTO cities (name, latitude, longitude) VALUES ('Fatima', 39.617207, -8.652142);


