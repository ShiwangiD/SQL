-- WINDOW FUNCTIONS :== window functions, also known as analytic functions allow
-- you to perform calculations across a set of rows related to the current row.

-- Defined by an OVER() clause.

select * from employee;

select fname,salary,
  sum(salary) OVER()
  from employee;


select fname,salary,
  sum(salary) OVER(ORDER BY salary)
  from employee;


  -- ### Benifits of Window functions :==

  -- * Advanced analytics :== they enable complex calculations
  -- like running totals, moving averages, rank calculations, and cummulative distributions.

  -- * Non- Aggregating :== Unlike aggrigate functions,
  -- window functions do not collapse rows. This means you can
  -- valculate aggregate while retaining individual row details.

  -- * Flexibility :== They can be used in various clauses of SQL, 
  -- such as SELECT,ORDER BY, and HAVING,providing alot of flexibility in writing queries.


  -- ## PreDefined Functions :==
 -- 1. ROW_NUMBER()
 -- 2. RANK()
 -- 3. DENSE_RANK()
 -- 4. LAG()
 -- 5. LEAD()


SELECT 
    ROW_NUMBER() OVER(),
	 fname,salary
	 FROM employee;


	 SELECT 
    ROW_NUMBER() OVER(ORDER BY fname),
	 fname,dept,salary
	 FROM employee;

	  SELECT 
    ROW_NUMBER() OVER(PARTITION BY dept),
	 fname,dept,salary
	 FROM employee;


	  SELECT 
	    fname,salary,
	 RANK() OVER(ORDER BY salary DESC)
	 FROM employee;


      SELECT 
	    fname,salary,
	DENSE_RANK() OVER(ORDER BY salary DESC)
	 FROM employee;


 SELECT 
	    fname,salary,
	 LAG(salary) OVER()
	 FROM employee;


 SELECT 
	    fname,salary,
	 LEAD(salary) OVER()
	 FROM employee;


 SELECT 
	    fname,salary,
	 LEAD(salary) OVER(ORDER BY salary)
	 FROM employee;
	 

	  SELECT 
	    fname,salary,
	 (salary -LEAD(salary) OVER(ORDER BY 
	 salary DESC)) as salary_diff
	 FROM employee;



	 