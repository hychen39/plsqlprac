# Fund Lesson 5 Practices


## Practice 01: Use SQL Statements in the PL/SQL

Prepare the table for the practice:
```sql
create table dept as 
select * from hr.departments;
```

Write an anonymous block to meet the requirements below: 

1. Find the maximum department ID in the `dept` table. Then, store the ID to the local variable `v_max_deptno`. Next, print out the variable value. 

2. Insert a new department into the `dept` table. The column values for the new department:
- Dept ID: `v_max_deptno` + 10
- Dept Name: 'Education'
- Location id: null

1. Print the number of rows affected by the INSERT statement. 

2. Update the `LOCATION_ID` column with a value of 3000 for the row you just inserted. Then, print the number of rows affected by the UPDATE statement.

### Related programming patterns:
- [10 Write DML statements in PL/SQL blocks](../patterns/10-write_dml_stmt.md)
- [11 Obtain the number of affected rows by the DML statements in PL/SQL blocks](../patterns/11-obtain_num_of_affected_rows.md)


## Practice 02: Merge two tables using the MERGE statement in the PL/SQL

Follow the steps to complete the practice: 

Step 1.	Use the CREATE AS SUBQUERY statement to create the `emp_salary_1` table:
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
   - Print out the number of updated rows after the merge is complete.  

(Hint: Use MERGE statement and SQL cursor attribute)
  
## Practice 03 Write a worksheet to maintain table data

Execute the following statements to prepare the tables `t1` and `t1_keep` for the practice:

```sql

-- Original table
create table t1 (id number primary key, val number);

-- The table to keep the rows to be deleted
create table t1_keep (id number primary key, val number);

-- Insert 10 rows with random values
insert into t1 
select rownum, round(dbms_random.value(1,100),0)  from dual connect by level <= 10;

-- Check the table t1
select * from t1;

commit;
```

Write a worksheet to meet the requirements below:
1. Declare a host variable to store a threshold value.
2. Write an empty PL/SQL block.
3. In the block, write an INSERT WITH SUBQUERY statement to insert the rows from the `t1` table to the `t1_keep` table where the `val` column value is less than the threshold value.
4. Then, print out the number of rows affected by the INSERT statement.
5. In the same block, write a DELETE statement to delete the rows from the `t1` table where the `val` column value is less than the threshold value.
6. Print out the number of rows affected by the DELETE statement.
7. Commit the transaction in the block.
8. After the block, query the  `t1_keep` tables to check the results.

Sample outputs of running the worksheet:
```

PL/SQL procedure successfully completed.
Rows kept: 3
Rows deleted: 3

PL/SQL procedure successfully completed.
        ID        VAL
        ---------- ----------
                 3          3         
                 7         23         
                 8         10
```

### Related programming patterns:

- [07 Use bind variables as the worksheet variables to exchange data between the blocks.](../patterns/07-bind_variables.md)
- [10 Write DML statements in PL/SQL blocks](../patterns/10-write_dml_stmt.md)
- [11 Obtain the number of affected rows by the DML statements in PL/SQL blocks](../patterns/11-obtain_num_of_affected_rows.md)
- [12 Insert multiple rows from another data source into a table](../patterns/12-insert_multi_rows.md)
