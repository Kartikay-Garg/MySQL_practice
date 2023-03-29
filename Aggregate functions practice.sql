SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;
SELECT 
    COUNT(salary)
FROM
    salaries;
SELECT 
    COUNT(from_date)
FROM
    salaries;
SELECT 
    COUNT(DISTINCT salary)
FROM
    salaries;
SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
SELECT 
    COUNT(*)
FROM
    salaries;
# How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
select count(distinct dept_no) from dept_emp;

select sum(salary) from salaries;
# What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
select sum(salary) from salaries where from_date > '1997-01-01';

select max(salary) from salaries;
select min(salary) from salaries;
# 1. Which is the lowest employee number in the database?
select min(emp_no) from employees;
# 2. Which is the highest employee number in the database?
select max(emp_no) from employees;

select AVG(salary) from salaries;
# What is the average annual salary paid to employees who started after the 1st of January 1997?
select avg(salary) from salaries where from_date > '1997-01-01';

select round(AVG(salary)) from salaries;
select round(AVG(salary),2) from salaries;
# Round the average amount of money spent on salaries for all contracts that started after the 1st of January 1997 to a precision of cents.
select round(avg(salary),2) from salaries where from_date > '1997-01-01';


select * from departments_dup order by dept_no;
alter table departments_dup
modify column dept_name varchar(40) ;
alter table departments_dup
modify column dept_no char(4) ;
insert into departments_dup (dept_no) values ('d011');
insert into departments_dup (dept_no) values ('d012');
alter table departments_dup add dept_manager varchar(40);
select dept_no, ifnull(dept_name, 'department name not provided') as dept_name from departments_dup;
select dept_no, coalesce(dept_name, 'department name not provided') as dept_name from departments_dup;
select dept_no,dept_name,coalesce(dept_manager,dept_name,'N/A') as dept_manager from departments_dup order by dept_no asc;
select dept_no,dept_name,coalesce('department manager name') as fake_col from departments_dup;
# Select the department number and name from the ‘departments_dup’ table and
# add a third column where you name the department number (‘dept_no’) as ‘dept_info’.
# If ‘dept_no’ does not have a value, use ‘dept_name’.
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

# Modify the code obtained from the previous exercise in the following way.
# Apply the IFNULL() function to the values from the first and second column,
# so that ‘N/A’ is displayed whenever a department number has no value, and ‘Department name not provided’ 
# is shown if there is no value for ‘dept_name’.

SELECT 
    IFNULL(dept_no, 'N/A') AS dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;











