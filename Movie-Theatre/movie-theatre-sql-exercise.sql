
/*--------------------------------------------------------------------------------
                               MOVIE THEATRE DATABASE
----------------------------------------------------------------------------------*/


-----------------------------------CREATE TABLES-----------------------------------

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE movie(
    movie_id SERIAL PRIMARY KEY,
    movie_name VARCHAR(100),
    movie_date DATE
);

CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    concession_amt NUMERIC(3,1)
);

CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    ticket_amt NUMERIC(3,1),
    seat_no VARCHAR(10),
    movie_id INTEGER NOT NULL,
    concession_id INTEGER NOT NULL,

    FOREIGN KEY(movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY(concession_id) REFERENCES concession(concession_id) ON DELETE CASCADE
);

CREATE TABLE RESERVATION(
    booking_id SERIAL PRIMARY KEY,
    booking_date DATE, 
    ticket_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    --DEFAULT VALUE for booking_date in ALTER section below

    FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id),
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
    -- ON DELETE CASCADE in ALTER query section below
);



-----------------------------ALTER TABLE/COLUMN--------------------------------------------

--Changing ticket_amt column data type from numeric(3,1) to numeric(5,2)
ALTER TABLE ticket
ALTER COLUMN ticket_amt TYPE NUMERIC(5,2);


--Setting DEFAULT value for booking_date to CURRENT DATE
ALTER TABLE reservation
ALTER booking_date SET DEFAULT CURRENT_DATE;


--Adding ON DELETE CASCADE constraint to foreign keys ticket_id, customer_id
ALTER TABLE reservation 
ADD FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id) ON DELETE CASCADE;

ALTER TABLE reservation 
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE;



---------------------------------INSERT VALUES -----------------------------------------

INSERT INTO CUSTOMER(first_name, last_name, phone_number)
VALUES
('Max', 'Park', '224-900-0011'),
('Sam', 'Jr', '224-900-0011'),
('John', 'Welter', '604-890-0234'),
('Tina', 'Newman', '700-212-5678')


INSERT INTO movie(movie_name, movie_date)
VALUES
('X-Games', '2019-10-23'),
('Fire hunt', '2020-08-12'),
('Wonderland', '2020-02-09'),
('Land Impossible', '2018-03-13')


INSERT INTO concession(concession_amt)
VALUES(2.5)


INSERT INTO ticket(ticket_amt, seat_no, movie_id, concession_id)
VALUES
(13.99, 'R11', 1, 1),
(13.99, 'R10', 3, 1),
(10.99, 'R01', 4, 1),
(11.99, 'R05', 2, 1),
(11.99, 'R12', 2, 1)


INSERT INTO reservation(ticket_id,customer_id)
VALUES
(1, 1),
(2,2),
(3,4),
(4,2)
(5,3)


-------------------------------UPDATE TABLE-----------------------------------

UPDATE reservation
SET booking_date = '2019-09-03'
WHERE booking_id = 4


----------------------------------SELECT --------------------------------------

SELECT * from customer;
SELECT * from movie;
SELECT * FROM concession;
SELECT * FROM ticket;
SELECT * FROM reservation;

-------------------------------------------------------------------------------


