-- Creating function to insert data into the car table:

CREATE OR REPLACE FUNCTION insert_car(
    _car_id INTEGER,
    _dealer_id BOOLEAN,
    _make VARCHAR,
    _model VARCHAR,
    _car_year INTEGER,
    _color VARCHAR,
    _mileage INTEGER,
    _vin VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO car (car_id, dealer_id, make, model, car_year, color, mileage, vin)
    VALUES (_car_id, _dealer_id, _make, _model, _car_year, _color, _mileage, _vin);
END;
$MAIN$
LANGUAGE plpgsql;


-- ADDING CARS

SELECT insert_car(2, TRUE, 'BMW', 'M5', 2022, 'Silver', 10000, 'DEF23456789012345');
SELECT insert_car(3, FALSE, 'Bugatti', 'Veyron', 2022, 'Black', 5000, 'GHI34567890123456');
SELECT insert_car(4, FALSE, 'McLaren', 'F1', 2022, 'Orange', 8000, 'JKL45678901234567');
SELECT insert_car(5, TRUE, 'Lamborghini', 'Aventador', 2022, 'Red', 3000, 'MNO56789012345678');


SELECT *
FROM car;




-- Creating function to insert customer data into customer table:

CREATE OR REPLACE FUNCTION insert_customer(
    _customer_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR,
    _phone_number VARCHAR,
    _email VARCHAR,
    _address VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO customer (customer_id, first_name, last_name, phone_number, email, address)
    VALUES (_customer_id, _first_name, _last_name, _phone_number, _email, _address);
END;
$MAIN$
LANGUAGE plpgsql;

-- ADDING CUSTOMERS

SELECT insert_customer(2, 'Taylor', 'Swift', '(542) 596-6424', 'taylor.swift@email.com', '456 Oak Ave');
SELECT insert_customer(3, 'Henry', 'Cavill', '(773) 589-5685', 'henry.cavill@email.com', '789 Maple Dr');
SELECT insert_customer(4, 'Satoru', 'Gojo', '(312) 695-4155', 'satoru.gojo@email.com', '101 Pine Ln');
SELECT insert_customer(5, 'Bob', 'Morley', '(727) 641-5592', 'bob.morley@email.com', '202 Cedar Rd');


SELECT *
FROM customer;




-- Let's add some services!

CREATE OR REPLACE FUNCTION insert_service(
    _service_id INTEGER,
    _service_type VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO services (service_id, service_type)
    VALUES (_service_id, _service_type);
END;
$MAIN$
LANGUAGE plpgsql;

-- ADDING services

SELECT insert_service(1, 'Oil Change');
SELECT insert_service(2, 'Brake Inspection');
SELECT insert_service(3, 'Tire Rotation');
SELECT insert_service(4, 'Engine Tune-up');


SELECT *
FROM services;




-- Let's add our master mechanics!

CREATE OR REPLACE FUNCTION insert_mechanic(
    _mechanic_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO mechanic (mechanic_id, first_name, last_name)
    VALUES (_mechanic_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;


-- ADDING mechanic names

SELECT insert_mechanic(1, 'Junior', 'Johnson');
SELECT insert_mechanic(2, 'Bud', 'Moore');
SELECT insert_mechanic(3, 'Dale', 'Inman');
SELECT insert_mechanic(4, 'Maurice', 'Petty');

SELECT *
FROM mechanic;




-- Let's create some service_invoices

CREATE OR REPLACE FUNCTION insert_service_invoice(
    _service_invoice_id INTEGER,
    _car_id INTEGER,
    _dealer_serial BOOLEAN,
    _dropoff_date DATE,
    _pickup_date DATE,
    _mechanic_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO service_invoice (service_invoice_id, car_id, dealer_serial, dropoff_date, pickup_date, mechanic_id)
    VALUES (_service_invoice_id, _car_id, _dealer_serial, _dropoff_date, _pickup_date, _mechanic_id);
END;
$MAIN$
LANGUAGE plpgsql;


-- add invoices

SELECT insert_service_invoice(1, 5, TRUE, '2023-09-01', '2023-09-03', 1);
SELECT insert_service_invoice(2, 2, FALSE, '2023-08-30', '2023-09-01', 2);
SELECT insert_service_invoice(3, 3, TRUE, '2023-08-31', '2023-09-02', 3);
SELECT insert_service_invoice(4, 4, TRUE, '2023-09-02', '2023-09-04', 1);

SELECT * 
FROM service_invoice;




-- Let's add some star sales employees!

CREATE OR REPLACE FUNCTION insert_salesperson(
    _salesperson_id INTEGER,
    _first_name VARCHAR,
    _last_name VARCHAR
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO salesperson (salesperson_id, first_name, last_name)
    VALUES (_salesperson_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;


-- add employee info

SELECT insert_salesperson(1, 'Peter', 'Parker');
SELECT insert_salesperson(2, 'Jane', 'Wilde');
SELECT insert_salesperson(3, 'Michael', 'Jordan');
SELECT insert_salesperson(4, 'Emily', 'Morris');

SELECT * 
FROM salesperson;




-- Let's throw some parts together!

CREATE OR REPLACE FUNCTION insert_part_used(
    _partused_id INTEGER,
    _service_invoice_id INTEGER,
    _price DECIMAL(10,2)
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO part_used (partused_id, service_invoice_id, price)
    VALUES (_partused_id, _service_invoice_id, _price);
END;
$MAIN$
LANGUAGE plpgsql;


-- add part used info

SELECT insert_part_used(1, 1, 50.00);
SELECT insert_part_used(2, 2, 75.00);
SELECT insert_part_used(3, 3, 60.00);
SELECT insert_part_used(4, 4, 90.00);


SELECT *
FROM part_used;




-- Let's do all the services with all the mechanics:

CREATE OR REPLACE FUNCTION insert_mechanic_services(
    _mechanic_services_id INTEGER,
    _mechanic_id INTEGER,
    _service_id INTEGER,
    _service_invoice_id INTEGER
)
RETURNS void 
AS $MAIN$
BEGIN
    INSERT INTO mechanic_services (mechanic_services_id, mechanic_id, service_id, service_invoice_id)
    VALUES (_mechanic_services_id, _mechanic_id, _service_id, _service_invoice_id);
END;
$MAIN$
LANGUAGE plpgsql;


-- add mechanics on services provided

SELECT insert_mechanic_services(1, 1, 1, 1);
SELECT insert_mechanic_services(2, 2, 2, 2);
SELECT insert_mechanic_services(3, 3, 3, 3);
SELECT insert_mechanic_services(4, 4, 4, 4);


SELECT *
FROM mechanic_services;




-- ADDING a is_serviced column

ALTER TABLE car
ADD COLUMN is_serviced BOOLEAN DEFAULT false;


CREATE OR REPLACE PROCEDURE mark_car_serviced(
    _car_id INTEGER
)
AS $$
BEGIN
    -- Mark the car as serviced
    UPDATE car
    SET is_serviced = TRUE
    WHERE car_id = _car_id;
END;
$$ LANGUAGE plpgsql;


-- call procedure to mark the car as serviced

CALL mark_car_serviced(3);


-- Now let's check if it updated

-- SELECT * FROM car WHERE car_id = 5;

SELECT *
FROM car;






















