# Fund Less 04 Practices 

## Practice 1: Explicit conversion 明確轉換

使用以下未完成的程式碼, 完成以下的要求

1. 請在 Mark 1 編寫程式碼以算出總薪水(v_total_salary)的值。
- 把 `v_salary` 和 `v_add` 相加後 可以得到 `v_total_salary` 的值。請注意， `v_salary` 是數字，`v_add`是一個字串，他們不能直接相加。
- 變數 `v_total_salary` 的值應該是 7000, 是數字型態。

1. Please write codes at line 2. Calculate the value of `v_retire_date` by adding the interval `v_interval` to the `v_hire_date`. Note that the `v_hire_date` is a string, and `v_interval` is a date-time interval.
2. 請在 Mark 2 編寫程式碼以算出退休日期(v_retire_date)的值。
- 把 `v_interval` 加到 `v_hire_date` 後可以得到 `v_retire_date` 的值。請注意， `v_hire_date` 是一個字串，`v_interval` 是一個日期時間間隔。
- `v_hire_date` 內的日期文字不符預設的日期格式 (DD-MON-RR), 請注意這一點。
- 變數 `v_retire_date` 的值應該是 31-DEC-19, 是日期型態。

注意：只需在 Mark 1 及 Mark 2 的地方加入程式碼，不要修改現有的程式碼。

```sql 
set serveroutput on

declare
v_salary number(6) :=6000;
v_total_salary v_salary%type;
v_add varchar2(10) := '1000';
v_hire_date  varchar2(100) := 'December 31, 2016';
v_interval CONSTANT interval year to month := '3-0';
v_retire_date date;

begin
-- Mark 1：編寫程式碼計算 v_total_salary的 值
-- 你的程式碼從這裡開始
--
dbms_output.put_line('Salary: ' || v_total_salary);


-- Mark 2：編寫程式碼計算v_retire_date的值
-- 你的程式碼從這裡開始
--
dbms_output.put_line('Retired Date:' || v_retire_date);

end;
/
```


### 相關的程式樣態

[P03_02 指派格式敏感(format-sensitive)的文字值給變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch03/03-02-init-var-format-sens)

[P04_01 明確轉換 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch04/04-01-explicit-convert)

## Practice 2: 巢狀區塊; 變數的範圍和可見性

With the following codes:
參考以下的程式碼，完成以下要求：

1. 請在 Mark 1 和 Mark 2 加入必要的程式碼，以列印出 `Big Brother` 和 `Young Brother` 的名字和出生日期。

輸出結果：
```
Big Brother, born on 01-JAN-00
Young Brother, born on 01-JAN-20
```

2. 當你在內部和外部區塊中使用相同的變數名稱時，會發生什麼？描述如何從內部區塊中訪問外部區塊中的變數。

```sql

-- Mark 1 加入區塊的標籤
DECLARE
  -- 變數 v_name 在內部區塊中不可見，因為內部區塊中也有一個 v_name。
  v_name  VARCHAR2(20) := 'Big Brother';
  v_birth DATE         := '01-Jan-2000';
BEGIN 
  DECLARE
    --此變數使外部區塊中的 v_name 不可見。
    v_name VARCHAR2(20) := 'Young Brother ';
    v_birth DATE         := '01-Jan-2020';
  BEGIN
    -- Mark 2
    -- 在這裡寫程式碼以列印出 `Big Brother` 和 `Young Brother` 的名字和出生日期。
  END Gen_Two;
END Gen_One;
/
```

### 相關的程式樣態

[P04_02 存取被遮蔽的外部區域變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch04/04-02-shadow-var)

## Practice 3

輸入並執行以下包含巢狀區塊的 PL/SQL 區塊。查看輸出並回答問題。

```sql
-- Declare the block, 外部區塊
DECLARE
    -- 宣告變數
    v_employee_id employees.employee_id%TYPE;
    v_job employees.job_id%TYPE;
BEGIN
    -- 選擇 employee_id 100 的員工 ID 及 job_id
    SELECT employee_id, job_id 
    INTO v_employee_id, v_job
    FROM employees
    WHERE employee_id = 100;

    -- 宣告另一個區塊, 內部區塊
    DECLARE
        -- 宣告變數
        v_employee_id employees.employee_id%TYPE;
        v_job employees.job_id%TYPE;
    BEGIN
        -- 選擇 employee_id 103 的員工的 ID 及 job_id
        SELECT employee_id, job_id 
        INTO v_employee_id, v_job
        FROM employees
        WHERE employee_id = 103;

        -- 輸出結果(Mark 1)
        DBMS_OUTPUT.PUT_LINE(v_employee_id || ' is a(n) ' || v_job);
    END;
    -- 輸出結果
    DBMS_OUTPUT.PUT_LINE(v_employee_id || ' is a(n) ' || v_job);
END;
```

A. 內部區塊為什麼顯示員工 103 的 job_id，而不是員工 100 的 job_id？

B. 外部區塊為什麼顯示員工 100 的 job_id，而不是員工 103 的 job_id？

C. 修改程式碼以在內部區塊中(標示 Mark 1 處)印出員工 100 的詳細資料。使用區塊標籤修飾變數，以區分內部和外部區塊中的變數。

注意: 此練習源自 Oracle Academy 的 Ch 2-6 巢狀區塊和變數範圍。

### 相關的程式樣態

[P04_02 存取被遮蔽的外部區域變數 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch04/04-02-shadow-var)


  
