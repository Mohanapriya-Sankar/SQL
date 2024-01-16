set serveroutput on; 

create table emplo as select employee_id,last_name,department_id,job_id,salary from employees;
select * from emplo;
delete from emplo;
declare
z_empid employees.employee_id%TYPE;
z_lastname  employees.last_name%TYPE;
z_depid employees.department_id%TYPE;
z_jobid employees.job_id%type;
z_sal employees.salary%type;
	
cursor c_emp is select employee_id,last_name,department_id,job_id,salary from employees;
begin
for er in c_emp
loop
insert into emp(employee_id,last_name,department_id,job_id,salary) 
values (er.z_empid,er.z_lastname,er.z_depid,er.z_jobid,er.z_sal);
--DBMS_OUTPUT.PUT_LINE(er);
end loop;
end;

/*DROP TABLE emp_temp;
CREATE TABLE emp_temp AS
  SELECT employee_id, department_id,job_id
  FROM employees;
DELETE FROM emp_temp;
COMMIT; 

DROP TABLE emp_detls_temp;
CREATE TABLE emp_detls_temp(
employee_id NUMBER,
empname varchar2(40)); 
*/
 
set serveroutput on; 
DECLARE
    z_empid employees.employee_id%TYPE;
	z_depid employees.department_id%TYPE;
    z_firstname employees.first_name%TYPE;
    z_lastname  employees.last_name%TYPE;
    
	
	
    CURSOR cur_stclerk IS
      SELECT employee_id,
	         department_id,
             first_name,
             last_name
      FROM   employees
      WHERE  job_id = 'ST_CLERK';
BEGIN
    OPEN cur_stclerk; 
    LOOP
        FETCH cur_stclerk INTO z_empid,z_depid,z_firstname, z_lastname;
        DBMS_OUTPUT.PUT_LINE(z_empid||' '||z_depid||' '||z_firstname||' '||z_lastname);
        EXIT WHEN cur_stclerk%NOTFOUND;
        INSERT INTO emp_temp
                    (employee_id,
                     department_id,
                     job_id)
        VALUES      (z_empid,
                     z_depid,
                     'ST_CLERK');

        INSERT INTO emp_detls_temp
                    (employee_id,
                     empname)
        VALUES      (z_empid,
                     z_firstname
                     || ' '
                     || z_lastname);
    END LOOP;
    CLOSE cur_stclerk;
    COMMIT; 
END;
select * from emp_detls_temp;