 -- case :==  CASE statement is used to add conditional logic to your queries—basically like an if-else statement in programming.

select * from employee;

select fname,salary,
case
when salary >= 50000 then 'high'
else 'low'
end as sal_cat from employee;


SELECT fname, salary,
       CASE
           WHEN salary >= 50000 THEN 'high'
           WHEN salary >= 40000 THEN 'mid'
           ELSE 'low'
       END AS sal_cat
FROM employee;

-- between :== BETWEEN is used to filter values within a range (inclusive of both start and end values).

select fname,salary,
       case
	     when salary >= 550000 then 'high'
		 when salary between 45000 and 55000 then 'mid'
		 else 'low'
	end as sal_cat
	  from employee;



	  -- 1.Task : add bonus column 

	  
	  select fname, salary,
	  case 
	   when salary > 0 then round(salary * 0.10)
	   end as bonus
	   from employee;
	   select * from employee;

	   -- 2. Task : how many empolyee are mid salary  bonus and low salary bonus .
	   select
	     case 
		   when salary >55000 then 'high'
		   when salary between 48000 and 55000 then 'mid'
		   else 'low'
		   end as sal_cat, count(emp_id)
		   from employee
		   group by sal_cat;
		   

