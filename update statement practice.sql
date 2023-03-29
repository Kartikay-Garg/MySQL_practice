use employees;
SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Akshay',
    last_name = 'Kumar',
    birth_date = '1975-08-31',
    gender = 'M'
WHERE
    emp_no = 999901;
    
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

commit;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

rollback;

insert into departments_dup
(dept_no,dept_name)
select * from departments;

drop table departments_dup;


SELECT 
    *
FROM
    departments;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';











