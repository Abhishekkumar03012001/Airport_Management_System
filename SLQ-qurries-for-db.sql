create database Airport_management_system;
show databases;
USE Airport_management_system;

CREATE TABLE AIRPORT (
    Airport_code INT PRIMARY KEY,
    Airport_Name VARCHAR(255) UNIQUE NOT NULL,
    Capacity INT NOT NULL,
    Location_city VARCHAR(255) NOT NULL,
    Location_country VARCHAR(30) NOT NULL,
    Location_Pincode VARCHAR(90) NOT NULL
);

INSERT INTO AIRPORT (Airport_code, Airport_Name, Capacity, Location_city, Location_country, Location_Pincode)
VALUES
  (1, 'John F. Kennedy International Airport', 5000, 'New York City', 'United States', '10001'),
  (2, 'Heathrow Airport', 4000, 'London', 'United Kingdom', 'TW6 1AP'),
  (3, 'Changi Airport', 6000, 'Singapore', 'Singapore', '819642'),
  (4, 'Los Angeles International Airport', 4500, 'Los Angeles', 'United States', '90045'),
  (5, 'Mumbai International Airport',7000,'Mumbai','India','173333');

CREATE TABLE SECURITY (
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Worker_airport INT,
    managed_by INT,
    DOB DATE,
    FOREIGN KEY (Worker_airport)
        REFERENCES AIRPORT(Airport_code)
        ON DELETE CASCADE
);

INSERT INTO SECURITY (ID, Name, Worker_airport, managed_by, DOB)
VALUES
  (1, 'John Smith', 1, 5, '1990-05-15'),
  (2, 'Emily Johnson', 2, 5, '1988-12-03'),
  (3, 'Michael Brown', 1, 5, '1995-07-22'),
  (4, 'Sarah Davis', 3, 5, '1993-09-10'),
  (5, 'Abhishek kumar',5,NULL,'2001-01-03');
  
CREATE TABLE AIRPLANE (
    REG_NO INT NOT NULL PRIMARY KEY,
    NAME VARCHAR(255) UNIQUE NOT NULL,
    airport_no INT,
    Capacity INT,
    Seats INT,
    Type VARCHAR(30),
    FOREIGN KEY (airport_no)
        REFERENCES AIRPORT(Airport_code)
        ON DELETE CASCADE
);

INSERT INTO AIRPLANE (REG_NO, NAME, airport_no, Capacity, Seats, Type)
VALUES
  (1, 'Boeing 747', 1, 500, 300, 'Passenger'),
  (2, 'Airbus A320', 2, 180, 120, 'Passenger'),
  (3, 'Cessna 172', 1, 4, 2, 'Private'),
  (4, 'Embraer E195', 3, 120, 80, 'Passenger');

CREATE TABLE AIRLINE (
  Airline_code INT NOT NULL PRIMARY KEY,
  Name VARCHAR(20) UNIQUE,
  Country VARCHAR(20),
  Airplane_no INT,
  FOREIGN KEY (Airplane_no)
    REFERENCES AIRPLANE (REG_NO)
    ON DELETE CASCADE
);

INSERT INTO AIRLINE (Airline_code, Name, Country, Airplane_no)
VALUES
  (1, 'Example Airlines', 'United States', 1),
  (2, 'Airline X', 'Canada', 2),
  (3, 'Sky Airways', 'Australia', 3),
  (4, 'Fly Europe', 'Germany', 4),
  (5, 'Pacific Wings', 'Japan', 4),
  (6, 'Air Express', 'France', 3),
  (7, 'Global Connect', 'United Kingdom', 1),
  (8, 'AeroLink', 'Spain', 1),
  (9, 'Jet Connect', 'India', 2),
  (10, 'Island Air', 'Philippines', 1);

CREATE TABLE FLIGHT (
  Flight_no INT NOT NULL PRIMARY KEY,
  Airline_no INT,
  Name VARCHAR(20) UNIQUE,
  Country VARCHAR(20),
  DEP_TIME TIME,
  ARR_TIME TIME,
  Curr_date DATE,
  Type VARCHAR(30),
  Class VARCHAR(10),
  FOREIGN KEY (Airline_no)
    REFERENCES AIRLINE (Airline_code)
    ON DELETE CASCADE
);

INSERT INTO FLIGHT (Flight_no, Airline_no, Name, Country, DEP_TIME, ARR_TIME, Curr_date, Type, Class)
VALUES
  (1, 1, 'Flight 001', 'United States', '08:00:00', '12:00:00', '2023-06-25', 'Domestic', 'Economy'),
  (2, 2, 'Flight 002', 'Canada', '10:30:00', '14:30:00', '2023-06-26', 'International', 'Business'),
  (3, 1, 'Flight 003', 'United States', '13:45:00', '17:45:00', '2023-06-27', 'Domestic', 'Economy'),
  (4, 3, 'Flight 004', 'Australia', '18:20:00', '23:10:00', '2023-06-28', 'International', 'Economy'),
  (5, 2, 'Flight 005', 'Canada', '09:15:00', '12:45:00', '2023-06-29', 'Domestic', 'Business');
  
