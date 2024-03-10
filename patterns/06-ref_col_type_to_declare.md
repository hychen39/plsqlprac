# Title

Refer table column's data types to declare variables

## Description

Refer table column's data types to declare variables.

Use the %TYPE attribute to declare a variable with the same data type as a table column.

Use it when you want to declare a variable that will hold the same type of data as a column in a table.

Benefits:
1. Avoid errors caused by data type mismatch or wrong precision 
2. Avoid hard-coding data type and precision
3. Avoid modifying the variable declaration when the column data type changes

```sql
declare
    v_emp_id employees.employee_id%type;
    v_emp_name employees.last_name%type;
    v_hire_date employees.hire_date%type;
begin
    select employee_id, last_name, hire_date
    into v_emp_id, v_emp_name, v_hire_date
    from employees
    where employee_id = 100;
    dbms_output.put_line('Employee ID: ' || v_emp_id || ', Name: ' || v_emp_name || ', Hire Date: ' || v_hire_date);
end;    
/
```
