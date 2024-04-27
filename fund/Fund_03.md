# Fund Lesson 3 Practices

## Practice 1

The employee with ID 104 will receive a salary raise for the first time after working for one year from his hire date. The increase will be 10%.

Please print out the date to increase the salary the first time and the new salary.

### Related programming patterns

[03. Initialize local variables when declaring them.](../patterns/03-init_variables.md)

[05. Assign or initialize format-sensitive literal values to variables: date, timestamp, and interval. ](../patterns/05-assign_format_sensitive_literal.md)

## Practice 2

Create a new worksheet for the practice. Copy and modify the codes in practice 1 to complete the practice.

Create two bind variables.
Use one of them to save employee ID 104. Use it in the select statement to find the employee's salary in the PL/SQL block. 
The new salary should be saved to the other bind variable. 

After executing the worksheet, you should print out the values of the two bind variables. 
 
When executing the block, you should press the F5 key to execute the whole script. Do not execute line-by-line by pressing Ctrl + Enter.

### Related programming patterns

[07. Use bind variables as the worksheet variables to exchange data between the blocks.](../patterns/07-bind_variables.md)

## Practice 3

Find the department name where the employee with ID 200 works. Save the department name to the variable `v_dept_name` and print it out.

The variable type should reference the `department_name` column in the `departments` table. 

Hint: You must join the `Employees` and `Departments` tables in the query.

### Related programming patterns

[06. Refer table column's data types to declare variables](../patterns/06-ref_col_type_to_declare.md)
