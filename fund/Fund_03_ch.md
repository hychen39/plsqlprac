# Fund Lesson 3 Practices

## Practice 1

ID 104 的員工自入職之日起工作一年後將首次獲得加薪，增幅將 10%。

請列印第一次加薪日期和新的工資。

### 相關程式樣態

[P02_01 從表格中選取多個欄位值並存入 Pl/SQL 變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch02/02-01-select-into)

[P03_01 變數初始化 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-01-init-var)

[P03_02 指派格式敏感(format-sensitive)的文字值給變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-02-init-var-format-sens)

## Practice 2

建立另一個新的工作表(worksheet)。複製並修改練習1中的程式碼，完成練習。

建立兩個綁定變數(bind variable)。使用其中一個儲存員工 ID，其值為 104。新的工資應該儲存到另一個綁定變數中。

執行工作表後，您應該列印出兩個綁定變數的值。
 
執行工作表時，應按 F5 鍵執行整個工作表。不要按 Ctrl + Enter 逐行執行。

### 相關程式樣態

[P03_03 綁定變數的使用 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-03-bind-var)

## Practice 3

尋找ID為200的員工所在的部門名稱。將部門名稱儲存到變數 `v_dept_name` 中並將其列印出來。

變數類型應參考 `departments` 表中的 `department_name` 欄位的資料類型。 

提示：必須在查詢中連接 `Employees` 和 `Departments` 表格。

### 相關程式樣態

[P03_04 %type 綁定區域變數的資料型態到表格的欄位資料型態 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-04-type-ref)
