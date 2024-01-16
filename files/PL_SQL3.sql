set SERVEROUTPUT ON;
declare
e_insert_excep Exception;
pragma exception_init(e_insert_excep,-01422);
v_fname varchar(20);
begin
select first_name into v_fname from employees where last_name ='Taylor';
dbms_output.put_line('Taylor first name is'||v_fname);
exception WHEN e_insert_excep then 
dbms_output.put_line('Insert operation failed');
dbms_output.put_line(SQLERRM);
end;


--creating a procedure
set SERVEROUTPUT ON;
create table dept as select * from departments;
create procedure add_dept1 is
v_dept_id dept.department_id%type;
v_dept_name dept.department_name%type;
begin
v_dept_id:=280;
v_dept_name:='ST-CURRICULUM';
insert into dept(department_id,department_name) values(v_dept_id,v_dept_name);
dbms_output.put_line('Inserted'||SQL%ROWCOUNT ||'row');
end;
/
begin
add_dept1(390,'ST-CURRICULUM');
end;
/

--Using Parameterized constructor
set SERVEROUTPUT ON;
create table dept as select * from departments;
create or replace procedure add_dept1(v_dept_id in dept.department_id%type,
v_dept_name in dept.department_name%type )is
begin
insert into dept(department_id,department_name) values(v_dept_id,v_dept_name);
dbms_output.put_line('Inserted'||SQL%ROWCOUNT ||'row');
end;
/
begin
add_dept1(390,'ST-CURRICULUM');
end;
/
select * from dept;

--Creation an Function with parameterized  constructor
set SERVEROUTPUT ON;
create or replace function check_sal (v_empno employees.employee_id%type) return boolean is
v_depid employees.department_id%type;
v_sal employees.salary%type;
v_avg_sal employees.salary%type;
begin
select salary,department_id into v_sal,v_depid from employees where employee_id=v_empno;
select avg(salary) into v_avg_sal from employees where department_id=v_depid;
if v_sal>v_avg_sal
then 
return true;
else
return false;
end if;
exception 
when no_data_found 
then 
return null;
end;
/
drop function check_sal;
/
set SERVEROUTPUT ON;
begin 
if check_sal(100)
then
dbms_output.put_line('Test');
end if;
end;
/
--Triggers
set SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER id_up BEFORE
    UPDATE  ON employees
    FOR EACH ROW
    WHEN ( new.employee_id > 0 )
DECLARE
    sal_diff NUMBER;
BEGIN
    sal_diff :=:new.salary-:old.salary;
    dbms_output.put_line('Old Salary:' || :old.salary);
    dbms_output.put_line('New Salary:' || :new.salary);
    dbms_output.put_line('Salary difference:' || sal_diff);
END;
update employees set salary=25000 where last_name='Abel';

