# Project Development Plan

## Sprint 1

Understand the project requirements and objectives.
Set up the project repository and development environment.
Design and implement the database schema using PostgreSQL and Sequelize.
Implement the user authentication and authorization system.
Create the basic UI design using React and Bootstrap.
Implement the REST API using Node.js and Express.
Write unit tests using Mocha and Chai.
Test API endpoints using Postman.

## Sprint 2

Implement the lessons catalog and booking system.
Implement the instructor scheduling and availability system.
Integrate the payment system.
Write integration tests using Postman.
Implement social media and chat integrations using Google, Facebook, and Discord APIs.

## Sprint 3

Implement the progress reports and analytics system.
Implement the contracts and tax data management system.
Write end-to-end tests using Selenium.
Improve UI design and user experience.
Perform load testing and optimize performance.
Prepare for deployment.
In terms of the technology stack, most of the required technologies are already in the developer's stack. However, some additional technologies may need to be learned, such as Sequelize, Google, Facebook, and Discord APIs.

To address the potential issue of scalability and data security, we will implement the use of load balancers and firewalls. We will also ensure that the API is secure and scalable by designing and implementing it using RESTful principles.

Overall, our development plan is designed to ensure that we create a high-quality, scalable, and secure language tutoring web app that meets the project requirements and provides value to its users. We will use an agile development approach, with regular sprints and continuous improvement

## Guiding Questions

1. What are the different types of users that can use the system?

    The system supports two types of users: students and instructors.

2. What are the personal details collected about a user?

    The system collects various personal details about a user, including first name, last name, email address, phone number, social media handles, birthdate, identification type and number, passport series (if applicable), and user type (instructor or student).

3. What kind of relationship exists between a user and their addresses?

    A user can have multiple addresses, and each address is associated with a user through a foreign key in the addresses table that references the user_id column in the users table.

4. What are the different types of lessons that an instructor can offer?


    An instructor can offer lessons in any language they are proficient in, and each lesson is associated with a subject (e.g., grammar, vocabulary, pronunciation), a goal, and a language.

5. What details does a lesson include?

    Each lesson includes details such as the start and end time, service charge, payment amount and status, subject, goal, language, and instructor and student notes.

6. What are lesson plans?

    Lesson plans are descriptions of the topics that an instructor intends to cover during a lesson.

7. How do lesson plans relate to lessons?

    Each lesson can have one or more associated lesson plans, and each lesson plan is associated with a lesson through a foreign key in the lesson_plans table that references the lesson_id column in the lessons table.

8. How do instructors indicate their availability?

    Instructors can specify their availability for lessons by indicating which days of the week and times of day they are available to teach. This information is stored in the instructor_availability table.

9. What is the lessons catalog?

    The lessons catalog is a collection of lessons that instructors have made available for students to book.

10. What are the different types of progress reports that students can receive?

    Students can receive progress reports on their overall performance or their performance in a particular subject. Each progress report is associated with a subject, a progress score, and a timestamp.

11. How are taxes and contracts related to users?

    Taxes and contracts are associated with a user through a foreign key in the tax_data and contracts tables that reference the user_id column in the users table. The tax_data table stores information about the taxes paid by the user, while the contracts table stores information about contracts that the user has signed.

## Technical Conceptual Model

## Entity Relationship Diagram

    The entities involved in the language tutoring web app are users, addresses, lessons, lesson_plans, instructor_availability, lessons_catalog, bookings, progress_reports, tax_data, and contracts. The relationships between the entities are as follows:

    1. Users have a one-to-many relationship with addresses, lessons, instructor_availability, lessons_catalog, bookings, progress_reports, tax_data, and contracts.
    
    2. Lessons have a many-to-one relationship with users and instructor_availability, and a one-to-many relationship with bookings and progress_reports.

    3. Bookings have a many-to-one relationship with users and lessons.

    4. Instructor_availability has a many-to-one relationship with users.

    5. Lessons_catalog has a many-to-one relationship with users.

    6. Progress_reports have a many-to-one relationship with users and lessons.

    7. Contracts have a many-to-one relationship with users.

    8. Each entity has its own set of attributes. The attributes associated with each entity are as follows:

    9. Users: user_id, first_name, last_name, email, phone_number, social_media_handles, birthdate, identification_type, identification_number, passport_series, user_type

    10. Addresses: address_id, user_id, address_line1, address_line2, city, state, country, zip_code

    11. Lessons: lesson_id, user_id, instructor_id, start_time, end_time, service_charge, payment_amount, payment_status, subject, goal, language, notes, direct_messages, rating, feedback

    12. Lesson_plans: plan_id, lesson_id, title, description

    13. Instructor_availability: availability_id, instructor_id, day_of_week, start_time, end_time

    14. Lessons_catalog: catalog_id, user_id, subject, description, price

    15. Bookings: booking_id, lesson_id, user_id, start_time, end_time, payment_amount, payment_status, booking_status, booking_progress

    16. Progress_reports: report_id, user_id, subject, progress, timestamp

    17. Tax_data: tax_id, user_id, tax_amount, timestamp

    18. Contracts: contract_id, user_id, contract_details, timestamp

