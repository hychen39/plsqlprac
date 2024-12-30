  

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
