-- CTE :==(Common Table Expression) is a temporary result set that you can define within a query to simplify complex SQL statements.

-- Syntax :==
--      WITH cte_name (optional_column_list) AS (
-- -- CTE query definition
--    SELECT ...
-- 	 )
-- 	 --Main query referencing the CTE
-- 	 SELECT...
-- 	 FROM cte_name
-- 	 WHERE ...;


select * from employee;

-- use case-1 :==
--   1. We want to calculte the average salary per department and then find
--   all employeeds whose salary is above the average salary of their department.

select dept,AVG(salary) from employee GROUP BY dept;

WITH avg_sal AS(
select dept, AVG(salary) as avg_salary from employee GROUP BY dept
)
SELECT 
e.emp_id, e.fname, e.dept, e.salary, a.avg_salary
FROM employee e
JOIN
  avg_sal a ON e.dept = a.dept;

  WITH avg_sal AS(
select dept, AVG(salary) as avg_salary from employee GROUP BY dept
)
SELECT 
e.emp_id, e.fname, e.dept, e.salary, a.avg_salary
FROM employee e
JOIN
  avg_sal a ON e.dept = a.dept
  where  
     e.salary > a.avg_salary;

	 -- Use Cases -2:
	  -- we want to find the heighest-paid employee in each department.

	   WITH max_sal AS(
select dept, max(salary) as max_salary from employee GROUP BY dept
)
SELECT 
e.emp_id, e.fname, e.dept, e.salary
FROM employee e
JOIN
  max_sal m ON e.dept = m.dept
  where  
     e.salary = m.max_salary;

	 -- Once CTE has been created it can only be used once. It will not be persisted.

-- TRIGGERS :== Trigger are special procedures in a database 
-- that automatically execute predefined actions in response to certain events on a specified table or view.

-- Syntax :==
--     CREATE TRIGGER trigger_name
-- 	{BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TURNCATE}
-- 	ON table_name
-- 	FOR EACH {ROW | STATEMENT }
-- 	EXECUTE FUNCTION trigger_function_name();



	 -- USE CASE :==
	 --      create a trigger so that
		--   If we insert/update negative salary in a table,
		--   it will be triggered and set it to O.


select emp_id,salary from employee;

call update_emp_salary(2, -52000);

create trigger before_update_salary
before update on employee
for each row
execute function check_salary();
