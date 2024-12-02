
# Fund Lesson 09 Handling Exceptions 例外處理

## Practice 01: 處理預定義的伺服器錯誤

主題: 處理預定義的伺服器錯誤 (有例外名稱的伺服器錯誤)

有一個程式嘗試將 ID 為 99 的員工記錄放到變數 V_EMP 中，如下所示:
```sql

SET serveroutput ON
DECLARE
  v_emp employees%rowtype;
BEGIN
  SELECT * INTO v_emp FROM employees e WHERE e.department_id = 99;
END;
/
```
但是，執行程式後，程式會產生以下的錯誤報告:
```
ORA-01403: no data found
ORA-06512: at line 4
01403. 00000 -  "no data found"
*Cause:    No data was found from the objects.
*Action:   There was no data from the objects which may be due to end of fetch.
```

請在程式中加入例外處理區段。你的程式應該列印出 NO_DATA_FOUND 例外的錯誤代碼和訊息，然後正常結束程式。

程式輸出應該如下:
```
Error code: 100
Error Msg: ORA-01403: no data found

PL/SQL procedure successfully completed.
```

注意程式執行後應該顯示成功完成的狀態(PL/SQL procedure successfully completed)。

<!-- ## Practice 02

Topics: Handling predefined errors (errors with names)

Write the program to get the record of the employee whose first name is `Steven`. 
Save the record to a variable of the record type.

Since there are more than one employees who meet the condition, your program should generate the TOO_MANY_ROWS exception.  

Add an exception handling section to handle it. Print out the error code and the error message for the caught exception.    -->

相關程式模式:
- [P09_01 例外處理概述 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-01-except-handling#qing-jing-1-bu-zhuo-yu-xian-ding-yi-de-li-wai)

## Practice 02: 例外發生時程式的執行流程

有以的程式如下。 department_id 及 first_name 都**不是**表格 EMPLOYEES 的主鍵。請問這個程式的輸出是什麼? 為什麼?

```sql
SET serveroutput ON
DECLARE
  v_emp employees%ROWTYPE;
BEGIN
  SELECT * INTO v_emp FROM employees e WHERE e.department_id = 99;
  SELECT * INTO v_emp FROM employees e WHERE first_name='Steven';
  DBMS_OUTPUT.PUT_LINE('Mission Complete!!');

EXCEPTION
   when NO_DATA_FOUND then
      DBMS_OUTPUT.PUT_LINE('NO_DATA_FOUND EXCEPTION');
   WHEN TOO_MANY_ROWS then
      DBMS_OUTPUT.PUT_LINE('TOO_MANY_ROWS EXCEPTION');
  WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('OTHER EXCEPTIONS');
END;
/
```
Options: 

A) NO_DATA_FOUND EXCEPTION

B) TOO_MANY_ROWS EXCEPTION

C) OTHER EXCEPTIONS

D) Mission Complete!!

E) None of the above. 

## Practice 03 處理非預先定義的伺服器錯誤

底下的程式嘗試在 DEPARTMENTS 表格中插入一筆記錄:
```sql
BEGIN
  INSERT INTO DEPARTMENTS
    (DEPARTMENT_ID, DEPARTMENT_NAME) 
    VALUES     (280, NULL );
END;
/
```

然而，執行程式後會產生錯誤報告:
```
Error report -
ORA-01400: cannot insert NULL into ("HR"."DEPARTMENTS"."DEPARTMENT_NAME")
ORA-06512: at line 2
01400. 00000 -  "cannot insert NULL into (%s)"
*Cause:    An attempt was made to insert NULL into previously listed objects.
*Action:   These objects cannot accept NULL values.
```

這個伺服器錯誤的錯誤代碼是 -1400, 並沒在 PL 引擎中有預先定義的例外名稱。可以，在 PL 中我們只能使用例外名稱來攔截伺服器錯誤。請在程式中加入例外處理區段，以攔截這個錯誤，並正常結束程式。

你需要在宣告區段中宣告一個例外，並將它與錯誤代碼 -1400 關聯起來。

