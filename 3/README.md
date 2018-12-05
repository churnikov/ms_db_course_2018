# Демонстрация использования утилит загрузки/выгрузки базы.

## On SQL Loader

Найдите dataset с разнообразными типами данных (строки, числа целые и вещественные, 
даты в разных форматах и т.п.) и загрузите его в базу данных ORACLE с помощью утилиты SQL*Loader.

### SQL Loader usage

```sql
sqlldr usr/usr control=./controler.ctl data=./data.csv
```

Result

![SQL Loader result](sql_loader_result_1.png)

## On SQL Dump
1. Создать дамп HR.
2. Уничтожить схему HR.
3. Поднять схему HR из дампа.

# Литература
- [Lecture on SQL Loader](https://drive.google.com/file/d/1Kz269PwfNYblJMGcRZDos-ctPs1w8JU8/view?usp=sharing)
- [Lecture on Oracle Dump](https://drive.google.com/file/d/1vqVwtiDszJxgXTsDEnHXzuc5np7YZy4V/view?usp=sharing)
