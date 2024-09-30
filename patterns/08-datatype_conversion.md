---
CJKmainfont: Songti SC Regular
CJKoptions: AutoFakeBold
---


# Title 

P08. Explicitly convert a data type to another data type.

## Description

You want to convert a data type to another data type explicitly. 

Typical tasks and related single-row functions:
- Convert a date literal string to date.
  - Use `to_date()` with a date-time format model.
- Convert a date to a formatted date literal string.
  - Use `to_char()` with a date-time format model.
- Convert a formatted number literal string to a number.
  - Use `to_number()` with a number format model.
- Convert a number to a formatted number literal string.
  - Use `to_char()` with a number format model.

Oracle Format Models:
- [Date-Time Format Models, 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Format-Models.html#GUID-49B32A81-0904-433E-B7FE-51606672183A)
- [Number Format Models, 19c](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Format-Models.html#GUID-49B32A81-0904-433E-B7FE-51606672183A)


## Example

### Convert a date literal string to a date
Convert the date literal string 'January 1, 2010' to a date using the current session's NLS_DATE_LANGUAGE setting.
```sql
select to_date('January 1, 2010', 'Month DD, YYYY') from dual;
```
where 
- `Month` is the full name of the month.
- `DD` is the day of the month.
- `YYYY` is the century and year.

To find the current NLS_DATE_LANGUAGE setting, use the following SQL statement:
```sql
select * from nls_session_parameters where parameter = 'NLS_DATE_LANGUAGE';
```

Convert the Chinese date literal string '1月 1, 2010' to a date by specifying the NLS_DATE_LANGUAGE explicitly.
```sql
select to_date('1月 1, 2010', 'Month DD, YYYY', q'[NLS_DATE_LANGUAGE='TRADITIONAL CHINESE']') from dual;
```

### Convert a date to a formatted date literal string

Output the date literal string with the format 'Jan 1st, 2010':
```sql
select to_char(sysdate, 'Mon DDth, YYYY') from dual;
```
where:
- `Mon` is the abbreviated name of the month.
- `DD` is the day of the month.
- `th` is the ordinal suffix.
- `YYYY` is the century and year.

### Convert a formatted number literal string to a number

Convert the number literal `'NT$1,000.00'` to number with the explicit NLS_CURRENCY setting:
```sql
select to_number('NT$1,000.00', 'L999G999D00', 'NLS_CURRENCY=NT$') from dual;
```
where:
- `L` is the local currency symbol.
- `G` is the group separator.
- `D` is the decimal character.

### Format a number to a formatted number literal
Print `1000` as `$1000.00` using the current session's NLS_CURRENCY setting:

```sql
select to_char(1000, 'L999G999D00', 'NLS_CURRENCY=$') from dual;
```



  
