# Title

P11. Obtain the number of affected rows by the DML statements in PL/SQL blocks.

## Description

Since the DML statements are massive operations and will not raise exceptions if no rows are affected, you might want to know the number of affected rows by the DML statements for further processing.

You can use the `SQL%ROWCOUNT` attribute to obtain the number of affected rows by the DML statements in PL/SQL blocks.

The `SQL` is a built-in implicit cursor in PL/SQL, which is maintained by the Oracle server. 

In addition, the `SQL` cursor provides `%FOUND` and `%NOTFOUND` attributes to check the cursor status.

Please note these attributes are the outcomes of the most recent DML statement.

You can use the SQL cursor attributes directly in the PL statements. 

## Example

### Example 1: Print the number of rows affected by a DELETE statement

Delete the rows from the `emp` table where the `department_id` is 90 and print the number of affected rows.

```sql
create table emp as 
select * from hr.employees;
```

```sql
set serveroutput on
declare
    v_affected_rows number;
begin
    delete from emp where department_id = 90;
    v_affected_rows := SQL%ROWCOUNT;
    dbms_output.put_line('The number of affected rows: ' || v_affected_rows);
end;
/
```

### Example 2: Print a warning message if no rows are affected by an UPDATE statement

Update the `salary` column value in the `emp` table where the `department_id` is 90 and print a warning message if no rows are affected.

```sql
set serveroutput on
declare
    v_affected_rows number;
begin
    update emp set salary = salary * 1.1 where department_id = 90;
    v_affected_rows := SQL%ROWCOUNT;
    if SQL%NOTFOUND then
        dbms_output.put_line('No rows are affected by the UPDATE statement.');
    else
        dbms_output.put_line('The number of affected rows: ' || v_affected_rows);
    end if;
end;
/
```

Run the above PL/SQL block in Live SQL: [Oracle Live SQL - Script: 11-obtain_num_of_affected_rows](https://livesql.oracle.com/apex/livesql/s/bhpvr3316iubdpp1s0ef5fhfc)


  
