-- Airway Company Database

SELECT * FROM AirCraft;
SELECT * FROM Customer;
SELECT * FROM Flight;
SELECT * FROM Ticket;

SELECT * FROM AirCraft WHERE id > 0;

SELECT * FROM AirCraft WHERE id > 0 AND id < 10;

SELECT Customer.*, Ticket.price
FROM Customer, Ticket
WHERE Customer.id = Ticket.customer_id;

SELECT Customer.name
FROM Customer
WHERE Customer.id IN ( SELECT customer_id FROM Ticket )
ORDER BY Customer.name ;


SELECT Customer.name, Flight.number
FROM Customer LEFT OUTER JOIN Ticket ON Customer.id = Ticket.customer_id
               LEFT OUTER JOIN Flight ON Ticket.flight_id = Flight.id
ORDER BY Customer.name;

SELECT Flight.number, Ticket.price
FROM Flight LEFT OUTER JOIN Ticket ON ( Flight.id = Ticket.flight_id )
ORDER BY Flight.number;

SELECT Flight.number, AVG(Ticket.price::numeric)::MONEY
FROM Flight LEFT OUTER JOIN Ticket ON ( Flight.id = Ticket.flight_id )
GROUP BY Flight.number
ORDER BY Flight.number;
