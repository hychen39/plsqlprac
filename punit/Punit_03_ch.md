# PU Lesson 3 建立預儲函數 (Creating Functions)

## Practice 1 建立預儲函數

建立一個預儲函數，判斷員工的工作年資是否超過13年。

函數規格如下：
`is_senior(p_employee_id number) return integer`

參數：
`p_employee_id`: 員工編號

回傳值：
- 1 代表真
- 0 代表假

之後，在 SQL Select 語句產生報表。
報表的欄位要求如下:
- 員工編號 (employee_id)
- 姓 (first_name)
- 雇用日期 (hire_date)
- 工作年資 (seniority)
- 是否為資深員工 (Senior Employee): 為 is_senior 函數的回傳值

你可以使用以下陳述式來計算員工的工作年資:

```sql
months_between(SYSDATE, v_hire_date)/12;
```

輸出範例:
```
100	Steven	17-JUN-03	15	1
101	Neena	21-SEP-05	13	1
102	Lex	13-JAN-01	18	1
103	Alexander	03-JAN-06	13	1
104	Bruce	21-MAY-07	12	0
105	David	25-JUN-05	13	1
106	Valli	05-FEB-06	13	1
107	Diana	07-FEB-07	12	0
108	Nancy	17-AUG-02	16	1
```

## Practice 2 處理函數中的例外

建立一個預儲函數 `DEPT_NAME`。當給定員工編號時，函數應該回傳部門名稱。

函數應該捕捉任何例外並處理它們。當發生例外時，函數應該回傳空值。
例如，表格中沒有員工編號為178的員工，查詢時會產生 NO_DATA_FOUND 例外。你的函數應該捕捉這個例外並回傳空值。

預儲函數建立完成後，請使用以下程式碼測試函數:
 

```sql
set SERVEROUTPUT ON
begin
  for i in 100..200 loop
    dbms_output.put_line( i || ' ' || dept_name(i));
  end loop;
end;
/
```

輸出範例:
```
...
176 Sales
177 Sales
178 
179 Sales
180 Shipping
181 Shipping
...
```
注意，範例輸出中員工編號178的部門名稱是空值，且 block 的執行結果為成功狀態。

## Practice 3 在 SQL Select 中使用預儲函數

Create the function `emp_country_name`. By giving an employee id, the function should return the country name in which the employee's department locates. When exceptions occur, the function should catch them and return the following message `!! Invalid employee id !!` .

建立一個預儲函數 `emp_country_name`。給定員工編號，函數應該回傳員工所在部門的國家名稱。當發生例外時，函數應該捕捉它們並回傳以下訊息 `!! Invalid employee id !!`。

使用以下 SQL 陳述式來測試你的函數:
```sql
select e.EMPLOYEE_ID, last_name, emp_country_name(employee_id)
from employees e	
where e.EMPLOYEE_ID in (100, 145, 201, 178)
order by 1;
```

範例輸出:
```
100	King	United States of America
145	Russell	United Kingdom
178	Grant	!!Invalid employee id!!
201	Hartstein	Canada
```

你需要 join 多張表格來取得員工所在部門的國家名稱。參考 HR schema 圖片來了解表格之間的關係。

![](https://oranswer.files.wordpress.com/2013/12/oracle_hr_schema.jpg)

  
