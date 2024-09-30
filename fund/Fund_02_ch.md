# Fund Lesson 2 

## Practice 1: 撰第一個匿名區塊


撰寫匿名區塊印出員工編號為110的員工的全名(Last_name, first_name)。

![](/img/f02-i01.png)

## Practice 2: Find the employee with the highest salary

編寫一個匿名區塊來找出公司中薪水最高的員工。
列印員工的名字(first name)和員工工作的部門名稱(department name)。


## Notes

- `set serveroutput on`: 開啟此選項可以使 `DBMS_OUTPUT.PUT_LINE` 的結果輸出到 SQL Developer。
    - Ref: http://docs.oracle.com/cd/B19306_01/server.102/b14357/ch12040.htm
- `DBMS_OUTPUT` 套件: 將訊息輸出到控制台的套件。
    - Ref: http://docs.oracle.com/cd/E11882_01/appdev.112/e40758/d_output.htm#ARPLS036
- 為什麼在區塊結束使用斜杠 `/`：斜杠 (/) 通知 PL/SQL 引擎執行儲存在 SQL 緩衝區中的 PL/SQL 區塊。
  - Ref: 
    * https://docs.oracle.com/cd/B19306_01/server.102/b14357/ch12004.htm
    * http://stackoverflow.com/questions/1079949/when-do-i-need-to-use-a-semicolon-vs-a-slash-in-oracle-sql
    
