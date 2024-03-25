CREATE TABLE IF NOT EXISTS car_dealership (
	dealership_id SERIAL PRIMARY KEY,
	"location" VARCHAR(50) NOT NULL,
	num_of_cars INTEGER NOT NULL
)

CREATE TABLE IF NOT EXISTS car_sold (
	car_sold_id SERIAL PRIMARY KEY,
	model VARCHAR(50) NOT NULL,
	make VARCHAR(50) NOT NULL,
	price NUMERIC(9,2) NOT NULL,
	color VARCHAR(20) NOT NULL,
	"year" INTEGER NOT NULL,
	new BOOLEAN NOT NULL
)

CREATE TABLE IF NOT EXISTS salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary NUMERIC(9,2) NOT NULL,
	cars_sold_month INTEGER NOT NULL,
	commission NUMERIC (4,2) NOT NULL,
	dealership_id INTEGER NOT NULL,
	FOREIGN KEY(dealership_id) REFERENCES car_dealership(dealership_id)
)

CREATE TABLE IF NOT EXISTS mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary NUMERIC(9,2) NOT NULL,
	cars_repaired_month INTEGER NOT NULL,
	dealership_id INTEGER NOT NULL,
	FOREIGN KEY(dealership_id) REFERENCES car_dealership(dealership_id)
)

CREATE TABLE IF NOT EXISTS car_serviced (
	car_service_id SERIAL PRIMARY KEY,
	model VARCHAR(50) NOT NULL,
	make VARCHAR(50) NOT NULL,
	color VARCHAR(20) NOT NULL,
	"year" INTEGER NOT NULL,
	car_sold_id INTEGER,
	FOREIGN KEY (car_sold_id) REFERENCES car_sold(car_sold_id)
)

CREATE TABLE IF NOT EXISTS service_ticket (
	serv_ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(7,2) NOT NULL,
	time_returned TIMESTAMP NOT NULL,
	service_done VARCHAR(100) NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	car_service_id INTEGER NOT NULL,
	FOREIGN KEY (car_service_id) REFERENCES car_serviced(car_service_id)
)

CREATE TABLE IF NOT EXISTS customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	money_spent NUMERIC(9,2),
	cars_bought INTEGER 
)

CREATE TABLE IF NOT EXISTS invoice (
	invoice_id SERIAL PRIMARY KEY,
	price NUMERIC(9,2) NOT NULL,
	time_bought TIMESTAMP NOT NULL,
	car_sold_id INTEGER NOT NULL,
	FOREIGN KEY (car_sold_id) REFERENCES car_sold(car_sold_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
)

CREATE TABLE IF NOT EXISTS customer_salesperson (
	customer_id INTEGER NOT NULL, 
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
)
