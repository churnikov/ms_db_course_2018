-- OPTIONS позволяет задать ряд параметров не
-- в командной строке, а непосредственно в файле.
OPTIONS (SKIP=1)
-- LOAD DATA требуется в начале управляющего файла
LOAD DATA
-- CHARACTERSET если требуется указать кодировку.
CHARACTERSET UTF8
-- INFILE определяет файл с исходными данными.
INFILE 'data.csv'
-- BADFILE определяет файл с некорректными данными.
BADFILE 'bad_data.bad'
-- DISCARDFILE определяет файл с отброшенными данными.
DISCARDFILE 'discard_data.dsc'
-- метод загрузки данных в таблицу
-- one of: {INSERT, APPEND, REPLACE, TRUNCATE}
INSERT
-- INTO TABLE + название таблицы для вставки данных
INTO TABLE TITANIC
-- FIELDS TERMINATED BY определяет разделитель данных в
-- файле данных
FIELDS TERMINATED BY ','
-- OPTIONALLY ENCLOSED BY '"' определяет,
-- что данные могут содержать символ обрамления
OPTIONALLY ENCLOSED BY '"'
-- TRAILING NULLCOLS если поле не имеет
-- данных в файле данных, то записать NULL
TRAILING NULLCOLS
-- описание столбцов таблицы с применяемыми SQL функциями
(
passengerid,
survived,
pclass,
name,
sex,
age,
sibsp,
parch,
ticket,
fare,
cabin,
embarked
)