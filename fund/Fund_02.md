# Fund Lesson 2 

## Practice 1: Writing the first anonymous block


Write an anonymous block to print out the full name of the employee with ID 110.

![](/img/f02-i01.png)


## Practice 2: Find the employee with the highest salary

Write an anonymous block to find the employee with the highest salary in the company.
Print out the first name of the employee and the department name where the employee works.


## Notes

- `set serveroutput on`: turn on this option to make `DBMS_OUTPUT.PUT_LINE` outputs results to the SQLDeveloper. 
    - Ref: http://docs.oracle.com/cd/B19306_01/server.102/b14357/ch12040.htm
- `DBMS_OUTPUT` package: a package to output messages to the console.
    - Ref: http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_output.htm#ARPLS036
- The function of the slash `/` at the end of the block: slash(/) 
Executes the PL/SQL block which is stored in the SQL buffer.
  - Ref: 
    * https://docs.oracle.com/cd/B19306_01/server.102/b14357/ch12004.htm
    * http://stackoverflow.com/questions/1079949/when-do-i-need-to-use-a-semicolon-vs-a-slash-in-oracle-sql
    