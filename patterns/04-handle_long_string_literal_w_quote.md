# Title 

P04. Handle long string literals that may contain single quotes.

## Description

Often, you assign a long string literal to a variable in PL/SQL. The string literal may contain single quotes that are used as the delimiter for the string, which can cause a syntax error.

For example, you want to assign the following SELECT statement containing string literals to a variable:
```sql
SELECT * FROM employees
        WHERE employee_id = 100
        AND last_name = 'King'
```

To avoid the syntax error, use the quote operator `q` to enclose the string literal. The quote operator customizes the delimiter for the string literal. 

## Example 

```sql
-- Use quote operator with very long string literals and containing single quotes
declare
    v_long_string varchar2(4000);
begin
    v_long_string := q'{
        SELECT * FROM employees
        WHERE employee_id = 100
        AND last_name = 'King'
    }';
    dbms_output.put_line(v_long_string);
end;
/
```
