SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;

insert into employees
( emp_no, birth_date, first_name, last_name, gender, hire_date)
values (999901,'1986-04-21','john','smith','M','2011-01-01');

insert into employees
( birth_date,emp_no, first_name, last_name, gender, hire_date)
values ('1973-03-26',999902,'patricia','lawrence','F','2005-01-01');

insert into employees
values (999903,'1997-08-28','Kartikay','Garg','M','2022-02-02');

SELECT 
    *
FROM
    titles
LIMIT 10;

#Then, in the same table, insert information about employee number 999903.
# State that he/she is a “Senior Engineer”, who has started working in this position on October 1st, 1997.


insert into titles(emp_no, title,from_date) values(999903,'Senior Engineer','1997-10-01');
SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC;

insert into dept_emp (emp_no,dept_no,from_date,to_date) values (999903,'d005','1997-10-01','9999-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;

select * from departments;

create table departments_dup
(dept_no char(4) not null, dept_name varchar(40) not null);

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

insert into departments_dup
(dept_no,dept_name)
SELECT 
    *
FROM
    departments;

# Create a new department called “Business Analysis”. Register it under number ‘d010’.
# Hint: To solve this exercise, use the “departments” table.
insert into departments
values('d010','Business Analysis'); 
SELECT 
    *
FROM
    departments
ORDER BY dept_no;













