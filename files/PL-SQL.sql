set serveroutput on;              --to display output
DECLARE
    v_last_name VARCHAR(25);
BEGIN
    SELECT
        last_name
    INTO v_last_name --to cannot be used
    FROM
        employees
    WHERE
        employee_id = 100;

    dbms_output.put_line('The Employees last name:' || v_last_name);
END;

DECLARE
    v_last_name VARCHAR(25);
    v_emp_id    NUMBER := 125;
BEGIN
    SELECT
        last_name
    INTO v_last_name --to cannot be used
    FROM
        employees
    WHERE
        employee_id = v_emp_id;

    dbms_output.put_line('The Employees last name:' || v_last_name);
END;
set serveroutput on;  
DECLARE
    v_myname VARCHAR2(20);
BEGIN
    dbms_output.put_line('The Employees last name:' || v_myname);
    v_myname := 'John';
    dbms_output.put_line('The Employees last name:' || v_myname);
END;

set serveroutput on; 
DECLARE
    v_myname VARCHAR2(20) := 'John';
BEGIN
    dbms_output.put_line('The Employees last name:' || v_myname);
    v_myname := 'Steven';
    dbms_output.put_line('The Employees last name:' || v_myname);
END;

/*declare
v_event varchar2(15);
begin
v_event:= q '!Father' 
*/
--not getting answer
set serveroutput on; 
declare
v_last_name VARCHAR(25);
BEGIN
    select last_name into v_last_name
    from employees where employee_id=178;
    dbms_output.put_line('The Employee last Name: '||v_last_name);
END;
/
set serveroutput on; 
print v_last_name
select first_name
from employees
where last_name =v_last_name;

--to find length
set serveroutput on;   
declare
v_leng_stmt number;
v_str varchar(27):='Hi Hello Welcome to PL-SQL';
begin
v_leng_stmt:=length(v_str);
dbms_output.put_line(v_str);
dbms_output.put_line(v_leng_stmt);
END;

--Total number of working days of employee
set serveroutput on;   
declare
v_hire_date number;
begin
select months_between(sysdate,hire_date) into v_hire_date from employees where last_name='Abel';
dbms_output.put_line('The number of days:' || v_hire_date);
end;

--Nested Blocks
set serveroutput on;   
declare
v_father_name varchar(25):='ABC';
begin
declare
v_child_name varchar(25):='XYZ';
begin
dbms_output.put_line(v_father_name);
dbms_output.put_line(v_child_name);
end;
dbms_output.put_line(v_father_name);
end;

set serveroutput on;   
declare 
v_salary number;
name varchar(10);
begin
select salary into v_salary from employees where last_name='&name';
dbms_output.put_line(v_salary);
end;

set serveroutput on;  
declare
v_last_name  Employees.last_name%type:='&name';
v_salary     Employees.salary%type:=&salary;
v_last_name_up  Employees.last_name%type;
v_new_sal    Employees.salary %type;
begin 
Update employees
set salary=v_salary
where last_name=v_last_name;
select last_name,salary into v_last_name,v_new_sal from employees where last_name=v_last_name;
dbms_output.put_line(v_last_name_up);
dbms_output.put_line(v_new_sal);
end;

set serveroutput on;  
declare
v_last_name  Employees.last_name%type:='&name';
v_salary     Employees.salary%type:=&salary;
v_last_name_pre  Employees.last_name%type;
v_salary_pre     Employees.salary%type;
v_last_name_new  Employees.last_name%type;
v_salary_new    Employees.salary%type;

begin 
select last_name,salary into v_last_name_pre,v_salary_pre from employees
where last_name=v_last_name;
Update employees
set salary=v_salary
where last_name=v_last_name;
select last_name,salary into v_last_name_new,v_salary_new from employees where last_name=v_last_name;
dbms_output.put_line('previous name and salary'||v_last_name_pre||' '||v_salary_pre);
dbms_output.put_line('user name and salary'||v_last_name||' '||v_salary);
dbms_output.put_line('new updated name and salary'||v_last_name_new||' '||v_salary_new);
end;

set serveroutput on;   
begin
insert into employees(employee_id,first_name,last_name,email,hire_date,job_id,salary)
values(061,'Yugan','Raj','yuganraj@2001','16-04-2001','AD_ASST',40000);
End;
select * FROM employees where employee_id=061;















