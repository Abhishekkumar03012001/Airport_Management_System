# Airport_Management_System
This repository contains a database schema and related files for managing employee information, contact details, and office bookings. It provides a platform for tracking employee data, managing their contacts, and reserving office spaces.
DATABASE README

=================
Table of Contents
=================

1. Introduction
2. Schema
3. Usage
4. Example Queries
5. Additional Notes

==================
1. Introduction
==================

This database is designed to store information about employees, their contacts, and office bookings. It provides a platform for managing employee details and tracking office reservations.

==================
2. Schema
==================

The database consists of the following tables:

- EMPLOYEE: Contains information about employees, such as employee_id, name, designation, and office_id.
- E_CONTACT: Stores contact details for employees, including employee_id, email, and phone number.
- BOOKING: Keeps track of office bookings, with booking_id, office_id, employee_id, start_date, and end_date.

The tables are related through foreign key constraints, ensuring data integrity and enabling efficient querying.

==================
3. Usage
==================

To use this database, you can perform standard SQL operations, including:

- Inserting new employee records into the EMPLOYEE table.
- Adding contact details for employees in the E_CONTACT table.
- Creating bookings in the BOOKING table to reserve offices.
- Updating employee information, contact details, or booking records.
- Querying the database to retrieve specific information or generate reports.

Please refer to your specific database management system's documentation for detailed instructions on how to interact with the database using SQL.

==================
4. Example Queries
==================

Here are a few example queries that can be executed against this database:

- Retrieve all employees:
- SELECT * FROM EMPLOYEE;
- Get the contact details of an employee:
- SELECT * FROM E_CONTACT WHERE employee_id = <employee_id>;
- Find all bookings for a specific office:
- SELECT * FROM BOOKING WHERE office_id = <office_id>;
- Get the office bookings for a particular employee:
- SELECT * FROM BOOKING WHERE employee_id = <employee_id>;

==================
5. Additional Notes
==================

- Ensure that proper backup and security measures are in place to protect the database from unauthorized access or data loss.
- Regularly maintain and update the database to ensure optimal performance.
- Customize and modify the database schema based on your specific requirements.

For any further assistance or troubleshooting, please consult the database administrator or refer to the relevant database documentation.

