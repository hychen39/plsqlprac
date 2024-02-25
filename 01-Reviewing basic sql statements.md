  
# Review of basic SQL Query statement

## The HR Schema 

![](img/24-02-25-21-33-12.png)

## Query a single table to make reports

Q1: List the employees in the department 90. The report should include the employee number, last name, first name, and salary. (Basic Select Statement, selecting specific columns and filtering rows with a WHERE clause)


Q2: Continue with the previous query. Set the column headings to `Employee`, `Last Name`, `First Name`, and `Salary`. (Set the column headings)


Q3: Continue with the first query. Concatenate the first and last name columns as the `Full Name` column. (Computation column)


Q4: Continue with the third query. Sort the result by the salary in descending order. (Order by)

Q5: Create a report to show the average salary for each department. The report should include the department number and the average salary. (Group by and aggregation function)

Q6: Create a report for the department whose average salary is greater than 10,000. The report should include the department number and the average salary. (Having clause to filter grouping results)

Summary for the basic SQL statements:

```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition
ORDER BY column1, column2, ... ASC|DESC
GROUP BY column1, column2, ...
HAVING condition
```

## Query multiple tables to make reports

Q7: Create a report to show the employee's full name, department name, and job title. (Joining tables). Use the Natural Join clause to join the tables.

Q8: The same report as the previous query, but use the Using clause to join the tables.

Q9: The same report as the previous query, but use the ON clause to join the tables.

Summary for table join clauses:
- Use the Natural Join clause when you want to use the same column names in two tables to join them.
- Use the Using clause when you want to use one of the common column names in two tables to join them.
- Use the ON clause when there are no common column names in two tables, and you want to join them.


  
