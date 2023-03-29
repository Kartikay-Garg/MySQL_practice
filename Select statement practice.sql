SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis' AND gender = 'M';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
   
   
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis'
        OR first_name = 'elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'denis'
        AND first_name = 'elvis';
    
    


SELECT 
    *
FROM
    employees
WHERE
    last_name = 'denis'
        AND (gender = 'M' OR gender = 'F');
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'denis';
    
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'cathie'
        OR first_name = 'mark'
        OR first_name = 'nathan';
        
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('cathie' , 'mark', 'nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('cathie' , 'mark', 'nathan');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%ar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');

SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%jack%');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';

SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN '66000' AND '70000';
    
SELECT 
    *
FROM
    salaries
WHERE
    emp_no NOT BETWEEN '10004' AND '10012' ;
    
#Select the names of all departments with numbers between ‘d003’ and ‘d006’;

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;

SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    first_name <> 'Mark';

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';

# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
# Hint: If you solve the task correctly, SQL should return 7 rows.

SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND hire_date >= '2000-01-01';
	
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;

SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees;

SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
# How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name desc;

SELECT 
    *
FROM
    employees
ORDER BY emp_no desc;

SELECT 
    *
FROM
    employees
ORDER BY first_name, last_name asc;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

SELECT DISTINCT
    first_name
FROM
    employees;
    
SELECT 
    first_name, count(first_name) as names_count
FROM
    employees
group by first_name
order by first_name desc;

# Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars.
# The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary.
# Lastly, sort the output by the first column.

SELECT 
    salary, COUNT(emp_no) AS emps_with_same_salary
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';
SELECT 
    *
FROM
    employees
HAVING hire_date >= '2000-01-01';

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

# Select all employees whose average salary is higher than $120,000 per annum.
# Hint: You should obtain 101 records.
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name ASC;

#Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
#Hint: To solve this exercise, use the “dept_emp” table.

SELECT 
    emp_no, COUNT(emp_no) AS emp_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY emp_no;

select * from salaries order by salary desc limit 10;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name desc
limit 100;

# Select the first 100 rows from the ‘dept_emp’ table. 
SELECT 
    *
FROM
    dept_emp
LIMIT 100;



















    
    
    
    
    
    
    
    
    
    
    
    
