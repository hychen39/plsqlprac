# Fund Less 04 Practices 

## Practice 1: Explicit conversion

With the following codes:
```sql 
-- Implicit and explicit data conversion
set serveroutput on
declare
v_salary number(6) :=6000;
v_total_salary v_salary%type;
v_add varchar2(10) := '1000';
v_hire_date  varchar2(100) := 'December 31, 2016';
v_interval CONSTANT interval year to month := '3-0';
v_retire_date date;

begin
-- line 1: Write codes to calculate the value of v_total_salary
dbms_output.put_line('Salary: ' || v_total_salary);


-- line 2: Write codes to calculate the value of v_retire_date
dbms_output.put_line('Retired Date:' || v_retire_date);
end;
/
```

 

1. Please write codes at line 1. Calculate the value of `v_total_salary` by adding the value of `v_add` to the `v_salary`. Note that the `v_salary` is a number and `v_add` is a string.

The resultant value of `v_total_salary` is 7000, the NUMBER type. 

2. Please write codes at line 2. Calculate the value of `v_retire_date` by adding the interval `v_interval` to the `v_hire_date`. Note that the `v_hire_date` is a string, and `v_interval` is a date-time interval.

The variable `v_retire_date` should be of type DATE, and the resultant value is 31-DEC-19.

Note: Only add codes to the lines 1 and 2. Do not modify the existing codes.

### Related programming patterns

[08. Explicitly convert a data type to another data type.](../patterns/08-datatype_conversion.md)

## Practice 2: Nested blocks; variable scope and visibility

With the following codes:

```sql
Begin 
-- line 1
DECLARE
  -- The variable v_name is invisible in the inner block because there's also a v_name in the inner block.
  v_name  VARCHAR2(20) := 'Big Brother';
  v_birth DATE         := '01-Jan-2000';
BEGIN 
  DECLARE
    -- The variable makes the v_name in the outer block invisible.
    v_name VARCHAR2(20) := 'Young Brother ';
    v_birth DATE         := '01-Jan-2020';
  BEGIN
    -- line 2
  END Gen_Two;
END Gen_One;
END;
/
```

1. Please add codes to lines 1 and 2 so that the block prints out the names and the birth dates for the `Big Brother` and `Young Brother`,

Outputs:
```
Big Brother, born on 01-JAN-00
Young Brother, born on 01-JAN-20
```

2. Explain what happens when you declare a variable with the same name in inner and outer blocks. Describe how to access the shadowed variable in the outer block from the inner block.


### Related programming patterns

[09. Access shadowed local variables in the outer of the nested block.](../patterns/09-access_shadowed_local_var.md)

## Practice 3

Enter and run the following PL/SQL block containing a nested block. Look at the
output and answer the questions.

```sql
-- Declare the block
DECLARE
    -- Declare variables
    v_employee_id employees.employee_id%TYPE;
    v_job employees.job_id%TYPE;
BEGIN
    -- Select employee details for employee_id 100
    SELECT employee_id, job_id 
    INTO v_employee_id, v_job
    FROM employees
    WHERE employee_id = 100;

    -- Declare another block
    DECLARE
        -- Declare variables
        v_employee_id employees.employee_id%TYPE;
        v_job employees.job_id%TYPE;
    BEGIN
        -- Select employee details for employee_id 103
        SELECT employee_id, job_id 
        INTO v_employee_id, v_job
        FROM employees
        WHERE employee_id = 103;

        -- Output the result
        DBMS_OUTPUT.PUT_LINE(v_employee_id || ' is a(n) ' || v_job);
    END;
    -- Output the result
    DBMS_OUTPUT.PUT_LINE(v_employee_id || ' is a(n) ' || v_job);
END;
```

A. Why does the inner block display the job_id of employee 103, not employee 100?

B. Why does the outer block display the job_id of employee 100, not employee 103?

C. Modify the code to display the details of employee 100 in the inner block. Use block labels.

Note: This practice is derived from Ch 2-6 Nested Blocks and Variable Scope in the Oracle Academy. 

### Related programming patterns

[09. Access shadowed local variables in the outer of the nested block.](../patterns/09-access_shadowed_local_var.md)


  
