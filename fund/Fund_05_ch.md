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
4. 在區塊中，寫一個 INSERT WITH SUBQUERY 語句，將 `t1` 表格中的小於閾值的資料列新增到 `t1_keep` 表格中。
   - 不要使用游標或迴圈來完成這個任務，直接使用 INSERT WITH SUBQUERY 語句即可。
   - 語法提示: `insert into t1_keep select * from t1 where val < :v_threshold;` 
5. 輸出 INSERT 語句影響的資料列數(Hint: 使用 SQL 游標屬性)
6. 在同一個區塊中，寫一個 DELETE 語句，刪除 `t1` 表格中的小於閾值的資料列。
7. 輸出 DELETE 語句影響的資料列數(Hint: 使用 SQL 游標屬性)
8. Commit 區塊中的交易
9.  在區塊之後，撰寫 Query, 查詢 `t1_keep` 表格來檢查結果。

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


## Practice 04 指定梯次匯入員工薪資

### 練習情境

人事部門提供兩個梯次的員工薪資資料。每個梯次都包含既有員工的薪資調整，以及新進員工的資料。

請在同一個 SQL worksheet 中，使用 bind variable 指定要匯入的梯次，再以 PL/SQL block 執行 `MERGE`，將該梯次的資料同步到員工主檔。

本練習使用兩張資料表：

- `employees_master`：員工主檔。
- `salary_import`：待匯入的薪資資料，以 `batch_id` 區分梯次。同一梯次內，每位員工只有一筆資料。

### 一、建立資料表與初始資料

先在練習帳號的 worksheet 執行以下 SQL。初始化程式只需執行一次；請使用尚未建立這兩張表的帳號。

```sql
CREATE TABLE employees_master (
    employee_id NUMBER(6) CONSTRAINT emp_master_pk PRIMARY KEY,
    last_name   VARCHAR2(25) NOT NULL,
    salary      NUMBER(10, 2) NOT NULL
);

CREATE TABLE salary_import (
    batch_id    NUMBER(2) NOT NULL,
    employee_id NUMBER(6) NOT NULL,
    last_name   VARCHAR2(25) NOT NULL,
    salary      NUMBER(10, 2) NOT NULL,
    CONSTRAINT salary_import_pk PRIMARY KEY (batch_id, employee_id)
);

INSERT INTO employees_master (employee_id, last_name, salary)
VALUES (101, 'Chen', 6000);

INSERT INTO employees_master (employee_id, last_name, salary)
VALUES (102, 'Wang', 8000);

-- 第 1 梯次：調整員工 101 的薪資，新增員工 103。
INSERT INTO salary_import (batch_id, employee_id, last_name, salary)
VALUES (1, 101, 'Chen', 6300);

INSERT INTO salary_import (batch_id, employee_id, last_name, salary)
VALUES (1, 103, 'Lin', 4500);

-- 第 2 梯次：調整員工 102 的薪資，新增員工 104。
INSERT INTO salary_import (batch_id, employee_id, last_name, salary)
VALUES (2, 102, 'Wang', 8400);

INSERT INTO salary_import (batch_id, employee_id, last_name, salary)
VALUES (2, 104, 'Huang', 5000);

COMMIT;

SELECT employee_id, last_name, salary
FROM employees_master
ORDER BY employee_id;

SELECT batch_id, employee_id, last_name, salary
FROM salary_import
ORDER BY batch_id, employee_id;
```

員工主檔初始資料：

| 員工編號 | 姓名 |  薪資 |
| -------- | ---- | ----: |
| 101      | Chen | 6,000 |
| 102      | Wang | 8,000 |

薪資匯入表資料：

| 梯次編號 | 員工編號 | 姓名  |  薪資 |
| -------- | -------- | ----- | ----: |
| 1        | 101      | Chen  | 6,300 |
| 1        | 103      | Lin   | 4,500 |
| 2        | 102      | Wang  | 8,400 |
| 2        | 104      | Huang | 5,000 |

### 二、實作要求

請將以下三個步驟寫在同一個 worksheet，並使用同一個資料庫連線依序執行。

#### 步驟 1：指定梯次並查看來源資料

1. 在 worksheet 宣告兩個 `NUMBER` 型別的 bind variables：
   - `b_batch_id`：要匯入的梯次編號。
   - `b_merge_rows`：`MERGE` 影響的資料筆數。
2. 撰寫一個簡單的匿名 PL/SQL block，將 `b_batch_id` 設為  `2`。
3. 使用一般 SQL `SELECT`，查詢 `salary_import` 中屬於該梯次的資料，並依員工編號排序。查詢條件必須使用 `:b_batch_id`。

#### 步驟 2：匯入指定梯次

撰寫另一個匿名 PL/SQL block，完成以下操作：

1. 使用 `MERGE` 將 `salary_import` 的資料同步到 `employees_master`。
2. 在 `USING` 的來源查詢(subquery)中，使用 `:b_batch_id` 篩選指定梯次，不能匯入其他梯次的資料。
3. 使用員工編號 `employee_id` 作為來源與目標的比對條件。
4. 員工已存在時，更新姓名與薪資。
5. 員工不存在時，新增員工編號、姓名與薪資。
6. 在 `MERGE` 後立即將 `SQL%ROWCOUNT` 指派給 `:b_merge_rows`。

#### 步驟 3：查看匯入結果

1. 在 PL/SQL block 外，使用 `PRINT b_batch_id` 與 `PRINT b_merge_rows` 顯示指定梯次及處理筆數。
2. 使用一般 SQL `SELECT` 查詢 `employees_master`，依員工編號排序，確認更新及新增結果。

### 三、預期結果

`b_merge_rows` 應為 `2`，合併後員工主檔應含三位員工的資料：

| 員工編號 | 姓名  |  薪資 |
| -------- | ----- | ----: |
| 101      | Chen  | 6,000 |
| 102      | Wang  | 8,400 |
| 104      | Huang | 5,000 |

使用 `select * from employees_master order by employee_id;` 查詢你的結果。




