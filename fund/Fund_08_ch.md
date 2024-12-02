  
# Fund Lesson 08 Using Explicit Cursor

## Practice 01

主題: 
1. 明確游標: Open, Fetch, Close 游標。
2. 更新當前取得(fetch)的資料列回資料表

撰寫程式計算IT部門(id 06)員工的新薪資。此部門的每位員工薪資增加10%。在處理過程中，請列印出每位員工的以下資訊:
- 姓氏 (first name)
- 原始薪資 (original salary)
- 新薪資 (new salary)

這個練習要求你使用以下程式技巧:
1. 使用 CURSOR 定義需要回傳多列的查詢
2. 使用 OPEN, FETCH, CLOSE 陳述句操作 CURSOR
3. 將整列資料取出放至一個 RECORD 變數

輸出範例：
```
Alexander Old Salary: 9900 New Salary: 10890
Bruce Old Salary: 6600 New Salary: 7260
David Old Salary: 5280 New Salary: 5808
Valli Old Salary: 5280 New Salary: 5808
Diana Old Salary: 4620 New Salary: 5082

PL/SQL procedure successfully completed.
```


## Practice 02

更改練習 01 的程式碼完成這個練習。

你必須要使用以下的程式技巧完成這個練習:
- 使用 CURSOR 定義需要回傳多列的查詢
- 使用 CURSOR FOR-LOOP 逐列取得查詢結果
- 程式應該顯示取得的記錄數

輸出範例如下: 
```
Alexander Old Salary: 9000 New Salary: 9900
Bruce Old Salary: 6000 New Salary: 6600
David Old Salary: 4800 New Salary: 5280
Valli Old Salary: 4800 New Salary: 5280
Diana Old Salary: 4200 New Salary: 4620
Fetch lines: 5

PL/SQL procedure successfully completed.
```

相關程式模式：
- [P08_01 使用顯式游標進行 DML 操作 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch08/08-01-dml-explicit-cursor)

## Practice 03

使用以下的 SQL 陳述句準備練習需要的測試資料:
```sql
drop table emp_08;
create table emp_08 as
  select * from employees;
alter table emp_08 add (new_salary number);
```
上述 SQL 陳述句會建立一個 `emp_08` 表格，包含了 `employees` 表格的所有資料。之後，會新增一個 `new_salary` 欄位到 `emp_08` 表格。

撰寫一個程式來提高IT部門(id 06)員工的薪資10%。在處理過程中，請列印出每位員工的以下資訊:
- 姓氏 (first name)
- 原始薪資 (original salary)
- 新薪資 (new salary)

此外，你需要更新 `emp_08` 表格中的 `NEW_SALARY` 欄位。

這個練習要求你使用以下程式技巧:
- 使用 CURSOR 定義需要回傳多列的查詢
- 使用 CURSOR FOR-LOOP 逐列取得查詢結果，並鎖定要被更新的資料列，防止資料被其他使用者更新
- 使用 WHERE CURRENT OF 子句更新 `emp_08` 表格


輸出範例如下:
```
Alexander Old Salary: 9900 New Salary: 10890
Bruce Old Salary: 6600 New Salary: 7260
David Old Salary: 5280 New Salary: 5808
Valli Old Salary: 5280 New Salary: 5808
Diana Old Salary: 4620 New Salary: 5082

PL/SQL procedure successfully completed.
```

此外，請執行以下的查詢來檢查 `emp_08` 表格中 `NEW_SALARY` 欄位的值，以確認資料是否正確更新:
```sql
select * from emp_08 where department_id = 60;
```

相關程式模式：
- [P08_01 使用顯式游標進行 DML 操作 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch08/08-01-dml-explicit-cursor)