CREATE TABLE ROUTE (
  Route_no INT PRIMARY KEY,
  route_id INT,
  Time_ TIME,
  descrip VARCHAR(255),
  FOREIGN KEY (route_id)
    REFERENCES FLIGHT (Flight_no)
    ON DELETE CASCADE
);

INSERT INTO ROUTE (Route_no, route_id, Time_, descrip)
VALUES
  (1, 1, '09:00:00', 'Route description 1'),
  (2, 2, '14:30:00', 'Route description 2'),
  (3, 3, '10:45:00', 'Route description 3'),
  (4, 4, '19:15:00', 'Route description 4'),
  (5, 5, '08:30:00', 'Route description 5');

CREATE TABLE FARE (
  ID INT NOT NULL PRIMARY KEY,
  Route_no INT,
  type VARCHAR(10),
  descrip VARCHAR(255),
  cond VARCHAR(255),
  FOREIGN KEY (Route_no)
    REFERENCES ROUTE (Route_no)
    ON DELETE CASCADE
);

INSERT INTO ROUTE (Route_no, route_id, Time_, descrip)
VALUES
  (6, 3, '16:20:00', 'Route description 6'),
  (7, 2, '12:15:00', 'Route description 7'),
  (8, 4, '21:30:00', 'Route description 8'),
  (9, 1, '11:45:00', 'Route description 9'),
  (10, 5, '19:50:00', 'Route description 10');
  
CREATE TABLE BOOKING_OFFICE (
  Office_id INT PRIMARY KEY NOT NULL,
  flight_id INT,
  Office_name VARCHAR(50),
  NO_OF_COUNTER INT,
  FOREIGN KEY (flight_id)
    REFERENCES FLIGHT (Flight_no)
    ON DELETE CASCADE
);

INSERT INTO BOOKING_OFFICE (Office_id, flight_id, Office_name, NO_OF_COUNTER)
VALUES
  (1, 1, 'Office A', 5),
  (2, 2, 'Office B', 3),
  (3, 3, 'Office C', 4);

CREATE TABLE EMPLOYEE (
  ID INT NOT NULL PRIMARY KEY,
  booking_Office_id INT,
  Name VARCHAR(30),
  JOB VARCHAR(80),
  DOB DATE,
  managed_by INT,
  FOREIGN KEY (booking_Office_id)
    REFERENCES BOOKING_OFFICE (Office_id)
    ON DELETE CASCADE
);

INSERT INTO EMPLOYEE (ID, booking_Office_id, Name, JOB, DOB, managed_by)
VALUES
  (1, 1, 'John Smith', 'Manager', '1990-05-15', NULL),
  (2, 1, 'Jane Doe', 'Ticketing Agent', '1995-08-23', 1),
  (3, 2, 'Michael Johnson', 'Customer Service Representative', '1993-10-12', 1),
  (4, 2, 'Emily Davis', 'Flight Attendant', '1991-12-07', 1),
  (5, 3, 'David Wilson', 'Baggage Handler', '1994-03-28', 2),
  (6, 3, 'Sarah Thompson', 'Security Officer', '1992-06-18', 2),
  (7, 1, 'Daniel Anderson', 'Pilot', '1988-09-03', 1),
  (8, 2, 'Olivia Martinez', 'Co-Pilot', '1996-02-11', 1),
  (9, 3, 'James Garcia', 'Maintenance Technician', '1993-07-24', 3),
  (10, 3, 'Sophia Robinson', 'Cleaning Crew', '1990-10-06', 3);

CREATE TABLE E_CONTACT (
  employee_id INT,
  CONTACT BIGINT,
  FOREIGN KEY (employee_id)
    REFERENCES EMPLOYEE (ID)
    ON DELETE CASCADE
);

INSERT INTO E_CONTACT (employee_id, CONTACT)
VALUES
  (1, 1234567890),
  (2, 9876543210),
  (3, 4567891230),
  (4, 7891234560),
  (5, 3216549870),
  (6, 6547893210),
  (7, 9876541230),
  (8, 6543219870),
  (9, 1237894560),
  (10, 4561237890),
  (1, 7894561230),
  (2, 3219876540),
  (3, 6543219876),
  (4, 9876543219),
  (5, 6549873210),
  (6, 1234569870),
  (7, 7896541230),
  (8, 3216547890),
  (9, 9871236540),
  (1, 4569873210);
  
CREATE TABLE PASSENGER (
  ID INT NOT NULL PRIMARY KEY,
  Office_id INT,
  Name VARCHAR(30),
  Email VARCHAR(125) UNIQUE,
  DOB DATE,
  country VARCHAR(30),
  passport VARCHAR(30),
  FOREIGN KEY (Office_id)
    REFERENCES BOOKING_OFFICE (Office_id)
    ON DELETE CASCADE
);

