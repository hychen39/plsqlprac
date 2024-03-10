# Title 

Use bind variables as the worksheet variables to exchange data between the blocks.

## Description

Use bind variables as the worksheet variables to input data to SQL and PL/SQL blocks and store the output data from the blocks in the worksheet.

Bind variables have the same life span as the worksheet. You can use them in the SQL statements and PL/SQL blocks in the worksheet.

To operate with bind variables: 
- Use `variable` command to declare a bind variable in the worksheet. 
- Use the colon (:) before the bind variable name to reference it in the SQL statement and PL/SQL block.
- Use the `print` command to print the values of the bind variables.
- Assign a value to the bind variable by using the anonymous block or `exec` command.

You need to run the entire worksheet to see the output by executing the Run Script button (pressing F5).

**Do not run line by line**.

## Example 

The following example:
1. Creates a bind variable
2. Assigns a value to the bind variable by using the anonymous block
3. Uses the bind variable in the SQL statement to retrieve data from the `employees` table
4. Create other two bind variables. 
5. Use them in the PL/SQL block to to save the values of the `first_name` and `last_name` columns from the `employees` table.
6. Print the values of the bind variables.

```sql
-- 1. Create a bind variable in the worksheet
variable b_emp_id number;

-- 2. Assign a value to the bind variable by using the anonymous block
-- or Exec command
begin
  :b_emp_id := 100;
end;
/
-- OR 
-- exec :b_emp_id := 100;

-- 3. Use the bind variable in the SQL statement
-- Use the colon (:) before the bind variable name to reference it
select * from employees where employee_id = :b_emp_id;


-- 4. Create other two bind variables
variable b_fname varchar2(40);
variable b_lname varchar2(40);

-- 5. Use the bind variables in the PL/SQL block
begin
    select first_name, last_name 
        into :b_fname, :b_lname
    from employees
    where employee_id = :b_emp_id;
    dbms_output.put_line('Employee name: ' || :b_fname || ' ' || :b_lname);
end;
/

-- 6.Print the values of the bind variables
print b_fname;
print b_lname;
```