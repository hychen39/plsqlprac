  

# PU Less 2: 建立預儲程序 (Creating procedures)  


## Practice 1： 建立與呼叫預儲程序 

建立一 stored procedure: Hello_Proc 會印出 `Hello, I'm from DB` 訊息。

在 PL/SQL BLOCK 內，使用 EXEC 敘述呼叫此 stored procedure. 


## Practice 2: 建立具有兩個參數的預儲程序

建立一個名為 `dept_max_salary` 的預儲程序，具有以下兩個參數：

參數名稱 | 模式 | 資料型別
---|------|---
`p_dept_id` | in | 參考 `employees` 表格中的 `department_id` 欄位。|
`p_salary` | out | 參考 `employees` 表格中的 `salary` 欄位。 |

根據 `p_dept_id` 的值，此程序應該透過參數 `p_salary` 回傳最該部門的最高薪水。

使用此程序取得部門 ID 為 50 和 60 的最高薪水，並印出結果。

## Practice 3: 從程序中拋出使用者自訊伺服器錯誤代碼和訊息

修改 Practice 2 中的 `dep_max_salary` 程序，加入程式碼來檢查應用程式邏輯。

如果給定部門的最高薪水為 null，則程序應該拋出一個應用程式錯誤，錯誤代碼為 -20000，錯誤訊息為 'Null Max Salary'。

此外，你需要在 `dep_max_salary` 程序中處理此應用程式錯誤，並印出錯誤訊息。

使用以下的匿名區塊來呼叫你的 `dep_max_salary` 程序執行測試: 

```sql
declare 
    l_salary number;
begin
    dep_max_salary(100, l_salary);
    dbms_output.put_line('Dept 100: ' || l_salary);
    dep_max_salary(105, l_salary);
    dbms_output.put_line('Dept 105: ' || l_salary);   -- no such ID in the departments table
    dep_max_salary(110, l_salary);
    dbms_output.put_line('Dept 110: ' || l_salary);
end;
/
```

執行的結果應如下:

```
Dept 100: 12008
ORA-20000: Null Max Salary
Dept 105: 
Dept 110: 12008

PL/SQL procedure successfully completed.
```

參考程式模式：

[P09_01 例外處理概述 | 情境 4: 拋出錯誤 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-01-except-handling#qing-jing-4-pao-chu-cuo-wu)
  

## Practice 4: 建立具有選項參數的預儲程序

建立一個名為 `top_n_employees` 的預儲程序, 印出薪水最高的前 N 個員工的資訊。

此程序應該具有以下參數，依序為：
1. 部門 ID (p_dept_id)：必要參數，沒有預設值。
2. 員工數量 (p_top_n)：選擇性參數，預設值為 5。
3. 薪水門檻 (p_min_salary)：選擇性參數，預設值為 0。

不可改變參數的順序。

使用此程序印出部門 ID 為 100 且薪水大於 5000 的員工資訊。

輸出欄位包括：employee_id, last_name, salary.

輸出參考:
```
PL/SQL procedure successfully completed.

employee_id: 108, last_name: Greenberg, salary: 12008
employee_id: 109, last_name: Faviet, salary: 9000
employee_id: 110, last_name: Chen, salary: 8200
employee_id: 112, last_name: Urman, salary: 7800
employee_id: 111, last_name: Sciarra, salary: 7700
```

參考程式模式： [PU02_01 帶有選擇性引數的預儲程序 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/pu02-yu-chu-cheng-xu/pu02-01-proc-with-opt-args)


## Practice 5:由 Use Case 到 PL/SQL Procedure 實作


### 一、作業背景（Problem Context）

某公司希望能夠針對特定部門，**一次性調整該部門所有員工的薪資**。  
調薪方式為依照指定的百分比進行調整，例如增加 1%。

系統需提供一個可重複使用的 **PL/SQL procedure** 來完成此功能。


### 二、Use Case 描述

- Use Case: 調整部門薪資
- 描述: 系統提供一個功能，讓使用者可以指定某一個部門，並依指定的調薪比例，批次調整該部門所有員工的薪資。
- 主要使用角色: 開發人員

#### 主要流程

1. 開發人員輸入部門代號及調薪比例
3. 系統調整該部門所有員工的薪資  
4. 系統回傳本次實際受影響的員工筆數  
5. 系統完成交易  

#### Post-condition

- **成功時**：  
  該部門所有符合條件的員工薪水已被更新，且交易已提交（commit）
- **失敗時**：  
  不應留下任何部分更新，交易必須回復（rollback）

### 三、IPO 分析（Input–Process–Output）

- Input

| 參數 | 說明 |
|---|---|
| 部門代號 | 指定要調薪的部門 |
| 調薪比例 | 薪水調整的百分比 |


-  Process
    - 系統依據輸入的部門代號，找出該部門的所有員工  
    - 系統依據輸入的調薪比例，更新員工薪資  
    - 系統記錄實際被更新的資料列數  
    - 系統處理交易（commit / rollback）  

- 資料來源（Tables & Columns）

執行過程中會使用到以下的資料表及欄位：

| Table | 使用欄位 | 用途說明 |
|---|---|---|
| EMPLOYEES | EMPLOYEE_ID | 辨識受影響的員工資料列 |
| EMPLOYEES | DEPARTMENT_ID | 篩選指定部門的員工 |
| EMPLOYEES | SALARY | 讀取並更新員工薪資 |

- Output

| 輸出 | 說明 |
|---|---|
| 受影響的資料列數 | 本次成功更新薪資的員工筆數 |

- Post-Condition
    - 成功時：該部門所有符合條件的員工薪水已被更新，且交易已提交（commit）  
    - 失敗時：不應留下任何部分更新，交易必須回復（rollback）



### 四、Procedure 規格（Specification / Signature）

請依照以下規格完成 **procedure 的實作**：

```sql
CREATE OR REPLACE PROCEDURE adjust_salary (
    p_dept_id IN  NUMBER,   -- 部門代號
    p_pct     IN  NUMBER,   -- 調薪比例（百分比）
    p_rows    OUT NUMBER    -- 受影響的資料列數
);