# Overview

This is a fully-functioning e-commerce application REST API that allows users to perform various CRUD operations such as registering an account, browsing products for sale, etc.

## Project Objectives

1. Build a functioning e-commerce REST API using Express, Node.js, and Postgres
2. Allow users to register and log in via the API
3. Allow CRUD operations on products
4. Allow CRUD operations on user accounts
5. Allow CRUD operations on user carts
6. Allow a user to place an order
7. Allow CRUD operations on orders
8. Use Git version control
9. Use command line
10. Develop locally on your computer
11. Document the API using Swagger

## Prerequisites

- JavaScript
- Git and GitHub
- Command line
- Express
- PostgreSQL

## DONE

### Setup version control

Set up Git tracking in your directory with `git init` and make sure to add and commit changes as you make them.

### Setup an express server

Create a directory for your project and set up a basic Express server and run `npm init` to create a `package.json` file. Add the necessary dependencies to your `package.json` file.

## TODO

### Design the database

Plan out the different types of data the application will track and how those pieces of data relate.

#### Database Design

This application uses a database to manage lesson scheduling, planning, documentation, booking, and payment. The database is designed to store information about students, teachers, lessons, schedules, bookings, payments, and documents.

The database schema includes six tables: Students, Teachers, Lessons, Schedules, Bookings, Payments, and Documents. Each table has a primary key that uniquely identifies each record, as well as foreign keys to establish relationships between the tables.

The Students table stores information about students, including their name, contact information, objectives, and settings.

The Teachers table stores information about teachers, including their name, contact information, availability, qualifications, and rates.

The Lessons table stores information about lessons, including the subject, level, duration, availability, and price.

The Schedules table stores information about lesson schedules, including the start and end times, dates, location, and availability.

The Bookings table stores information about lesson bookings, including the student, teacher, lesson, schedule, payment, and notes.

The Payments table stores information about payments, including the booking, amount, payment method, date, and status.

The Documents table stores information about lesson documents, including the lesson, type, name, and content.

The relationships between the tables are as follows:

- Each booking is associated with one student, one teacher, one lesson, and one schedule.
- Each payment is associated with one booking.
- Each document is associated with one lesson.

This database design enables the application to manage lesson scheduling, planning, documentation, booking, and payment in a clear and organized manner, and supports the business requirements of the comprehensible input teaching manager API.

### Create PostgreSQL database and tables

Create a PostgreSQL database and add the tables from your design.

### Connect the app and database

Set up your application to be able to interface with the PostgreSQL database.

### Plan API endpoints

Plan the API endpoints that will be used in retrieving data from your database.

### Set up user registration

Add the logic for handling registration of new users.

### Set up local login

Add the logic for handling login using a username and password.

### Set up product endpoints

Add the logic for handling CRUD operations related to products.

### Set up user endpoints

Add the logic for handling CRUD operations related to users and their accounts

### Set up cart endpoint

Add the logic for handling CRUD operations related to a user’s cart.

### Set up checkout endpoint

Add the logic for handling checkout. There is no need to actually try and charge somebody yet; charging will come in a later evolution of this project. For now, we will assume that all charges succeed for ease of development (still add in error handling to account for times it doesn’t).

### Set up order endpoints

Add the logic for handling CRUD operations related to orders.

### Document the API

Document the API you have built by adding and configuring Swagger to your project.