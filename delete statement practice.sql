SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
commit;
DELETE FROM employees 
WHERE
    emp_no = 999903;

rollback;

DELETE FROM departments 
WHERE
    dept_no = 'd010';
    
SELECT 
    *
FROM
    departments;
rollback;














