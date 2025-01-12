DROP DATABASE IF EXISTS `airline_reservation_system`;
CREATE DATABASE `airline_reservation_system`; 
USE `airline_reservation_system`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

-- Payment Methods Table --
CREATE TABLE `payment_methods` (
  `payment_method_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `payment_methods` VALUES 
(1, 'Credit Card'),
(2, 'Cash'),
(3, 'PayPal'),
(4, 'Wire Transfer');

-- Airport Table--
CREATE TABLE `airports` (
  `airport_id` INT PRIMARY KEY AUTO_INCREMENT,
  `airport_name` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NOT NULL
);

INSERT INTO `airports` VALUES
(1, 'John F. Kennedy International Airport', 'New York, USA'),
(2, 'Heathrow Airport', 'London, UK'),
(3, 'Dubai International Airport', 'Dubai, UAE'),
(4, 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai, India'),
(5, 'Los Angeles International Airport', 'Los Angeles, USA'),
(6, 'Beijing Capital International Airport', 'Beijing, China'),
(7, 'Tokyo Haneda Airport', 'Tokyo, Japan'),
(8, 'Charles de Gaulle Airport', 'Paris, France'),
(9, 'Frankfurt Airport', 'Frankfurt, Germany'),
(10, 'Singapore Changi Airport', 'Singapore'),
(11, 'Hong Kong International Airport', 'Hong Kong'),
(12, 'Sydney Kingsford Smith Airport', 'Sydney, Australia'),
(13, 'Toronto Pearson International Airport', 'Toronto, Canada'),
(14, 'Amsterdam Schiphol Airport', 'Amsterdam, Netherlands'),
(15, 'Suvarnabhumi Airport', 'Bangkok, Thailand'),
(16, 'Indira Gandhi International Airport', 'Delhi, India'),
(17, 'Incheon International Airport', 'Seoul, South Korea'),
(18, 'Madrid-Barajas Airport', 'Madrid, Spain'),
(19, 'São Paulo–Guarulhos Airport', 'São Paulo, Brazil'),
(20, 'Cape Town International Airport', 'Cape Town, South Africa');

-- Aircrafts Table --
CREATE TABLE `aircrafts` (
  `aircraft_id` INT PRIMARY KEY AUTO_INCREMENT,
  `aircraft_model` VARCHAR(100) NOT NULL,
  `capacity` INT NOT NULL
);

INSERT INTO `aircrafts` VALUES 
(1, 'Boeing 747', 366),
(2, 'Airbus A380', 853),
(3, 'Boeing 737', 215),
(4, 'Embraer E190', 114),
(5, 'Bombardier CRJ700', 70),
(6, 'Cessna Citation X', 12),
(7, 'Boeing 767', 375),
(8, 'Airbus A320', 180),
(9, 'Boeing 777', 396),
(10, 'Airbus A350', 440),
(11, 'Boeing 787', 242),
(12, 'McDonnell Douglas MD-11', 293),
(13, 'Lockheed L-1011', 400),
(14, 'Concorde', 92),
(15, 'Bombardier Dash 8', 37),
(16, 'Boeing 757', 239),
(17, 'Airbus A321', 244),
(18, 'ATR 72', 78),
(19, 'Pilatus PC-12', 10),
(20, 'De Havilland Comet', 44);

-- Flights Table --
CREATE TABLE `flights` (
  `flight_id` INT PRIMARY KEY AUTO_INCREMENT,
  `aircraft_id` INT NOT NULL,
  `departure_airport_id` INT NOT NULL,
  `arrival_airport_id` INT NOT NULL,
  `departure_time` DATETIME NOT NULL,
  `arrival_time` DATETIME NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (`aircraft_id`) REFERENCES `aircrafts`(`aircraft_id`),
  FOREIGN KEY (`departure_airport_id`) REFERENCES `airports`(`airport_id`),
  FOREIGN KEY (`arrival_airport_id`) REFERENCES `airports`(`airport_id`)
);

INSERT INTO `flights` VALUES 
(1, 1, 1, 2, '2023-12-01 10:00:00', '2023-12-01 20:00:00', 1200.00),
(2, 2, 3, 4, '2023-12-05 08:30:00', '2023-12-05 16:00:00', 800.00),
(3, 3, 2, 3, '2023-12-10 15:00:00', '2023-12-10 23:30:00', 1000.00),
(4, 4, 5, 6, '2023-12-15 12:00:00', '2023-12-15 18:00:00', 500.00),
(5, 5, 7, 8, '2023-12-20 09:00:00', '2023-12-20 17:00:00', 700.00),
(6, 6, 9, 10, '2023-12-25 14:00:00', '2023-12-25 22:30:00', 900.00),
(7, 7, 11, 12, '2023-12-30 06:00:00', '2023-12-30 14:00:00', 600.00),
(8, 8, 13, 14, '2024-01-05 16:30:00', '2024-01-05 23:30:00', 750.00),
(9, 9, 15, 16, '2024-01-10 10:00:00', '2024-01-10 18:00:00', 1100.00),
(10, 10, 17, 18, '2024-01-15 13:00:00', '2024-01-15 21:30:00', 1250.00),
(11, 11, 19, 20, '2024-01-20 07:00:00', '2024-01-20 15:00:00', 1400.00),
(12, 12, 1, 5, '2024-01-25 09:00:00', '2024-01-25 18:00:00', 1350.00),
(13, 13, 3, 7, '2024-01-30 10:30:00', '2024-01-30 20:00:00', 1000.00),
(14, 14, 8, 14, '2024-02-01 11:00:00', '2024-02-01 22:00:00', 1150.00),
(15, 15, 9, 15, '2024-02-05 12:00:00', '2024-02-05 20:00:00', 650.00),
(16, 16, 10, 6, '2024-02-10 08:00:00', '2024-02-10 16:30:00', 750.00),
(17, 17, 11, 2, '2024-02-15 17:30:00', '2024-02-15 23:30:00', 850.00),
(18, 18, 12, 3, '2024-02-20 13:00:00', '2024-02-20 20:00:00', 920.00),
(19, 19, 4, 16, '2024-02-25 10:00:00', '2024-02-25 21:00:00', 800.00),
(20, 20, 6, 20, '2024-03-01 09:00:00', '2024-03-01 20:30:00', 900.00);

-- Passengers Table --
CREATE TABLE `passengers` (
  `passenger_id` INT PRIMARY KEY AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100),
  `phone_number` VARCHAR(15)
);

INSERT INTO `passengers` VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '1234567890'),
(2, 'Bob', 'Smith', 'bob@example.com', '0987654321'),
(3, 'Charlie', 'Brown', 'charlie@example.com', '1122334455'),
(4, 'Diana', 'Black', 'diana@example.com', '2233445566'),
(5, 'Eve', 'White', 'eve@example.com', '3344556677'),
(6, 'Frank', 'Green', 'frank@example.com', '4455667788'),
(7, 'Grace', 'Blue', 'grace@example.com', '5566778899'),
(8, 'Hank', 'Gray', 'hank@example.com', '6677889900'),
(9, 'Ivy', 'Yellow', 'ivy@example.com', '7788990011'),
(10, 'Jack', 'Red', 'jack@example.com', '8899001122'),
(11, 'Karen', 'Violet', 'karen@example.com', '9900112233'),
(12, 'Leo', 'Brown', 'leo@example.com', '1002003004'),
(13, 'Mia', 'Silver', 'mia@example.com', '1102203304'),
(14, 'Nathan', 'Gold', 'nathan@example.com', '1202403404'),
(15, 'Olivia', 'Amber', 'olivia@example.com', '1302503504'),
(16, 'Paul', 'Cyan', 'paul@example.com', '1402603604'),
(17, 'Quinn', 'Indigo', 'quinn@example.com', '1502703704'),
(18, 'Rita', 'Pink', 'rita@example.com', '1602803804'),
(19, 'Steve', 'Purple', 'steve@example.com', '1702903904'),
(20, 'Tina', 'Black', 'tina@example.com', '1803004004');

-- Bookings Table --
CREATE TABLE `bookings` (
  `booking_id` INT PRIMARY KEY AUTO_INCREMENT,
  `passenger_id` INT NOT NULL,
  `flight_id` INT NOT NULL,
  `booking_date` DATE NOT NULL,
  FOREIGN KEY (`passenger_id`) REFERENCES `passengers`(`passenger_id`),
  FOREIGN KEY (`flight_id`) REFERENCES `flights`(`flight_id`)
);

INSERT INTO `bookings` VALUES
(1, 1, 1, '2023-11-20'),
(2, 2, 2, '2023-11-21'),
(3, 3, 3, '2023-11-22'),
(4, 4, 4, '2023-11-23'),
(5, 5, 5, '2023-11-24'),
(6, 6, 6, '2023-11-25'),
(7, 7, 7, '2023-11-26'),
(8, 8, 8, '2023-11-27'),
(9, 9, 9, '2023-11-28'),
(10, 10, 10, '2023-11-29'),
(11, 11, 11, '2023-11-30'),
(12, 12, 12, '2023-12-01'),
(13, 13, 13, '2023-12-02'),
(14, 14, 14, '2023-12-03'),
(15, 15, 15, '2023-12-04'),
(16, 16, 16, '2023-12-05'),
(17, 17, 17, '2023-12-06'),
(18, 18, 18, '2023-12-07'),
(19, 19, 19, '2023-12-08'),
(20, 20, 20, '2023-12-09');

-- Tickets Table --
CREATE TABLE `tickets` (
  `ticket_id` INT PRIMARY KEY AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `seat_number` VARCHAR(10),
  `class` VARCHAR(20) CHECK (`class` IN ('Economy', 'Business', 'First')),
  FOREIGN KEY (`booking_id`) REFERENCES `bookings`(`booking_id`)
);

INSERT INTO `tickets` VALUES
(1, 1, '12A', 'Economy'),
(2, 2, '1B', 'Business'),
(3, 3, '15C', 'Economy'),
(4, 4, '22D', 'First'),
(5, 5, '14F', 'Economy'),
(6, 6, '5G', 'Business'),
(7, 7, '11H', 'Economy'),
(8, 8, '6I', 'First'),
(9, 9, '19J', 'Economy'),
(10, 10, '7K', 'Business'),
(11, 11, '9L', 'First'),
(12, 12, '3M', 'Economy'),
(13, 13, '20N', 'Economy'),
(14, 14, '18O', 'First'),
(15, 15, '4P', 'Business'),
(16, 16, '13Q', 'Economy'),
(17, 17, '8R', 'Economy'),
(18, 18, '16S', 'Business'),
(19, 19, '17T', 'First'),
(20, 20, '10U', 'Economy');

-- Payments Table --
CREATE TABLE `payments` (
  `payment_id` INT PRIMARY KEY AUTO_INCREMENT,
  `ticket_id` INT NOT NULL,
  `payment_method_id` TINYINT(4) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `amount_paid` DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (`ticket_id`) REFERENCES `tickets`(`ticket_id`),
  FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods`(`payment_method_id`)
);

