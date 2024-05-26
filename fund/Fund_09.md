
# Fund Lesson 09 Handling Exceptions

## Practice 01: Handling predefined errors (errors with names)

Topics: Handling predefined errors (errors with names)

Consider the following program that tries to put the employee record with ID 99 to the variable V_EMP:
```sql

SET serveroutput ON
DECLARE
  v_emp employees%rowtype;
BEGIN
  SELECT * INTO v_emp FROM employees e WHERE e.department_id = 99;
END;
/
```

The program gets the following error report: 
```
ORA-01403: no data found
ORA-06512: at line 4
01403. 00000 -  "no data found"
*Cause:    No data was found from the objects.
*Action:   There was no data from the objects which may be due to end of fetch.
```

Please add the exception handling section to the program. Your program should print out the error code and message for the NO_DATA_FOUND exception and terminate gracefully. 

Outputs should look like the following:
```
Error code: 100
Error Msg: ORA-01403: no data found

PL/SQL procedure successfully completed.
```
Note the state should be successfully completed after you execute the program. 

<!-- ## Practice 02

Topics: Handling predefined errors (errors with names)

Write the program to get the record of the employee whose first name is `Steven`. 
Save the record to a variable of the record type.

Since there are more than one employees who meet the condition, your program should generate the TOO_MANY_ROWS exception.  

Add an exception handling section to handle it. Print out the error code and the error message for the caught exception.    -->

## Practice 02: execution flow when an exception occurs

Consider the following program? What is the output of the program? Why?

```sql
SET serveroutput ON
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
  SELECT * INTO v_emp FROM employees e WHERE e.department_id = 99;
  SELECT * INTO v_emp FROM employees e WHERE first_name='Steven';
  DBMS_OUTPUT.PUT_LINE('Mission Complete!!');

EXCEPTION
   when NO_DATA_FOUND then
      DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND EXCEPTION');
   WHEN TOO_MANY_ROWS then
      DBMS_OUTPUT.PUT_LINE('TOO_MANY_ROWS EXCEPTION');
  WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('OTHER EXCEPTIONS');
END;
/
```
Options: 

A) NO_DATA_FOUND EXCEPTION

B) TOO_MANY_ROWS EXCEPTION

C) OTHER EXCEPTIONS

D) Mission Complete!!

E) None of the above. 

## Practice 03 Handling Non-Predefined server errors


The following program tries to insert a row in the `DEPARTMENTS` table.:
```sql
BEGIN
  INSERT INTO DEPARTMENTS
    (DEPARTMENT_ID, DEPARTMENT_NAME) 
    VALUES     (280, NULL );
END;
/

```
However, an error report is generated after the program is executed:
```
Error report -
ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")
ORA-06512: at line 2
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
```
Please add an exception handling section to handle the exception so that the program can terminate gracefully.

You need to declare an exception and associate it with the error number -1400 in the declarative section. 

## Practice 04: Throwing and trapping User-defined exceptions


Consider the following program that updates the LOCATION table:
```sql
set serveroutput on
DECLARE
-- Define required variables
v_country_id varchar2 (20) := 'TW';
v_name VARCHAR2(20) := 'Taichung';

BEGIN
-- update the department
UPDATE locations
SET city = v_name
where country_id = v_country_id;

DBMS_OUTPUT.put_line('Updated rows: ' || sql%rowcount);

END;
/
```

The outputs after executing the program are as follows:
```
Updated rows: 0
PL/SQL procedure successfully completed.
```

Add codes to the given program to meet the following requirements:
- When no row is updated, the program should throw the user-defined exception `E_INVALID_LOCATION`.
- Add an exception handling section to catch the `E_INVALID_LOCATION` exception and print out the following message:
`No such country ID: [your_country_id] exists.`



## Practice 05: Exception propagation in the nested blocks


Consider the following program. The line after the Mark 1 causes the program error. 
Please use a nested block to enclose the line and handle the exception caused by the line inside the nested block. 

Note that the lines with marks 2 and 3 cannot be executed in the exception handling section.  

```sql 
SET serveroutput ON
declare 
  v_value number;
BEGIN
  
  dbms_output.put_line('Mark-1'); -- ##2 

  -- #1 The line below throw the VALUE_ERROR  exception (ORA-06502) 
  v_value := to_number('AA0');  

  dbms_output.put_line('Mark-2');  -- #3

END;
```
/


## Practice 06: Throw user-defined error code and message.  

Topic: Throw user-defined error code and message.  

Execute the following codes to create a Stored Procedure:
```sql
create or replace PROCEDURE RAISE_USER_DEFINE_ERROR AS 
BEGIN
  raise_application_error(-20000, 'Throw an app error. User-defined error.');
END RAISE_USER_DEFINE_ERROR;
/
```

Consider the following program:
```sql
set serveroutput on
declare
-- Add codes 
BEGIN

-- Add codes 
-- call the procedure RAISE_USER_DEFINE_ERROR
raise_user_define_error();
-- Add codes 

END;
/
```

An error report is generated after executing the previous program:
```
Error report -
ORA-20000: Throw an app error. 自訂錯誤
ORA-06512: at "HR.RAISE_USER_DEFINE_ERROR", line 4
ORA-06512: at line 6
20000. 00000 -  "%s"
*Cause:    The stored procedure 'raise_application_error'
           was called, which causes this error to be generated.
*Action:   Correct the problem as described in the error message or contact
           the application administrator or DBA for more information.
```

Please add an exception handling section the the previous program so that it can catch the user-defined error and print out the user-defined error code and message as follows:
```
Err Msg:ORA-20000: Throw an app error. User-defined error.

PL/SQL procedure successfully completed.
```