INSERT INTO PASSENGER (ID, Office_id, Name, Email, DOB, country, passport)
VALUES
  (1, 1, 'John Smith', 'john.smith@example.com', '1990-05-15', 'USA', 'AB123456'),
  (2, 1, 'Jane Doe', 'jane.doe@example.com', '1995-08-23', 'USA', 'CD789012'),
  (3, 2, 'Michael Johnson', 'michael.johnson@example.com', '1993-10-12', 'UK', 'EF345678'),
  (4, 2, 'Emily Davis', 'emily.davis@example.com', '1991-12-07', 'UK', 'GH901234'),
  (5, 3, 'David Wilson', 'david.wilson@example.com', '1994-03-28', 'Canada', 'IJ567890'),
  (6, 3, 'Sarah Thompson', 'sarah.thompson@example.com', '1992-06-18', 'Canada', 'KL123456'),
  (7, 1, 'Daniel Anderson', 'daniel.anderson@example.com', '1988-09-03', 'Australia', 'MN789012'),
  (8, 1, 'Olivia Martinez', 'olivia.martinez@example.com', '1996-02-11', 'Australia', 'OP901234'),
  (9, 2, 'James Garcia', 'james.garcia@example.com', '1993-07-24', 'Germany', 'QR567890'),
  (10, 2, 'Sophia Robinson', 'sophia.robinson@example.com', '1990-10-06', 'Germany', 'ST123456'),
  (11, 2, 'Jacob Turner', 'jacob.turner@example.com', '1992-11-15', 'France', 'UV789012'),
  (12, 3, 'Ava Walker', 'ava.walker@example.com', '1997-04-28', 'France', 'WX901234'),
  (13, 1, 'Ethan Lopez', 'ethan.lopez@example.com', '1994-08-09', 'Spain', 'YZ567890'),
  (14, 3, 'Mia Hall', 'mia.hall@example.com', '1991-01-22', 'Spain', 'AB123456'),
  (15, 3, 'Alexander Young', 'alexander.young@example.com', '1989-12-03', 'Italy', 'CD789012'),
  (16, 1, 'Charlotte Adams', 'charlotte.adams@example.com', '1993-03-16', 'Italy', 'EF901234'),
  (17, 2, 'William Rodriguez', 'william.rodriguez@example.com', '1992-05-07', 'Japan', 'GH567890'),
  (18, 3, 'Grace Campbell', 'grace.campbell@example.com', '1996-10-20', 'Japan', 'IJ123456'),
  (19, 3, 'Henry Hill', 'henry.hill@example.com', '1995-07-13', 'Brazil', 'KL789012'),
  (20, 3, 'Lily Foster', 'lily.foster@example.com', '1990-09-26', 'Brazil', 'MN901234');


CREATE TABLE P_CONTACT (
  passenger_id INT,
  CONTACT BIGINT,
  FOREIGN KEY (passenger_id)
    REFERENCES PASSENGER (ID)
    ON DELETE CASCADE
);

INSERT INTO P_CONTACT (passenger_id, CONTACT)
VALUES
  (1, 1234567890),
  (2, 2345678901),
  (3, 3456789012),
  (4, 4567890123),
  (5, 5678901234),
  (6, 6789012345),
  (7, 7890123456),
  (8, 8901234567),
  (9, 9012345678),
  (10, 1023456789),
  (11, 1123456789),
  (12, 1223456789),
  (13, 1323456789),
  (14, 1423456789),
  (15, 1523456789),
  (16, 1623456789),
  (17, 1723456789),
  (18, 1823456789),
  (19, 1923456789),
  (20, 2023456789);


CREATE TABLE BAGGAGE (
  id INT PRIMARY KEY,
  passenger_id INT,
  weight INT,
  stat VARCHAR(100),
  CONSTRAINT weight_check CHECK (weight <= 100),
  FOREIGN KEY (passenger_id)
    REFERENCES PASSENGER (ID)
    ON DELETE CASCADE
);

INSERT INTO BAGGAGE (id, passenger_id, weight, stat)
VALUES
  (1, 1, 20, 'Checked'),
  (13, 2, 30, 'Checked'),
  (3, 3, 15, 'Carry-on'),
  (11, 4, 10, 'Carry-on'),
  (5, 5, 40, 'Checked'),
  (6, 6, 25, 'Checked'),
  (14, 7, 12, 'Carry-on'),
  (8, 8, 18, 'Carry-on'),
  (19, 9, 30, 'Checked'),
  (7, 10, 8, 'Carry-on');

SELECT *
FROM EMPLOYEE
JOIN E_CONTACT ON EMPLOYEE.ID = E_CONTACT.employee_id;


SELECT *
FROM EMPLOYEE
WHERE office_id IN (SELECT office_id FROM BOOKING);


            
