
# Fund Lesson 5 Practices

Practice  Highlights:
- Create Table As Subquery statement
- Merge statement


## Practice 01: Use SQL Statements in the PL/SQL

Practice highlights:
- Use the INSERT and UPDATE SQL statements in the PL/SQL
- Use cursor attribute: sql%rowcount

Write an anonymous block to meet the requirement below: 

1. Find the maximum department ID in the `Department` table. Then, store the ID to the local variable `v_max_deptno`. Then, print out the variable value. 

2. Insert a new department to the `Department` table. The column values for the new department:
- Dept ID: (current maximum department ID) + 10
- Dept Name: 'Education'
- Location id: null

3. Print out:
- the current maximum department ID (The one found in the req. 1)
- the number of rows affected by the INSERT statement. 

4. Update the `LOCATION_ID` column with value 3000 to the row you just have inserted. Then, print out the number of rows affected by the UPDATE statement.

## Practice 02: Merge two tables using the MERGE statement in the PL/SQL

Follow the steps to complete the practice: 

Step 1.	Use CREATE AS SUBQUERY statement to create the `emp_salary_1` table:
```sql
create table emp_salary_1 as
select e.employee_id, e.first_name, e.salary , 0 as NEW_SALARY
from employees e
where rownum <2;
```
    
Ensure the value of the third column `NEW_SALARY` is 0. There should be only one row in the table. 

Step 2.	Execute the following statements to create the `emp_salary_2` table.
```sql
create table emp_salary_2 as
select e.employee_id, e.first_name, e.salary 
from employees e
where rownum <3;
```

There should be two rows in the table. 

Step 3.	Ensure the resultant `emp_salary_1` 及 `emp_salary_2` tables。
```sql
select tname from tab where tname like 'EMP_SALARY%';
```

Step 4. Write an anonymous PL/SQL block to merge rows from `emp_salary_2` to `emp_salary_1` table. 
   - The column `emp_salary_1.NEW_SALARY` should be updated to `emp_salary_2.salary` * 1.2 when you merge the two tables. 
   - Print out the number of updated rows after the merge completes.  

(Hint: Use MERGE statement and SQL cursor attribute)
  
