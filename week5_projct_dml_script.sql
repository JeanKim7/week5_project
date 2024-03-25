-- only add one value to car_dealsership since there is only one dealership
INSERT INTO car_dealership (LOCATION, num_of_cars)
VALUES ('Vancouver', 975);

INSERT INTO salesperson (first_name, last_name, salary, cars_sold_month, commission, dealership_id)
VALUES('Jim', 'Harbaugh', 100000, 75, 8.75, 1);

INSERT INTO salesperson (first_name, last_name, salary, cars_sold_month, commission, dealership_id)
VALUES ('Sandy', 'Cheeks', 75, 2, 1.00, 1);

SELECT*
FROM salesperson;

SELECT*
FROM car_dealership;

INSERT INTO mechanic(first_name, last_name, salary, cars_repaired_month, dealership_id)
VALUES ('Jose', 'Alvarado', 50000, 87, 1),
('Deborah', 'Samson', 900000, 298, 1);

SELECT *
FROM mechanic;

CREATE OR REPLACE PROCEDURE add_customers(
	first_name VARCHAR(50), 
	last_name VARCHAR(50), 
	money_spent NUMERIC(9,2),
	cars_bought INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO customer(first_name, last_name, money_spent, cars_bought)
	VALUES (first_name, last_name, money_spent, cars_bought);
END;
$$;

CALL add_customers('Jean', 'Kim', 99.99, 1);
CALL add_customers('Sarah', 'Swanson', 1000000, 3);

INSERT INTO customer_salesperson(customer_id, salesperson_id)
VALUES(1, 2),
(2, 2);

INSERT INTO car_sold(model, make, price, color, "year", new)
VALUES ('Fiesta', 'Ford', 15000, 'neon pink', 2013, True),
('Model S', 'Tesla', 13, 'space grey', 1906, True);

INSERT INTO car_serviced(model, make, "year", color, car_sold_id)
VALUES ('Model S', 'Tesla', 1906, 'space grey', 2),
('Civic', 'Honda', 1994, 'forest green', Null);

INSERT INTO invoice (price, time_bought, car_sold_id, customer_id, salesperson_id)
VALUES (15000, '1907-03-18 12:00:00', 2, 1, 2),
(13, '1997-01-01 00:15:00', 1, 2, 2);

INSERT INTO service_ticket (price, time_returned,service_done, mechanic_id, customer_id, car_service_id)
VALUES (1500, '2004-01-01 00:00:09','oil change', 1, 1, 1),
(90000, '2024-03-25 02:07:30', 'install jet engine and refrigerator', 2, 2, 2);

SELECT *
FROM service_ticket;

SELECT*
FROM invoice;

SELECT*
FROM customer;

SELECT *
FROM customer_salesperson;

SELECT*
FROM car_serviced;

SELECT*
FROM car_sold;