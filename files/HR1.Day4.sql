select employee_id,job_id
from employees
Union
select employee_id,job_id
from job_history;

select employee_id,job_id
from employees
Union All
select employee_id,job_id
from job_history;

select employee_id,job_id
from employees
Intersect
select employee_id,job_id
from job_history;

--Employee_id whose current job_id and previous job_id should not be same 
select employee_id,job_id
from employees
minus
select employee_id,job_id
from job_history;

--To get the employee who is working in same department in previous and now
select employee_id,department_id
from employees
Intersect
select employee_id,department_id
from job_history;

select employee_id,job_id,salary
from employees
Union
select employee_id,job_id,0 --because int should be here as it is in employees
from job_history;

select employee_id,job_id,last_name,hire_date
from employees
Union
select employee_id,job_id,to_char(null),TO_DATE('31-AUG-2004','DD-MON-YYYY')
from job_history;

select employee_id,job_id,last_name,hire_date
from employees
Union
select employee_id,job_id,to_char(null),start_date
from job_history;

--To update the details in exixting table
Update employees
set salary=(select salary from employees where last_name='Abel')where last_name='Taylor';
select last_name,salary from employees
order by last_name;

--To delete existing rows of table
delete from jobs
where min_salary < 5000;

Truncate table jobs;

set serveroutput on;  
begin
insert into employees(employee_id,first_name,last_name,email,hire_date,job_id,salary)
values(218,'Ruth','Cores','RCores',current_date,'AD_ASST',4000);
End;

select * from employees;



