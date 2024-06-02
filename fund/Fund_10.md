
# Fund Lesson 10 Introducing Stored Procedures and Functions

Run the following SQL script to create the student_scores table:

```sql
CREATE TABLE student_scores (
    stu_id number(10) PRIMARY KEY,  -- Student ID
    subject varchar2(50) not null ,  -- Subject. e.g. Math, English, Science
    score number(3) not null -- Score. 0 ~ 100
);
```

Insert the following sample data into the student_scores table:

```sql
INSERT INTO student_scores VALUES (1, 'Math', 90);
INSERT INTO student_scores VALUES (2, 'Math', 80);
INSERT INTO student_scores VALUES (3, 'Math', 70);
INSERT INTO student_scores VALUES (5, 'Science', 85);
INSERT INTO student_scores VALUES (6, 'Science', 75);
INSERT INTO student_scores VALUES (7, 'Science', 65);
commit;
```

## Practice 1: Create a Stored Procedure

Create a stored procedure named `add_score` that takes three parameters: `stu_id`, `subject`, and `score`. 
The stored procedure should insert a new record into the student_scores table.
The procedure should check the `score` parameter to ensure it is between 0 and 100.
If the `score` is not within the valid range, the procedure should raise an custom application error. 
Use the error code -20001 and the error message  `Invalid score` for the custom error.

For example, the following call to `add_score` should insert a new record into the student_scores table:

```sql
BEGIN
    add_score(8, 'Math', 95);
END;
```

The following call to `add_score` should raise an error:

```sql
BEGIN
    add_score(8, 'Math', 105);
END;
```

## Practice 2: Create a stored function 

Create a stored function named `get_score` that takes two parameters: `stu_id` and `subject` and returns the score for the student and subject.

The function should handle the exception when the student ID and subject are not found in the student_scores table.
The function should return -1 and print a warn message "The following student ID and subject does not exist <student_id>, <subject>" if the exception is raised.

Use the following SQL to test the function:

```sql
begin 
    dbms_output.put_line('Score: ' || get_score(1, 'Math'));
    dbms_output.put_line('Score: ' || get_score(4, 'Math'));  -- # This line will raise an error
    dbms_output.put_line('Score: ' || get_score(5, 'Science'));
end;
```

The output should be:
```
Score: 90
The following student ID and subject does not exist 4, Math
Score: -1
Score: 85
```

## Practice 3: Handle exceptions when calling stored procedures

Consider the following SQL script that using the `add_score` procedure in the previous practice to insert multiple records into the student_scores table:

```sql
BEGIN
    add_score(20, 'Math', 105); --#1 This will raise an error
    add_score(21, 'Math', 95);
    add_score(22, 'Math', 85);
end;
/
```

Add exception handling codes to the script so that it can continue to insert the remaining records even if the error occurs in the first call to `add_score`.








