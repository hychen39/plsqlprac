
# Fund Lesson 7 Practices

<!-- zh-Tw Translation of [Fund_07_practices.md](Fund_07_practices.md) -->

## Practice 01: 使用自定的記錄類型

Define a record type that includes the following fields:
- emp_id: employee_id from employees table
- first_name: first_name from employees table
- last_name: last_name from employees table
- dept_name: department_name from departments table
- salary: salary from employees table

定義一個記錄類型，包含以下欄位：
- emp_id: 參考到 employees 表格的 employee_id
- first_name: 參考到 employees 表格的 first_name
- last_name: 參考到 employees 表格的 last_name
- dept_name: 參考到 departments 表格的 department_name
- salary: 參考到 employees 表格的 salary

你需要自己決定每個欄位的資料型態。

使用這個記錄類型來宣告一個變數，來存儲來自於 `Employees` 表格 employee_id 為 124 的員工的相對應的欄位值。例如，`employee_id` 的值應該存儲在記錄類型的 `emp_id` 欄位中。

接著，你的程式應該輸出記錄類型變數中的 `emp_id`, `first_name` 和 `salary` 欄位值。

你可以參考教科書的 P7-12 的範例來完成這個練習。

### 相關程式樣態

[P07_01 RECORD 型態變數的定義、宣告及使用 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch07/07-01-access-record-fields)

## Practice 02:  DML 操作中使用 RECORD 型態變數

使用以下的 DDL 語句來建立所需的表格：
```sql
CREATE TABLE retired_emps
  (
    EMPNO     NUMBER(4),
    ENAME     VARCHAR2(10), -- last name
    JOB       VARCHAR2(9),  -- job id
    MGR       NUMBER(4),    -- manager id
    HIREDATE  DATE,
    LEAVEDATE DATE,
    SAL       NUMBER(7,2),  -- salary
    COMM      NUMBER(7,2),  -- commission percentage
    DEPTNO    NUMBER(2)     -- department number
  );
```

我們有以下的 PL/SQL 程式碼，其中有部分的程式碼。
我們已經宣告了一個變數 `v_retired_emps` 來存儲 `retired_emps` 表格的資料。
你必須在 Task 1 到 5 的標記後寫程式碼來完成以下要求：
- Task 1: 將 來自於 EMPLOYEES 表格中的 employee_id 為 124 的資料列的相應欄位值存儲到 RECORD 變數 `v_retired_emps` 中。注意 `employees` 表格中沒有 `LEAVEDATE` 欄位。
- Task 2: 將 `v_retired_emps` 變數的值新增到 `retired_emps` 表格中。使用 `v_retired_emps` 變數一整列。
- Task 3: 將 `v_retired_emps` 變數中的 `LEAVEDATE` 欄位設置為今天的日期。
- Task 4: 使用 `v_retired_emps` 變數的值來更新 `retired_emps` 表格中相應的資料列。使用 `v_retired_emps` 變數做整列更新。

完成後，你可以使用 `select * from retired_emps;` 來檢查你的結果。

部份的程式碼如下：
```sql
DECLARE
  -- Declare the record variable for the table retired_emps.
  v_retired_emps retired_emps%rowtype;
BEGIN
  -- Task 1: 
  -- Write your codes here

  -- Task 2 
  -- Write your codes here
 
  -- Task 3
  -- Write your codes here
  
  -- Task 4
  -- Write your codes here
  
  -- Task 5
  -- Write your codes here
   
END;
/
```

### 相關程式樣態

[P07_03 在 DML 語句中使用 RECORD 變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch07/07-03-select-update-insert-with-record)

## Practice 03: Index-by table 操作: 存取和遍歷索引表中的值。

撰寫一個 PL/SQL 程式來滿足以下要求：
1. 找出所有員工的平均薪資。
2. 使用 `FOR-LOOP` 找出薪資低於平均薪資的員工資料列，並將這些資料列存儲在索引表中。
   - 員工編號的範圍從 100 到 200。注意, EMPLOYEES 表格中的 employee_id 在 100 到 200 之間應該要有連號。
3. 使用 `WHILE-LOOP` 遍歷索引表(index-by table)中的所有記錄。輸出每個記錄的 `employee_id` 和 `salary` 欄位值。


## Practice 04: 使用 SELECT BULK COLLECT INTO 捉取多筆資料放入 Index-by Table

參考 HR schema, 撰寫一個 PL/SQL 程式一次捉取多筆資料並將存到 Index-by Table 中。
1. 查詢位於英國的部門的部門編號(department_id)和部門名稱(department_name)。將這些資料存到 Index-by Table `l_dept_uk_tab` 中。
   - Index-by Table 中的記錄包含兩個欄位及其型態：(dept_id number, dept_name departments.department_name%type)
   - 你需要使用 `select bulk collect into` 來完成這個任務。
2. 從第一筆記錄開始，遍歷 Index-by Table `l_dept_uk_tab` 中的所有記錄，輸出部門名稱。
   - 你需要使用 `WHILE-LOOP` 來遍歷 Index-by Table。


### 相關程式樣態

[P07_04 存放 SELECT 語句回傳的多筆資料列 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch07/07-04-handle-select-with-multiple-rows)





