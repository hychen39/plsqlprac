# Fund Lesson 5 Practices


## Practice 01: 在 PL/SQL 中使用 SQL 語句

準備練習所需要的表格
```sql
create table dept as 
select * from departments;
```

撰寫一個匿名區塊來完成下列要求：

1. 在 `dept` 表格中找到最大的部門 ID。然後將這個 ID 存儲到區域變數 `v_max_deptno` 中。接著輸出這個變數的值。
2. 新增一個部門到 `dept` 表格中。新部門的欄位值如下:
   - 部門 ID: `v_max_deptno` + 10
   - 部門名稱: 'Education'
   - 位置 ID: null


### 相關程式模式:
- [P05_01 在 PL/SQL 中撰寫 DML 語句 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch05/05-01-write-dml-stmt)
- [P05_02 取得 DML 語句所影響的資料列數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch05/05-02-obtain-num-affected-rows)


## Practice 02: 在 PL/SQL 中使用 MERGE 語句合併兩個表格的資料

請依照以下步驟完成練習：

Step 1. 使用 CREATE AS SUBQUERY 語句來建立 `emp_salary_1` 表格：
```sql
create table emp_salary_1 as
select e.employee_id, e.first_name, e.salary , 0 as NEW_SALARY
from employees e
where rownum <2;
```
這個表格應該只有一列，並確保第三欄 `NEW_SALARY` 的值為 0。
    

Step 2. 執行以下語句來建立 `emp_salary_2` 表格。
```sql
create table emp_salary_2 as
select e.employee_id, e.first_name, e.salary 
from employees e
where rownum <3;
```
這個表格應該有兩筆資料列


Step 3. 確認 `emp_salary_1` 及 `emp_salary_2` 表格是否已經建立。
```sql
select tname from tab where tname like 'EMP_SALARY%';
```

Step 4. 撰寫一個匿名 PL/SQL 區塊來將 `emp_salary_2` 表格的資料合併到 `emp_salary_1` 表格中。
   - 當合併兩個表格時，`emp_salary_1.NEW_SALARY` 欄位的值應該更新為 `emp_salary_2.salary` * 1.2。
   - 在合併完成後，輸出更新的資料列數。

(Hint: 使用 MERGE 語句和 SQL 游標屬性)

### 相關程式模式:

- [P05_01 在 PL/SQL 中撰寫 DML 語句 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch05/05-01-write-dml-stmt)
- [P05_02 取得 DML 語句所影響的資料列數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch05/05-02-obtain-num-affected-rows)

## Practice 03 撰寫工作表來維護表數據

執行以下語句來準備練習所需的表格 `t1` 和 `t1_keep`：

```sql
-- 原始表格
create table t1 (id number primary key, val number);

-- 用來保留將要刪除的資料列的表格
create table t1_keep (id number primary key, val number);

-- 新增 10 筆隨機數值的資料列至 t1 表格
insert into t1 
select rownum, round(dbms_random.value(1,100),0)  from dual connect by level <= 10;

-- 查看表格 t1
select * from t1;

commit;
```
`t1` 表格中應該有 10 筆資料列。

你要撰寫一個命令稿, 將 `t1` 表格中的資料列的值小於閾值的資料列插入到 `t1_keep` 表格中，並刪除 `t1` 表格中的這些資料列。
這個閾值存於一個綁定變數(bind variable)中，值為 50。

依照下列步驟來完成:

1. 宣告一個綁定變數(bind variable)來存儲一個閾值
2. 設定閾值為 50
3. 寫一個空的 PL/SQL 區塊
4. 在區塊中，寫一個 INSERT WITH SUBQUERY 語句，將 `t1` 表格中的資料列的值小於閾值的資料列插入到 `t1_keep` 表格中。
5. 輸出 INSERT 語句影響的資料列數
6. 在同一個區塊中，寫一個 DELETE 語句，刪除 `t1` 表格中的資料列的值小於閾值的資料列。
7. 輸出 DELETE 語句影響的資料列數
8. Commit 區塊中的交易
9. 在區塊之後，撰寫 Query, 查詢 `t1_keep` 表格來檢查結果。

範例輸出：
```
PL/SQL procedure successfully completed.
Rows kept: 3
Rows deleted: 3

PL/SQL procedure successfully completed.
        ID        VAL
        ---------- ----------
                 3          3         
                 7         23         
                 8         10
```

### 相關程式模式:

- [P03_03 綁定變數的使用 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-03-bind-var)
- [P05_03 插入多筆資料列至表格中 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch05/05-03-insert-multi-rows)
