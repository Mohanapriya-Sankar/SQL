select employee_id,last_name,commission_pct,manager_id,coalesce(to_char(commission_pct,manager_id),0)
from employees;


select last_name,salary,job_id,
CASE job_id when 'IT_PROG' then salary * 0.5+salary
            when 'PU_MAN' then salary*0.3 +salary
            when 'ST_CLERK' then salary*0.1+salary
            Else salary
END New_salary
from employees;

select last_name,salary,job_id,
DECODE( job_id , 'IT_PROG' , salary * 0.5+salary
            , 'PU_MAN' , salary*0.3 +salary
            , 'ST_CLERK' , salary*0.1+salary
            , salary
 )New_Salary
from employees;


select COUNT(*)
from employees;

select SUM(salary)
from employees;

select round(avg(salary),2)Average_salary,MAX(salary),MIN(salary)
from employees;

select MAX(last_name),MIN(last_name)
from employees;

select MAX(hire_date),MIN(hire_date)
from employees;

select round(sum(salary)/count(*),2),
round(sum(salary)/count(manager_id),2),--can't includes null values
round(sum(salary)/count(nvl(manager_id,0)),2)
from employees;

select * from departments;

select count(department_id)
from departments;

select department_id,count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
from employees
group by department_id
order by department_id;

select department_id,job_id,count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
from employees
group by department_id,job_id
order by department_id,job_id;

select last_name,department_id,job_id,count(department_id),sum(salary),round(avg(salary),0),max(salary),min(salary)
from employees
group by last_name,department_id,job_id
order by last_name,department_id,job_id;

select first_name,salary,avg(salary)
from employees
Having avg(salary)>15000
group by first_name,salary
order by first_name;

select  first_name, avg(salary) 
from employees
group by first_name
order by avg(salary);


/*select department_id,manager_id,count(*)
case manager_id
when &&id then select department_id from departments where manager_id=&id and count (*) from employees where manager_id=&id;
end
from employees;*/






