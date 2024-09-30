# Title 

P05. Assign or initialize format-sensitive literal values to variables: date, timestamp, and interval.

## Description

The literals for date, timestamp, and interval data types are format-sensitive to the NLS_DATE_FORMAT setting. 

Oracle implicitly converts these literals to the corresponding data types based on the NLS_DATE_FORMAT setting in the current session when you do not explicitly specify the format using the `TO_DATE`, `TO_TIMESTAMP`, or `TO_YMINTERVAL` functions (or so-called date-time conversion functions). 

You can check the current NLS_DATE_FORMAT setting using the following SQL statement:

```sql
select * from nls_session_parameters where parameter = 'NLS_DATE_FORMAT';
```

## Example

```sql
-- Initialize data, timestamp, and intervale variables with literals
-- Can be applied to assign literal values to variables in the executable section
declare
    -- Need to comply with the NLS_DATE_FORMAT setting
    -- Default format is 'DD-MON-RR'
    v_date date := '10/03/24';   -- date literal
    -- timestamp literal
    v_timestamp timestamp := '10/03/24 12:00:00';  
    -- interval literal
    v_interval interval day to second := interval '1 12:00:00' day to second;
begin
    dbms_output.put_line('Date: ' || v_date);
    dbms_output.put_line('Timestamp: ' || v_timestamp);
    dbms_output.put_line('Interval: ' || v_interval);
end;
/
```
