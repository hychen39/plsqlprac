# Title

Access shadowed local variables in the outer of the nested block.

# Description

Variable shadowing occurs when a variable declared within a certain scope has the same name as a variable declared in an outer scope.

This situation usually occurs in nested blocks. You declare a local variable in the nested block with the same name as the one in the outer block. 

When you are in the nested block, the local variable in it shadows the local variable in the outer block.

```sql
declare
    x number := 10;
begin
    declare
        x number := 20;
    begin
        -- outer local variable x is shadowed by the inner local variable 
        dbms_output.put_line(x); -- 20
    end;
    dbms_output.put_line(x); -- 10
end;
/
```

You must qualify the outer local variable with the block label to access it.

# Example


```sql
<<outer>>   -- label for the outer block
declare
    x number := 10;
begin
    declare
        x number := 20;
    begin
        dbms_output.put_line('Inner x: ' || x); -- 20
        dbms_output.put_line('Outer x: ' || outer.x); -- 10; Qualify the outer local variable with the block label
    end;
    dbms_output.put_line(x); -- 10
end;
/
```
  
