
# Fund Lesson 6 Practices

## Practice 01: Case statement

**Topic: Case Statement**

Write a PL/SQL program to print the salary grade for the employee with ID 206. 
The salary is graded as:
- C level, if it is less than or equal to 94000. 
- B level, if it is between 9400 and 16700,
- A, Otherwise. 

Please use the (searched) CASE statement to complete the task. 


Program outputs:
```
PL/SQL procedure successfully completed.

Employee ID#206. Salary: 8300.Salary code: C
```

## Practice 02 `IF-ELSIF-ELSE` statement

Rewrite Practice 1 by using the IF-ELSE statement. 


## Practice 03: Loop Statement

Create the `msg` table with the following statements:
```sql
DROP TABLE messages;
CREATE TABLE messages (results VARCHAR2(80));
```

Insert into `msg` table the numbers from 1 to 10 except 6 and 8. 
You should use the `CONTINUE` statement to complete the task.
Please commit the transaction after you execute the PL/SQL program. 
Query the  `msg` table to display your result to confirm. 

## Practice 04 Comprehensive practice for chapters 5 and 6

Covered Topics:
* Chapter 5 Interacting with Oracle Database Server: SQL statements in PL/SQL Engine
* Chapter 6 Writing Control Structures
* 


Create two tables `A_EMP` and `B_EMP` with the following statements:
```sql
create table A_EMP(employee_id NUMBER(6,0) PRIMARY KEY, salary number(8,2));
create table B_EMP(employee_id NUMBER(6,0) PRIMARY KEY, salary number(8,2));
```

Please write a PL/SQL program to insert data of employees with IDs from 100 to 150 to `A_EMP` and `B_EMP` respectively, according to the following rules:

1. if Salary >= 10000, insert employee_id and salary to  `A_EMP` table.
2. if Salary <= 2500, insert employee_id and salary to `B_EMP` table.

In addition, your program should print employee_id and salary of employees who do not meet the above rules. 

After executing the PL/SQL program, please query the `A_EMP` and `B_EMP` tables to confirm the results.


Referenced outputs:
Rows in the `A_EMP`:
```
Id  Salary
---------
101	17000
102	17000
108	12008
114	11000
145	14000
146	13500
147	12000
148	11000
149	10500
150	10000
```

Rows in the `B_EMP`
```
Id  Salary
---------
119	2500
127	2400
128	2200
131	2500
132	2100
135	2400
136	2200
140	2500
144	2500
```
