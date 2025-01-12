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
5. [Key Queries](#key-queries)
6. [Setup Instructions](#setup-instructions)
7. [Future Improvements](#future-improvements)
8. [License](#license)

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

Example: **Airports Table**
```sql
INSERT INTO `airports` VALUES
(1, 'John F. Kennedy International Airport', 'New York, USA'),
(2, 'Heathrow Airport', 'London, UK'),
...
(20, 'Cape Town International Airport', 'Cape Town, South Africa');