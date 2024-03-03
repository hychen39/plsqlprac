
Title: Select a scalar value from a table into a pl local variable

## Description

Select a scalar value from a table into a PL/SQL local variable for further processing.
The scalar value is a single value, such as a number, a string, or a date.
The scalar value might be a column value or an expression result.
The local variable type should be compatible with the selected value type.

## Example

Select the number of employees from the `employees` table into a local variable `v_employees_count`.

## Code Snippet

```sql
declare 
    v_employees_count number;
begin
    select count(*) into v_employees_count from employees;
    dbms_output.put_line('The number of employees: ' || v_employees_count);
end;
/
```

