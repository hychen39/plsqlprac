# Title 

Initialize local variables when declaring them.

## Description

Initialize local variables when declaring them to avoid unexpected behavior, which is a best practice in programming.

You must to initialize variables with the constant and NOT NULL constraints.

You cannot assign a value to variables with the constant constraints in the executable section. 

## Example

```sql
set SERVEROUTPUT on 
-- declare variables 
declare
 -- a variable not initialized 
	v_cust_name varchar2(100);
 -- Init a constant. Cannot be modified in the executable section.
	v_tax_rate  constant number := 0.05;
 -- Init a variable must have a value
	v_payment   number not null := 0;
begin
	null;
    -- Assign a value to a variable with no constant constraint/
	v_cust_name := 'John Doe';
    -- Assign a value to variable with the NOT NULL constraint.
	v_payment  := 100;
    dbms_output.put_line('Customer Name: ' || v_cust_name || ' Payment: ' || v_payment);
end;
/
```

