
desc employees
desc departments;
select employee_id,last_name,department_id,department_name
from employees
Natural join departments;

select employee_id,last_name,employees.department_id,department_name             --for only on conditions
from employees
join departments
on(employees.department_id=departments.department_id);

select employee_id,last_name,department_id,department_name
from employees
join departments
using(department_id);

select employee_id,last_name,manager_id,department_name
from employees
join departments
using(manager_id);

select employee_id,last_name,employees.department_id,department_name,employees.Manager_id --for only on conditions
from employees
join departments
on(employees.department_id=departments.department_id);

select employee_id,last_name,manager_id,department_id,department_name
from employees
join departments
using(manager_id)
where employees.manager_id= 100;     --gives an error when where condition is same as in using clause

select * from employees where department_id is null;
select * from employees where manager_id is null;

select employee_id,last_name,department_name,e.department_id
from employees e
left outer join departments d
on(e.department_id=d.department_id);

select employee_id,last_name,department_name,e.department_id
from departments d
left outer join employees e
on(e.department_id=d.department_id);

select employee_id,last_name,department_name,e.department_id
from departments d
right outer join employees e
on(e.department_id=d.department_id);

select employee_id,last_name,department_name,e.department_id
from employees e
right outer join departments d
on(e.department_id=d.department_id);

select employee_id,last_name,department_name,e.department_id
from employees e
cross join departments d;

--self join
select e.employee_id,e.last_name,e.manager_id,m.employee_id,m.last_name
from employees e
join employees m
on(e.manager_id=m.employee_id);

--3 way joining
select employee_id,last_name,job_id,salary,department_name,city
from employees 
join departments
using (department_id)
join locations
using (location_id);

--Another way of 3-way joining
select employee_id,last_name,job_id,salary,department_name,city
from employees e 
join departments d 
on(e.department_id=d.department_id)
join locations l
on(d.location_id=l.location_id);


