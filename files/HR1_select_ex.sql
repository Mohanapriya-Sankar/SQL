Select * from user_tables;
select table_name from user_tables;
DESCRIBE employees;
Describe jobs;
desc job_history;
select * from employees;
select first_name,last_name,Job_id,salary from employees
order by last_name;
select first_name,last_name,Job_id,salary*12 as Annual_Salary from employees;
select first_name,last_name,Job_id,salary*12 "Annual Salary" from employees;
select first_name || last_name from employees;
select first_name ||' '|| last_name from employees;
select first_name ||' '|| last_name||' is a '||job_id Employee_Details from employees;
select first_name||' '||q'[Employee's Manager is]'||manager_id from employees;
select DISTINCT salary from employees;

select*
from employees
where salary=8000;

select*
from employees
where salary<>9000;

select*
from employees
where salary in (8000,12000,7400);

select*
from employees
where salary not in (8000,12000,7400);

select*
from employees
where salary between 8000 and 9000;

select*
from employees
where last_name like 'K%';

select*
from employees
where last_name like '%a';


select*
from employees
where last_name like '__k%';

select*
from employees
where last_name like 'K%g';

select*
from employees
where last_name not like 'K%g';

select*
from employees
where last_name like 'K%a%n%g';

select*
from employees
where last_name like 'K%a%n%g' and last_name not like 'K%a%g';

select*
from employees
where salary=&sal;

select &colName
from employees
where salary between &con;
undefine calName;

select &calName
from &tabName
where &con;

select &&calName,last_name
from &tabName
where &con
order by &calName;

undefine calName;

select last_name,first_name,salary,salary*12 Asalary ,job_id
from employees
order by Asalary;

select last_name,first_name,salary,salary*12 Asalary ,job_id
from employees
order by 3 desc;

select last_name,first_name,salary,salary*12 Asalary ,job_id
from employees
order by last_name,first_name;

select last_name,first_name,salary,salary*12 Asalary ,job_id
from employees
order by first_name,last_name;

--DEFINE col=department_id;
select &col,last_name,first_name,salary,salary*12 Asalary,job_id
from employees
order by &col;

Undefine col;









