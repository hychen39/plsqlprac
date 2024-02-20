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
-- line 1
dbms_output.put_line('Salary: ' || v_total_salary);


-- line 2
dbms_output.put_line('Retired Date:' || v_retire_date);
end;
/
```

 

1. Please write codes at line 1. Calculate the value of 
```
v_total_salary = v_salary + v_add
```
The resultant value of `v_total_salary` is 7000, which is the NUMBER type. 

2. Please write codes at line 2. Calculate the value of 
```
v_retire_date = v_hire_date + v_interval
```

The variable `v_retire_date` is of type DATE and the resultant value is 31-DEC-19.


## Practice 2: Nested blocks; variable scope and visibility

With the following codes:

```sql
Begin 
-- line 1
DECLARE
  -- The variable is invisible in inner block because there's also a v_name in the inner block.
  v_name  VARCHAR2(20) := 'Big Brother';
  v_birth DATE         := '01-Jan-2000';
BEGIN 
  DECLARE
    -- The variable make the v_name in the outer block invisible.
    v_name VARCHAR2(20) := 'Young Brother ';
    v_birth DATE         := '01-Jan-2020';
  BEGIN
    -- line 2
  END Gen_Two;
END Gen_One;
END;
/
```

Please add codes to lines 1 and 2 so that the block prints out the names and the birth dates for the `Big Brother` and `Young Brother`,

Outputs:
```
Big Brother, born on 01-JAN-00
Young Brother, born on 01-JAN-20
```