INSERT INTO `payments` VALUES
(1, 1, 1, '2023-11-20 10:00:00', 1200.00),
(2, 2, 2, '2023-11-21 12:30:00', 800.00),
(3, 3, 3, '2023-11-22 15:45:00', 1000.00),
(4, 4, 4, '2023-11-23 08:00:00', 500.00),
(5, 5, 1, '2023-11-24 13:00:00', 700.00),
(6, 6, 2, '2023-11-25 11:30:00', 900.00),
(7, 7, 3, '2023-11-26 16:45:00', 600.00),
(8, 8, 4, '2023-11-27 10:15:00', 750.00),
(9, 9, 1, '2023-11-28 12:50:00', 1100.00),
(10, 10, 2, '2023-11-29 14:30:00', 1250.00),
(11, 11, 3, '2023-11-30 09:00:00', 1400.00),
(12, 12, 4, '2023-12-01 11:20:00', 1350.00),
(13, 13, 1, '2023-12-02 08:45:00', 1000.00),
(14, 14, 2, '2023-12-03 10:30:00', 1150.00),
(15, 15, 3, '2023-12-04 13:45:00', 650.00),
(16, 16, 4, '2023-12-05 15:00:00', 750.00),
(17, 17, 1, '2023-12-06 17:20:00', 850.00),
(18, 18, 2, '2023-12-07 09:45:00', 920.00),
(19, 19, 3, '2023-12-08 11:30:00', 800.00),
(20, 20, 4, '2023-12-09 10:30:00', 900.00);