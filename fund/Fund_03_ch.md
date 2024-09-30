# Fund Lesson 3 Practices

## Practice 1

ID 104 的員工自入職之日起工作一年後將首次獲得加薪，增幅將 10%。

請列印第一次加薪日期和新的工資。

### 相關程式樣態

[從表格中選取多個欄位值並存入 Pl/SQL 變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/01-02-select-into)

[03. Initialize local variables when declaring them.](../patterns/03-init_variables.md)

[05. Assign or initialize format-sensitive literal values to variables: date, timestamp, and interval. ](../patterns/05-assign_format_sensitive_literal.md)

## Practice 2

建立另一個新的工作表(worksheet)。複製並修改練習1中的程式碼，完成練習。

建立兩個綁定變數(bind variable)。使用其中一個儲存員工 ID，其值為 104。新的工資應該儲存到另一個綁定變數中。

執行工作表後，您應該列印出兩個綁定變數的值。
 
執行工作表時，應按 F5 鍵執行整個工作表。不要按 Ctrl + Enter 逐行執行。

### Related programming patterns

[07. Use bind variables as the worksheet variables to exchange data between the blocks.](../patterns/07-bind_variables.md)

## Practice 3

尋找ID為200的員工所在的部門名稱。將部門名稱儲存到變數 `v_dept_name` 中並將其列印出來。

變數類型應參考 `departments` 表中的 `department_name` 欄位的資料類型。 

提示：必須在查詢中連接 `Employees` 和 `Departments` 表格。

### Related programming patterns

[06. Refer table column's data types to declare variables](../patterns/06-ref_col_type_to_declare.md)
