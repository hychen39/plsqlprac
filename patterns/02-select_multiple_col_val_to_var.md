# Title 

Select multiple column values from a table and put them into PL/SQL local variables.

## Description

Select multiple column values from a table and put them into PL/SQL local variables for further processing. 

Each local variable type should be compatible with the selected column type.

Column values are assigned to local variables in the order they appear, e.g., first column to first variable, second column to second variable, and so on.

Use the `%type` attribute to define the local variable type based on the column type for not hardcoding the type.


## Example

Select the `employee_id`, `first_name`, and `last_name` from the `employees` table into local variables `v_employee_id`, `v_first_name`, and `v_last_name`.

## Code Snippet

```sql
declare 
    -- The type of v_employee_id variable is the same as the type of the employee_id column when using the %type attribute.
    v_employee_id employees.employee_id%type;
    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
begin
    select employee_id, first_name, last_name 
    into v_employee_id, v_first_name, v_last_name 
    from employees
    where employee_id = 100;
end;
/
```
    
  
