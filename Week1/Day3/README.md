
&#x20;SQL Joins Practice Queries (Students–Courses–Instructors Database)

&#x20;Introduction

This repository contains a collection of SQL JOIN practice queries designed to improve understanding of relational database operations using a sample database consisting of:



Students

Courses

Enrollments

Instructors

The queries focus mainly on:



\- SQL JOIN Operations

\- Many-to-Many Relationships

\- Handling NULL Values

\- Database Relationship Understanding

\- Interview-Oriented SQL Practice



\# Database Schema

\## Students Table

Column Name	Description

student\_id	Primary Key

student\_name	Student Name

email	Student Email

\## Instructors Table

Column Name	Description

instructor\_id	Primary Key

instructor\_name	Instructor Name

department	Instructor Department

\## Courses Table

Column Name	Description

course\_id	Primary Key

course\_name	Course Name

instructor\_id	Foreign Key referencing Instructors

\## Enrollments Table

Column Name	Description

enrollment\_id	Primary Key

student\_id	Foreign Key referencing Students

course\_id	Foreign Key referencing Courses

enrollment\_date	Enrollment Date

🔗 Database Relationships

Instructors

&#x20;    ↑

&#x20;    |

&#x20; Courses

&#x20;    ↑

&#x20;    |

Enrollments

&#x20;    ↑

&#x20;    |

&#x20;Students

\# SQL Concepts Covered

\## INNER JOIN

Retrieve matching records between related tables.



\## LEFT JOIN

Retrieve all rows from the left table including unmatched rows.



\## RIGHT JOIN

Retrieve all rows from the right table including unmatched rows.



\## FULL OUTER JOIN

Retrieve all matching and unmatched rows from both tables.



\## CROSS JOIN / Cartesian Join / Product Join

Generates every possible combination of rows.



\## SELF JOIN

Join a table with itself.



\## NATURAL JOIN

Automatically joins using columns with the same name.



\# Topics Practiced

INNER JOIN

LEFT JOIN

RIGHT JOIN

FULL OUTER JOIN

CROSS JOIN

SELF JOIN

NATURAL JOIN



\#Learning Outcomes

By completing these JOIN queries, i have gained practical understanding of:



&#x20;-Relational database design

&#x20;-JOIN operations in SQL

&#x20;-Handling unmatched records

&#x20;-Working with many-to-many relationships

&#x20;-Real-world database querying

&#x20;-SQL interview problem solving
