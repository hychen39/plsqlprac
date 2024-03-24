## Title

Select a scalar value from a table into a pl local variable

## Description

- Select a scalar value from a table into a PL/SQL local variable for further processing.
- The scalar value is a single value, such as a number, a string, or a date.
- The scalar value might be a column value or an expression result.
- The local variable type should be compatible with the selected value type.
- The SELECT INTO statement is an "exact fetch" statement. 
  - "Exact fetch" means that the statement must return exactly one row.
  - Return no rows or many rows will raise exceptions.
  - Raise `NO_DATA_FOUND` exception if no rows are returned.
  - Raise `TOO_MANY_ROWS` exception if more than one row is returned.


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

