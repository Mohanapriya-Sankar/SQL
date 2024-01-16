SELECT
    *
FROM
    user_tables;

SELECT
    table_name
FROM
    user_tables;

DESCRIBE employees;

SELECT
    *
FROM
    employees;

SELECT
    first_name,
    last_name,
    job_id,
    salary
FROM
    employees
ORDER BY
    last_name;
    
select * from job_history where employee_id=(select employee_id from employees where last_name='Abel');

SELECT
    first_name,
    last_name,
    job_id,
    salary * 12 AS annual_salary
FROM
    employees;

SELECT
    first_name,
    last_name,
    job_id,
    salary * 12 "Annual Salary"
FROM
    employees;

SELECT
    first_name || last_name
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name
FROM
    employees;
    
select first_name ||' '|| last_name||' is a '||job_id Employee_Details from employees;

SELECT
    first_name
    || ' '
    || q'[Employee's Manager is]'
    || manager_id
FROM
    employees;

SELECT DISTINCT
    salary
FROM
    employees;