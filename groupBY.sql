-- HAVING :== The HAVING clause in SQL is used to filter grouped data (after using GROUP BY).
-- 1.WHERE → filters rows before grouping
-- 2.HAVING → filters groups after grouping

SELECT p_name, sum(total_price) from billing_info
       GROUP BY p_name;

SELECT p_name, sum(total_price) from billing_info
       GROUP BY p_name
	   HAVING SUM(total_price) > 1500;


-- GROUP BY ROLLUP :== GROUP BY ROLLUP in SQL is used to create subtotals and a grand total along with grouped data. 
-- It’s an extension of GROUP BY.

SELECT p_name, sum(total_price) from billing_info
       GROUP BY ROLLUP(p_name)
	   ORDER BY SUM(total_price);


-- COALESCE :== The COALESCE function in SQL is used to replace NULL values with a specified value.

SELECT
   COALESCE(p_name, 'Total'),
   SUM(total_price) from billing_info
       GROUP BY ROLLUP(p_name)
	   ORDER BY SUM(total_price);

	   




