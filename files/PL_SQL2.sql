set serveroutput on;    
declare
v_my_age number:=&num;
begin
if v_my_age<11
Then
DBMS_OUTPUT.PUT_LINE('Iam a child');
elsif v_my_age<40
then
DBMS_OUTPUT.PUT_LINE('Iam a adult ');
else
DBMS_OUTPUT.PUT_LINE('Iam a senior citizen');
end if;
end;

declare
v_grade VARCHAR(2):=upper('&grade');
begin
case v_grade
when 'A' then DBMS_OUTPUT.PUT_LINE('Excellent ');
when 'B' then DBMS_OUTPUT.PUT_LINE('Good');
when 'C' then DBMS_OUTPUT.PUT_LINE('Average');
when 'D' then DBMS_OUTPUT.PUT_LINE('Below Average');
when 'E' then DBMS_OUTPUT.PUT_LINE('Fail');
else DBMS_OUTPUT.PUT_LINE('No Grade');
End case;
end;

DBMS_OUTPUT.PUT_LINE('Grade: '||v_grade ||' Appraisal'||v_appraisal);
set serveroutput on;  
declare 
v_num number:=1;
begin
loop
DBMS_OUTPUT.PUT_LINE('Welcome to looping statements');
v_num:=v_num+1;
exit when v_num=10;
end loop;
end;
/

set serveroutput on;   
declare
v_emplo_id number:=100;
v_emp_name varchar(30);
v_emp_dep varchar(30);
v_emp_job varchar(30);
v_emp_sal number;
begin
while v_emplo_id <=110
loop
select employee_id,last_name,department_id,job_id,salary into v_emplo_id,v_emp_name,v_emp_dep,v_emp_job,v_emp_sal from employees;
v_emplo_id:=v_emplo_id+1;
DBMS_OUTPUT.PUT_LINE(v_emplo_id,v_emp_name,v_emp_dep,v_emp_job,v_emp_sal );
end loop;
end;

set serveroutput on;  
declare
v_id employees.employee_id:=100;
v_name employees.last_name%type;
v_dept employees.department_id%type;
v_job employees.job_id%type;
v_salary employees.salary%type;
begin
while v_id<110 loop 
select employee_id,last_name,department_id,job_id,salary into v_id,v_name,v_dept,v_job,v_salary from employees where employee_id=v_id;
v_id:=v_id+1;
DBMS_OUTPUT.PUT_LINE(v_id|| ' '||v_name|| ' '||v_dept|| ' '||v_job|| ' '||v_salary);

end loop;
end;
/
declare
type emp  is record
(lname varchar(25),
job varchar(25),
salary number,
e employees%rowtype
);
emp_ref emp;
begin
select * into emp_ref.e from employees where employee_id=124;
select last_name,job_id,salary into emp_ref.lname,emp_ref.job,emp_ref.salary from employees where employee_id=124;
DBMS_OUTPUT.PUT_LINE('last_name'||' '||'jobs'||' '||'salary');
DBMS_OUTPUT.PUT_LINE(emp_ref.lname||' '||emp_ref.job||' '||emp_ref.salary );
DBMS_OUTPUT.PUT_LINE(emp_ref.e.last_name||' '||emp_ref.e.job_id||' '||emp_ref.e.salary );
end;

set serveroutput on; 
declare
emp employees%rowtype;
begin
select * into emp
from employees
where employee_id=118;
DBMS_OUTPUT.PUT_LINE(emp.last_name||' '||emp.job_id||' '||emp.salary );
end;


--to create delete insert an table
create table copyemp
as(select*from employees);
delete from copyemp where employee_id=118;
select * from copyemp;
declare
emp employees%rowtype;
begin
select * into emp
from employees
where employee_id=118;
insert into copyemp values emp;
end;

--to update a table


--each element of a department table is a record
--Collections(Assosiative Array)
set serveroutput on; 
declare
type employ_table_type is table of
employees%rowtype index by pls_integer;
employ_table employ_table_type;
v_eid number:=100;
v_n number:=1;
begin
while v_eid<110 loop
select employee_id,last_name,job_id,salary into employ_table(v_n) from employees where employee_id=v_eid;
DBMS_OUTPUT.PUT_LINE(employ_table(v_n).employee_id|| employ_table(v_n).last_name|| employ_table(v_n).job_id||employ_table(v_n).salary);
v_eid:=v_eid+1;
v_n:=v_n+1;
end loop;
end;

set serveroutput on; 
declare 
cursor c_emp_cursor is
select employee_id,last_name from employees
where department_id=30;
begin
for emp_record in c_emp_cursor
loop
DBMS_OUTPUT.PUT_LINE(emp_record.employee_id||' '||emp_record.last_name);
end loop;
end;

--Using for each loop
declare
cursor emp is select last_name from employees;
begin
for er in emp
loop
dbms_output.put_line(er.last_name);
end loop;
end;

--without using for each loop
set serveroutput on; 
declare
cursor emp is select last_name from employees;
empr emp%rowtype;
begin
open emp;
loop
fetch emp into empr;
exit when emp%notfound;
dbms_output.put_line(empr.last_name);
end loop;
end;

--In sub_queries
begin
for er in(select employee_id,last_name,salary from employees where department_id=30)
loop
dbms_output.put_line(er.employee_id||' '||er.last_name||' '||er.salary);
end loop;
end;

set serveroutput on; 
declare
v_fname varchar(20);
begin
select first_name into v_fname from employees where last_name ='Smith';
dbms_output.put_line('Taylor first name is'||v_fname);
exception
when too_many_rows then 
dbms_output.put_line('Your select statement retrieved multiple rows.Consider using a cursor');
end;
/
select first_name from employees where last_name ='Taylor';
/
set serveroutput on; 
declare
e_insert_excep Exception;
pragma exception_init(e_insert_excep,-01422);
v_fname varchar(20);
begin
select first_name into v_fname from employees where last_name ='Taylor';
dbms_output.put_line('Taylor first name is'||v_fname);
exception WHEN e_insert_excep then 
--dbms_output.put_line('Insert operation failed');
dbms_output.put_line(SQLERRM);
end;
/
set SERVEROUTPUT ON;
declare 
e_eid_excep exception;
pragma exception_init(e_eid_excep, -06512);
--v_eid number:=110;
begin 
insert into employees values(062,'Nandhini','periyasamy','nandhini@gmaiil','123.456.789','03-05-2002','man_id',12000,0.2,32,44);
exception
when e_eid_excep then
dbms_output.put_line('Insert operation failed');
dbms_output.put_line(SQLERRM);
end;
/
describe employees;
select * from employees;
select employee_id from employees;