The entities are used to implement the features of the web app as follows:

    - Users are used to store information about the users of the web app.
    - Addresses are used to store information about the addresses of the users.
    - Lessons are used to store information about the lessons created by users.
    - Lesson_plans are used to store information about the lesson plans created by users.
    - Instructor_availability is used to store information about the availability of instructors.
    - Lessons_catalog is used to store information about the lessons offered by users.
    - Bookings are used to store information about the bookings made by users.
    - Progress_reports are used to store information about the progress reports of users.
    - Tax_data is used to store information about the tax data of users.
    - Contracts are used to store information about the contracts of users.
    - Data is stored and retrieved in the web app using SQL queries. The queries are executed on the database to retrieve the required information.
    - Users are authenticated and authorized to access the web app by logging in with their credentials. Their credentials are verified against the information stored in the database.
    - Lessons are created by users and booked by other users. Progress reports are generated by users after a lesson has been completed. All this information is stored in the database and can be retrieved using SQL queries.
    - Instructors are scheduled by users based on their availability, which is stored in the database.
    - The payment system is integrated with the web app using payment APIs. Users can make payments for bookings and lessons through the payment system.
    - Contracts and tax data are managed in the web app by storing the information in the database.

## Schema

The following tables are used in the database:

1. users - contains information about users, including their first name, last name, email, phone number, social media handles, birthdate, identification type and number, passport series, and user type.

2. lessons - contains information about lessons, including the user who created the lesson, the instructor for the lesson, the start and end times, the service charge, payment amount, payment status, subject, goal, language, notes, direct messages, rating, and feedback.

3. bookings - contains information about bookings, including the lesson being booked, the user who made the booking, the start and end times, payment amount, payment status, booking status, and booking progress.
progress_reports - contains information about progress reports, including the user, subject, progress, and timestamp.

4. progress_reports - contains information about progress reports, including the user, subject, progress, and timestamp.

5. tax_data - contains information about tax data, including the user, tax amount, and timestamp.

6. contracts - contains information about contracts, including the user, contract details, and timestamp.

## API Documentation

The following endpoints are available:

    GET /users - returns a list of all users
    GET /users/:id - returns a specific user by ID
    POST /users - creates a new user
    PUT /users/:id - updates a user by ID
    DELETE /users/:id - deletes a user by ID
    GET /lessons - returns a list of all lessons
    GET /lessons/:id - returns a specific lesson by ID
    POST /lessons - creates a new lesson
    PUT /lessons/:id - updates a lesson by ID
    DELETE /lessons/:id - deletes a lesson by ID
    GET /bookings - returns a list of all bookings
    GET /bookings/:id - returns a specific booking by ID
    POST /bookings - creates a new booking
    PUT /bookings/:id - updates a booking by ID
    DELETE /bookings/:id - deletes a booking by ID
    GET /progress-reports - returns a list of all progress reports
    GET /progress-reports/:id - returns a specific progress report by ID
    POST /progress-reports - creates a new progress report
    PUT /progress-reports/:id - updates a progress report by ID
    DELETE /progress-reports/:id - deletes a progress report by ID

## Data Flow Diagram

    The data flow diagram for the language tutoring web app is as follows:

    1. The user logs in to the web app using their credentials.
    2. The user creates a lesson.
    3. The user schedules the lesson.
    4. The user books the lesson.
    5. The user pays for the lesson.
    6. The user creates a progress report after the lesson has been completed.
    7. The user creates a tax data entry after the lesson has been completed.
    8. The user creates a contract after the lesson has been completed.

## Class Diagram

    The class diagram for the language tutoring web app is as follows:

    1. The user class contains the attributes user_id, first_name, last_name, email, phone_number, social_media_handles, birthdate, identification_type, identification_number, passport_series, and user_type.
    2. The address class contains the attributes address_id, user_id, address_line1, address_line2, city, state, country, and zip_code.
    3. The lesson class contains the attributes lesson_id, user_id, instructor_id, start_time, end_time, service_charge, payment_amount, payment_status, subject, goal, language, notes, direct_messages, rating, and feedback.
    4. The lesson_plan class contains the attributes plan_id, lesson_id, title, and description.
    5. The instructor_availability class contains the attributes availability_id, instructor_id, day_of_week, start_time, and end_time.
    6. The lessons_catalog class contains the attributes catalog_id, user_id, subject, description, and price.
    7. The booking class contains the attributes booking_id, lesson_id, user_id, start_time, end_time, payment_amount, payment_status, booking_status, and booking_progress.
    8. The progress_report class contains the attributes report_id, user_id, subject, progress, and timestamp.
    9. The tax_data class contains the attributes tax_id, user_id, tax_amount, and timestamp.
    10. The contract class contains the attributes contract_id, user_id, contract_details, and timestamp.

