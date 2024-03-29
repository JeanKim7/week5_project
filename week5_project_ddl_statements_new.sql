CREATE TABLE IF NOT EXISTS salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary NUMERIC(9,2) NOT NULL,
	cars_sold_month INTEGER NOT NULL,
	commission NUMERIC (4,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	money_spent NUMERIC(9,2),
	cars_bought INTEGER,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id)
);

CREATE TABLE IF NOT EXISTS mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	salary NUMERIC(9,2) NOT NULL,
	cars_repaired_month INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS invoice (
	invoice_id SERIAL PRIMARY KEY,
	price NUMERIC(9,2) NOT NULL,
	time_bought TIMESTAMP NOT NULL,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY (salesperson_id) REFERENCES salesperson(salesperson_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE IF NOT EXISTS car (
	car_id SERIAL PRIMARY KEY,
	model VARCHAR(50) NOT NULL,
	make VARCHAR(50) NOT NULL,
	price NUMERIC(9,2) NOT NULL,
	color VARCHAR(20) NOT NULL,
	"year" INTEGER NOT NULL,
	new BOOLEAN NOT NULL,
	invoice_id INTEGER NOT NULL,
	FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE IF NOT EXISTS service_ticket (
	serv_ticket_id SERIAL PRIMARY KEY,
	price NUMERIC(7,2) NOT NULL,
	time_returned TIMESTAMP NOT NULL,
	service_done VARCHAR(100) NOT NULL,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id)
);

CREATE TABLE IF NOT EXISTS service_ticket_mechanic (
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY (mechanic_id) REFERENCES mechanic(mechanic_id),
	serv_ticket_id INTEGER NOT NULL,
	FOREIGN KEY (serv_ticket_id) REFERENCES service_ticket(serv_ticket_id)
);
