-- RELATIONSHIP :==	In SQL, a relationship refers to the connection between two or more tables based on a common column 
-- (usually a key). Relationships allow you to combine data from multiple tables efficiently.

-- TYPES OF RELATIONSHIP :== 1. ONE TO ONE ,2. ONE TO MANY AND 3. MANY TO MANY.

-- ONE TO MANY :==

-- PRIMARY KEY :==  uniquely identifies each row in a table.
--  1. Unique: No two rows can have the same value in the primary key column(s).
--  2. Not Null: A primary key cannot have NULL values.
-- 3. One per Table: Each table can have only one primary key.

-- FOREIGN KEY :== A Foreign Key in SQL is a column (or set of columns) in one table that refers to the primary key of another table, 
-- creating a link (relationship) between the two tables.

--  1.Establishes Relationships: Connects two tables (e.g., one-to-many).
--  2.Data Integrity: Ensures that values in the foreign key column exist in the referenced table.
--  3.Can have duplicates: Multiple rows in the child table can refer to the same row in the parent table.
--  4.Can allow NULL (unless specified NOT NULL).


CREATE DATABASE STORE_DB;

CREATE TABLE customers(
cust_id SERIAL PRIMARY KEY,
cust_name varchar(100) NOT NULL
);

INSERT INTO customers (cust_name) VALUES
('Alice'),
('Bob'),
('Charlie'),
('David');

CREATE TABLE orders(
ord_id SERIAL PRIMARY KEY,
ord_date DATE  NOT NULL,
price NUMERIC NOT NULL,
cust_id INTEGER NOT NULL,
FOREIGN KEY (cust_id) REFERENCES customers (cust_id));

INSERT INTO orders (ord_date, price, cust_id) VALUES
('2026-04-01', 250.50, 1),
('2026-04-02', 150.00, 2),
('2026-04-03', 300.75, 3),
('2026-04-04', 500.00, 1);

select * from customers;
select * from orders;




-- JOIN :== Operation is used to combine rows from two or more tables based on a related column between them.
-- TYPES OF JOIN : 1. CROSS JOIN ,2.INNER JOIN, 3.LEFT JOIN AND 4.RIGHT JOIN.

-- CROSS JOIN :== Every row from one table is combined with every row from another table.

select * from customers cross join orders;

-- INNER JOIN :== Return only the rows where there is a match between the specified column in both the 
-- left(or first) and right (or second) tables.

 SELECT * FROM customers c INNER JOIN orders o
 ON c.cust_id=o.cust_id;

  SELECT c.cust_name, COUNT(o.ord_id) FROM customers c INNER JOIN orders o
 ON c.cust_id=o.cust_id GROUP BY cust_name;
 
 SELECT c.cust_name, SUM(o.price) FROM customers c INNER JOIN orders o
 ON c.cust_id=o.cust_id GROUP BY cust_name;


 -- LEFT JOIN :== Return all rows from the left(or first) table and the matching rows from the right (or second) tables.

 SELECT * FROM customers c
 LEFT JOIN orders o
 ON c.cust_id=o.cust_id;


 -- RIGHT JOIN :==  Return all rows from the right(or first) table and the matching rows from the left (or second) tables.

 SELECT * FROM customers c
 RIGHT JOIN orders o
 ON c.cust_id=o.cust_id;


 -- MANY TO MANY :== A Many-to-Many (M:N) relationship in SQL is
 -- used when multiple rows in one table can relate to multiple rows in another table.

-- ##  Why Use Many-to-Many?
-- 1. Represents complex relationships
--     Example: Students can enroll in multiple courses, and each course can have multiple students.
-- 2. Avoids data duplication
--       Without M:N, you’d have to repeat data in one table, which wastes space and can cause inconsistencies.
-- 3. Maintains data integrity
--       Using a junction (bridge) table, you can enforce foreign keys for both sides.
--  4.Flexible querying
--   1.You can easily find:
--     i) All students in a course
--     ii) All courses a student is enrolled in


create database institute;

 

   

	   