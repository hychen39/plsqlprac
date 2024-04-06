# Title

Insert multiple rows from another data source into a table.

## Description

You want to select rows from a table and insert them into the target table. 
Use the INSERT INTO SELECT statement to complete the task.
The statement is called the Single Table Insert. 

When you use it in the PL/SQL block, you can use the `SQL%ROWCOUNT` attribute to obtain the number of rows affected by the statement.

The syntax of the INSERT INTO SELECT statement is as follows:

![](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/img/single_table_insert.gif)
Ref: [INSERT, SQL Language Reference 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/INSERT.html)

## Example: Select employees whose salaries are greater than the company average and insert them into the `emp_above_avg` table.

Prepare the `emp_above_avg` table:

```sql
create table emp_above_avg as
select * from employees where 1=0;
```
The above statement creates an empty table `emp_above_avg` with the same structure as the `employees` table.


Write an anonymous PL/SQL block to insert the qualified employees into the `emp_above_avg` table and print out the number of rows affected by the INSERT statement.

```sql
set serveroutput on
begin
    insert into emp_above_avg
    select * from employees   -- #1
    where salary > (select avg(salary) from employees);  --#2
    dbms_output.put_line('The number of affected rows: ' || SQL%ROWCOUNT);
end;
/
```

In the above block:
- Mark #1: The subquery selects qualified employees whose salaries are greater than the company average.
- Mark #2: The subquery calculates the average salary of the company. The subquery is executed first and then is used as a value in the WHERE condition.

Check the `emp_above_avg` table:

```sql
select * from emp_above_avg;
```




  

  
