  
# Fund Lesson 08 Using Explicit Cursor

## Practice 01

Topics:
  1. Explicit Cursor: Open, Fetch, and Close cursor.
  2. Update the current fetched row.


Write a program to calculate the new salary for the employees in the IT department (id 06). Each employee's salary is increased by 10% in this department. During the process, please print out the following information for each employee: 
- first name, 
- the original salary, and 
- the new salary.


The practice asks you to use the following programming techniques:
- Use the CURSOR to define the required query that returns multiple rows.
- Use OPEN, FETCH, and CLOSE statements to operate the CURSOR. 
- Fetch the entire row to a RECORD type variable. 


Example of outputs：
```
Alexander Old Salary: 9900 New Salary: 10890
Bruce Old Salary: 6600 New Salary: 7260
David Old Salary: 5280 New Salary: 5808
Valli Old Salary: 5280 New Salary: 5808
Diana Old Salary: 4620 New Salary: 5082

PL/SQL procedure successfully completed.
```


## Practice 02

Modify the codes in Practice 01 to complete this practice. 


When writing your program, you should meet the following requirements:
- Use a CURSOR with the department id as its parameter to define the required query that returns multiple rows.
- Use CURSOR FOR-LOOP for fetching the query results row by row. 
- the program should show the number of fetched records. 

Example of the outputs:
```
Alexander Old Salary: 9000 New Salary: 9900
Bruce Old Salary: 6000 New Salary: 6600
David Old Salary: 4800 New Salary: 5280
Valli Old Salary: 4800 New Salary: 5280
Diana Old Salary: 4200 New Salary: 4620
Fetch lines: 5

PL/SQL procedure successfully completed.
```


## Practice 03


Prepare your testing data with the following SQL statements:
```sql
drop table emp_08;
create table emp_08 as
  select * from employees;
alter table emp_08 add (new_salary number);
```
The resultant table contains the SALARY column for the original salary and the NEW_SALARY column for the new salary.

Write a program to raise the employee's salary by 10% in the IT department (id 06).  
During the processing, please print out the following information for each employee: 
- first name, 
- the original salary, and 
- the new salary.

In addition, you need to update the new salary to the `NEW_SALARY` column in the `emp_08` table for each employee. 

The practice asks you to use the following programming techniques:
- Use the CURSOR to define the required query that returns multiple rows.
- Use the CURSOR FOR LOOP to operate the CURSOR. 
- Use the WHERE CURRENT OF clause when you update the `emp_08` table. 



Example of outputs：
```
Alexander Old Salary: 9900 New Salary: 10890
Bruce Old Salary: 6600 New Salary: 7260
David Old Salary: 5280 New Salary: 5808
Valli Old Salary: 5280 New Salary: 5808
Diana Old Salary: 4620 New Salary: 5082

PL/SQL procedure successfully completed.
```

Moreover, please execute the following query to check the NEW_SALARY column values in the `emp_08` table:
```sql
select * from emp_08 where department_id = 60;
```









  
