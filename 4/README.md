# Демонстрация двух любых новых возможностей Oracle 12c

## JSON in Oracle Database

https://docs.oracle.com/database/121/ADXDB/json.htm#ADXDB6246

## APPROX_COUNT_DISTINCT

https://docs.oracle.com/database/121/SQLRF/functions013.htm#SQLRF56900

```sql
SQL> SELECT APPROX_COUNT_DISTINCT(EMBARKED) AS "Embarked" FROM TITANIC;
```

![Approx count example](approx_count_example.png)

## Inline Functions
```sql
WITH
FUNCTION CamCase(op VARCHAR2) RETURN VARCHAR2
IS
BEGIN
  RETURN initcap(op);
END;
SELECT CamCase(SEX) FROM TITANIC
```

__No function applied__

![No function applied](no_function_applied.png)

__Function applied__

![Function applied](function_applied.png)