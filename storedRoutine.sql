-- STOREED ROUTING :== An SQL statement or a set of sql statement 
-- that can be stored on database server which can be call no. of times.


-- types of stored routine :==
-- 1. Stored Procedure
-- 2. User defined Functions

-- 1. Stored Procedure :== Set of SQL statements and procedural logic
-- that can perform operations such as inserting, updating,deleting,
-- and querying data.

-- Syntax :==
--     CREATE OR REPLACE PROCEDURE procedure_name (parameter_name parameter_type,...)
-- 	LANGUAGE plpgsql
-- 	AS $$
-- 	BEGIN
-- 	  -- procedural code here
-- 	 END;
-- 	 $$;

-- here $$; (delimeter)



CREATE OR REPLACE PROCEDURE update_emp_salary (
p_employee_id INT,
p_new_salary NUMERIC
)
	LANGUAGE plpgsql
	AS $$
	BEGIN
	 UPDATE employee
	 SET salary = p_new_salary
	 WHERE emp_id = p_employee_id;
	 END;
	 $$;


select * from employee;

UPDATE employee
   SET salary = 97000
  WHERE emp_id = 4;
  CALL update_emp_salary(3,71000);



  -- 2. USER DEFINE FUNCTION :==  custom function created by the user to perform specific operations and return a value.

 --  syntax :==  
 --     CREATE OR REPLACE FUNCTION function_name(parameters)
	--  RETURNS return_type AS $$
	--  BEGIN 
	--   -- function body (sql statements)
	--   RETURN some_value; -- for scalar functions
	-- END;
	-- $$ LANGUAGE plpbsql




-- Find name of the employees in each department having maximum salary.

select dept, max(salary) from
employee
 group by dept;

 -- ## subQuery :==

   select 
      e.emp_id,
	  e.fname,
	  e.salary
	from
	employee e
	where e.dept = 'hr'
	and e.salary = (
       select max(emp.salary)
       from employee emp
       where emp.dept = 'hr'
	);


	CREATE OR REPLACE FUNCTION dept_max_sal_emp1(dept_name VARCHAR)
	RETURNS TABLE(emp_id INT,fname VARCHAR,salary NUMERIC)
	AS $$
	BEGIN
	  RETURN QUERY
	  SELECT
	    e.emp_id, e.fname,e.salary
	FROM
	  employee e
	  WHERE
	   e.dept = dept_name
	  AND e.salary = (
          SELECT MAX(emp.salary)
		  FROM employee emp
		  WHERE emp.dept = dept_name
	  );
	END;
	$$ LANGUAGE plpgsql;

	select * from dept_max_sal_emp1('hr');
	



	
	 