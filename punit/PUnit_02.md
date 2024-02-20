  

# PU Less 2: Creating procedures  


## Practice 1： Create and call stored procedures


Please create a stored procedure `Hello_Proc` to print out the message `Hello, I'm from DB`.

Use the EXEC statement and an anonymous block to call your procedure. 

建立一 stored procedure: Hello_Proc 會印出 `Hello, I'm from DB` 訊息。在 PL/SQL BLOCK 內，使用 EXEC 敘述呼叫此 stored procedure. 

## Practice 2: Create a procedure with two parameters 

Create a stored procedure `dept_max_salary` with the following two parameters. 

Parameter name | Mode | Data type
---|------|---
`p_dept_id` | in | Reference to the department_id column in the `employees` table.|
`p_salary` | out | Reference to the salary column in the `employees` table. |

The procedure should return the maximum salary through the parameter `p_salary` according to the parameter `p_dept_id` value. 

Use department ids 50 and 60 to test your procedure. 


## Practice 3: Throw a user-defined error from a procedure 

Modify your `dep_max_salary` procedure by adding codes to check application logic. 

If the maximum salary of the given department is null, the procedure should throw an application error with the code -20000 and the error message 'Null Max Salary'.

In addition, you need to handle the application error in the `dep_max_salary` procedure and print out the error message.

Use the following anonymous block to call your `dep_max_salary`  with various department IDs:
```
declare 
    l_salary number
begin
    dep_max_salary(100, l_salary);
    dbms_output.put_line('Dept 100: ' || l_salary);
    dep_max_salary(105, l_salary);
    dbms_output.put_line('Dept 105: ' || l_salary);   -- no such ID in the departments table
    dep_max_salary(110, l_salary);
    dbms_output.put_line('Dept 110: ' || l_salary);
end;
/
```

Your anonymous block should complete SUCCESSFULLY. 


  