相關程式模式:
- [P09_01 例外處理概述 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-01-except-handling#qing-jing-2-bu-zhuo-fei-yu-xian-ding-yi-de-li-wai)

## Practice 04: 拋出和捕捉使用者定義的例外

考慮下面的程式，它嘗試更新 LOCATION 表格:
```sql
set serveroutput on
DECLARE
-- Define required variables
v_country_id varchar2 (20) := 'TW';
v_name VARCHAR2(20) := 'Taichung';

BEGIN
-- update the department
UPDATE locations
SET city = v_name
where country_id = v_country_id;

DBMS_OUTPUT.put_line('Updated rows: ' || sql%rowcount);

END;
/
```

程式執行後的輸出如下:
```
Updated rows: 0
PL/SQL procedure successfully completed.
```

因為 TW 不是 LOCATION 表格中的國家代碼，所以沒有任何列被更新。但是，我們希望當沒有列被更新時，程式應該拋出使用者定義的例外，以提醒使用者。

加入程式碼到上述的程式中，以符合以下的需求:
- 當沒有列被更新時，程式應該拋出使用者定義的例外 `E_INVALID_LOCATION`。
- 加入例外處理區段來捕捉 `E_INVALID_LOCATION` 例外，並列印出以下的訊息:
  - `No such country ID: <your_country_id> exists.`

相關程式模式:
- [P09_01 例外處理概述 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-01-except-handling#qing-jing-3-pao-chu-zi-ding-li-wai)

## Practice 05: 使用巢狀區塊處理可能發生例外的敘述句，並在例外處理後，繼續執行程式

有以下的程式。 Mark 1 後的敘述句會造成程式錯誤。
請使用巢狀區塊來包裹這行敘述句，並處理這行敘述句可能引發的例外。
如此，即使在 Mark 1 後的敘述句引發例外, 程式仍然可以繼續執行 Mark 3 的敘述句。
捕捉到例外後，請印出訊息: `AA0 is not a valid number.`

注意, Mark 2 及 3 的敘述句不能在例外處理區段中執行。

```sql 
SET serveroutput ON
declare 
  v_value number;
BEGIN
  
  dbms_output.put_line('Mark-1'); -- ##2 

  -- #1 The line below throw the VALUE_ERROR  exception (ORA-06502) 
  v_value := to_number('AA0');  

  dbms_output.put_line('Mark-2');  -- #3

END;
```
/

程式執行的結果應印出:
```
Mark-1 
AA0 is not a valid number.
Mark-2 

PL/SQL procedure successfully completed.
```

相關程式模式:
- [P09_02 巢狀區塊處理可能發生例外的敘述 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-02-nested-block-handling)

## Practice 06:  抛出使用者自訊伺服器錯誤代碼和訊息 

此練習中，我們將建立一個儲存程序(stored procedure) ，該程序將拋出一個使用者定義的錯誤。之後，我們將撰寫一個匿名區塊呼叫此叫存程序，並練習如何捕捉這個使用者定義的錯誤。

執行以下的程式碼以建立一個儲存程序:
```sql
create or replace PROCEDURE RAISE_USER_DEFINE_ERROR AS 
BEGIN
  raise_application_error(-20000, 'Throw an app error. User-defined error.');
END RAISE_USER_DEFINE_ERROR;
/
```
執行後，此 Oracle 會編譯此程序並儲存到資料庫中，供重複呼叫。

在上述中，我們使用 `raise_application_error` 函數來拋出一個使用者定義的錯誤。這個函數接受兩個參數，第一個參數是錯誤代碼，第二個參數是錯誤訊息。

底下的程式中，我們呼叫 `RAISE_USER_DEFINE_ERROR` 程序。

```sql
set serveroutput on
declare
-- Add codes 
BEGIN

-- Add codes 
-- call the procedure RAISE_USER_DEFINE_ERROR
raise_user_define_error();
-- Add codes 

END;
/
```

因為這個程序拋出一個使用者定義的錯誤，所以執行後會產生一個錯誤報告:
```
Error report -
ORA-20000: Throw an app error. 自訂錯誤
ORA-06512: at "HR.RAISE_USER_DEFINE_ERROR", line 4
ORA-06512: at line 6
1.     00000 -  "%s"
*Cause:    The stored procedure 'raise_application_error'
           was called, which causes this error to be generated.
*Action:   Correct the problem as described in the error message or contact
           the application administrator or DBA for more information.
```

你需要修改上述的程式，以捕捉這個使用者定義的錯誤，並列印出錯誤代碼和訊息如下:

```
Err Msg:ORA-20000: Throw an app error. User-defined error.

PL/SQL procedure successfully completed.
```

注意, 區塊執行後應該顯示成功完成的狀態(PL/SQL procedure successfully completed)。

相關程式模式:
- [P09_01 例外處理概述 | plsql-prog-patterns](https://hychen39.gitbook.io/plsql-prog-patterns/ch09-li-wai-chu-li/09-01-except-handling#qing-jing-4-pao-chu-cuo-wu)
