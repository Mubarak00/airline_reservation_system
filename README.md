# Airline Reservation System

## Description

The **Airline Reservation System** is a SQL-based project designed to streamline and manage flight operations, passenger bookings, ticketing, and payment processing. It offers a robust database schema to simulate real-world airline operations with advanced SQL functionalities for data manipulation, reporting, and analysis.

This project demonstrates key database management concepts such as relational modeling, data integrity, and efficient query handling, making it an ideal showcase for SQL and database design skills.

---

## Features

- **Flight Management**: Includes flight schedules, aircraft assignments, and pricing.
- **Passenger Management**: Tracks passenger details, including contact information.
- **Booking System**: Allows passengers to book flights and assign tickets.
- **Payment Processing**: Supports multiple payment methods like Credit Card, PayPal, and Cash.
- **Comprehensive Reporting**: Includes queries for analytics, such as total revenue and flight occupancy.

---

## Table of Contents

1. [Description](#description)
2. [Features](#features)
3. [Database Schema](#database-schema)
4. [Data Population](#data-population)
5. [Setup Instructions](#setup-instructions)
6. [Key Queries](#key-queries)


---

## Database Schema

The database consists of the following tables:

1. **airports**: Stores airport details.
   - `airport_id`, `airport_name`, `location`
2. **aircrafts**: Manages details of aircraft used in flights.
   - `aircraft_id`, `aircraft_model`, `capacity`
3. **flights**: Tracks flight schedules, pricing, and aircraft assignments.
   - `flight_id`, `aircraft_id`, `departure_airport_id`, `arrival_airport_id`, `departure_time`, `arrival_time`, `price`
4. **passengers**: Stores passenger information.
   - `passenger_id`, `first_name`, `last_name`, `email`, `phone_number`
5. **bookings**: Logs passenger flight bookings.
   - `booking_id`, `passenger_id`, `flight_id`, `booking_date`
6. **tickets**: Tracks ticket details, including class and seat assignment.
   - `ticket_id`, `booking_id`, `seat_number`, `class`
7. **payment_methods**: Lists supported payment methods.
   - `payment_method_id`, `name`
8. **payments**: Records payment transactions.
   - `payment_id`, `ticket_id`, `payment_method_id`, `payment_date`, `amount_paid`

---

## Data Population

Each table contains **20 rows of sample data** for realistic simulation. The dataset is comprehensive, ensuring thorough testing and validation of all features.

---

## Setup Instructions:
1. Clone the repository:
	```sql
	git clone https://github.com/your-username/airline-reservation-system.git
	```
2. Import SQL Script: Use a SQL client like MySQL Workbench or pgAdmin to execute the provided airline_reservation.sql file.
3. Run Queries: Use the provided query scripts (queries.sql) to test and interact with the database.

---

## Key Queries:

Insert a new flight:
```sql
INSERT INTO flights (
        aircraft_id, 
        departure_airport_id, 
        arrival_airport_id, 
        departure_time, 
        arrival_time, 
        price)
VALUES (
        1, 
        3, 
        4, 
        '2024-04-10 09:00:00', 
        '2024-04-10 17:00:00', 
        1100.00);

```

Update ticket price:
```sql
UPDATE tickets 
SET class = 'Business' WHERE ticket_id = 5;

```

Delete a passenger record:
```sql
DELETE FROM passengers WHERE passenger_id = 20;

```

Calculate total revenue by flight:
```sql
SELECT 
    flight_id, 
    SUM(amount_paid) AS total_revenue
FROM payments
GROUP BY flight_id;;

```

Find average price of Economy class tickets::
```sql
SELECT 
    AVG(price) AS avg_economy_price
FROM tickets
WHERE class = 'Economy';;

```

List passengers with their booked flights:
```sql
SELECT 
    p.first_name, 
    p.last_name, 
    f.departure_airport_id, 
    f.arrival_airport_id, 
    f.departure_time
FROM passengers p
JOIN bookings b 
    ON p.passenger_id = b.passenger_id
JOIN flights f 
    ON b.flight_id = f.flight_id;;

```


Create a view for all upcoming flights:
```sql
CREATE VIEW upcoming_flights AS
SELECT 
    flight_id, 
    departure_time, 
    arrival_time, price
FROM flights
WHERE departure_time > NOW();;

```

Calculate total revenue for a given flight:
```sql
CREATE PROCEDURE GetFlightRevenue(IN flight INT)
BEGIN
    SELECT SUM(amount_paid) AS revenue
    FROM payments p
    JOIN tickets t ON p.ticket_id = t.ticket_id
    JOIN bookings b ON t.booking_id = b.booking_id
    WHERE b.flight_id = flight;
END;

```
