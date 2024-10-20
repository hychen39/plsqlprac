
# Fund Lesson 6 Practices

## Practice 01: Case 敘述

撰寫 PL/SQL 印出員工 ID 為 206 的薪資等級。薪資等級的規則如下：
- 如果薪資小於等於 9400，則等級為 C。
- 如果薪資介於 9400 和 16700 之間，則等級為 B。
- 其他情況，等級為 A。

請使用 Searched CASE 敘述完成此練習。

程式輸出：
```
PL/SQL procedure successfully completed.

Employee ID#206. Salary: 8300.Salary code: C
```

## Practice 02: `IF-ELSIF-ELSE` statement

重新撰寫練習 1，使用 IF-ELSE 敘述。

## Practice 03: Loop Statement

使用以下語句建立 `msg` 表格，供本練習使用：
```sql
DROP TABLE messages;
CREATE TABLE messages (results VARCHAR2(80));
```


新增 1 到 10 的數字到 `msg` 表格，但不包括 6 和 8。
你應該使用 `CONTINUE` 敘述來完成這個任務。執行 PL/SQL 程式後，請提交(commit)交易。
完成後，請查詢 `msg` 表格以確認結果。

## Practice 04: 第5章和第6章的綜合練習

涵蓋的主題：
* Chapter 5 Interacting with Oracle Database Server: SQL statements in PL/SQL Engine
* Chapter 6 Writing Control Structures

本練習使用 IF-ELSE 敘述，依據員工的薪資將員工資料新增到不同的表格中

使用以下語句先建立 `A_EMP` 和 `B_EMP` 表格：
```sql
create table A_EMP(employee_id NUMBER(6,0) PRIMARY KEY, salary number(8,2));
create table B_EMP(employee_id NUMBER(6,0) PRIMARY KEY, salary number(8,2));
```

請撰寫一個 PL/SQL 程式，根據以下規則將員工資料新增到 `A_EMP` 和 `B_EMP` 表格中：
- 如果薪資大於等於 10000，則將員工 ID 和薪資新增到 `A_EMP` 表格中。
- 如果薪資小於等於 2500，則將員工 ID 和薪資新增到 `B_EMP` 表格中。

除此之外，你的程式應該印出不符合上述規則的員工 ID 和薪資。

在執行 PL/SQL 程式後，請查詢 `A_EMP` 和 `B_EMP` 表格以確認結果。

在 `A_EMP` 表格中的參考輸出:
```
Id  Salary
---------
101	17000
102	17000
108	12008
114	11000
145	14000
146	13500
147	12000
148	11000
149	10500
150	10000
```

在 `B_EMP` 表格中的參考輸出:
```
Id  Salary
---------
119	2500
127	2400
128	2200
131	2500
132	2100
135	2400
136	2200
140	2500
144	2500
```
