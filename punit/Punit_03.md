# PU Lesson 3 Creating Functions

## Practice 1 Creating a function 

Create a function to decide if the job tenure of an employee is greater than 13 years.

The function specification is as the following: 
`is_senior(p_employee_id number) return integer`

Parameter:
`p_employee_id`: employee id 

Return values:
- 1 represents true 
- 0 represents false 

You can use the following statement to calculate the job tenure in years for an employee:

```sql
v_tenure := months_between(SYSDATE, v_hire_date)/12;
```

Use the following SQL statement to test your function:

```sql
SELECT employee_id, first_name, hire_date, trunc((CURRENT_DATE - hire_date)/365) AS seniority, is_senior(employee_id) "Senior Employee" FROM employees ;
```

Sample outputs：
```
100	Steven	17-JUN-03	15	1
101	Neena	21-SEP-05	13	1
102	Lex	13-JAN-01	18	1
103	Alexander	03-JAN-06	13	1
104	Bruce	21-MAY-07	12	0
105	David	25-JUN-05	13	1
106	Valli	05-FEB-06	13	1
107	Diana	07-FEB-07	12	0
108	Nancy	17-AUG-02	16	1
```

## Practice 2 Handling exceptions in functions

Create a function `DEPT_NAME`. 
The function should return the department name when an employee id is given. 

The function should catch any exceptions and handle them. Return a null value whenever exceptions occur. 

To test your function, please use the following codes: 

```sql
set SERVEROUTPUT ON
begin
  for i in 100..200 loop
    dbms_output.put_line( i || ' ' || dept_name(i));
  end loop;
end;
/
```

Note that the department name for employee id 178 is null in the sample outputs:
```
...
176 Sales
177 Sales
178 
179 Sales
180 Shipping
181 Shipping
...
```

## Practice 3 Using stored function in SQL statements

Create the function `emp_country_name`. By giving an employee id, the function should return the country name in which the employee's department locates. When exceptions occur, the function should catch them and return the following message `!! Invalid employee id !!` .

Use the following SQL statement to test your function:
```sql
select e.EMPLOYEE_ID, last_name, emp_country_name(employee_id)
from employees e	
where e.EMPLOYEE_ID in (100, 145, 201, 178)
order by 1;
```

Sample outputs:
```
100	King	United States of America
145	Russell	United Kingdom
178	Grant	!!Invalid employee id!!
201	Hartstein	Canada
```

HR schema 

![](https://oranswer.files.wordpress.com/2013/12/oracle_hr_schema.jpg)

  
## Practice 4 Creating Employee Review Date Function

### Use Case

The HR department needs to calculate the employee review date based on the hire date. The review date is defined as the first Friday on or after every 6-year anniversary of the hire date. If the employee has not completed 6 years of service, the function should return NULL.

The caller will provide the hire date as input, and the function will return the calculated review date or NULL if the employee has not completed 6 years of service.


### IPO Analysis

#### Input

| Name | Type | Description |
|---|---|---|
| p_hire_date | DATE | Employee hire date | 

#### Output

| Name | Type | Description |
|---|---|---|
| Return value | DATE | Review date |


### Process 

1. Calculate completed years of service.
2. Determine completed 6-year cycles.
3. Compute the 6-year anniversary date.
4. Find the first Friday on or after the anniversary date.

### Function Specification

Using the inputs and outputs defined above, one can specify the function as follows:

```sql
CREATE OR REPLACE FUNCTION get_review_date (
    p_hire_date IN DATE
) RETURN DATE;
```

### Task 

Your task is to implement the function according to the specification and process described above.

Upload your complete function code and screenshot of test results to complete the assignment.

### Test Cases 

You can use the following SQL statements to test your function:

```sql
SELECT get_review_date(DATE '2021-01-01') FROM dual;
SELECT get_review_date(DATE '2019-03-01') FROM dual;
SELECT get_review_date(DATE '2020-05-08') FROM dual;
```

The expected outputs are:

```
2027-01-07
2025-03-07
NULL
```

