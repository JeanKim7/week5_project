INSERT INTO salesperson (first_name, last_name, salary, cars_sold_month, commission)
VALUES('Jim', 'Harbaugh', 100000, 75, 8.75);

INSERT INTO salesperson (first_name, last_name, salary, cars_sold_month, commission)
VALUES ('Sandy', 'Cheeks', 750, 2, 1.00);

CREATE OR REPLACE PROCEDURE add_customers(
	first_name VARCHAR(50), 
	last_name VARCHAR(50), 
	money_spent NUMERIC(9,2),
	cars_bought INTEGER,
	salesperson_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, money_spent, cars_bought, salesperson_id)
	VALUES (first_name, last_name, money_spent, cars_bought, salesperson_id);
END;
$$;

CALL add_customers('Jean', 'Kim', 99.99, 1, 1);
CALL add_customers('Sarah', 'Swanson', 1000000, 3, 2);

INSERT INTO invoice (price, time_bought, customer_id, salesperson_id)
VALUES (15000, '1907-03-18 12:00:00', 1, 1),
(13, '1997-01-01 00:15:00', 2, 2);

INSERT INTO car (model, make, price, color, "year", NEW, invoice_id)
VALUES ('Fiesta', 'Ford', 15000, 'neon pink', 2013, TRUE, 1),
('Model S', 'Tesla', 13, 'space grey', 1906, TRUE, 2);

INSERT INTO service_ticket (price, time_returned,service_done, customer_id, car_id)
VALUES (1500, '2004-01-01 00:00:09','oil change', 1, 1),
(90000, '2024-03-25 02:07:30', 'install jet engine and refrigerator', 2, 2);

INSERT INTO mechanic(first_name, last_name, salary, cars_repaired_month)
VALUES ('Jose', 'Alvarado', 50000, 87),
('Deborah', 'Samson', 900000, 298);

INSERT INTO service_ticket_mechanic  (mechanic_id, serv_ticket_id)
VALUES (1, 1),
(2, 2);

SELECT * 
FROM car;

SELECT *
FROM customer;

SELECT *
FROM invoice;

SELECT *
FROM mechanic;

SELECT *
FROM salesperson;

SELECT *
FROM service_ticket;

SELECT *
FROM service_ticket_mechanic;