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

#### Semantic Commit Messages

Semantic commit messages have been implemented to document your changes. The commit message should be structured as follows:

    <type>[optional scope]: <description>

    [optional body]

    [Optional footer]

The commit message consists of a header, a body, and a footer. The header is mandatory and the scope of the header is optional. The body and footer are optional and should be used to clarify the commit if necessary.

The header is the most important part of the commit message. It contains a succinct description of the change. The header is a single line that contains a type, an optional scope, and a description.

The type is contained within the header and can be one of these types:

- feat: a new feature
- fix: a bug fix
- docs: changes to documentation
- style: formatting, missing semi colons, etc; no code change
- refactor: refactoring production code
- test: adding tests, refactoring test; no production code change
- chore: updating build tasks, package manager configs, etc; no production code change

The scope is contained within parenthesis after the type and describes the affected code. For example, `(users)`.
The description is a short description of the change.

The body should include the motivation for the change and contrast this with previous behavior.

The footer should contain any information about Breaking Changes and is also the place to reference GitHub issues that this commit Closes.

Example commit messages for each type:

    feat: create a new user endpoint /api/users

    feat(users): create a new user endpoint /api/users

    fix: fix a bug in the login endpoint

    fix(users): fix a HTTP status code in the login endpoint

    docs: add `change` to the README

    docs(users): update users documentation

    style: fix formatting in the login endpoint

    style(users): fix formatting in the login endpoint

    refactor: refactor the login endpoint

    refactor(users): refactor the login endpoint

    test: add tests for the login endpoint

    test(users): add tests for updating a user

    chore: update dependencies

    chore(users): update dependencies

### Setup an express server

Create a directory for your project and set up a basic Express server and run `npm init` to create a `package.json` file. Add the necessary dependencies to your `package.json` file.

### Database Design

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

You will need to create a PostgreSQL database and tables to store the data for this application. You can use the `psql` command line tool to create the database and tables.

There are three sql files in the `src/model/querries` directory that you can use to create the database and tables. You can run these files using the `psql` command line tool or copy and paste the queries into a SQL editor and run them there.

### Connect the app and database

The application is able to interface with the PostgreSQL database. The connection is made using the `pg` package.
You can set the environment variables in the `.env` file. The `.env` file is not tracked by Git, so you will need to create it yourself. The `.env` file should contain the same variables as the `.env.example` file.

The connection is logged to the console when the application starts.
Anytime a query is made to the database, the query is logged to the console.

### Planed API endpoints

The API endpoints that will be used in retrieving data from the database:

1. GET /students - retrieves a list of all students
2. GET /students/:id - retrieves information about a specific student identified by id
3. GET /students/:id/lessons - retrieves a list of lessons associated with the student identified by id

4. GET /teachers - retrieves a list of all teachers
5. GET /teachers/:id - retrieves information about a specific teacher identified by id
6. GET /teachers/:id/lessons - retrieves a list of lessons associated with the teacher identified by id

7. GET /lessons - retrieves a list of all lessons
8. GET /lessons/:id - retrieves information about a specific lesson identified by id

9. GET /schedules - retrieves a list of all schedules
10. GET /schedules/:id - retrieves information about a specific schedule identified by id

11. GET /bookings - retrieves a list of all bookings
12. GET /bookings/:id - retrieves information about a specific booking identified by id
13. GET /bookings/:id/payments - retrieves payment information associated with the booking identified by id

### TODO

#### For Teachers:

- POST /lessons: Create a new lesson for a student, including booking and payment info.
- PUT /lessons/:id: Update an existing lesson for a student, including booking and payment info.
- DELETE /lessons/:id: Delete a lesson for a student, including booking and payment info.
- For Students:

- GET /lessons: Get a list of all upcoming lessons for the student.
- GET /lessons/:id: Get details for a specific lesson, including booking and payment info.
- POST /payments: Submit a new payment for a specific lesson.
- GET /payments: Get a list of all past payments for the student.
- GET /payments/:id: Get details for a specific payment.

#### For authentication and authorization:

- POST /login: Authenticate a user and return a session token.
- POST /logout: Invalidate the current session token and log out the user.
- POST /register: Create a new user account with appropriate roles and permissions.

#### Student Authentication Endpoints

- POST /api/student/login
- POST /api/student/register
- POST /api/student/forgot_password
- POST /api/student/reset_password

#### Teacher Authentication Endpoints

- POST /api/teacher/login
- POST /api/teacher/register
- POST /api/teacher/forgot_password
- POST /api/teacher/reset_password

#### Lesson Creation Endpoints

- POST /api/lesson (for teacher to create a lesson)

#### Lesson Booking Endpoints

- GET /api/availability?teacher_id=<teacher_id>&date=<date> (to get available slots for a selected teacher in a - given date)
- POST /api/booking (for student to book a lesson)
- PATCH /api/booking/<booking_id> (for student to update a booking)
- DELETE /api/booking/<booking_id> (for student to cancel a booking)

#### Payment Endpoints

- POST /api/payment (for student to make a payment)
- GET /api/payment/<payment_id> (to get payment details)
- Calendar Endpoints
- GET /api/calendar/student (to get student's past and upcoming lessons)
- GET /api/calendar/teacher (to get teacher's past and upcoming lessons)

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
