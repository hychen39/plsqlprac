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

  
## Practice 4 建立員工評核日期函數

### 使用案例

人資部門需要根據員工的雇用日期計算員工的評核日期。評核日期定義為每個6年紀念日當天或之後的第一個星期五。如果員工未滿6年服務年資，函數應回傳 NULL。

呼叫者將提供雇用日期作為輸入，函數將回傳計算後的評核日期，或在員工未滿6年服務年資時回傳 NULL。


### IPO 分析

#### 輸入

| 名稱 | 類型 | 描述 |
|---|---|---|
| p_hire_date | DATE | 員工雇用日期 | 

#### 輸出

| 名稱 | 類型 | 描述 |
|---|---|---|
| 回傳值 | DATE | 評核日期 |


### 流程 

1. 計算完成的服務年限。
2. 確定完成的6年週期。
3. 計算6年週年紀念日。
4. 找到週年紀念日當天或之後的第一個星期五。

### 函數規格

根據上述定義的輸入和輸出，可以將函數指定如下：

```sql
CREATE OR REPLACE FUNCTION get_review_date (
  p_hire_date IN DATE
) RETURN DATE;
```

### 任務 

你的任務是根據上述規格和流程實作該函數。

上傳完整的函數代碼和測試結果的截圖以完成作業。

### 測試案例 

你可以使用以下 SQL 陳述式來測試你的函數：

```sql
SELECT get_review_date(DATE '2021-01-01') FROM dual;
SELECT get_review_date(DATE '2019-03-01') FROM dual;
SELECT get_review_date(DATE '2020-05-08') FROM dual;
```

預期的輸出為：

```
2027-01-07
2025-03-07
NULL
```

## Practice 5 計算員工年薪

HR 部門要求要能計算某位員工的年薪。年薪是指員工每年可獲得的總薪資，公式為: 月薪 x 月數。

月薪是指員工的 `salary` 欄位值。
月數則是依據員工的職稱決定。目前的規則為：
- 業務類( `SA` 開頭的職稱): 18 個月
- 財務類(`FI`開頭的職稱): 16 個月
- 其他職稱: 13.5 個月

經過研究後，我們將這兩個商業規則分別封裝到兩個不同的函數中。

第一個函數 `cal_annual_salary` 負責計算年薪。它有兩個參數: 月薪和月數。它會回傳年薪。
第二個函數 `get_months_by_job` 負責根據職稱回傳月數。它有一個參數: 職稱, 並回傳月數。

使用預存函數來實作這兩個函數。

接著，使用這兩個函數製作以下報表:

| Employee ID | First Name | Job Title        | Monthly Salary | Months | Annual Salary |
|-------------|------------|------------------|----------------|--------|---------------|
| 100         | Steven     | SA_MAN          | 24000          | 18   | 324000        |
| 101         | Neena      | FI_MGR            | 17000          | 16   | 229500        |
| 102         | Lex        | AD_VP            | 17000          | 13.5   | 229500        |
| ...         | ...        | ...              | ...            | ...    | ... | 
