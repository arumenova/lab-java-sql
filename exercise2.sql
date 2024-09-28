#Task2
CREATE DATABASE airline_ln;

USE airline_ln;

CREATE TABLE customer_information
(
    id                   INT AUTO_INCREMENT PRIMARY KEY,
    customer_name        VARCHAR(150),
    customer_status      VARCHAR(100),
    total_customer_miles INT
);

INSERT INTO customer_information (customer_name, customer_status, total_customer_miles)
VALUES ('Augustine Riviera', 'Silver', 115235),
       ('Alaina Sepulvida', 'None', 6008),
       ('Tom Jones', 'Gold', 205767),
       ('Sam Rio', 'None', 2653),
       ('Jessica James', 'Silver', 127656),
       ('Ana Janco', 'Silver', 136773),
       ('Jennifer Cortez', 'Gold', 300582),
       ('Christian Janco', 'Silver', 14642);

CREATE TABLE flight_details
(
    id_flight      INT AUTO_INCREMENT PRIMARY KEY,
    flight_number  VARCHAR(100),
    air_craft      VARCHAR(100),
    total_seats    INT,
    flight_mileage INT,
    customer_id    INT,
    FOREIGN KEY (customer_id) REFERENCES customer_information (id)
);

INSERT INTO flight_details (flight_number, air_craft, total_seats, flight_mileage)
VALUES ('DL1430', 'Boeing 747', 400, 135),
       ('DL122', 'Airbus 330', 236, 4370),
       ('DL53', 'Boeing 777', 264, 2078),
       ('DL222', 'Boeing 777', 264, 1765),
       ('DL37', 'Boeing 747', 400, 1765);



SHOW CREATE TABLE flight_details;

SHOW TABLES;

DESCRIBE flight_details;



ALTER TABLE flight_details
DROP COLUMN customer_id;

CREATE TABLE customer_flight
(
    id_custom_flight INT AUTO_INCREMENT PRIMARY KEY,
    customer_id      INT,
    flight_id        INT,
    FOREIGN KEY (customer_id) REFERENCES customer_information (id),
    FOREIGN KEY (flight_id) REFERENCES flight_details (id_flight)
);

INSERT INTO customer_flight (customer_id, flight_id)
VALUES (1, 1),
       (1, 2),
       (2, 2),
       (3, 2),
       (3, 3),
       (3, 4),
       (4, 1),
       (4, 5),
       (5, 1),
       (5, 2),
       (6, 2),
       (7, 4),
       (8, 4);

SELECT COUNT(*)
FROM customer_flight
WHERE flight_id;

SELECT AVG(flight_mileage)
FROM flight_details;

SELECT AVG(total_seats)
FROM flight_details;

SELECT AVG(total_customer_miles)
FROM customer_information
GROUP BY customer_status;

SELECT MAX(total_customer_miles)
    AS 'total_customer_miles'
FROM customer_information
GROUP BY customer_status;

SELECT COUNT(*)
FROM flight_details
WHERE air_craft
          LIKE 'Boeing%';

SELECT flight_mileage
FROM flight_details
WHERE flight_mileage BETWEEN 2000 AND 3000;

SELECT ci.customer_status, AVG(fd.flight_mileage) AS avg_flight_mileage
FROM customer_flight cf
         JOIN customer_information ci ON cf.customer_id = ci.id
         JOIN flight_details fd ON cf.flight_id = fd.id_flight
GROUP BY ci.customer_status;

SELECT COUNT(*)flight_id
FROM customer_flight
         JOIN customer_information ON  customer_id=customer_information.id
         JOIN flight_details ON flight_id=customer_id
WHERE customer_status='Gold'
GROUP BY customer_status;

SELECT fd.air_craft, COUNT(*) AS bookings_count
FROM customer_flight cf
         JOIN customer_information ci ON cf.customer_id = ci.id
         JOIN flight_details fd ON cf.flight_id = fd.id_flight
WHERE ci.customer_status = 'Gold'
GROUP BY fd.air_craft
ORDER BY bookings_count DESC
    LIMIT 1;