## Activity Diagram

    The activity diagram for the language tutoring web app is as follows:

    1. The user logs in to the web app using their credentials.
    2. The user creates a lesson.
    3. The user schedules the lesson.
    4. The user books the lesson.
    5. The user pays for the lesson.
    6. The user creates a progress report after the lesson has been completed.
    7. The user creates a tax data entry after the lesson has been completed.
    8. The user creates a contract after the lesson has been completed.

## Sequence Diagram

    The sequence diagram for the language tutoring web app is as follows:

    1. The user logs in to the web app using their credentials.
    2. The user creates a lesson.
    3. The user schedules the lesson.
    4. The user books the lesson.
    5. The user pays for the lesson.
    6. The user creates a progress report after the lesson has been completed.
    7. The user creates a tax data entry after the lesson has been completed.
    8. The user creates a contract after the lesson has been completed.

## Use Case Diagram

    The use case diagram for the language tutoring web app is as follows:

    1. The user logs in to the web app using their credentials.
    2. The user creates a lesson.
    3. The user schedules the lesson.
    4. The user books the lesson.
    5. The user pays for the lesson.
    6. The user creates a progress report after the lesson has been completed.
    7. The user creates a tax data entry after the lesson has been completed.
    8. The user creates a contract after the lesson has been completed.

## User Interface Design

    The user interface design for the language tutoring web app is as follows:

    1. The user logs in to the web app using their credentials.
    2. The user creates a lesson.
    3. The user schedules the lesson.
    4. The user books the lesson.
    5. The user pays for the lesson.
    6. The user creates a progress report after the lesson has been completed.
    7. The user creates a tax data entry after the lesson has been completed.
    8. The user creates a contract after the lesson has been completed.

## Implementation Plan

To implement the language tutoring web app, I will use the following technologies:

    1. HTML - to create the web pages
    2. CSS - to style the web pages
    3. JavaScript - to add interactivity to the web pages
    4. Node.js - to create the web server
    5. Express.js - to create the web application framework
    6, PostgreSQL - to create the database
    7. Sequelize - to create the ORM
    8. React.js - to create the front-end
    9. Redux - to create the state container
    10. React Router - to create the routing
    11. Axios - to create the HTTP client
    12. Bootstrap - to create the front-end framework
    13. Git - to create the version control system
    14. GitHub - to create the remote repository
    15. Netlify - to create the web hosting service
    16. GitHub Projects - to create the project management tool
    17. Mocha - to create the unit testing framework
    18. Chai - to create the assertion library
    19. Visual Studio Code - implement the code
    20. Microsoft Edge - to test the web app
    21. Postman - to test the API
    22. Draw.io - to create the diagrams
    23. DB Designer - to create the database design
    24. Swagger - to create the API documentation
    25. WebSockets - to create the real-time communication
    26. SQL - to create queries outside of the ORM (Sequelize) for query optimization purposes to reduce overhead and increase performance and scalability. The controller will be responsible for executing the SQL queries and switch when to use the ORM and when to use custom SQL.
    27. Backend and feature testing with automated testing tools such as Selenium, Cypress, and Puppeteer or manual testing with Postman.
    28. Frontend testing with automated testing tools such as Jest.
    32. Developer tools such as Microsoft Edge Developer Tools, Google Chrome Developer Tools, and Firefox Developer Tools to test the web app.
    33. Browser extensions such as React Developer Tools, Redux DevTools, and Redux Logger to test the web app.
    34. Browser extensions such as Wappalyzer, WhatRuns, and BuiltWith to test the web app.
    35. Test-driven development (TDD) design methodology to create the web app.
    36. Agile software development methodology to create the web app.
    37. Babalon.js - to create the build tool
    38. Handlebars.js - to create the template engine
    39. curl - to test the API
    40. OAuth 2.0 - to create the authentication and authorization protocol
    41. Bcrypt - to create the password hashing function
    42. Session authentication with Node.js and Express.js - to create the authentication and authorization protocol
    43. JSX - to create the front-end
    44. OpenAPI - to create the API documentation
    45. 
