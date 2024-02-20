
# Fund Lesson 7 Practices


## Practice 01: User-defined record type

Define a record type that includes the following fields:
- emp_id: employee id 
- first_name: first name 
- last_name: last name 
- dept_name: department name 
- salary: number 

You need to determine the data type for each field. 

Use the record type to declare a variable to store the corresponding column values from the employee with ID 124. For example, the employee_id value should be stored into the emp_id field in the declared variable of the record type.  

The program should print out the `emp_id`, `first_name` and `salary` fields in the variable of the user-defined record type.

You can refer to the example in the P7-12 to complete the practice. 

## Practice 02: DML operations with record type variables

Use the following DDL statements to create the required table:
```sql
CREATE TABLE retired_emps
  (
    EMPNO     NUMBER(4),
    ENAME     VARCHAR2(10), -- last name
    JOB       VARCHAR2(9),  -- job id
    MGR       NUMBER(4),    -- manager id
    HIREDATE  DATE,
    LEAVEDATE DATE,
    SAL       NUMBER(7,2),  -- salary
    COMM      NUMBER(7,2),  -- commission percentage
    DEPTNO    NUMBER(2)     -- department number
  );
```

We have the following PL/SQL program with parts of codes:
```sql
DECLARE
  -- Declare the record variable for the table retired_emps.
  v_retired_emps retired_emps%rowtype;
BEGIN
  -- Task 1: 
  -- Write your codes here

  -- Task 2 
  -- Write your codes here
 
  -- Task 3
  -- Write your codes here
  
  -- Task 4
  -- Write your codes here
  
  -- Task 5
  -- Write your codes here
   
END;
/

-- Check your result
select * from retired_emps;
```

Please write codes after marks of Task 1 to 5 to complete the following requirements:

- Task 1: Put the corresponding column values of employee 124 to variable `v_retired_emps`. Note that no `LEAVEDATE` column in the employees table.
- Task 2: Insert the `v_retired_emps` variable value into `retired_emps` table.
- Task 3: Populate the `v_retired_emps` variable with the column values of employee 124 in the `retired_emps` table 
-  Task 4: Set the LEAVEDATE field in the `v_retired_emps` variable to the current date.
-  Task 5: Use the updated `v_retired_emps` variable values to update `retired_emps` table. 



## Practice 03: Index-by table operations: access and iterate values in the index-by tables.

Write a PL/SQL program that meets the following requirements:
1. Identify the average salary of all the employees.
2. Use `FOR-LOOP` to find the records of the employees whose salaries are less than the average salary and store these rows in an index-by table. The range of employee id starts from 100 to 200. 
3. Use `WHILE-LOOP` to iterate all of the elements in the index-by table. Print the `employee_id` and `salary` column values of each element. 


## Practice 04: select bulk collect into

Refer to HR schema. Write a PL/SQL program to meet the following requirements:
1. Query department id and department name of departments located in the UK. Save the column values to the associate array (index-by table) `l_dept_uk_tab`.
   - The record in the associate array contains two fields: (dept_id number, dept_name departments.department_name%type)
   - You are asked to use `select bulk collect into` to complete the task.
2. Starting from the first record, iterate all the records in the associate array `l_dept_uk_tab`. Print out the department name. 
   - You are asked to use `WHILE-LOOP` to iterate the associate array.




