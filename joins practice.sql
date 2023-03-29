ALTER TABLE departments_dup
DROP COLUMN dept_manager;

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);
INSERT INTO departments_dup
(dept_no,dept_name)SELECT * FROM departments;
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002'; 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');
DELETE FROM departments_dup WHERE dept_name = 'Public Relations'; 



DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES  (999904, '2017-01-01'), (999905, '2017-01-01'), (999906, '2017-01-01'), (999907, '2017-01-01');
DELETE FROM dept_manager_dup WHERE dept_no = 'd001';
INSERT INTO departments_dup (dept_name) VALUES ('Public Relations');
DELETE FROM departments_dup WHERE dept_no = 'd002'; 

select * from departments_dup order by dept_no;
select * from dept_manager_dup order by dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
select e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date from employees e inner join dept_manager dm on e.emp_no = dm.emp_no order by e.emp_no;


# duplicate records

insert into dept_manager_dup values ('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup values ('d009','Customer Service');
select * from departments_dup order by dept_no asc;
select * from dept_manager_dup order by dept_no asc;
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

delete from dept_manager_dup where emp_no = '110228';
delete from departments_dup where dept_no = 'd009';
insert into dept_manager_dup values ('110228','d003','1992-03-21','9999-01-01');
insert into departments_dup values ('d009','Customer Service');

# left join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

# left join
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY dept_no;
/*
Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch.
 See if the output contains a manager with that name.  Hint: Create an output containing information corresponding to the following fields:
 ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.
*/
select e.emp_no,e.first_name,e.last_name,dm.dept_no,dm.from_date
from employees e
left join dept_manager dm on e.emp_no = dm.emp_no
where e.last_name = 'Markovitch'
order by dm.dept_no desc, e.emp_no;

# Right Join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;
    
# where
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;

# join (the new join syntax) vs where (the old join syntax)

# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.
#Use the old type of join syntax to obtain the result.
select e.emp_no,e.first_name,e.last_name,dm.dept_no,e.hire_date
from employees e, dept_manager dm
where e.emp_no = dm.emp_no
order by emp_no;

# New Join Syntax:
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no; 

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000;
    
set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');

#Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.
SELECT 
    e.emp_no, e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch';

# cross join  

select dm.*,d.* from dept_manager dm cross join departments d;
select dm.*,d.* from dept_manager dm cross join departments d order by dm.emp_no, d.dept_no;
select dm.*,d.* from dept_manager dm,departments d order by dm.emp_no, d.dept_no;
select dm.*,d.* from dept_manager dm join departments d order by dm.emp_no, d.dept_no;
select dm.*,d.* from dept_manager dm inner join departments d order by dm.emp_no, d.dept_no;
select dm.*,d.* from departments d cross join dept_manager dm where d.dept_no <> dm.dept_no order by dm.emp_no, d.dept_no;
select e.*,d.* from departments d cross join dept_manager dm join employees e on dm.emp_no = e.emp_no 
where d.dept_no <> dm.dept_no order by dm.emp_no, d.dept_no;

# Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
SELECT dm.*, d.*  FROM departments d CROSS JOIN dept_manager dm WHERE d.dept_no = 'd009' ORDER BY d.dept_no;
# Return a list with the first 10 employees with all the departments they can be assigned to. Hint: Don’t use LIMIT; use a WHERE clause.
SELECT e.*, d.* FROM employees e CROSS JOIN departments d WHERE e.emp_no < 10011 ORDER BY e.emp_no , d.dept_name;

SELECT 
    e.gender, AVG(s.salary) AS avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
    
    SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON  m.emp_no = e.emp_no;
    
   # Select all managers’ first and last name, hire date, job title, start date, and department name.
 SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.title = 'Manager'
ORDER BY e.emp_no;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
        JOIN
    titles t ON e.emp_no = t.emp_no
        AND m.from_date = t.from_date
ORDER BY e.emp_no;

SELECT 
    d.dept_name, AVG(salary) as average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
    group by dept_name
    having average_salary > 60000
    order by average_salary desc;
    
# How many male and how many female managers do we have in the ‘employees’ database?
    
    SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;

drop table if exists employees_dup;
create table employees_dup(
emp_no int(11),
birth_date date,
first_name varchar(14),
last_name varchar(16),
gender enum('M','F'),
hire_date date);

insert into employees_dup
select e.* from employees e limit 20;

select * from employees_dup;

insert into employees_dup values
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');
    
select e.emp_no,e.first_name,e.last_name,null as dept_no, null as from_date 
from employees_dup e where e.emp_no = '10001'
union all select 
null as emp_no, null as first_name,null as last_name,m.dept_no,m.from_date from dept_manager m;



select e.emp_no,e.first_name,e.last_name,null as dept_no, null as from_date 
from employees_dup e where e.emp_no = '10001'
union select 
null as emp_no, null as first_name,null as last_name,m.dept_no,m.from_date from dept_manager m;


# Go forward to the solution and execute the query.
# What do you think is the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
SELECT * FROM (SELECT e.emp_no, e.first_name, e.last_name, NULL AS dept_no, NULL AS from_date
FROM employees e WHERE last_name = 'Denis' UNION SELECT  NULL AS emp_no, NULL AS first_name, NULL AS last_name, dm.dept_no, dm.from_date
FROM dept_manager dm) AS a ORDER BY - a.emp_no DESC;

















































    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

















































