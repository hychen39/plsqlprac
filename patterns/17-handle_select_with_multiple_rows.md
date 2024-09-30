# Title

P17. Handle a SELECT statement that returns multiple rows

# Description

The SELECT statement in PL/SQL is an exact fetch statement. It must return exactly one row. Otherwise, it raises an exception. 

What if our SELECT statement returns multiple rows? 

There are two choices to handle this situation: one is to use the SELECT BULK COLLECT INTO statement, and the other is to use an explicit cursor.

The ideas behind these two methods are different. 

The SELECT BULK COLLECT INTO statement fetches all rows into a collection at once. That is, all rows are fetched into the memory space of the collection at once. The advantage is that it is faster than fetching one row at a time because it requires just one pl and sql context switch [1]. The disadvantage is that it may consume a lot of memory if the number of rows is large.

When the number of rows is large, it is better to use an explicit cursor. An explicit cursor fetches one row to a record variable at a time. But, the main disadvantage is that it requires a lot of pl and sql context switches [2], which erodes the performance.

![](https://blogs.oracle.com/content/published/api/v1.1/assets/CONT1D95F3344119421A91E7484D7265A6E1/Medium?cb=_cache_5e3b&channelToken=055b6b0fc6e14d9d8ec2cfc921769d16&format=jpg)

Figure: Context switches between PL/SQL and SQL runtime engines [1]


# Examples

Assume we want to print the employee ID and the employee name of all employees in the department ID 80.

## Example 1: Use the SELECT BULK COLLECT INTO statement

```sql
declare
    type emp_aa_type is table of employees%rowtype
        index by pls_integer;
    emp_aa emp_aa_type;
begin
    select * bulk collect into emp_aa
    from employees
    where department_id = 80;

    for i in 1..emp_aa.count loop
        dbms_output.put_line('Employee ID: ' || emp_aa(i).employee_id);
        dbms_output.put_line('Employee Name: ' || emp_aa(i).first_name || ' ' || emp_aa(i).last_name);
    end loop;
end;
/
```

## Example 2: Use an explicit cursor

```sql
declare
    cursor c_emp is
        select *
        from employees
        where department_id = 80;
begin
    for emp_rec in c_emp loop
        dbms_output.put_line('Employee ID: ' || emp_rec.employee_id);
        dbms_output.put_line('Employee Name: ' || emp_rec.first_name || ' ' || emp_rec.last_name);
    end loop;
end;
/
```



# References

1. [Bulk data processing with BULK COLLECT and FORALL in PL/SQL](https://blogs.oracle.com/connect/post/bulk-processing-with-bulk-collect-and-forall)
   
2. [Solving the Row-by-Row Problem](https://blogs.oracle.com/connect/post/solving-the-row-by-row-problem)