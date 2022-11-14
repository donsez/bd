-- Airway Company Database

CREATE TABLE AirCraft
(              id SERIAL PRIMARY KEY,
            name VARCHAR(50),
    description VARCHAR(9000000)
);

CREATE TABLE Customer
(              id SERIAL PRIMARY KEY,
            name VARCHAR(50),
          number VARCHAR(50),
        address1 VARCHAR(250),
        address2 VARCHAR(250),
        address3 VARCHAR(250),
        address4 VARCHAR(250)
);
-- TODO add birthdate

CREATE TABLE Flight
(              id SERIAL PRIMARY KEY,
          number VARCHAR(50),
          "from" VARCHAR(150),
            "to" VARCHAR(150),
        departs VARCHAR(100),
        arrives VARCHAR(100),
    aircraft_id INTEGER REFERENCES AirCraft(id)
);
-- TODO replace departs and arrives with GNT date and time

CREATE TABLE Ticket
(              id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES Customer(id),
      flight_id  INTEGER REFERENCES Flight(id),
          price MONEY
);


INSERT INTO AirCraft
    ( name, description )
  VALUES
    ( 'DC-10-A', 'DC-10 Passenger Plane' ),
    ( 'DC-10-B', 'DC-10 Passenger Plane' ),
    ( 'DC-10-C', 'DC-10 Passenger Plane' ),
    ( 'DC-10-D', 'DC-10 Passenger Plane' ),
    ( 'DC-10-E', 'DC-10 Passenger Plane' ),
    ( 'DC-10-F', 'DC-10 Passenger Plane' ),
    ( 'DC-10-G', 'DC-10 Passenger Plane' ),
    ( 'DC-10-H', 'DC-10 Passenger Plane' ),
    ( 'DC-10-I', 'DC-10 Passenger Plane' ),
    ( 'DC-10-J', 'DC-10 Passenger Plane' ),
    ( 'DC-10-K', 'DC-10 Passenger Plane' ),
    ( 'DC-10-L', 'DC-10 Passenger Plane' ),
    ( 'DC-10-M', 'DC-10 Passenger Plane' ),
    ( 'DC-10-N', 'DC-10 Passenger Plane' ),
    ( 'DC-10-O', 'DC-10 Passenger Plane' ),
    ( 'DC-10-P', 'DC-10 Passenger Plane' ),
    ( 'DC-12-A', 'DC-12 Passenger Plane' ),
    ( 'DC-12-B', 'DC-12 Passenger Plane' ),
    ( 'DC-12-C', 'DC-12 Passenger Plane' ),
    ( 'DC-12-D', 'DC-12 Passenger Plane' ),
    ( 'DC-12-E', 'DC-12 Passenger Plane' ),
    ( 'DC-12-F', 'DC-12 Passenger Plane' ),
    ( 'DC-12-Fa', 'DC-12 Passenger Plane' ),
    ( 'DC-12-G', 'DC-12 Passenger Plane' ),
    ( 'DC-12-H', 'DC-12 Passenger Plane' ),
    ( 'DC-12-I', 'DC-12 Passenger Plane' ),
    ( 'DC-12-J', 'DC-12 Passenger Plane' ),
    ( 'DC-12-K', 'DC-12 Passenger Plane' ),
    ( 'DC-12-L', 'DC-12 Passenger Plane' ),
    ( 'DC-12-M', 'DC-12 Passenger Plane' ),
    ( 'DC-12-N', 'DC-12 Passenger Plane' ),
    ( 'DC-12-O', 'DC-12 Passenger Plane' ),
    ( 'DC-12-Oa', 'DC-12 Passenger Plane' ),
    ( 'DC-12-P', 'DC-12 Passenger Plane' )
;

INSERT INTO AirCraft
    ( name, description )
  VALUES
    ( 'AB0093-1', 'AB0093 Passenger Plane' ),
    ( 'AB0093-2', 'AB0093 Passenger Plane' ),
    ( 'AB0093-3', 'AB0093 Passenger Plane' ),
    ( 'AB0093-4', 'AB0093 Passenger Plane' ),
    ( 'AB0093-5', 'AB0093 Passenger Plane' ),
    ( 'AB0093-6', 'AB0093 Passenger Plane' ),
    ( 'AB0093-7', 'AB0093 Passenger Plane' ),
    ( 'AB0093-8', 'AB0093 Passenger Plane' ),
    ( 'AB0093-9', 'AB0093 Passenger Plane' ),
    ( 'AB0093-10', 'AB0093 Passenger Plane' ),
    ( 'AB0093-11', 'AB0093 Passenger Plane' ),
    ( 'AB0093-12', 'AB0093 Passenger Plane' ),
    ( 'AB0093-13', 'AB0093 Passenger Plane' ),
    ( 'AB0093-14', 'AB0093 Passenger Plane' ),
    ( 'AB0093-15', 'AB0093 Passenger Plane' ),
    ( 'AB0093-16', 'AB0093 Passenger Plane' )
;

UPDATE AirCraft SET name = CONCAT(name, '-upd')
  WHERE name LIKE 'DC-12-%'
;

INSERT INTO Customer
    ( number, name, address1, address2, address3, address4 )
  VALUES
    ( 'TO_BE_CHANGED',
        'Bobby Davis', '7 Main Road', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'Peter Lack', '19 Fredrickson Street', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'Bob Dobe', '911 Copitait Av.', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'Richard Daniel', '25 Broom Street', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'James Gresh', '1228 Davis Bv.', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'Ian Peterson', '9 Mig Flip St.', '', '', '' ),
    ( 'TO_BE_CHANGED',
        'Tobias Downer', '96 Yemm Street', '', '', '' )
;

UPDATE Customer SET number = CONCAT('0553', (id * 96), '-', ((id + 544) * 12));


INSERT INTO Flight
    ( number, "from", "to", departs, arrives, aircraft_id )
  VALUES
    ( 'EN-13', 'Manchester, England', 'Dublin, Ireland',
      'September 1, 2001 13:15', 'September 1, 2001 15:20', 5 ),
    ( 'EN-15', 'Sheffield, England', 'Isle Of Wight, England',
      'September 7, 2001 10:45', 'September 2, 2001 13:25', 8 ),
    ( 'KL-72', 'Paris, France', 'Tokyo, Japan',
      'September 9, 2001 17:10', 'September 10, 2001 04:00', 13 ),
    ( 'DL-12', 'Melbourne, Australia', 'New York, USA',
      'September 12, 2001 09:30', 'September 13, 2001 00:15', 15 ),
    ( 'WD-14', 'New York, USA', 'Amsterdam, Holland',
      'September 13, 2001 00:45', 'September 13, 2001 11:10', 20 ),
    ( 'LL-90', 'Hong Kong, China', 'Calcutta, India',
      'September 23, 2001 12:10', 'September 23, 2001 19:55', 3 ),
    ( 'DL-47', 'Cincinnati', 'London - Heathrow',
      'October 2, 2001 02:15', 'October 2, 2001 11:15', 14 )
;

INSERT INTO Ticket
    ( customer_id, flight_id, price )
  VALUES
    ( 3, 2, 400.00 ),
    ( 3, 1, 440.00 ),
    ( 3, 3, 360.00 ),
    ( 6, 2, 250.00 ),
    ( 7, 1, 480.00 ),
    ( 1, 4, 700.00 ),
    ( 1, 5, 660.00 ),
    ( 2, 7, 420.00 )
;


