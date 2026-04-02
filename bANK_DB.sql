create table employee (
emp_id serial primary key,
fname varchar(50) not null,
lname varchar(50) not null,
email varchar(100) not null unique,
dept varchar(50),
salary decimal(10,2) default 30000.00,
hire_date date not null default current_date
);
select * from employee;

insert into employee(emp_id,fname,lname,email,dept,salary,hire_date)
  values
 
  (1,'lovely','dubey','lovelydubey123@gmail.com','hr',100000,'2026-01-15'),
   (2,'nikita','dubey','nikitadubey123@gmail.com','IT',1000000,'2025-03-15'),
    (3,'yashasvi','sharma','yashasvi123@gmail.com','hr',100000,'2024-02-15'),
	 (4,'shruti','rai','shruti123@gmail.com','hr',500000,'2023-04-15'),
	  (5,'shreshi','panday','shreshi123@gmail.com','hr',50000,'2022-05-15'),
	   (6,'shivanya','tripathi','shivanya123@gmail.com','hr',60000,'2021-06-15'),
	    (7,'shikha','driwedi','shikha123@gmail.com','hr',30000,'2020-07-15'),
		 (8,'shivi','mishra','shivi123@gmail.com','hr',40000,'2024-08-15');

		-- INSERT VALUES IN TABLE  :==

INSERT INTO employee (emp_id, fname, lname, email, dept, salary, hire_date)
VALUES (9, 'Rahul', 'Sharma', 'rahul@gmail.com', 'IT', 50000, '2024-01-01');

INSERT INTO employee (fname, lname, email, dept)
VALUES ('Rani', 'Sharma', 'rani@gmail.com', 'IT');

-- SHOW ALL TABLE DETAILS 

select * from employee;

-- WHERE CLAUSE :== USE FOR CONDITIONS 

select * from employee where fname = 'nikita';
select * from employee where emp_id =5;
select * from employee where dept = 'HR';


select * from employee where fname='lovely';
select * from employee where dept='hr';
select * from employee where dept = 'IT';
select * from employee where salary>=60000 and dept ='hr';
select * from employee where salary>=60000 or dept ='hr';

select * from employee where dept in('it','hr');
select * from employee where dept not in('IT','hr');
select * from employee where salary between 40000 and 65000;

-- DISTINCT :== The DISTINCT keyword is used to remove duplicate values from the result.

select dept from employee;
select distinct dept from employee;

-- ORDER BY :== The ORDER BY clause is used to sort the result set based on one or more columns.
-- ASC → Ascending order (default)
-- DESC → Descending order

select * from employee order by fname;
select * from employee order by lname;
select * from employee order by fname desc;
select * from  employee order by emp_id desc;

-- LIMIT :== The LIMIT clause is used to restrict the number of rows returned in a query.

select * from employee limit 3;

-- LIKE :=The LIKE operator is used to search for a pattern in a column.

select * from employee where fname like 'n%';
select * from employee where lname like '%a';
